<?php
namespace App\Http\Controllers;
use App\Models\Produk;
use App\Models\Kategori;
use App\Models\AuditLog;
use Illuminate\Http\Request;

class ProdukController extends Controller {
    public function index(Kategori $kategori, Request $request) {
        $search = $request->get('q','');
        $produk = Produk::where('kategori_id', $kategori->id)
            ->when($search, fn($q)=>$q->where(fn($q2)=>$q2->where('nama','like',"%{$search}%")->orWhere('kode','like',"%{$search}%")))
            ->where('is_active',true)->get();
        return view('produk.index', compact('kategori','produk','search'));
    }

    public function store(Request $request, Kategori $kategori) {
        $data = $request->validate([
            'kode'       => 'required|unique:produk,kode',
            'nama'       => 'required',
            'merk'       => 'nullable',
            'harga_awal' => 'required|numeric|min:0',
            'harga_jual' => 'required|numeric|min:0',
            'deskripsi'  => 'nullable',
            'foto'       => 'nullable|image|max:2048',
        ]);
        $data['kategori_id'] = $kategori->id;
        if ($request->hasFile('foto')) {
            $file = $request->file('foto');
            $filename = time().'_'.$file->getClientOriginalName();
            $file->move(public_path('uploads/produk'), $filename);
            $data['foto'] = $filename;
        }
        $p = Produk::create($data);
        AuditLog::catat('CREATE','Produk',"Tambah produk: {$p->nama} ({$p->kode})");
        return response()->json(['success'=>true,'produk'=>$p]);
    }

    public function update(Request $request, string $id) { // <-- Menambahkan 'string' menghilangkan error Intelephense
        
        // 1. Cari data produk berdasarkan ID secara manual
        $produk = Produk::findOrFail($id);

        // 2. Jalankan validasi data inputan dari form
        $data = $request->validate([
            // Menggunakan {$produk->id} agar kode barang murni miliknya sendiri tidak dianggap duplikat saat disave
            'kode'       => "required|unique:produk,kode,{$produk->id}",
            'nama'       => 'required',
            'merk'       => 'nullable',
            'harga_awal' => 'required|numeric|min:0',
            'harga_jual' => 'required|numeric|min:0',
            'deskripsi'  => 'nullable',
            'foto'       => 'nullable|image|max:2048',
        ]);

        // 3. Logika penggantian gambar/foto produk
        if ($request->hasFile('foto')) {
            // Hapus file foto lama di folder public/uploads/produk jika sebelumnya sudah ada foto
            if ($produk->foto && file_exists(public_path('uploads/produk/'.$produk->foto))) {
                unlink(public_path('uploads/produk/'.$produk->foto));
            }
            
            // Upload file foto baru ke folder server lokal Laragon
            $file = $request->file('foto');
            $filename = time().'_'.$file->getClientOriginalName();
            $file->move(public_path('uploads/produk'), $filename);
            $data['foto'] = $filename;
        }

        // 4. Eksekusi pembaruan data ke dalam database MySQL
        $produk->update($data);

        // 5. Catat aktivitas pembaruan ke Audit Log kelompokmu
        AuditLog::catat('UPDATE', 'Produk', "Edit produk: {$produk->nama}");

        // 6. Kembalikan respon sukses berupa JSON murni ke JavaScript di Blade
        return response()->json([
            'success' => true,
            'produk'  => $produk->fresh()
        ]);
    }

    public function destroy(Produk $produk) {
        $produk->update(['is_active'=>false]);
        AuditLog::catat('DELETE','Produk',"Nonaktifkan produk: {$produk->nama}");
        return response()->json(['success'=>true]);
    }
}
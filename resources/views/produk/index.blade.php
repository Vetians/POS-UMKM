@extends('layouts.app')
@section('title','Produk - ' . $kategori->nama)
@push('styles')
<style>
.produk-card{border-radius:12px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,.08);background:#fff;position:relative;transition:transform .15s;}
.produk-card:hover{transform:translateY(-3px);box-shadow:0 6px 20px rgba(0,0,0,.12);}
.produk-img{width:100%;aspect-ratio:1;object-fit:cover;background:#e5e7eb;display:block;}
.produk-img-ph{width:100%;aspect-ratio:1;background:#e5e7eb;display:flex;align-items:center;justify-content:center;font-size:3rem;color:#9ca3af;}
.produk-body{padding:.75rem;}
.produk-nama{font-weight:700;font-size:.9rem;margin-bottom:.25rem;}
.produk-price{font-size:.8rem;color:#6b7280;}
.produk-price strong{color:#1a2fa0;}
.fab-group{position:absolute;bottom:.5rem;right:.5rem;display:flex;gap:.35rem;}
.edit-fab{width:32px;height:32px;border-radius:50%;background:#3b82f6;color:#fff;border:none;display:flex;align-items:center;justify-content:center;cursor:pointer;font-size:.85rem;}
.del-fab{width:32px;height:32px;border-radius:50%;background:#ef4444;color:#fff;border:none;display:flex;align-items:center;justify-content:center;cursor:pointer;font-size:.85rem;transition:background .15s;}
.del-fab:hover{background:#dc2626;}
</style>
@endpush

@section('content')
<div class="d-flex align-items-center justify-content-between mb-3">
  <div class="d-flex align-items-center gap-2">
    <a href="{{ route('produk.kategori') }}" class="btn btn-sm btn-outline-secondary rounded-circle"><i class="bi bi-arrow-left"></i></a>
    <h5 class="fw-bold mb-0">{{ $kategori->nama }}</h5>
  </div>
  <div class="d-flex gap-2 align-items-center">
    <div class="input-group input-group-sm" style="width:200px;">
      <span class="input-group-text"><i class="bi bi-search"></i></span>
      <input type="text" class="form-control" placeholder="Cari produk..." id="searchInput" value="{{ $search }}"
        onkeydown="if(event.key==='Enter') window.location='?q='+this.value">
    </div>
    <button class="btn btn-orange btn-sm rounded-circle" onclick="bukaModalTambah()"><i class="bi bi-plus-lg"></i></button>
  </div>
</div>

{{-- NOTIFIKASI TOAST MELAYANG DENGAN ANIMASI FADE & SLIDE (Sinkron dengan Kategori) --}}
<div id="toastSukses" class="position-fixed start-50 translate-middle-x p-3 bg-dark text-white rounded-3 shadow border border-secondary" 
     style="z-index: 9999; top: -50px; opacity: 0; min-width: 250px; text-align: center; font-weight: 600; font-size: 0.9rem; transition: all 0.3s ease-in-out;">
  <span class="text-success me-2">✅</span> <span id="toastTeks">Produk berhasil disimpan!</span>
</div>

<div class="row g-3" id="gridProduk">
  @forelse($produk as $p)
  <div class="col-6 col-md-4 col-xl-3">
    <div class="produk-card">
      @if($p->foto)
        <img src="{{ asset('uploads/produk/'.$p->foto) }}" class="produk-img" alt="{{ $p->nama }}">
      @else
        <div class="produk-img-ph"><i class="bi bi-image"></i></div>
      @endif
      <div class="produk-body">
        <div class="produk-nama">{{ $p->nama }}</div>
        <div class="produk-price">Harga Jual:<br><strong>Rp {{ number_format($p->harga_jual,0,',','.') }},-</strong></div>
        <div class="produk-price mt-1">Modal Awal:<br>Rp {{ number_format($p->harga_awal,0,',','.') }},-</div>
      </div>
      <div class="fab-group">
        <button class="del-fab" onclick="hapusProduk({{ $p->id }}, '{{ addslashes($p->nama) }}', this)"><i class="bi bi-trash"></i></button>
        {{-- PERBAIKAN 1: Menambahkan 'this' pada parameter click editProduk --}}
        <button class="edit-fab" onclick='editProduk({{ json_encode($p) }}, this)'><i class="bi bi-pencil"></i></button>
      </div>
    </div>
  </div>
  @empty
  <div class="col-12 text-center text-muted py-5">Belum ada produk di kategori ini.</div>
  @endforelse
</div>

{{-- Modal Tambah/Edit Produk --}}
<div class="modal fade" id="modalProduk" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header border-0">
        <h5 class="modal-title fw-bold" id="modalProdukTitle">Tambahkan Produk</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" style="background-color:#ef4444;border-radius:50%;opacity:1;"></button>
      </div>
      <form id="formProduk" enctype="multipart/form-data">
        @csrf
        <input type="hidden" name="_method" id="produkMethod" value="POST">
        <input type="hidden" id="produkId" value="">
        <div class="modal-body">
          <input type="text" name="kode" id="fKode" class="form-control mb-2" placeholder="Kode Produk (contoh: YKT150)" required>
          <input type="text" name="nama" id="fNama" class="form-control mb-2" placeholder="Nama Produk" required>
          <input type="text" name="merk" id="fMerk" class="form-control mb-2" placeholder="Merk Produk">
          <div class="input-group mb-2">
            <span class="input-group-text">Rp.</span>
            <input type="number" name="harga_awal" id="fModal" class="form-control" placeholder="Harga Awal (Modal)" required min="0">
          </div>
          <div class="input-group mb-2">
            <span class="input-group-text">Rp.</span>
            <input type="number" name="harga_jual" id="fHarga" class="form-control" placeholder="Harga Produk (Jual)" required min="0">
          </div>
          <input type="hidden" name="kategori_id" value="{{ $kategori->id }}">
          <textarea name="deskripsi" id="fDesk" class="form-control mb-2" rows="2" placeholder="Deskripsi Produk"></textarea>
          <input type="file" name="foto" id="fFoto" class="form-control" accept="image/*">
        </div>
        <div class="modal-footer border-0">
          <button type="button" class="btn btn-danger rounded-pill px-4" data-bs-dismiss="modal">Batal</button>
          <button type="submit" id="btnSimpan" class="btn btn-success rounded-pill px-4">Simpan</button>
        </div>
      </form>
    </div>
  </div>
</div>

{{-- Modal Konfirmasi Hapus --}}
<div class="modal fade" id="modalHapus" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog modal-dialog-centered modal-sm">
    <div class="modal-content border-0 shadow" style="border-radius:16px;">
      <div class="modal-body text-center py-4 px-3">
        <div style="font-size:2.5rem;margin-bottom:.5rem;">🗑️</div>
        <h6 class="fw-bold mb-1">Hapus Produk?</h6>
        <p class="text-muted small mb-3" id="hapusNamaTeks">Produk ini tidak akan muncul lagi.</p>
        <div class="d-flex gap-2 justify-content-center">
          <button class="btn btn-outline-secondary rounded-pill px-4" data-bs-dismiss="modal">Batal</button>
          <button class="btn btn-danger rounded-pill px-4" id="btnKonfirmasiHapus">Hapus</button>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

@push('scripts')
<script>
let actionUrl = '';
let _hapusId = null, _hapusBtn = null; // Variabel penampung elemen global

function bukaModalTambah() {
  actionUrl = '{{ route("produk.store", $kategori) }}';
  document.getElementById('modalProdukTitle').textContent = 'Tambahkan Produk';
  document.getElementById('produkMethod').value = 'POST';
  document.getElementById('fKode').value = '';
  document.getElementById('fNama').value = '';
  document.getElementById('fMerk').value = '';
  document.getElementById('fModal').value = '';
  document.getElementById('fHarga').value = '';
  document.getElementById('fDesk').value = '';
  document.getElementById('fFoto').value = '';
  new bootstrap.Modal(document.getElementById('modalProduk')).show();
}

function editProduk(p, btn) {
  _hapusBtn = btn; 
  
  // Ambil elemen kartu produk tempat tombol ini berada
  const productCard = btn.closest('.produk-card');
  
  // SCAN DATA TERBARU LANGSUNG DARI LAYAR (DOM)
  const namaTerbaru = productCard.querySelector('.produk-nama').textContent.trim();
  
  // Cari input harga awal dan jual dari string teks, bersihkan karakter "Rp", titik, dan koma
  const prices = productCard.querySelectorAll('.produk-price');
  
  // Trik regex untuk mengambil angka saja dari teks "Harga Jual: Rp 15.000,-"
  const hargaJualTerbaru = prices[0].textContent.replace(/[^0-9]/g, '');
  const hargaAwalTerbaru = prices[1].textContent.replace(/[^0-9]/g, '');

  actionUrl = `/data-produk/item/${p.id}`; 
  document.getElementById('modalProdukTitle').textContent = 'Edit Produk';
  document.getElementById('produkMethod').value = 'PUT';
  
  // Masukkan data terbaru hasil scan ke dalam Form Modal
  document.getElementById('fKode').value  = p.kode; // Kode unik umumnya tetap
  document.getElementById('fNama').value  = namaTerbaru; // <--- Menggunakan nama terbaru di layar
  document.getElementById('fMerk').value  = p.merk || '';
  document.getElementById('fModal').value = hargaAwalTerbaru; // <--- Menggunakan modal terbaru
  document.getElementById('fHarga').value = hargaJualTerbaru; // <--- Menggunakan harga jual terbaru
  document.getElementById('fDesk').value  = p.deskripsi || '';
  document.getElementById('fFoto').value  = '';
  
  new bootstrap.Modal(document.getElementById('modalProduk')).show();
}

// Handler Submit Form Tambah & Edit Produk via AJAX Fetch
document.getElementById('formProduk').addEventListener('submit', async function(e) {
  e.preventDefault();
  const btn = document.getElementById('btnSimpan');
  btn.disabled = true;
  btn.textContent = 'Menyimpan...';

  const formData = new FormData(this);
  const methodValue = document.getElementById('produkMethod').value;
  formData.set('_method', methodValue); 

  try {
    const res = await fetch(actionUrl, {
      method: 'POST', 
      headers: { 
        'X-CSRF-TOKEN': '{{ csrf_token() }}', 
        'Accept': 'application/json' 
      },
      body: formData
    });
    
    const json = await res.json();

    if (res.ok && json.success) {
      const myModalEl = document.getElementById('modalProduk');
      const modalInstance = bootstrap.Modal.getInstance(myModalEl);
      if (modalInstance) {
        modalInstance.hide();
      }

      document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());
      document.body.classList.remove('modal-open');
      document.body.style.overflow = '';
      document.body.style.paddingRight = '';

      const isEdit = methodValue === 'PUT';
      const toast = document.getElementById('toastSukses');

      if (isEdit) {
        // Skenario A: JIKA EDIT (Live Update DOM Kartu secara real-time)
        if (_hapusBtn) {
          const productCard = _hapusBtn.closest('.produk-card');
          productCard.querySelector('.produk-nama').textContent = formData.get('nama');
          
          const prices = productCard.querySelectorAll('.produk-price');
          const hargaJualFormated = parseFloat(formData.get('harga_jual')).toLocaleString('id-ID');
          const hargaAwalFormated = parseFloat(formData.get('harga_awal')).toLocaleString('id-ID');
          
          prices[0].innerHTML = `Harga Jual:<br><strong>Rp ${hargaJualFormated},-</strong>`;
          prices[1].innerHTML = `Modal Awal:<br>Rp ${hargaAwalFormated},-`;

          // Handle live update preview foto
          const fileInput = document.getElementById('fFoto');
          if (fileInput.files && fileInput.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
              const imgEl = productCard.querySelector('.produk-img');
              if (imgEl) {
                imgEl.src = e.target.result;
              } else {
                const phEl = productCard.querySelector('.produk-img-ph');
                if (phEl) {
                  const newImg = document.createElement('img');
                  newImg.src = e.target.result;
                  newImg.className = 'produk-img';
                  newImg.alt = formData.get('nama');
                  phEl.replaceWith(newImg);
                }
              }
            }
            reader.readAsDataURL(fileInput.files[0]);
          }
        }

        document.getElementById('toastTeks').textContent = 'Produk diperbarui!';
        toast.style.top = '1rem';
        toast.style.opacity = '1';

        setTimeout(() => { 
          toast.style.opacity = '0';
          toast.style.top = '-50px';
        }, 800);

      } else {
        // Skenario B: JIKA TAMBAH BARU
        document.getElementById('toastTeks').textContent = 'Produk berhasil ditambahkan!';
        toast.style.top = '1rem';
        toast.style.opacity = '1';

        setTimeout(() => { 
          window.location.reload();
        }, 600);
      }

    } else {
      if (json.errors) {
        let errMessage = '';
        Object.values(json.errors).forEach(err => { errMessage += `- ${err[0]}\n`; });
        alert('Gagal menyimpan produk:\n' + errMessage);
      } else {
        alert(json.message || 'Gagal menyimpan produk. Coba lagi.');
      }
    }
  } catch (err) {
    alert('Terjadi kesalahan koneksi sistem.');
    console.error(err);
  } finally { // <-- PERBAIKAN 3: Memastikan sintaks JavaScript tertulis 'finally'
    btn.disabled = false;
    btn.textContent = 'Simpan';
  }
});

function hapusProduk(id, nama, btn) {
  _hapusId  = id;
  _hapusBtn = btn;
  document.getElementById('hapusNamaTeks').textContent = `"${nama}" tidak akan muncul lagi di daftar.`;
  new bootstrap.Modal(document.getElementById('modalHapus')).show();
}

document.getElementById('btnKonfirmasiHapus').addEventListener('click', async function() {
  const modalEl = document.getElementById('modalHapus');
  bootstrap.Modal.getInstance(modalEl)?.hide();
  try {
    const res = await fetch(`/data-produk/item/${_hapusId}`, {
      method: 'DELETE',
      headers: { 'X-CSRF-TOKEN': '{{ csrf_token() }}', 'Accept': 'application/json' }
    });
    const json = await res.json();
    if (json.success) {
      _hapusBtn.closest('[class*="col-"]').remove();
      document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());
    } else {
      alert('Gagal menghapus produk.');
    }
  } catch(err) {
    alert('Terjadi kesalahan.');
    console.error(err);
  }
});
</script>
@endpush
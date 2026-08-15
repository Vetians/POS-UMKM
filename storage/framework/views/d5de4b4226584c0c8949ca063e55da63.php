<?php $__env->startSection('title','Data Produk'); ?>
<?php $__env->startSection('content'); ?>
<div class="d-flex align-items-center justify-content-between mb-3">
  <div>
    <h5 class="fw-bold mb-0">Semua Kategori</h5>
    <small class="text-muted"><?php echo e($kategori->count()); ?> kategori tersedia</small>
  </div>
  <div class="d-flex gap-2">
    <button class="btn btn-orange btn-sm rounded-circle" onclick="bukaModalTambah()"><i class="bi bi-plus-lg"></i></button>
  </div>
</div>


<div id="toastSukses" class="position-fixed start-50 translate-middle-x p-3 bg-dark text-white rounded-3 shadow border border-secondary" 
     style="z-index: 9999; top: -50px; opacity: 0; min-width: 250px; text-align: center; font-weight: 600; font-size: 0.9rem; transition: all 0.3s ease-in-out;">
  <span class="text-success me-2">✅</span> <span id="toastTeks">Kategori berhasil disimpan!</span>
</div>

<div class="row g-3" id="gridKategori">
  <?php $__empty_1 = true; $__currentLoopData = $kategori; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
  <div class="col-sm-6 col-lg-4">
    <div class="rounded-3 p-4 text-white text-center position-relative kategori-card"
         data-id="<?php echo e($k->id); ?>"
         data-nama="<?php echo e($k->nama); ?>"
         data-icon="<?php echo e($k->icon ?? 'bi bi-box'); ?>"
         data-warna="<?php echo e($k->warna); ?>"
         style="background:<?php echo e($k->warna); ?>;cursor:pointer;min-height:120px;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:.5rem;"
         onclick="window.location='<?php echo e(route('produk.index', $k)); ?>'">

      <div class="position-absolute" style="top: 10px; right: 12px; display: flex; gap: 0.35rem;">
        <button type="button"
                class="btn btn-sm text-white p-0"
                style="background: rgba(0,0,0,0.2); width: 28px; height: 28px; border-radius: 50%; display: flex; align-items: center; justify-content: center; border: none;"
                onclick="event.stopPropagation(); editKategori(this)"
                title="Edit Kategori">
          <i class="bi bi-pencil" style="font-size: 0.8rem;"></i>
        </button>

        <button type="button"
                class="btn btn-sm text-white p-0"
                style="background: rgba(239, 68, 68, 0.8); width: 28px; height: 28px; border-radius: 50%; display: flex; align-items: center; justify-content: center; border: none;"
                onclick="event.stopPropagation(); konfirmasiHapusKategori(<?php echo e($k->id); ?>, '<?php echo e(addslashes($k->nama)); ?>', this)"
                title="Hapus Kategori">
          <i class="bi bi-trash" style="font-size: 0.8rem;"></i>
        </button>
      </div>

      <i class="<?php echo e($k->icon ?? 'bi bi-box'); ?>" style="font-size:2rem;"></i>
      <div class="fw-bold"><?php echo e($k->nama); ?></div>
    </div>
  </div>
  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
  <div class="col-12 text-center text-muted py-5">Belum ada kategori. Tambahkan kategori baru.</div>
  <?php endif; ?>
</div>


<div class="modal fade" id="modalKategori" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header border-0">
        <h5 class="modal-title fw-bold" id="modalKategoriTitle">Tambahkan Kategori</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" style="background-color:#ef4444;border-radius:50%;opacity:1;"></button>
      </div>
      <form id="formKategori">
        <?php echo csrf_field(); ?>
        <input type="hidden" name="_method" id="kategoriMethod" value="POST">
        <div class="modal-body">
          <input type="text" name="nama" id="namaKategori" class="form-control mb-3" placeholder="Nama Kategori" required>
          <select name="icon" id="ikonKategori" class="form-select mb-3">
            <option value="bi bi-bag-fill">🛍 Sembako / Belanja</option>
            <option value="bi bi-house-fill">🏠 Rumah Tangga</option>
            <option value="bi bi-cup-straw">🥤 Makanan & Minuman</option>
            <option value="bi bi-emoji-smile">😊 Rokok / Lainnya</option>
            <option value="bi bi-stars">⭐ Perawatan</option>
            <option value="bi bi-box">📦 Umum</option>
          </select>
          <input type="color" name="warna" id="warnaKategori" class="form-control form-control-color mb-3" value="#3b82f6" title="Warna kartu">
        </div>
        <div class="modal-footer border-0">
          <button type="button" class="btn btn-danger rounded-pill px-4" data-bs-dismiss="modal">Batal</button>
          <button type="submit" id="btnSimpan" class="btn btn-success rounded-pill px-4">Simpan</button>
        </div>
      </form>
    </div>
  </div>
</div>


<div class="modal fade" id="modalHapus" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog modal-dialog-centered modal-sm">
    <div class="modal-content border-0 shadow" style="border-radius:16px;">
      <div class="modal-body text-center py-4 px-3">
        <div style="font-size:2.5rem;margin-bottom:.5rem;">🗑️</div>
        <h6 class="fw-bold mb-1">Hapus Kategori?</h6>
        <p class="text-muted small mb-3" id="hapusNamaTeks">Semua produk di dalam kategori ini juga akan terhapus.</p>
        <div class="d-flex gap-2 justify-content-center">
          <button class="btn btn-outline-secondary rounded-pill px-4" data-bs-dismiss="modal">Batal</button>
          <button class="btn btn-danger rounded-pill px-4" id="btnKonfirmasiHapus">Hapus</button>
        </div>
      </div>
    </div>
  </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script>
let actionUrl  = '';
let _editBtn   = null;
let _hapusId   = null;
let _hapusBtn  = null; // ← deklarasi SEKALI saja di atas
const CSRF = document.querySelector('meta[name="csrf-token"]').content;

function bukaModalTambah() {
  _editBtn  = null;
  actionUrl = '/data-produk/kategori';
  document.getElementById('modalKategoriTitle').textContent = 'Tambahkan Kategori';
  document.getElementById('kategoriMethod').value = 'POST';
  document.getElementById('namaKategori').value   = '';
  document.getElementById('ikonKategori').value   = 'bi bi-bag-fill';
  document.getElementById('warnaKategori').value  = '#3b82f6';
  new bootstrap.Modal(document.getElementById('modalKategori')).show();
}

function editKategori(btn) {
  _editBtn = btn;

  // Baca dari data-attributes yang selalu up-to-date setelah setiap edit
  const cardEl = btn.closest('.kategori-card');
  const id     = cardEl.dataset.id;
  const nama   = cardEl.dataset.nama;
  const icon   = cardEl.dataset.icon;
  const warna  = cardEl.dataset.warna;

  actionUrl = `/data-produk/kategori/${id}`;
  document.getElementById('modalKategoriTitle').textContent = 'Edit Kategori';
  document.getElementById('kategoriMethod').value = 'PUT';
  document.getElementById('namaKategori').value   = nama;
  document.getElementById('ikonKategori').value   = icon;
  document.getElementById('warnaKategori').value  = warna;
  new bootstrap.Modal(document.getElementById('modalKategori')).show();
}

function konfirmasiHapusKategori(id, nama, btn) {
  _hapusId  = id;
  _hapusBtn = btn;
  document.getElementById('hapusNamaTeks').textContent =
    `Kategori "${nama}" dan semua produk di dalamnya akan terhapus permanen.`;
  new bootstrap.Modal(document.getElementById('modalHapus')).show();
}

function tampilkanToast(pesan) {
  const toast = document.getElementById('toastSukses');
  document.getElementById('toastTeks').textContent = pesan;
  toast.style.top     = '1rem';
  toast.style.opacity = '1';
  setTimeout(() => {
    toast.style.opacity = '0';
    toast.style.top     = '-50px';
  }, 2000);
}

document.getElementById('formKategori').addEventListener('submit', async function(e) {
  e.preventDefault();
  const btn    = document.getElementById('btnSimpan');
  btn.disabled = true;
  btn.textContent = 'Menyimpan...';

  const nama   = document.getElementById('namaKategori').value.trim();
  const icon   = document.getElementById('ikonKategori').value;
  const warna  = document.getElementById('warnaKategori').value;
  const isEdit = document.getElementById('kategoriMethod').value === 'PUT';

  try {
    const res = await fetch(actionUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': CSRF,
        'Accept': 'application/json'
      },
      body: JSON.stringify({ nama, icon, warna, _method: isEdit ? 'PUT' : 'POST' })
    });

    const json = await res.json();

    if (res.ok) {
      bootstrap.Modal.getInstance(document.getElementById('modalKategori'))?.hide();
      document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());
      document.body.classList.remove('modal-open');
      document.body.style.overflow     = '';
      document.body.style.paddingRight = '';

      if (isEdit && _editBtn) {
        // Update visual DOM
        const cardEl = _editBtn.closest('.kategori-card');
        cardEl.style.background = warna;
        cardEl.querySelector('.fw-bold').textContent = nama;
        const iconEl = cardEl.querySelector(':scope > i.bi');
        if (iconEl) { iconEl.className = icon; iconEl.style.fontSize = '2rem'; }

        // Update data-attributes agar edit berikutnya baca data terbaru
        cardEl.dataset.nama  = nama;
        cardEl.dataset.icon  = icon;
        cardEl.dataset.warna = warna;

        tampilkanToast('Kategori diperbarui!');
      } else {
        window.location.reload();
      }

    } else {
      alert(json.message || 'Gagal menyimpan kategori.');
    }
  } catch (err) {
    alert('Terjadi kesalahan sistem.');
    console.error(err);
  } finally {
    btn.disabled    = false;
    btn.textContent = 'Simpan';
  }
});

document.getElementById('btnKonfirmasiHapus').addEventListener('click', async function() {
  bootstrap.Modal.getInstance(document.getElementById('modalHapus'))?.hide();
  try {
    const res = await fetch(`/data-produk/kategori/${_hapusId}`, {
      method: 'DELETE',
      headers: { 'X-CSRF-TOKEN': CSRF, 'Accept': 'application/json' }
    });
    const json = await res.json();
    if (res.ok && json.success) {
      _hapusBtn.closest('.col-sm-6').remove();
      document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());
    } else {
      alert('Gagal menghapus kategori.');
    }
  } catch (err) {
    alert('Terjadi kesalahan koneksi.');
    console.error(err);
  }
});
</script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.app', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\laragon\www\toko-madura\resources\views/kategori/index.blade.php ENDPATH**/ ?>
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash; // <-- Wajib ditambahkan untuk memverifikasi password
use App\Models\AuditLog;

class AuthController extends Controller {
    
    public function showLogin() { 
        return view('auth.login'); 
    }

    public function login(Request $request) {
        $request->validate(['username'=>'required','password'=>'required'],
            ['username.required'=>'Username wajib diisi','password.required'=>'Password wajib diisi']);

        if (Auth::attempt($request->only('username','password'), $request->boolean('remember'))) {
            $request->session()->regenerate();
            if (Auth::user()->status === 'libur') {
                Auth::logout();
                return back()->withErrors(['username' => 'Akun Anda sedang dalam status Libur.']);
            }
            AuditLog::catat('LOGIN', 'System', 'User login ke sistem');
            $userActive = Auth::user(); // Ambil object user lewat Auth Facade
            $home = $userActive->role === 'admin'
                ? route('dashboard')
                : route('kasir.index');
            return redirect()->intended($home);
        }
        return back()->withErrors(['username' => 'Username atau password salah.'])->withInput($request->only('username'));
    }

    public function logout(Request $request) {
        AuditLog::catat('LOGOUT', 'System', 'User logout dari sistem');
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('login');
    }

    /**
     * Fitur Keamanan Tambahan: Logout dengan Verifikasi Password Kasir
     */
    public function secureLogout(Request $request) {
        // 1. Validasi input password tidak boleh kosong
        $request->validate([
            'password' => 'required',
        ], [
            'password.required' => 'Password wajib diisi untuk melakukan logout!',
        ]);

        $user = Auth::user();

        // 2. Cek apakah password yang diketik sesuai dengan password di database
        if (Hash::check($request->password, $user->password)) {
            
            // Catat aktivitas sukses logout ke database Audit Log kelompokmu
            AuditLog::catat('LOGOUT', 'System', 'Kasir ' . $user->name . ' menutup sesi dengan verifikasi password');

            // Proses pembersihan session dan logout
            Auth::logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();

            return redirect()->route('login')->with('success', 'Sesi kasir berhasil ditutup dengan aman.');
        }

        // 3. JIKA GAGAL: Catat juga ke Audit Log sebagai peringatan keamanan (kondisi mencurigakan)
        AuditLog::catat('LOGOUT FAILED', 'System', 'Percobaan logout gagal pada akun ' . $user->name . ' (Salah Password)');

        // Kembalikan ke halaman kasir dengan memunculkan pesan error kotak merah
        return redirect()->back()->withErrors(['password' => 'Gagal Keluar! Password konfirmasi yang Anda masukkan salah.']);
    }
}
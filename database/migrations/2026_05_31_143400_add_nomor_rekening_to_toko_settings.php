<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('toko_settings', function (Blueprint $table) {
            $table->string('nomor_rekening')->nullable()->after('qris_image');
        });

        Schema::table('transaksi', function (Blueprint $table) {
            $table->string('metode_bayar')->default('cash')->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('toko_settings', function (Blueprint $table) {
            $table->dropColumn('nomor_rekening');
        });

        Schema::table('transaksi', function (Blueprint $table) {
            $table->enum('metode_bayar', ['cash', 'hutang', 'gopay', 'dana', 'qris', 'bca', 'seabank', 'mandiri'])->default('cash')->change();
        });
    }
};

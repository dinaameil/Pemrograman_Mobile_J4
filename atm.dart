import 'dart:io';

void main() {
  print("===================================");
  print("    SELAMAT DATANG DI BANK DART    ");
  print("===================================");
  
  // Data dummy
  String nama = "Ahmad Fauzi";
  String noRekening = "1234-5678-9012";
  double saldo = 5000000;
  int pin = 123456;
  
  print("Nomor Rekening: $noRekening");
  print("Atas Nama: $nama");
  print("===================================");
  
  // Verifikasi PIN
  int kesempatan = 3;
  bool loginBerhasil = false;
  
  while (kesempatan > 0 && !loginBerhasil) {
    stdout.write("Masukkan PIN Anda (6 digit): ");
    int inputPin = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    
    if (inputPin == pin) {
      loginBerhasil = true;
      print("✅ PIN benar! Mengakses menu...\n");
    } else {
      kesempatan--;
      if (kesempatan > 0) {
        print("❌ PIN salah! Kesempatan tersisa: $kesempatan");
      } else {
        print("❌❌❌ PIN salah 3 kali! Kartu diblokir.");
        return;
      }
    }
  }
  
  // Menu utama dengan perulangan do-while
  int pilihan;
  do {
    print("\n============= MENU UTAMA =============");
    print("1. Cek Saldo");
    print("2. Tarik Tunai");
    print("3. Transfer");
    print("4. Keluar");
    print("=======================================");
    
    stdout.write("Pilih menu (1-4): ");
    pilihan = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
    
    // Switch-case untuk menu
    switch (pilihan) {
      case 1:
        print("\n╔═══════════════ CEK SALDO ═══════════════╗");
        print("  Nomor Rekening : $noRekening");
        print("  Atas Nama      : $nama");
        print("  Saldo Anda     : Rp ${saldo.toStringAsFixed(0)}");
        
        // Percabangan untuk memberi saran berdasarkan saldo
        if (saldo > 10000000) {
          print("  💰 Saldo Anda sangat sehat!");
        } else if (saldo > 5000000) {
          print("  💵 Saldo Anda cukup baik");
        } else if (saldo > 1000000) {
          print("  💳 Saldo Anda mencukupi");
        } else if (saldo > 0) {
          print("  ⚠️  Saldo Anda menipis");
        } else {
          print("  🆘 Saldo Rp 0, segera lakukan pengisian!");
        }
        print("╚══════════════════════════════════════════╝");
        
        // Tanya apakah ingin lanjut
        stdout.write("\nTekan Enter untuk kembali ke menu...");
        stdin.readLineSync();
        break;
        
      case 2:
        print("\n╔═══════════════ TARIK TUNAI ═══════════════╗");
        print("  Saldo tersedia: Rp ${saldo.toStringAsFixed(0)}");
        print("╠════════════════════════════════════════════╣");
        print("  Pilih nominal:");
        print("  1. Rp 50.000");
        print("  2. Rp 100.000");
        print("  3. Rp 200.000");
        print("  4. Rp 500.000");
        print("  5. Rp 1.000.000");
        print("  6. Nominal lain");
        print("  0. Batal");
        print("╚════════════════════════════════════════════╝");
        
        stdout.write("Pilih nominal (0-6): ");
        int pilihTarik = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        
        double jumlahTarik = 0;
        
        // Switch-case untuk pilihan nominal
        switch (pilihTarik) {
          case 1:
            jumlahTarik = 50000;
            break;
          case 2:
            jumlahTarik = 100000;
            break;
          case 3:
            jumlahTarik = 200000;
            break;
          case 4:
            jumlahTarik = 500000;
            break;
          case 5:
            jumlahTarik = 1000000;
            break;
          case 6:
            stdout.write("Masukkan jumlah penarikan (kelipatan Rp 50.000): Rp ");
            jumlahTarik = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
            break;
          case 0:
            print("  ❌ Transaksi dibatalkan");
            break;
          default:
            print("  ❌ Pilihan tidak valid");
        }
        
        // Proses penarikan jika jumlah valid
        if (jumlahTarik > 0) {
          // Validasi dengan percabangan if-else
          if (jumlahTarik % 50000 != 0) {
            print("  ❌ Jumlah harus kelipatan Rp 50.000!");
          } else if (jumlahTarik > saldo) {
            print("  ❌ Maaf, saldo tidak mencukupi!");
            print("  Saldo Anda: Rp $saldo");
          } else {
            saldo -= jumlahTarik;
            print("\n  ✅ Penarikan berhasil!");
            print("  Silakan ambil uang Rp ${jumlahTarik.toStringAsFixed(0)}");
            print("  Sisa saldo: Rp ${saldo.toStringAsFixed(0)}");
            
            // Tanya apakah ingin cetak struk
            stdout.write("\n  Cetak struk? (y/n): ");
            String cetak = stdin.readLineSync()?.toLowerCase() ?? 'n';
            
            if (cetak == 'y') {
              print("\n╔═══════════════ STRUK TRANSAKSI ═══════════════╗");
              print("  BANK DART");
              print("  ${DateTime.now()}");
              print("  No. Rekening : $noRekening");
              print("  Transaksi     : TARIK TUNAI");
              print("  Jumlah        : Rp ${jumlahTarik.toStringAsFixed(0)}");
              print("  Sisa Saldo    : Rp ${saldo.toStringAsFixed(0)}");
              print("  Status        : SUKSES");
              print("╚════════════════════════════════════════════════╝");
              print("  Terima kasih telah menggunakan Bank Dart");
            }
          }
        }

        stdout.write("\nTekan Enter untuk kembali ke menu...");
        stdin.readLineSync();
        break;
        
      case 3:
        print("\n--- TRANSFER ---");
        print("Fitur sedang dalam pengembangan");
        break;
        
      case 4:
        print("\n✅ Terima kasih telah menggunakan Bank Dart!");
        print("=======================================");
        break;
        
      default:
        print("❌ Pilihan tidak valid! Silakan pilih 1-4.");
    }
    
  } while (pilihan != 4);
}
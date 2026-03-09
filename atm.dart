import 'dart:io';

void main() {
  print("===================================");
  print("    SELAMAT DATANG DI BANK DART    ");
  print("===================================");
  
  // Data dummy
  String nama = "Ahmad Fauzi";
  String noRekening = "1234-5678-9012";
  double saldo = 5000000; // Saldo awal
  int pin = 123456;
  
  print("Nomor Rekening: $noRekening");
  print("Atas Nama: $nama");
  print("===================================");
  
  // Verifikasi PIN
  int kesempatan = 3;
  bool loginBerhasil = false;
  
  // Perulangan while untuk percobaan PIN
  while (kesempatan > 0 && !loginBerhasil) {
    stdout.write("Masukkan PIN Anda (6 digit): ");
    int inputPin = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    
    // Percabangan if-else untuk cek PIN
    if (inputPin == pin) {
      loginBerhasil = true;
      print("✅ PIN benar! Mengakses menu...\n");
    } else {
      kesempatan--;
      if (kesempatan > 0) {
        print("❌ PIN salah! Kesempatan tersisa: $kesempatan");
      } else {
        print("❌❌❌ PIN salah 3 kali! Kartu diblokir.");
        return; // Program berhenti
      }
    }
  }
  
  // Menu utama akan menyusul di commit berikutnya
  print("Menu utama akan segera hadir...");
}
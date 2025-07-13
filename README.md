# Suitmedia Kreasi Intern Test

✅ 📌 Catatan Pengerjaan Project Flutter
🔹 Versi Flutter:

Sudah OK! Menggunakan Flutter versi 3.32 ke atas (pastikan saat flutter --version).

🔹 State Management:

Dipakai: Provider

Sudah diterapkan:

Menyimpan name dari input di First Screen ke UserProvider (ChangeNotifier).

Mengambil name di Second Screen via Provider.of.

Catatan: selectedUserName masih disimpan di local state SecondScreen. Ini valid & simple.

Screen 1

| Kriteria                                                    | Status       |
| ----------------------------------------------------------- | ------------ |
| Ada 2 input (Name & Sentence)                               | ✅            |
| Fungsi `isPalindrome` sudah dibuat                          | ✅            |
| Contoh input valid (`kasur rusak`, `step on no pets`, dll.) | ✅ Sudah bisa |
| Tombol “Check” → cek palindrome                             | ✅            |
| Hasil muncul di Dialog                                      | ✅            |
| Tombol “Next” → navigasi ke Second Screen                   | ✅            |
| Warna, font pakai Poppins, UI menarik                       | ✅            |
| Data name disimpan pakai Provider                           | ✅            |


Screen 2 

| Kriteria                                          | Status                                  |
| ------------------------------------------------- | --------------------------------------- |
| Ada label “Welcome”                               | ✅                                       |
| Tampilkan `name` dari First Screen (via Provider) | ✅                                       |
| Tampilkan `Selected User Name`                    | ✅                                       |
| Tombol “Choose a User”                            | ✅                                       |
| Tombol ke Third Screen                            | ✅                                       |
| Warna, font Poppins, sama tema                    | ✅                                       |
| Hasil user terpilih disimpan di state lokal       | ✅ (boleh pakai Provider juga, opsional) |

Screen 3

| Kriteria                                         | Status                         |
| ------------------------------------------------ | ------------------------------ |
| List/ Table View of Users                        | ✅ (`ListView.builder`)         |
| Data API dari `reqres.in`                        | ✅                              |
| Tampilkan email, first\_name, last\_name, avatar | ✅                              |
| Pull to refresh                                  | ✅ (`RefreshIndicator`)         |
| Infinite scroll                                  | ✅ (`ScrollController`)         |
| Empty state jika data kosong                     | ✅ (`Center(child: Text(...))`) |
| Klik User → kirim nama ke Second Screen          | ✅ (`Navigator.pop`)            |


![Screenshot](assets/1.png)
![Screenshot](assets/2.png)
![Screenshot](assets/3.png)
![Screenshot](assets/4.png)
![Screenshot](assets/5.png)
![Screenshot](assets/6.png)
![Screenshot](assets/7.png)


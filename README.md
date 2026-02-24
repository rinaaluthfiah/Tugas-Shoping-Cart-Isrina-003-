# Tugas Pemrograman Aplikasi Bergerak-Shoping 🛒
Isrina Luthfiah | 2409116003 | 

Sistem Informasi A'24


# Shopping Cart App 🛒

Shopping Cart adalah aplikasi sederhana berbasis Flutter yang mengimplementasikan fitur keranjang belanja secara langsung di dalam aplikasi. Melalui aplikasi ini, pengguna dapat menambahkan produk ke dalam keranjang, melihat daftar barang yang telah dipilih, mengubah jumlah pembelian, menghapus item, serta melihat total harga yang otomatis diperbarui sesuai dengan perubahan yang dilakukan.


#  Fitur Utama ✨

1. Menampilkan daftar produk

2. Menambahkan produk ke keranjang

3. Menghapus produk dari keranjang

4. Menghitung total harga secara otomatis

5. Halaman checkout dengan input:

    ・ Nama
    
    ・ Alamat
    
    ・ Nomor HP
    
    ・ Catatan (opsional)

6. Halaman notifikasi order berhasil

7. Keranjang otomatis kosong setelah checkout berhasil


# Alur Program 🔄

## 1. Tampilan Awal (Halaman Home)

<img width="614" height="1018" alt="Screenshot 2026-02-24 165530" src="https://github.com/user-attachments/assets/3d2581b7-1124-477b-93eb-2ecbe9009cf5" />

Tampilan awal program menampilkan pilihan produk yang bisa ditambahkan ke keranjang untuk dibeli. Pada halaman ini, pengguna dapat melihat daftar produk lengkap dengan nama dan harga.

<img width="615" height="1012" alt="Screenshot 2026-02-24 172639" src="https://github.com/user-attachments/assets/10837e7d-4b91-4741-8a53-38c3cf981cd8" />

Jika ingin mencari barang yang diinginkan dengan mudah ketikkan kata kunci pada search bar(tombol pencarian), maka daftar produk akan otomatis terfilter sesuai dengan nama produk yang dicari


<img width="612" height="1020" alt="Screenshot 2026-02-24 173403" src="https://github.com/user-attachments/assets/575ecc54-58ca-46d7-9a18-58a84a0456bd" />

<img width="618" height="1010" alt="Screenshot 2026-02-24 173600" src="https://github.com/user-attachments/assets/ec3e6e09-7dba-450d-9bdf-07b7cecc6fb2" />

Pada program ini terdapat fitur filter kategori yaitu Electronic dan Accessories. Ketika pengguna memilih salah satu kategori, maka hanya produk dalam kategori tersebut yang ditampilkan. Jika filter dilepas, semua produk akan muncul kembali


<img width="601" height="987" alt="Screenshot (1723)" src="https://github.com/user-attachments/assets/6f0470be-19a7-44de-a46f-677918309dff" />

Saat pengguna menekan tombol Add to Cart, maka produk otomatis langsung masuk ke dalam keranjang dan terdapat notifikasi barang berhasil ditambahkan ke keranjang (cart) serta  data keranjang diperbarui secara real-time.

## 2. Halaman Cart (Keranjang)

<img width="617" height="1014" alt="image" src="https://github.com/user-attachments/assets/3736328c-0138-4d3f-8413-2492a655afb6" />

Ketika ikon keranjang diklik, maka pengguna akan masuk ke halaman keranjang. Disini terlihat barang yang disimipan dalam keranjang dimana setiap item dalam keranjang menampilkan:

󠁯•󠁏 Nama produk

󠁯•󠁏 Harga satuan

󠁯•󠁏 Jumlah pembelian (quantity)

󠁯•󠁏 Subtotal harga 

󠁯•󠁏 Tombol tambah (+)

󠁯•󠁏 Tombol kurang (–)

󠁯•󠁏 Tombol hapus

<img width="602" height="1008" alt="image" src="https://github.com/user-attachments/assets/f7310d99-bf90-4a6e-baaa-06400de8b5f6" />

Ketikan pengguna menekan tombol tambah (+), maka Quantity bertambah, subtotal berubah dan total harga akan ikut bertambah

<img width="617" height="1014" alt="Screenshot 2026-02-24 174103" src="https://github.com/user-attachments/assets/bd7aca50-4a86-4907-97af-32262d58f77f" />


Tetapi jika pengguna menekan tombol (-),  maka Quantity berkurang,  total harga ikut menyesuaikan serta jika quantity menjadi nol, item bisa otomatis terhapus

<img width="617" height="1013" alt="image" src="https://github.com/user-attachments/assets/4e347a89-84dc-4a05-9d58-12081a9e2e3b" />

Saat pengguna ingin menghapus seluruh  item  dari keranjang maka hanya dengan mengklik ikon sampah yang berada di pojok kanan dan setelahnya akan ada muncul notifikasi dilayar untuk memastikan "apakah ingin menghapus semua item?", jika menekan ya maka Item langsung dihapus dari keranjang, jika tidak maka item tetap dan tidak  terhapus.

## 3. Halaman Checkout

<img width="613" height="1012" alt="image" src="https://github.com/user-attachments/assets/8d00bb9a-3adc-473b-9f99-f879f583eb82" />

Setelah menekan tombol Checkout, maka pengguna akan beralih masuk ke halaman Checkout. Pada bagian utama halaman Checkout ditampilkan Order Summary, yaitu ringkasan pesanan yang berisi informasi produk yang dibeli, jumlah pembelian masing-masing produk, harga per item, serta total keseluruhan yang harus dibayarkan. Ringkasan ini membantu pengguna untuk memastikan kembali pesanan sebelum melanjutkan ke tahap pembayaran. Di bawah ringkasan pesanan tersebut terdapat form pengisian data pelanggan.

<img width="607" height="1003" alt="image" src="https://github.com/user-attachments/assets/362bd74b-d095-405f-b38e-86b5b64d1a07" />

Pada bagian ini, pengguna mengisi data seperti nama, alamat, dan nomor HP untuk melengkapi proses pemesanan. Tersedia juga kolom catatan yang bersifat opsional, sehingga boleh diisi atau dikosongkan sesuai kebutuhan. Jika ada permintaan khusus, pengguna dapat menuliskannya di bagian ini. Pada tampilan di atas, pengguna menambahkan catatan: “Kak untuk smartphone warnanya mau yang silver” sebagai informasi tambahan kepada penjual mengenai preferensi produk yang diinginkan.

## 4. Halaman Order Success

<img width="614" height="1007" alt="image" src="https://github.com/user-attachments/assets/5db2f626-2078-45e9-9a69-c716f44141b0" />

Setelah proses berhasil, pengguna akan diarahkan ke halaman Order Success. Pada halaman ini ditampilkan pesan bahwa pesanan berhasil dilakukan, beserta informasi seperti nama pelanggan dan total pembayaran.

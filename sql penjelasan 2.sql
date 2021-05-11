-- DISTINCT
Dengan menggunakan DISTINCT, Anda dapat mengecualikan baris yang memiliki data yang sama dari hasil pencarian. Anda dapat menentukan nama kolom untuk mendapatkan baris unik dan mengecualikan duplikatnya. Untuk melakukan hal ini, gunakan syntax berikut: DISTINCT( column_name )
DISTINCT (column_name)
-- Menggunakan DISTINCT
Sebagaimana ditampilkan dibawah, Anda dapat menggunakan DISTINCT dalam pernyataan SELECT untuk mengecualikan baris duplikat. Dalam contoh dibawah, pernyataan memilih kolom name dari tabel purchases dengan mengecualikan duplikat.
SELECT DISTINCT (name)
FROM purchases;

-- Menggunakan operator aritmetika
-- Operator Aritmetika
Penghitungan dapat dilakukan di SQL dengan operator aritmetika. Sebagaimana ditampilkan di bawah, dengan menggunakan operator ini, Anda dapat melakukan penghitungan di baris pada kolom yang Anda tentukan.
column_name * 1.09 -- kalikan baris dikolom yang dispesifikasikan dengan 1.09!
column_name - 10 -- kurangi 10 dari baris di kolom yang dispesifikasikan!
-- Menggunakan Operator Aritmetika
Agar bisa mendapatkan harga termasuk pajak, kita akan mengkalikan kolom price dengan 1.09 (untuk tarif pajak sebesar 9%). Dalam kueri SQL, untuk mendapatkan nilai hasil penghitungan, operator aritmetika dapat digunakan setelah kata kunci SELECT .
SELECT name, price * 1.09 -- gunakan operator aritmatika
FROM purchases;

-- Menggunakan function
-- Menggunakan jumlah total
-- SUM
Untuk menghitung jumlah angka di SQL, gunakan function SUM.
Dengan syntax SUM (column_name), dengan pernyataan ini, penghitungan total semua nilai dalam kolom yang ditentukan bisa dilakukan.
SUM(column_name)
-- Menggunakan SUM
Function SUM digunakan setelah SELECT untuk mendapatkan hasil agregat. Digambar kanan bawah ini adalah contoh hasilnya.
SELECT SUM(price)
FROM purchases;
-- Menggabungkan WHERE & SUM
Penggunaan function SUM juga dapat dikombinasikan dengan WHERE. Pada contoh di bawah, keduanya dapat dikombinasikan untuk mendapatkan jumlah total uang yang digunakan oleh Ninja Ken.
SELECT SUM(price) -- dapatkan jumlah total dari kolom price dari hasil penyaringan baris dibawah
FROM purchases
WHERE character_name = "Ninja Ken"; -- dapatkan baris dengan nilai "Ninja Ken"!

-- Menghitung Rata-Rata
-- AVG
Untuk menghitung rata-rata angka di SQL, Anda dapat menggunakan AVG. Menggunakan syntax AVG (column_name), Anda dapat menghitung nilai rata-rata pada kolom yang dinginkan.
AVG(column_name)
-- Menggunakan AVG
Function AVG dapat digunakan setelah SELECT untuk menghitung rata-rata baris untuk kolom tertentu. Di kanan bawah ini adalah contoh keluaran hasilnya.
SELECT AVG(price)
FROM purchases;
-- Menggabungkan WHERE & AVG
Penggunaan function AVG juga dapat dikombinasikan dengan klausa WHERE. Pada contoh dibawah, kita menggunakan WHERE untuk mendapatkan harga rata-rata pembelian yang khususnya dilakukan oleh Ninja Ken.
SELECT AVG(price) -- kalkulasikan rata-rata kolom price dari hasil penyaringan baris dibawah
FROM purchases
WHERE character_name = "Ninja Ken"; -- dapatkan baris dengan nilai "Ninja Ken"!

-- Menghitung jumlah baris
-- count
Function COUNT digunakan untuk menghitung jumlah total baris pada kolom yang ditargetkan. Ini dapat dilakukan dengan menggunakan syntax COUNT(column_name) sebagaimana ditampilkan pada contoh di bawah.
COUNT(column_name)
-- count dan null
Saat menggunakan COUNT, jumlah baris yang terhitung tidak mencakup baris dengan nilai NULL. Oleh karena itu, untuk kasus seperti gambar di sebelah kanan, hasil akhir hitungan COUNT adalah 4.
COUNT(price)
-- Menggunakan count
Jika Anda ingin menghitung semua baris, termasuk baris dengan nilai NULL, Anda harus menggunakan * (tanda bintang) dengan function COUNT. Ketika digunakan, * akan menghitung jumlah total baris secara keseluruhan, termasuk yang nilainya NULL.
SELECT COUNT(*)
FROM purchases;
-- Where & Count
Penggunaan function COUNT juga dapat dikombinasikan dengan WHERE. Pada contoh di bawah, kita menggunakan keduanya untuk melihat total pembelian yang dilakukan oleh Ninja Ken.
SELECT COUNT(*) -- menghitung jumlah baris
FROM purchases
WHERE character_name = "Ninja Ken"; -- cari baris dengan nilai "Ninja Ken"!

-- Menemukan nilai maksimum dan minimum
-- MAX & MIN
Dengan function MAX di SQL, Anda bisa mendapatkan nilai maksimum dari baris milik kolom tertentu. Sebaliknya, dengan menggunakan function MIN, Anda bisa mendapatkan nilai minimum-nya.
MAX (column_name)
MIN (column_name)
-- Menggunakan MAX dan MIN
SELECT MAX(price)
FROM purchases;
Sama dengan function agregat lainnya, MAX dan MIN dapat digunakan setelah SELECT. Seperti contoh dibawah, dengan menetapkan kolom price di function MAX, Anda bisa mendapatkan item dengan harga tertinggi untuk semua baris dikolom price.
-- Menggabungkan WHERE dengan MAX・MIN
SELECT MAX(price) --dapatkan nilai maksimum dari hasil yang telah ditemukan
FROM purchases
WHERE character_name = "Ninja Ken";
Penggunaan MAX dan MIN dapat dikombinasikan dengan WHERE, sama caranya dengan function agregat lainnya. Pada contoh dibawah ini, kita menggunakan MAX dan WHERE untuk mendapatkan pembelian paling mahal yang dilakukan oleh Ninja Ken.

-- Mengelompokkan baris
-- grup by
Dengan GROUP BY, Anda dapat mengelompokkan baris. Misalnya, menggunakan syntax GROUP BY column_name, sebagaimana ditampilkan di bawah ini, baris dengan nilai yang sama akan dikelompokkan untuk kolom yang Anda tentukan.
GROUP BY column_name
-- mengelompokkan & mengagregat
Untuk menggunakan pengelompokan dengan data agregat, Anda dapat menambahkan GROUP BY column_name pada akhir statement SQL seperti gambar disisi kiri. Dalam kasus seperti gambar dibawah, code ini akan menerapkan function agregat untuk menampilkan jumlah harga bagi setiap data tanggal unik dikolom "purchased_at".
SELECT SUM(price)
FROM purchases
GROUP BY purchased_at;
--catatan tentang group by
Saat menggunakan GROUP BY, kolom yang ditentukan untuk mengelompokkan item atau function agregat sering digunakan didalam SELECT. Seperti contoh di bawah ini, karena function agregat SUM() tidak diberikan nama kolom, tidak ada yang dapat dikelompokkan oleh GROUP BY dan pada akhirnya yang ditampilkan adalah instance untuk setiap nilai "purchased_at".
SELECT SUM(price), purchased_at
FROM purchases
GROUP BY purchased_at;

-- Mengelompokkan hasil dari banyak kolom
-- Cara Menggunakan GROUP BY dengan banyak Kolom
Anda dapat menggunakan GROUP BY untuk banyak kolom dengan memasukkan nama kolom-kolom tersebut dan memisahkannya dengan koma (,). Kita akan lihat apa saja jenis pengelompokan dan agregat yang dapat dibuat dislide berikutnya.
GROUP BY kolom1,kolom2... -- gunakan koma

SELECT SUM(price),purchased_at,character_name
FROM purchases
GROUP BY purchased_at,character_name;
-- GROUP BY dengan Banyak Kolom
Menggunakan GROUP BY dengan beberapa kolom dapat mengkombinasikan data untuk menghasilkan grup seperti di bawah ini.
-- Hasil Penggunaan GROUP BY dengan banyak Kolom
Menggunakan function agregat pada grup tertentu akan lebih efektif daripada menggunakannya pada semua hasil. Dibawah ini adalah contoh penggunaan function SUM dan COUNT pada hasil yang telah dikelompokkan.
-- dapatkan total harga purchases berdasarkan purchased_at dan character_name
SELECT SUM(price), purchased_at, character_name 
FROM purchases
GROUP BY purchased_at, character_name;
/*
dapatkan total berapa kali purchases terjadi berdasarkan
purchased_at and character_name
*/

SELECT COUNT(*), purchased_at, character_name 
FROM purchases
GROUP BY purchased_at, character_name;

-- Mengelompokkan Menurut Kondisi Tepat
-- WHERE & GROUP BY
GROUP BY juga dapat digunakan dengan klausa WHERE. Untuk melakukan hal ini, letakkan GROUP BY setelah WHERE dalam statement SQL. Sebagaimana ditampilkan dibawah, function ini memiliki urutannya sendiri: WHERE diletakkan pertama, lalu GROUP BY, diikuti dengan function agregat.
SELECT aggregate_function
FROM table_name
WHERE Kondisi
GROUP BY kolom1,kolom2; -- diletakkan setelah WHERE!
-- Urutan Penggunaan WHERE dan GROUP BY (1)
Untuk mendapatkan jumlah total uang makanan yang dibelanjakan setiap karakter pada hari tertentu, ikuti 3 langkah berikut:
① Cari baris dengan nilai category "makanan"
② Kelompokkan nilai menurut kolom character_name dan purchased_at. Untuk langkah ketiga akan dijelaskan pada slide berikutnya.
-- Urutan Penggunaan WHERE dan GROUP BY (2)
Terakhir, ③ Terapkan function agregat untuk mengelompokkan hasil.
-- Menulis SQL dengan WHERE dan GROUP BY
SELECT SUM(price), purchased_at, character_name
FROM purchases
WHERE category = "makanan" -- mencari baris yang memiliki "makanan"!
GROUP BY purchased_at, character_name; -- grup hasil berdasarkan tanggal dan nama karakter!
/*
tambahkan aturan di klausa WHERE untuk mengelompokkan
baris, dimana character_name adalah "Ninja Ken"
*/

SELECT SUM(price), purchased_at
FROM purchases
WHERE character_name = "Ninja Ken"
GROUP BY purchased_at;
/*
Tambahkan klausa WHERE untuk mendapatkan baris dengan category "makanan"
setelah itu, kelompokkan hasilnya berdasarkan kolom
purchased_at dan character_name 
*/

SELECT SUM(price), purchased_at, character_name
FROM purchases
WHERE category = "makanan"
GROUP BY purchased_at, character_name;

-- Mempersempit data yang dikelompokkan
-- HAVING
Jika Anda ingin mempersempit penyaringan hasil data yang dikelompokkan menggunakan GROUP BY, Anda dapat menggunakan HAVING. Sebagaimana ditampilkan pada contoh dibawah, kita bisa mendapatkan grup dengan kondisi tertentu dengan menggunakan syntax: GROUP BY column_name HAVING kondisi.
GROUP BY column_name
HAVING kondisi;
-- WHERE & HAVING
Untuk mempersempit data setelah pengelompokan, gunakanlah HAVING, bukan WHERE, karena SQL memiliki urutan specific dalam menjalankan kueri-nya. Sebagaimana ditampilkan pada gambar di bawah, WHERE dijalankan pertama, lalu GROUP BY, lalu function, dan HAVING dijalankan terakhir.
-- Perbedaan Antara
WHERE dan HAVING
Bergantung pada urutannya, WHERE dan HAVING mencari target yang berbeda. WHERE mencari seluruh tabel sebelum pengelompokan, sementara HAVING mencari grup yang dibuat dengan GROUP BY.
-- Catatan Tentang HAVING
Karena HAVING mencari dari tabel setelah pengelompokan, kolom yang digunakan dalam pernyataan kondisional selalu menggunakan kolom dari tabel yang dikelompokkan.
SELECT SUM(price),purchased_at
FROM purchases
GROUP BY purchased_at
HAVING SUM(price) > 10; -- menggunakan kolom setelah gruping!
/*
dapatkan total harga, lalu kelompokkan hasilnya berdasarkan tanggal,
hanya untuk grup yang memiliki total harga lebih dari 20
*/

SELECT SUM(price), purchased_at
FROM purchases
GROUP BY purchased_at
HAVING SUM(price) > 20;
/*
grup berdasarkan categori, setelah itu dapatkan total jumlah kolom price
dan kolom category untuk setiap grup
*/

SELECT SUM(price), category
FROM purchases
GROUP BY category
;
/*
buatlah sebuah grup untuk setiap karakter,
dan dapatkan total jumlah dari kolom price dan character_name 
tetapi, aggregatkan hasil hanya untuk kolom category dengan nilai "lainnya"
*/

SELECT SUM(price), character_name
FROM purchases
WHERE category = "lainnya"
GROUP BY character_name
;


-- Database adalah tempat untuk menyimpan string dan angka --

SELECT name -- dari kolom apa? --
FROM purchases -- dari tabel apa? --

-- WHERE, untuk mendapatkan baris tertentu gunakan WHERE. --
WHERE category="makanan"

-- *** IMPORTANT --> akhiri dengan tanda titik koma ; --
-- Jika ingin mendapatkan semua data dari kolom dalam tabel menggunakan simbol * --
SELECT *
FROM purchases

-- mari kita coba menulis kueri untuk menampilkan semua baris yang memenuhi syarat "produk dengan harga 10$", harga dalam kolom "price" disimpan sebagai jenis data integer/angka. --
-- *** Integer tidak perlu menggunakan tanda petik --
SELECT *
FROM purchases
WHERE price = 10;

-- Selanjutnya, kita akan menampilkan baris dengan tanggal "2018-10-10". Data dalam kolom "purchased_at" disimpan sebagai jenis data "tanggal". Untuk jenis data tanggal, diperlukan tanda kutip. Jadi, jangan lupa menulis tanda kutip pada setiap penulisan nilai data tanggal! --
SELECT *
FROM purchases 
WHERE purchases_at = "2018-10-17"

-- OPERATOR PERBANDINGAN, Selain tanda =, terdapat simbol lain yang dapat digunakan dalam klausa WHERE. Mereka disebut operator perbandingan. Seperti operator lebih dari dan kurang dari pada gambar dikiri bawah. Dengan ini, Anda dapat membuat kondisi seperti "jika kolom harga lebih dari atau sama dengan $10" untuk menampilkan baris dengan data yang sesuai. --
SELECT *
FROM purchases
WHERE price >= 10; //mencari baris dengan harga yang "lebih besar dari atau sama dengan" 10

-- OPERATOR PERBANDINGAN, Selain data angka didalam kolom "price", operator perbandingan dapat digunakan pada jenis data "tanggal" seperti pada kolom "purchased_at". Jangan lupa gunakan tanda kutip untuk nilai tanggalnya! --
SELECT *
FROM purchases
WHERE purchased_at <= "2018-11-01"; //mencari baris dengan tanggal "sebelum atau sama dengan 2018-11-01"!

-- OPERATOR LIKE, Saat ingin menampilkan baris yang berisi karakter tertentu, gunakan operator LIKE. Sebagaimana ditampilkan di bawah, kamu bisa menetapkan kondisi untuk menampilkan "baris yang berisi string tertentu" di kolom yang diinginkan. --
SELECT *
FROM purchases
WHERE name LIKE nilai_string

-- WILDCARD, Untuk menggunakan operator LIKE, Anda harus belajar tentang wildcard. Dalam dunia pemrograman, "wildcard" adalah simbol untuk menggantikan satu / beberapa karakter dalam sebuah string. Simbol wildcard (%) dapat digunakan dengan operator LIKE --
SELECT *
FROM purchases
WHERE name LIKE "%puding%" -- anda dapat mencari string apapun yang memiliki "puding" dengan memberikan wildcard (%) sebelum dan sesudah kata "puding" --

-- PENCARIAN PREFIKS, Wildcard bisa digunakan di awal dan akhir sebuah string. Seperti di bawah ini, wildcard "puding%" bisa digunakan untuk mencari "puding" dan semua nilai di database yang diawali dengan "puding" (lihat contoh dibawah). Pencarian ini disebut pencarian prefiks. --
SELECT *
FROM purchases
WHERE name LIKE "puding%" -- mencari nilai yang mulai dengan "puding" --

-- PENCARIAN POSTFIKS, Kamu juga bisa mencari nilai-nilai dengan akhir string tertentu, misalnya "%puding" (lihat contoh dibawah ini). Semua nilai yang diakhiri dengan string "puding" akan ditampilkan. Pencarian semacam ini disebut pencarian postfiks. --\
SELECT * 
FROM purchases
WHERE name LIKE "%puding"; -- mencari nilai yang berakhir dengan "puding" --

-- OPERATOR NOT, Untuk menampilkan baris yang tidak memiliki nilai tertentu, gunakan operator NOT. Sebenarnya, NOT bisa digunakan didepan semua operator yang sudah kita pelajari. Dengan begitu, semua baris yang tidak memenuhi kondisi yang ditentukan akan ditampilkan.
SELECT *
FROM purchases
WHERE NOT name > 10 -- mengambil baris yang tidak memenuhi kondisi --

SELECT *
FROM purchases
WHERE NOT name LIKE "%puding%" -- mengambil bari yang tidak memenuhi kondisi --

/*
dibawah "FROM purchases" tambahkan code untuk mendapatkan semua baris dimana
kolom "character_name" tidak mengandung kata "Ninja Ken"
*/

SELECT *
FROM purchases
WHERE NOT character_name = "Ninja Ken";

/*
dibawah "FROM purchases" tambahkan code untuk mendapatkan semua baris dimana
kolom "name" tidak mengandung kata "puding"
*/

SELECT *
FROM purchases
WHERE NOT name LIKE "%puding%";

-- MENAMPILKAN BARIS DENGAN NILAI NULL, Untuk memilih baris yang berisi nilai NULL dikolom tertentu, gunakan IS NULL. Sebagai contoh di bawah ini, dengan kondisi misalnya "WHERE column_name IS NULL" kita bisa mencari baris dimana kolomnya bernilai NULL. Ini berguna disituasi dimana kita mau mencari kolom yang kita lewatkan tanpa sengaja. --
SELECT * FROM purchases
WHERE price IS NULL; -- mengambil data dari kolom price yang isi barisnya adalah null

-- MENAMPILKAN BARIS TANPA NILAI NULL, Sebaliknya, IS NOT NULL dapat digunakan untuk menampilkan baris yang tidak berisi nilai NULL untuk kolom tertentu. --
SELECT * FROM purchases
WHERE price IS NOT NULL -- mengambil data dari kolom price yang isi barisnya bukanlah null --

-- MEMBANDINGKAN NIALI DENGAN NULL, Untuk mendapatkan baris dimana kolom tertentu berisi atau tidak berisi NULL, kamu tidak dapat menggunakan operator =. Hati-hati jangan sampai melakukan kesalahan ini. --
SELECT * FROM purchases
WHERE price = NULL; --TIDAK BISA DIGUNAKAN --

-- OPERATOR AND, Dengan menggunakan AND, kita bisa menentukan beberapa kondisi atau syarat untuk klausa WHERE. Gunakan struktur "WHERE kondisi1 AND kondisi2" untuk mencari baris yang memenuhi kedua kondisi. --
SELECT * FROM purchases
WHERE character_name = "Guru Domba" -- kondisi 1 --
AND category = "makanan" --kondisi 2 -- 

-- OPERATOR OR, Seperti operatorAND, operator OR dapat digunakan di kueri SQL untuk memasukkan beberapa kondisi. Gunakan struktur "WHERE kondisi1 OR kondisi2" untuk mencari baris yang memenuhi salah satu kondisi (atau keduanya). --
SELECT * FROM purchases
WHERE character_name = "Guru Domba" -- kondisi 1 --
OR character_name = "Ninja Ken" -- kondisi 2 --

-- MENGURUTKAN BARIS --
-- ORDER BY 1 Dalam SQL, kamu bisa mengurutkan baris menggunakan ORDER BY. Kamu juga bisa memilih kolom tertentu yang ingin kamu urutkan, seperti contoh berikut ini. Kamu juga harus menentukan bagaimana cara pengurutannya di bagian akhir kueri. --
ORDER BY column_name method_order;
-- URUTAN NAIK TURUN, ORDER BY memerlukan method untuk mengurutkan data secara "menurun (DESC)" atau "menaik (ASC)". Urutan naik akan meletakkan nilai terkecil terlebih dahulu. Sedangkan urutan turun akan meletakkan nilai terbesar terlebih dahulu. Dalam code SQL, ASC digunakan untuk "ascending (menaik)" sedangkan DESC digunakan untuk "descending (menurun)" --
-- ORDER BY 2, Jika menuliskan ORDER BY di akhir sebuah statement SQL, hasil akan diurutkan seperti contoh di bawah ini.
SELECT *
FROM purchases
ORDER BY price DESC;
-- ORDER BY 3, karena ORDER BY digunakan diakhir statement SQL, ORDER BY dapat digunakan dengan klausa WHERE seperti gambar dibawah.
SELECT *
FROM purchases
WHERE kondisi
ORDER BY price DESC;
/* 
dibawah "FROM purchases" tambahkan code untuk
menampilkan baris dari nilai yang terbesar dikolom "price"
*/

SELECT *
FROM purchases
ORDER BY price DESC;
/*
dibawah WHERE character_name = "Ninja Ken", tambahkan code untuk
menampilkan baris dari nilai terkecil dikolom "price"
*/

SELECT *
FROM purchases
WHERE character_name = "Ninja Ken"
ORDER BY price ASC;

-- HANYA MENAMPILKAN BARIS YANG DIPERLUKAN --
-- LIMIT 1, Untuk menentukan "jumlah maksimum hasil" tertentu, gunakan LIMIT. Lihat cara kerjanya pada contoh di bawah ini. --
LIMIT jumlah_baris;
-- LIMIT 2, Seperti ORDER BY, LIMIT digunakan di akhir sebuah kueri SQL. Jadi, kamu bisa menggunakannya untuk membatasi jumlah hasil. --
SELECT *
FROM purchases
LIMIT 5;
-- LIMIT 3, Selain itu, seperti ORDER BY, LIMIT juga bisa digunakan bersamaan dengan klausa WHERE.
SELECT *
FROM purchases
WHERE kondisi
LIMIT 5;

-- 【Tambahan】Menggabungkan ORDER BY dengan LIMIT, ORDER BY dan LIMIT ditulis diakhir kueri SQL, tapi mereka dapat digunakan bersamaan dalam satu pernyataan. Pada saat menggunakannya secara bersamaan, LIMIT harus ditulis paling akhir. Berikut ini adalah contoh cara menampilkan hanya 5 harga teratas. --
SELECT *
FROM purchases
ORDER BY price DESC
LIMIT 5;
/*
Dibawah "FROM purchases" tambahkan code untuk mengambil baris
dengan nilai tanggal "2018-11-01" dan sebelumnya, dari kolom "purchased_at"
*/

SELECT *
FROM purchases
WHERE purchased_at <= "2018-11-01";
/*
Dibawah "FROM purchases" tambahkan code untuk baris dimana
kolom "name" mengandung string "puding"
*/

SELECT *
FROM purchases
WHERE name LIKE "%puding%";
/*
dibawah "FROM purchases" gunakan operator NOT untuk menambahkan code untuk
mengambil baris dimana nilai kolom "character_name" adalah bukan "Ninja Ken"
*/

SELECT *
FROM purchases
WHERE NOT character_name = "Ninja Ken";
/*
dibawah "FROM purchases" tambahkan code untuk
menambahkan baris dimana kolom "price" adalah NULL
*/

SELECT *
FROM purchases
WHERE price IS NULL;
/*
setelah "FROM purchases" tambahkan code untuk mengambil baris dimana nilai
kolom "category" adalah "makanan" dan kolom "character_name" adalah "Guru Domba"
*/

SELECT *
FROM purchases
WHERE category = "makanan"
AND character_name = "Guru Domba";
/*
dibawah "FROM purchases" tambahkan code untuk mengambil maksimum 5 baris
dengan urutan terbesar dari kolom "price"
*/

SELECT *
FROM purchases
ORDER BY price DESC
LIMIT 5;
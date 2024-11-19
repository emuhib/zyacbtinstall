# zyacbtinstall
Untuk Install ZYA CBT

### 1. Unduh dan Instal File Installer
Jalankan perintah berikut untuk mengunduh installer:

```bash
wget https://raw.githubusercontent.com/emuhib/zyacbtinstall/main/setup_lamp_cbt_interactive.sh
```

### 2. Berikan Izin Eksekusi pada File
Setelah diunduh, berikan izin agar file dapat dijalankan:

```bash
chmod +x setup_lamp_cbt_interactive.sh
```

### 3. Jalankan Installer
Jalankan installer dengan perintah berikut:

```bash
sudo bash setup_lamp_cbt_interactive.sh
```

### 4. Masukkan username dan password untuk pengguna MySQL saat diminta.

### 5. Rename ke cbt dan Unggah File CBT dari Mas Lutfi melalui FTP.
Unggah File ke folder /var/www/html/ lalu hapus file index.html (bawaan apache)

### 6. Extract file CBT
Jalankan dengan perintah berikut:
```bash
sudo 7z x /var/www/html/cbt.7z -o/var/www/html/
```
### 7. Rename file sql bawaan ZYACBT yang dibutuhkan
Masuk lewat FTP dan ke Folder /var/www/html/

### 8. Impor Database sql yang barusan di Rename ke MySQL
Jalankan Perintah Berikut ini, Jangan Lupa Ubah cbt_user sesuai yang anda buat tadi :
```bash
mysql -u cbt_user -p cbt_database < /var/www/html/cbt.sql
```
### 9. Edit Konfigurasi CBT
Jalankan Perintah, Lalu sesuaikan "cbt_user", "cbt_database" dan "cbt_Pasword" :
```bash
sudo nano /var/www/html/application/config/database.php
```
Setelah disesuaikan, press CRTL+X Lalu Yes Lalu Enter

### 10. Mengubah Izin File dan Direktori
Jalankan Perintah berikut ini:
```bash
sudo chown -R www-data:www-data /var/www/html && sudo find /var/www/html -type d -exec chmod 755 {} \; && sudo find /var/www/html -type f -exec chmod 644 {} \;
```

### 11. Restart Apache
```bash
sudo systemctl restart apache2
```

# TERAKHIR MENGATUR ONLY FULL GRUP MYSQL

### 1. Login ke MySQL
```bash
mysql -u root -p
```
### 2. Periksa Mode SQL Aktif
```bash
SELECT @@sql_mode;
```
### 3. Nonaktifkan Mode ONLY FOR GROUP BY
```bash
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
```
### 4. Verifikasi Perubahan Mode ONLY FOR GROUP BY
```bash
SELECT @@sql_mode;
```
### 5. Exit
```bash
EXIT;
```
Saat ini sudah bisa digunakan tapi jika server MySQL Restart maka akan terjadi error lagi, Untuk menanggulangi hal itu ikuti langkah berikut ini:

### 1. Edit File Konfigurasi MySQL
```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```
### 2. Tambahkan atau Edit Baris Berikut
```bash
[mysqld]
sql_mode = "STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
```
Jangan Lupa Save, Ketik CTRL+X lalu Y lalu Enter

### 3. Restart MySQL
```bash
sudo systemctl restart mysql
```

## Sekarang CBT Siap digunakan, Silahkan akses dengan IP VPS anda 

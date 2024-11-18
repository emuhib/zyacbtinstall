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

### 5. Rename ke cbt dan Unggah File CBT dari Mas Lutfi melalui SCP.
```
Unggah File ke folder /var/www/html/
```
### 6. Extract file CBT
Jalankan dengan perintah berikut:
```bash
sudo 7z x /var/www/html/cbt.7z -o/var/www/html/
```

PERTAMA :
- install xampp pada laptop
- buka pada browser http://localhost/phpmyadmin
- buat db dengan nama tes_sekai
- kemudian import DB ke dalam db tes_sekai, DB ada di dalam folder api_tes_sekai
- selesai

KEDUA :
- install flutter pada laptop
- install visual studio code sebagai editor
- buka folder tes_sekai_mobile
- ganti value dari variable url yang ada di dalam file i_constant.dart dengan IP local yang di gunakan sebagai server local (pastikan IP harus 1 router agar dapat tersambung)
  file i_constant.dart ada di dalam tes_sekai_mobile/lib/util
- jalankan flutter
- email dan pass yang sudah ada adalah user berikut :
  - putra3@gmail.com (pass: tes)
  - supriyatno@gmail.com (pass: tes)
  - mike@gmail.com (pass: tes)

KETIGA :
- pindahkan folder tes_sekai_web ke dalam xampp/htdocs
- ganti setiap url API yang berada di dalam folder service dengan IP address yang di gunakan sebagai server local.
  jika db dan web berada dalam 1 htdocs, maka bisa menggunakan localhost sebagai IP address local
- buka browser dan jalan kan http://localhost/tes_sekai_web/login.php
- user login sesuai yang di minta dalam soal TEST :
  - username : sekai
  - password : tpetestIT
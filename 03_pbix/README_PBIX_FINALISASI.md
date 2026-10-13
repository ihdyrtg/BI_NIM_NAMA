# Finalisasi PBIX M04-M07

Repository yang diperiksa sudah memiliki M01, M02, dan M03. Lanjutkan dari `M03_Nama_NIM.pbix`.

## M04_Nama_NIM.pbix
1. File > Save As M04_Nama_NIM.pbix.
2. Buat reference `audit_Fact_Sales_Branch` dari Fact_Sales.
3. Left Outer merge ke Dim_Branch pada Branch_ID.
4. Expand Branch_Name dan buat `Branch_Key_Audit`.
5. Verifikasi 4 transaksi B099.
6. Terapkan pilihan **Unknown / Unmapped Branch** sesuai decision log paket: buat row B099 dan append ke `Dim_Branch_Model`.
7. Jangan mengubah row count Fact_Sales dasar (tetap 15.712).

## M05_Nama_NIM.pbix
1. Save As dari M04/M03 yang sudah konsisten.
2. Buat tabel `_Measures` dan sembunyikan Placeholder.
3. Tambahkan 8 measure P05 dari `06_resources/DAX/P05_Measures.dax`.
4. Tambahkan format, Description, dan Display Folder.
5. Buat page `05_Validasi_Measures`: 8 Card + slicer Transaction_ID, Branch_ID, Month_Start.
6. Uji baseline, T0000001, B001, dan Jan 2024 menggunakan workbook validasi.

## M06_Nama_NIM.pbix
1. Pastikan Fact_Sales, Fact_Target, Dim_Date, Dim_Product, Dim_Branch tersedia.
2. Periksa relationship sesuai `06_resources/Model/Relationship_Spec.md`.
3. Gunakan measure P06 dari `06_resources/DAX/P06_Dashboard_Measures.dax`.
4. Buat Executive Overview 16:9: 4 Card, Sales by Month, Profit by Category, Branch x KPI, slicer Year/Branch/Channel.
5. Uji Edit interactions dan tooltip.

## M07_Nama_NIM.pbix
1. Save As dari M06.
2. Buat 3 halaman: Executive, Product & Campaign, Branch & Customer.
3. Tambahkan Page Navigator.
4. Tambahkan hidden page `Branch Detail` dengan drillthrough Branch_Name.
5. Tambahkan hidden report page tooltip `Tooltip Product` dengan Product_Name.
6. Tambahkan bookmark `Fokus Penjualan` dan `Fokus Laba`; matikan opsi Data bila bookmark hanya mengubah visibility.
7. Lakukan 5-second test dengan tester nyata dan terapkan minimal 1 revisi.
8. Jalankan QA `06_resources/QA/M07_QA_CHECKLIST.md`.

Catatan: jangan membuat PBIX kosong hanya untuk memenuhi nama file. File harus benar-benar dapat dibuka dan interaksinya diuji di Power BI Desktop.

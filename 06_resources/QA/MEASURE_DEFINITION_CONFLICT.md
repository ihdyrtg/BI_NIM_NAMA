# Konflik Definisi Measure: Gross Profit

Ini bukan error pengetikan yang boleh disamarkan.

## Praktikum 05
`Gross Profit = [Total Sales] - [Total Cost]`
Baseline modul: sekitar **Rp461.461.814,12**, Profit Margin sekitar **32,15%**.

## Praktikum 06-07
`Gross Profit`/`Total Laba = SUM(Fact_Sales[Profit])`
Benchmark modul: sekitar **Rp457,64 juta**, margin sekitar **31,9%**.

## Implikasi
Dua angka itu berbeda, sehingga satu nama measure tidak boleh diam-diam dipakai untuk dua definisi.

## Pilihan aman dalam paket ini
- pertahankan `Gross Profit P05` dan `Profit Margin P05` untuk validasi Praktikum 05;
- gunakan `Gross Profit P06`/`Total Laba` dan `Profit Margin P06`/`Margin Laba` untuk dashboard Praktikum 06-07;
- bila dosen ingin satu definisi kanonik sepanjang semester, minta keputusan eksplisit lalu ubah catalog dan semua visual secara konsisten.

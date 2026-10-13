# Relationship Specification - P06/P07

Gunakan star-schema/filter direction yang terkontrol. Minimal:

- `Dim_Date` -> `Fact_Sales` melalui key tanggal (`Date`/`Date_Key` sesuai implementasi model).
- `Dim_Date` -> `Fact_Target` melalui key bulan (`Month_Key` atau relasi bulan yang digunakan pada project).
- `Dim_Branch` -> `Fact_Sales` melalui `Branch_ID`.
- `Dim_Branch` -> `Fact_Target` melalui `Branch_ID`.
- `Dim_Product` -> `Fact_Sales` melalui `Product_ID`.
- `Dim_Customer` -> `Fact_Sales` melalui `Customer_ID`.

Peringatan: jangan merge `Fact_Operations` (grain bulan-cabang) langsung ke `Fact_Sales` (grain transaksi) hanya menggunakan Branch_ID karena dapat menggandakan baris dan menginflasi KPI.

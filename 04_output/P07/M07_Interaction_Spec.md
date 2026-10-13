# M07 Interaction Spec

## Page navigation
Executive -> Product & Campaign -> Branch & Customer. Gunakan Page Navigator dan pastikan state Selected terlihat jelas.

## Branch Detail
- Drill-through field: Dim_Branch[Branch_Name]
- Cards: Total Penjualan, Total Laba, Margin Laba, Jumlah Transaksi
- Table: Transaction_ID, Transaction_Date, Product_Name, Customer_ID, Quantity, Revenue, Profit, Campaign
- Back button
- Hide page dari navigasi utama

## Tooltip Product
- Canvas size Tooltip; Page Information Tooltip=On
- Tooltip field Dim_Product[Product_Name]
- Card Total Penjualan, Card Total Laba, line chart Month_Year x Total Penjualan
- Hide page

## Bookmarks
- Fokus Penjualan: show line Sales, hide line Profit
- Fokus Laba: show line Profit, hide line Sales
- Matikan opsi Data bila tujuan hanya visibility sehingga slicer user tidak reset
- Tambahkan Bookmark Navigator

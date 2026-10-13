from pathlib import Path
import sys

root = Path(sys.argv[1] if len(sys.argv) > 1 else '.').resolve()
checks = [
 ('Dataset raw', root/'01_data_raw/Dataset_Praktikum_BI_Raw.xlsx', False),
 ('M02 PBIX', root/'03_pbix/M02_Nama_NIM.pbix', False),
 ('M03 PBIX', root/'03_pbix/M03_Nama_NIM.pbix', False),
 ('M04 PBIX', root/'03_pbix/M04_Nama_NIM.pbix', True),
 ('M05 PBIX', root/'03_pbix/M05_Nama_NIM.pbix', True),
 ('M06 PBIX', root/'03_pbix/M06_Nama_NIM.pbix', True),
 ('M07 PBIX', root/'03_pbix/M07_Nama_NIM.pbix', True),
 ('P02 profiling', root/'04_output/P02/M02_Profiling_Nama_NIM.xlsx', False),
 ('P04 decision log', root/'04_output/P04/M04_Decision_Log_B099.pdf', False),
 ('P05 measure catalog', root/'04_output/P05/M05_Measure_Catalog.xlsx', False),
 ('P06 blueprint', root/'04_output/P06/M06_Executive_Overview_Blueprint.png', False),
 ('P07 user test', root/'04_output/P07/M07_5SecondTest_TEMPLATE.xlsx', False),
]
print('BI Project Verification:', root)
missing_required=[]
for name,p,needs_powerbi in checks:
    ok=p.exists() and p.stat().st_size>0
    tag='OK' if ok else ('POWER BI REQUIRED' if needs_powerbi else 'MISSING')
    print(f'[{tag:17}] {name:22} {p.relative_to(root)}')
    if not ok and not needs_powerbi: missing_required.append(name)
print('\nCatatan: M04-M07 harus berupa PBIX nyata yang dapat dibuka; script tidak menganggap file placeholder sebagai selesai.')
if missing_required:
    print('Komponen non-PBIX yang belum ditemukan:', ', '.join(missing_required))
    sys.exit(1)

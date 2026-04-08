SELECT tgltr tanggal,regional,outlet,
CASE
WHEN LOWER(ketproduk) LIKE '%meterai%' THEN 'METERAI'
WHEN LOWER(ketproduk) LIKE '%filateli%'
OR LOWER(ketproduk) LIKE '%prangko%' THEN 'FILATELI'
ELSE 'KONSINYASI'
END AS kategori,SUM(PRODUKSI)produksi,SUM(PENDAPATAN)pendapatan,
'KONSINYASI FILATELI' sumber
FROM FEEDER_SAP_RITEL
WHERE tgltr>'20260101'
GROUP BY tgltr,CASE
WHEN LOWER(ketproduk) LIKE '%meterai%' THEN 'METERAI'
WHEN LOWER(ketproduk) LIKE '%filateli%'
OR LOWER(ketproduk) LIKE '%prangko%' THEN 'FILATELI'
ELSE 'KONSINYASI'
END,regional,outlet

SELECT tgltr tanggal,regional,outlet,
UPPER(ketproduk) ketproduk,
'JASA KEUANGAN' sumber ,
SUM(PRODUKSI)produksi,SUM(PENDAPATAN)pendapatan
FROM FEEDER_SAP_JASKUG
WHERE tgltr>'20260101'
GROUP BY tgltr,UPPER(ketproduk),regional,outlet

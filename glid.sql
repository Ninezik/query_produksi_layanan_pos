SELECT
date(tgl_billing) tanggal, 
kode_nopen,
service_name,
'GLID' as kategori,
COUNT(DISTINCT order_code) produksi,
SUM(
CASE
WHEN LOWER(jenis_produk) LIKE '%include%'
THEN total_amount / (1+(1.1/100))
ELSE total_amount
END
) AS pendapatan,
SUM(tot_weight_kg )berat,
'KURIR LOGISTIK' sumber
FROM glid.glid
where tgl_billing>'2026-01-01'
GROUP BY 1,2,3,4

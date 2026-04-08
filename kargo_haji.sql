SELECT date(created_at)created_at ,
kargo_haji_kolekting.countrycode ,
kargo_haji_kolekting.reciver_zipcode ,
'KARGO HAJI' as kategori,
COUNT(distinct no_resi)produksi,
SUM(total_fee_idr)/(1+(1.1/100)) pendapatan,
SUM(total_weight)berat,
'KURIR LOGISTIK' sumber
FROM kargo.kargo_haji_kolekting
where UPPER(status)='MANIFEST'
and is_paid='t'
GROUP BY
1,2,3

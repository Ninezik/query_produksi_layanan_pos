select DATE(t.created_at)tanggal,s.kota,
'AGRIPOS' kategori,
COUNT(DISTINCT t.id) produksi,
SUM(((p.price - p.base) * td.qty) / (1+(1.1/100))) pendapatan,
'KURIR LOGISTIK' sumber
from agripost.transactions t
LEFT JOIN agripost.transaction_details td
ON t.id = td.transaction_id
LEFT JOIN agripost.stores s
ON t.store_id = s.id
LEFT JOIN agripost.products p
ON td.product_id = p.id
WHERE t.store_id NOT IN (1,2,3,4,5,6,7,8,9,10,11,12)
and UPPER(t.status) ='SELESAI'
and t.created_at>'20260101'
group by 1,2

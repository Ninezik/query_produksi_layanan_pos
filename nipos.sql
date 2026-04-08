SELECT
date(nipos.connote__created_at ) AS tanggal,
date(nipos.connote__updated_at ) as tanggal_sampai,
connote__connote_sla_day,
customer_code,
nipos.nipos.location_data_created__custom_field__nopen ,
nipos.custom_field__destination_nopen ,
nipos.nipos.connote__connote_service ,
COUNT(connote__connote_code)produksi,
SUM(connote__connote_service_price +connote__connote_surcharge_amount )pendapatan,
'KURIR LOGISTIK' sumber
FROM nipos.nipos
WHERE connote__created_at > '20260101'
AND UPPER(connote__location_name) != 'AGP TESTING LOCATION'
AND UPPER(connote__connote_state) NOT IN ('CANCEL','PENDING')
and nipos.nipos.connote__connote_service !='LNINCOMING'
group by 1,2,3,4,5,6,7
limit 10

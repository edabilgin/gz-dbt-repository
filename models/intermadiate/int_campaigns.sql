select * from
{{ ref('stg_raw_gz_adwords') }}
union all
select * from
{{ ref('stg_raw_gz_bingo') }}
union all
select * from
{{ ref('stg_raw_gz_criteo') }}
union all
select * from
{{ ref('stg_raw_gz_facebook') }}

 --1-- 
     
 select p.product_code,
  pmr.region_name,
  s.* 
 from sales s
 join products p 
 on s.sal_prd_id = p.id and p.product_code = 'PRD8'
 join product_manufactured_region pmr 
 on p.product_man_region =pmr.id 
 where sal_date >= now()-interval '2 months';
 
	
--2--
explain analyze
 select p.product_code,
  pmr.region_name,
  s.* 
 from sales s
 join products p 
 on s.sal_prd_id = p.id and p.product_code = 'PRD8'
 join product_manufactured_region pmr 
 on p.product_man_region =pmr.id 
 where sal_date >= now()-interval '2 months';

      
-- execution time; 7,36ms, planning time:0.107ms
-- seq scan wykonane na produktach do wyszukania PRD8 (odfiltrowano 7 wierszy),
-- nastepnie, seq scan wykonane do zlaczenia prduct_manufacture_region, po odpowiednim polu z produktami 
--to wszystko laczone jest hash joinem, nastpnie seq scan na tabeli sales do odflitorwnia odpowiedniej daty,
-- calosc laczona hash joinem , koszt 30.79
 
      
      
--3--
select count(product_code),
  count(distinct product_code),
  count(distinct product_code)::float/count(*) as selectivity  
from products;     


--4--
create index prod_code on products using btree(product_code);

--5--

discard all;

explain analyze
 select p.product_code,pmr.region_name, s.* 
 from sales s
 join products p 
 on s.sal_prd_id = p.id and p.product_code = 'PRD8'
 join product_manufactured_region pmr 
 on p.product_man_region =pmr.id 
 where sal_date >= now()-interval '2 months';


--plan wyglada tak samo, chociaz trwa execution trwa troche krocej:5.2ms natomaist wydluzyl sie planning time:17.3ms
--indeks nei zostal wykorzystany

--6--
create index sal_dat_index on sales (sal_date);

--7--

discard all;

explain analyze
 select p.product_code,pmr.region_name, s.* 
 from sales s
 join products p 
 on s.sal_prd_id = p.id and p.product_code = 'PRD8'
 join product_manufactured_region pmr 
 on p.product_man_region =pmr.id 
 where sal_date >= now()-interval '2 months';
      
--plan wyglada tak samo, nie ma w nim informacji o uzyciu indeksu, jednak execution time zmniejszyl sie do
-- 5.323ms oraz planning time do 2.03 ms


--8--
 --dla insertowania bez partycji operacja insert do tabeli trwa krocej niz dla tej z partycjami (dla ktorej musi dopasowac dodatkowo wartosc do odpowiedniej partycji)

Execution Time: 9946.645 ms
Execution Time: 10569.012 ms

/* 1 */

select top 2 title, price, min(minprice) as minminprice from
(select title, price, min(price) as minprice from titles group by title, price) mp
group  by title, price, minprice;
;


select  min(price) as minprice from titles group by  price



select title, min(price) from titles group by title, price;

/* 2 */

select title, count(title) as countert from sales join titles on sales.title_id = titles.title_id where count(title) < 40 group by title, count(title);

select * from titles join sales on titles.title_id = sales.title_id where qty > 40;

/* 3 */

select * from authors  join titleauthor on authors.au_id = titleauthor.au_id where authors.au_id = NULL;
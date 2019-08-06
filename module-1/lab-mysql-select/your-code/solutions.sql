#Challenge 1

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id=titles.title_id
INNER JOIN publishers
ON titles.pub_id=publishers.pub_id;

#Challenge 2

SELECT authors.au_id AS AUTHOR_ID, 
authors.au_lname AS LAST_NAME, 
authors.au_fname AS FIRST_NAME, 
COUNT(titles.title_id) AS TITLE_COUNT, 
publishers.pub_name AS PUBLISHER
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id=titles.title_id
INNER JOIN publishers
ON titles.pub_id=publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name;

#Challenge 3

SELECT authors.au_id AS AUTHOR_ID, 
authors.au_lname AS LAST_NAME, 
authors.au_fname AS FIRST_NAME, 
SUM(titles.ytd_sales) AS TOTAL
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(titles.ytd_sales) DESC
LIMIT 3;

#Challenge 4

SELECT authors.au_id AS AUTHOR_ID,
authors.au_lname AS LAST_NAME, 
authors.au_fname AS FIRST_NAME, 
IFNULL(SUM(titles.ytd_sales),0) AS TOTAL
FROM authors
LEFT JOIN titleauthor
ON authors.au_id=titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC

#Bonus

SELECT 
DISTINCT(a.au_id) 'AUTHOR ID', 
a.au_lname 'LAST NAME', 
a.au_fname 'FIRST NAME',
sum(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) 'PROFIT'
FROM authors a
INNER JOIN titleauthor ta 
ON a.au_id=ta.au_id
INNER JOIN titles t 
ON ta.title_id=t.title_id
INNER JOIN sales s 
ON s.title_id=t.title_id
GROUP by a.au_id
ORDER BY sum(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) DESC
LIMIT 3;
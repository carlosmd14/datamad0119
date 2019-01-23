#Challenge 1

#Step 1:

CREATE TEMPORARY TABLE T1
SELECT authors.au_id AS Authors_ID,
IFNULL((sales.qty * titles.price * 0.01 * titles.royalty * 0.01 * titleauthor.royaltyper),0) AS Royalty_Per_Sale,
sales.ord_num AS Ord_Num,
titles.title_id AS Title_ID
FROM authors
LEFT JOIN titleauthor
ON authors.au_id=titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id=titles.title_id
LEFT JOIN sales
ON titles.title_id=sales.title_id;

#Step 2:

CREATE TEMPORARY TABLE T2
SELECT Authors_ID, Title_ID, 
SUM(Royalty_Per_Sale) AS Sum_Roy
FROM T1
GROUP BY Authors_ID, Title_ID;

#Step 3:

SELECT Authors_ID, (Sum_Roy + titles.advance) AS Total_Profit
FROM T2, titles
GROUP BY Authors_ID, Total_Profit
ORDER BY Total_Profit DESC
LIMIT 3;


#Challenge 2

SELECT Authors_ID, (Sum_Roy + titles.advance) AS Total_Profit
FROM (
	SELECT Authors_ID, Title_ID, 
	SUM(Royalty_Per_Sale) AS Sum_Roy
	FROM (
		SELECT authors.au_id AS Authors_ID,
		IFNULL((sales.qty * titles.price * 0.01 * titles.royalty * 0.01 * titleauthor.royaltyper),0) AS Royalty_Per_Sale,
		sales.ord_num AS Ord_Num,
		titles.title_id AS Title_ID
		FROM authors
		LEFT JOIN titleauthor
		ON authors.au_id=titleauthor.au_id
		LEFT JOIN titles
		ON titleauthor.title_id=titles.title_id
		LEFT JOIN sales
		ON titles.title_id=sales.title_id
	) T1
	GROUP BY Authors_ID, Title_ID
) T2, titles
GROUP BY Authors_ID, Total_Profit
ORDER BY Total_Profit DESC
LIMIT 3;


#Challenge 3

CREATE TABLE most_profiting_authors
SELECT Authors_ID AS au_id, (Sum_Roy + titles.advance) AS profits
FROM (
	SELECT Authors_ID, Title_ID, 
	SUM(Royalty_Per_Sale) AS Sum_Roy
	FROM (
		SELECT authors.au_id AS Authors_ID,
		IFNULL((sales.qty * titles.price * 0.01 * titles.royalty * 0.01 * titleauthor.royaltyper),0) AS Royalty_Per_Sale,
		sales.ord_num AS Ord_Num,
		titles.title_id AS Title_ID
		FROM authors
		LEFT JOIN titleauthor
		ON authors.au_id=titleauthor.au_id
		LEFT JOIN titles
		ON titleauthor.title_id=titles.title_id
		LEFT JOIN sales
		ON titles.title_id=sales.title_id
	) T1
	GROUP BY Authors_ID, Title_ID
) T2, titles
GROUP BY Authors_ID, profits
ORDER BY profits DESC
LIMIT 3;
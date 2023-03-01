/*Вывести жанр (или жанры), в котором было заказано больше всего экземпляров книг, указать это количество .
Последний столбец назвать Количество.*/

WITH СуммазаказовПоЖанрам as (
	SELECT genre_id, SUM(buy_book.amount) AS Количество 
    FROM buy_book
	INNER JOIN
		book ON book.book_id = buy_book.book_id
	GROUP BY genre_id)

SELECT 
	genre.name_genre,
	Количество
FROM СуммазаказовПоЖанрам
INNER JOIN
	genre ON СуммазаказовПоЖанрам.genre_id = genre.genre_id
WHERE Количество = (SELECT MAX(Количество) AS max_sum_amount FROM СуммазаказовПоЖанрам)
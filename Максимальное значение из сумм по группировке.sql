/*������� ���� (��� �����), � ������� ���� �������� ������ ����� ����������� ����, ������� ��� ���������� .
��������� ������� ������� ����������.*/

WITH �������������������� as (
	SELECT genre_id, SUM(buy_book.amount) AS ���������� 
    FROM buy_book
	INNER JOIN
		book ON book.book_id = buy_book.book_id
	GROUP BY genre_id)

SELECT 
	genre.name_genre,
	����������
FROM ��������������������
INNER JOIN
	genre ON ��������������������.genre_id = genre.genre_id
WHERE ���������� = (SELECT MAX(����������) AS max_sum_amount FROM ��������������������)
/*Вывести клиентов, которые делали покупки в прошлом году, но не делали в этом.
А также новых клиентов, которые делали заказы только в текущем году. Информацию отсортировать по возрастанию лет.*/
SELECT 
	name_client,
	MIN(YEAR(first_payment)) AS Ãîä
FROM
  (
	SELECT 
		name_client,
		MIN(date_payment) AS first_payment
	FROM 
		buy_archive 
	INNER JOIN client USING(client_id)
	GROUP BY  name_client

	UNION

	SELECT
		name_client,
		MIN(date_step_end)
	FROM 
       buy 
    INNER JOIN client USING(client_id)
    INNER JOIN buy_step USING (buy_id)
	GROUP BY
		name_client
  ) query_in
GROUP BY
	name_client
HAVING
	COUNT(*) = 1
ORDER BY 2

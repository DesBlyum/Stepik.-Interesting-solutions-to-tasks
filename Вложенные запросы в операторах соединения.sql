/*¬ывести информацию о книгах (название книги, фамилию и инициалы автора, название жанра, цену и количество экземпл€ров книги),
написанных в самых попул€рных жанрах, в отсортированном в алфавитном пор€дке по названию книг виде.
—амым попул€рным считать жанр, общее количество экземпл€ров книг которого на складе максимально.*/

SELECT  title, name_author, name_genre, price, amount
FROM 
    author 
    INNER JOIN book ON author.author_id = book.author_id
    INNER JOIN genre ON  book.genre_id = genre.genre_id
GROUP BY title,name_author,name_genre, genre.genre_id,price, amount
HAVING genre.genre_id IN
         (/* выбираем автора, если он пишет книги в самых попул€рных жанрах*/
          SELECT query_in_1.genre_id
          FROM 
              ( /* выбираем код жанра и количество произведений, относ€щихс€ к нему */
                SELECT genre_id, SUM(amount) AS sum_amount
                FROM book
                GROUP BY genre_id
               )query_in_1
          INNER JOIN 
              ( /* выбираем запись, в которой указан код жанр с максимальным количеством книг */
                SELECT genre_id, SUM(amount) AS sum_amount
                FROM book
                GROUP BY genre_id
                ORDER BY sum_amount DESC
                LIMIT 1
               ) query_in_2
          ON query_in_1.sum_amount= query_in_2.sum_amount
         )
ORDER by title; 
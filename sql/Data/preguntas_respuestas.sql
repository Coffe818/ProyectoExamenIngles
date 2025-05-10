
CREATE TEMPORARY TABLE  IF NOT EXISTS temp_respuestas (
    texto_respuesta VARCHAR(255),
    es_correcta BOOLEAN
);

        -- Pregunta 1
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 1, 'Hello, Jack. How are you?\n_____ Sophie! I’m great, thanks.', 'Beginner'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 1
        );
        
-- Respuestas para la pregunta 1

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('Hi', 1), ('Bye', 0), ('Goodbye', 0), ('Of course', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  1, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 1
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 2
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 2, 'Hey, do you know that girl?\nSure! ____ is the new student, Martha.', 'Beginner'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 2
        );
        
-- Respuestas para la pregunta 2

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('He', 0), ('They', 0), ('She', 1), ('We', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  2, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 2
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 3
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 3, 'Can you see those two men over there?\nYes, why?\nThey ____ my brothers, Carl and Craig.', 'Beginner'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 3
        );
        
-- Respuestas para la pregunta 3

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('is', 0), ('am', 0), ('be', 0), ('are', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  3, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 3
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 4
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 4, 'How old is she?\nShe____ 28 years old.', 'Beginner'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 4
        );
        
-- Respuestas para la pregunta 4

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('has', 0), ('is', 1), ('are', 0), ('have', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  4, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 4
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 5
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 5, 'Sophie really likes this movie, I think it’s _____ favorite movie because she told me she loves it!', 'Beginner'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 5
        );
        
-- Respuestas para la pregunta 5

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('my', 0), ('her', 1), ('his', 0), ('their', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  5, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 5
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 6
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 6, 'Hey, where ___ Charlie ___?\nHe is from France.', 'Beginner'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 6
        );
        
-- Respuestas para la pregunta 6

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('are / to', 0), ('am / from', 0), ('is / for', 0), ('is/ from', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  6, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 6
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 7
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 7, 'I need to buy ___ umbrella, ___ bag, and ____ wallet.', 'Beginner'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 7
        );
        
-- Respuestas para la pregunta 7

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('a / an / a', 0), ('an / a / a', 1), ('an / an / a', 0), ('a / a / an', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  7, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 7
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 8
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 8, 'Hey! Laurie, can you see ______ two cars in the distance?\nNo, I can’t. I need my glasses.', 'Beginner'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 8
        );
        
-- Respuestas para la pregunta 8

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('these', 0), ('that', 0), ('this', 0), ('those', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  8, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 8
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 9
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 9, 'There are more than ten _____ parked outside.', 'Beginner'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 9
        );
        
-- Respuestas para la pregunta 9

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('bus', 0), ('buses', 1), ('buzes', 0), ('buss', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  9, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 9
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 10
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 10, 'Can you describe your house, please?\nYes, It’s really big. __________  a big living room. Also, __________ four bathrooms and  four bedrooms.', 'Beginner'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 10
        );
        
-- Respuestas para la pregunta 10

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('there are / there is', 0), ('there is / there is', 0), ('there is / there are', 1), ('there are / there are', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  10, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 10
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 11
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 11, 'Excuse me, ______ can you find a good mall in this city?\nThe best malls are downtown. You can take a bus right there.', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 11
        );
        
-- Respuestas para la pregunta 11

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('why', 0), ('when', 0), ('where', 1), ('who', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  11, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 11
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 12
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 12, 'What do you usually do on Monday morning, Susana?\nOh! well… I usually ______ to work and spend the day in the office.', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 12
        );
        
-- Respuestas para la pregunta 12

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('Goes', 0), ('Went', 0), ('Going', 0), ('Go', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  12, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 12
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 13
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 13, '______ your sister like Pizza?\nYes, she loves it!', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 13
        );
        
-- Respuestas para la pregunta 13

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('Do', 0), ('Does', 1), ('Did', 0), ('Can', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  13, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 13
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 14
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 14, 'My mother really _______ to buy a new car.', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 14
        );
        
-- Respuestas para la pregunta 14

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('wants', 1), ('want', 0), ('is wanting', 0), ('wanting', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  14, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 14
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 15
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 15, 'I usually travel by plane but today I ___________ by bus!', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 15
        );
        
-- Respuestas para la pregunta 15

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('are  travel', 0), ('am  travel', 0), ('am travelling', 1), ('are travelling', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  15, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 15
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 16
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 16, 'What a beautiful car!\nYes, it’s _________. Her father gave it to her on her birthday.', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 16
        );
        
-- Respuestas para la pregunta 16

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('Lisas’ car', 0), ('Lisa her car', 0), ('Lisa’s car', 1), ('the car of Lisa', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  16, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 16
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 17
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 17, 'There are a lot of ______ and _______ in this office but no one cares about the infestation of _______ they have. It’s disgusting!', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 17
        );
        
-- Respuestas para la pregunta 17

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('mans / womans / mouses', 0), ('men / Women / mouses', 0), ('men / Womens / mice', 0), ('men / women / mice', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  17, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 17
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 18
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 18, 'I am perfect! I never _______ mistakes!\nNo one is perfect Johanna, that’s impossible.', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 18
        );
        
-- Respuestas para la pregunta 18

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('do', 0), ('make', 1), ('commit', 0), ('take', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  18, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 18
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 19
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 19, 'This restaurant is amazing! ____ food is good and ____ service is excellent. There is ____ beautiful painting, too.', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 19
        );
        
-- Respuestas para la pregunta 19

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('An / a / the', 0), ('The / the / the', 0), ('The / a / a', 0), ('The / the / a', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  19, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 19
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 20
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 20, 'Take a look at this picture of my new girlfriend. She ____ green eyes and blond hair. Also, she ____ very tall and thin.', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 20
        );
        
-- Respuestas para la pregunta 20

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('have / is', 0), ('is / Has', 0), ('has / is', 1), ('has / has', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  20, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 20
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 21
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 21, 'Let’s go to the beach on Saturday!\nOh, I _____ swim sorry. But we could go to the French club.\nI _____ speak French George, you know that.', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 21
        );
        
-- Respuestas para la pregunta 21

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('can / can', 0), ('don’t know / don’t know', 0), ('can’t / can’t', 1), ('no / Don’t', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  21, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 21
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 22
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 22, 'Where are you on Monday morning?\nI usually spend my mornings ____ the office.', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 22
        );
        
-- Respuestas para la pregunta 22

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('on', 0), ('in', 1), ('at', 0), ('to', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  22, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 22
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 23
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 23, 'Whose notebook is this?\nIt’s _______.', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 23
        );
        
-- Respuestas para la pregunta 23

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('mine', 1), ('my', 0), ('her', 0), ('their', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  23, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 23
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 24
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 24, 'What are some differences between a car and a motorcycle?\nI suppose cars are _______ and _______, too!', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 24
        );
        
-- Respuestas para la pregunta 24

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('more fast / more expensive', 0), ('faster / expensiver', 0), ('more fast / expensiver', 0), ('faster / more expensive', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  24, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 24
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 25
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 25, 'I was thinking about our next anniversary.\nMe too! I would _________  it in Asia this year.', 'Elementary'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 25
        );
        
-- Respuestas para la pregunta 25

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('like celebrate', 0), ('like to celebrating', 0), ('like to celebrate', 1), ('to like celebrate', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  25, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 25
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 26
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 26, 'Hey Mark, where ____ you ____ last night?\nI went to the supermarket, why?', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 26
        );
        
-- Respuestas para la pregunta 26

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('did / go', 1), ('did / went', 0), ('do / went', 0), ('do / go', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  26, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 26
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 27
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 27, 'I _____ to her yesterday but I didn’t _____ to you! I swear!.', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 27
        );
        
-- Respuestas para la pregunta 27

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('talk / lied', 0), ('talked / lied', 0), ('talked / lie', 1), ('talk / lie', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  27, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 27
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 28
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 28, 'How ______ sugar do you like in your coffee?\nI like my coffee with _____ sugar, not much.', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 28
        );
        
-- Respuestas para la pregunta 28

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('many / any', 0), ('much / some', 1), ('many / some', 0), ('much / any', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  28, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 28
        );
        

        TRUNCATE temp_respuestas  ;

         -- Pregunta 29
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 29, 'I hate my legs! they are ____ fat. My hair is _____ pretty, though.', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 29
        );
        
-- Respuestas para la pregunta 29

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('too / Too', 0), ('really / too', 0), ('too / really', 1), ('Much / too', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  29, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 29
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 30
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 30, 'My sister has sleeping problems, can you give me some advice for her?\nShe _____ avoid using her cell phone at night and she _______ drink coffee either.', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 30
        );
        
-- Respuestas para la pregunta 30

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('needs / doesn’t have to', 0), ('should / shouldn’t', 1), ('can / could', 0), ('must / might', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  30, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 30
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 31
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 31, 'What is all this mess? What did you do, Joe?\nI’m sorry, mom!\n___ to your room right now! You’re grounded!', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 31
        );
        
-- Respuestas para la pregunta 31

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('Went', 0), ('Going', 0), ('Go', 1), ('Gone', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  31, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 31
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 32
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 32, 'I ____________ on the phone when my friend Carl knocked on the door.', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 32
        );
        
-- Respuestas para la pregunta 32

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('am talking', 0), ('were talking', 0), ('was talking', 1), ('is talking', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  32, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 32
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 33
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 33, 'This is the _________ car in the world but I’m afraid it’s not ________.', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 33
        );
        
-- Respuestas para la pregunta 33

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('most expensive / faster', 0), ('most expensive / the fastest', 1), ('most expensive / the faster', 0), ('expensivest / the fastest', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  33, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 33
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 34
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 34, 'She __________ stay in that hotel on her trip. She’s already booked a room there for a week.', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 34
        );
        
-- Respuestas para la pregunta 34

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('is going to', 1), ('will', 0), ('might', 0), ('is not going to', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  34, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 34
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 35
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 35, 'Sorry, I can’t talk right now. I_________ call you back later.', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 35
        );
        
-- Respuestas para la pregunta 35

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('am going to', 0), ('will', 1), ('will to', 0), ('definitely', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  35, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 35
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 36
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 36, '_____ you ever _____ Japanese food?\nYes, of course! My grandmother is Japanese.', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 36
        );
        
-- Respuestas para la pregunta 36

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('Had / eating', 0), ('Are / eating', 0), ('Have / ate', 0), ('Have / eaten', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  36, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 36
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 37
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 37, 'I ___________ driven a car! I hope I will get to drive one next year!', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 37
        );
        
-- Respuestas para la pregunta 37

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('yet haven’t', 0), ('still haven’t', 1), ('yet have', 0), ('still have', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  37, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 37
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 38
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 38, 'Look at that woman on the stage! She is singing my favorite song!\nYes, she sings ________.', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 38
        );
        
-- Respuestas para la pregunta 38

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('beautiful', 0), ('beautifully', 1), ('good', 0), ('perfect', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  38, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 38
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 39
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 39, 'Excuse me, do you know ___________ ?', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 39
        );
        
-- Respuestas para la pregunta 39

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('where is the bus station', 0), ('where can I find the bus station', 0), ('where the bus station is', 1), ('where can be found the bus station', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  39, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 39
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 40
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 40, 'There are a lot of things to do in this house! Mark, you ____ the laundry and… Mary, you _____ breakfast while I ____ the ironing.', 'Pre-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 40
        );
        
-- Respuestas para la pregunta 40

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('make / make / do', 0), ('do / do / make', 0), ('do / do / do', 0), ('do / make / do', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  40, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 40
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 41
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 41, '________ are going to beat ______ in the upcoming tournament, I’m sure of that!\nYes! we are a great team!', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 41
        );
        
-- Respuestas para la pregunta 41

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('You and me / they', 0), ('You and I / them', 1), ('You and me / them', 0), ('You and I / they', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  41, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 41
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 42
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 42, 'Sarah spends too much time in front of the mirror!\nYes, she really loves _______ a bit too much.', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 42
        );
        
-- Respuestas para la pregunta 42

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('she', 0), ('herself', 1), ('myself', 0), ('her', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  42, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 42
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 43
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 43, 'Marie and Joseph are always arguing and insulting _______.', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 43
        );
        
-- Respuestas para la pregunta 43

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('them', 0), ('themselves', 0), ('herself', 0), ('each other', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  43, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 43
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 44
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 44, 'Both of them ____ very competitive!\nYes, you are right. Neither of them ______ to lose!', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 44
        );
        
-- Respuestas para la pregunta 44

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('are / wants', 1), ('are / want', 0), ('is / wants', 0), ('is / want', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  44, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 44
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 45
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 45, 'When I was a kid, I _______ walk 10km to go to school everyday.', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 45
        );
        
-- Respuestas para la pregunta 45

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('was used to', 0), ('used to', 1), ('will', 0), ('went to', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  45, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 45
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 46
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 46, 'She really likes playing volleyball, _________?', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 46
        );
        
-- Respuestas para la pregunta 46

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('doesn’t she?', 1), ('does she?', 0), ('is she?', 0), ('isn’t she?', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  46, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 46
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 47
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 47, 'If you ______ your room, you ________ to the party tonight.', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 47
        );
        
-- Respuestas para la pregunta 47

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('cleaned / go', 0), ('clean / would go', 0), ('cleaned / would go', 0), ('clean / will go', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  47, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 47
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 48
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 48, 'I wanted to ____ together with my friends in the club tonight!', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 48
        );
        
-- Respuestas para la pregunta 48

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('go', 0), ('be', 0), ('get', 1), ('have', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  48, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 48
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 49
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 49, 'The environment ___________ get better if we continue to pollute the air like we do!', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 49
        );
        
-- Respuestas para la pregunta 49

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('will definitely', 0), ('won’t definitely', 0), ('definitely will', 0), ('definitely won’t', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  49, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 49
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 50
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 50, 'I have _________ this book for weeks and I think I will never finish it! It’s too long!', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 50
        );
        
-- Respuestas para la pregunta 50

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('read', 0), ('been read', 0), ('been reading', 1), ('reading', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  50, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 50
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 51
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 51, 'My parents usually make me ________ my homework and they never let me_____ outside with the other kids!', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 51
        );
        
-- Respuestas para la pregunta 51

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('do / play', 1), ('to do / to play', 0), ('to do / play', 0), ('do / to play', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  51, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 51
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 52
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 52, 'When I arrived at the restaurant Mark _________.\nReally?\nYes, he ____________ for me for more than one hour.', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 52
        );
        
-- Respuestas para la pregunta 52

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('has left / was waiting', 0), ('had left / had been waiting', 1), ('left / was waiting', 0), ('had been leaving / waited', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  52, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 52
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 53
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 53, 'Joseph _______ me that he was leaving the country today.\nYes, he _______ the same thing in the meeting the other day.', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 53
        );
        
-- Respuestas para la pregunta 53

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('said / told', 0), ('said / said', 0), ('told / told', 0), ('told / said', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  53, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 53
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 54
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 54, 'Did you hear what the boss said yesterday?\nNo! What did he say?\nHe said that ________________', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 54
        );
        
-- Respuestas para la pregunta 54

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('he was going to promote Mary, the secretary.', 1), ('he is going to promote Mary, the secretary.', 0), ('he will promote Mary, the secretary.', 0), ('he went to promote Mary, the secretary.', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  54, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 54
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 55
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 55, 'Million of books__________ everyday.', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 55
        );
        
-- Respuestas para la pregunta 55

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('will print', 0), ('are print', 0), ('printed', 0), ('are printed', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  55, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 55
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 56
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 56, 'My son, ______ is a lawyer, works in that big building over there!', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 56
        );
        
-- Respuestas para la pregunta 56

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('which', 0), ('who', 1), ('that', 0), ('whom', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  56, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 56
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 57
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 57, 'If I ______ a lot of money, I _________ buy a big house in the hills.', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 57
        );
        
-- Respuestas para la pregunta 57

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('have / would', 0), ('had / will', 0), ('had / would', 1), ('would / will', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  57, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 57
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 58
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 58, 'Where _____ you go if you _____ fly?\nTo the North Pole, definitely!', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 58
        );
        
-- Respuestas para la pregunta 58

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('would / could', 1), ('will / can', 0), ('can / will', 0), ('could / would', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  58, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 58
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 59
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 59, 'I hate living in this small town! If only ______  somewhere else!', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 59
        );
        
-- Respuestas para la pregunta 59

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('I can live', 0), ('I could live', 1), ('I could lived', 0), ('could I live', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  59, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 59
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 60
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 60, 'I wish ________ in a big city!', 'Intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 60
        );
        
-- Respuestas para la pregunta 60

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('I lived', 1), ('I am living', 0), ('I can live', 0), ('I would live', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  60, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 60
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 61
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 61, 'I hate having to walk to school!\nI don’t hate it. I ______ used to _____ it every day.', 'Upper-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 61
        );
        
-- Respuestas para la pregunta 61

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('will / do', 0), ('am / doing', 1), ('am / do', 0), ('— / doing', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  61, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 61
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 62
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 62, 'We had an incredible time at the party last night!\nOhh, if only I ________ you guys! now I regret it.', 'Upper-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 62
        );
        
-- Respuestas para la pregunta 62

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('joined', 0), ('did join', 0), ('had joined', 1), ('have joined', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  62, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 62
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 63
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 63, 'You haven’t found your keys____, have you?\nNo, I ______ haven’t.', 'Upper-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 63
        );
        
-- Respuestas para la pregunta 63

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('yet / already', 0), ('still / yet', 0), ('yet / yet', 0), ('yet / still', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  63, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 63
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 64
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 64, 'Why hasn’t the teacher arrived?\nI don’t know. He _________  in traffic.', 'Upper-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 64
        );
        
-- Respuestas para la pregunta 64

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('was caught', 0), ('might have caught', 0), ('might have been caught', 1), ('was definitely caught', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  64, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 64
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 65
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 65, 'Why do people care more about social media sites than the real life?\nThat’s not true, it’s mostly teenagers. ________ people or so, you know.', 'Upper-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 65
        );
        
-- Respuestas para la pregunta 65

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('15-years-old', 0), ('15-year-old', 1), ('15 year old', 0), ('15 years old', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  65, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 65
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 66
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 66, 'Martial arts were created in _______ to fight attackers back!', 'Upper-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 66
        );
        
-- Respuestas para la pregunta 66

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('relation', 0), ('consequence', 0), ('intention', 0), ('order', 1);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  66, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 66
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 67
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 67, 'My mother feels really bad!\nI suggest ________________ to the doctor.', 'Upper-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 67
        );
        
-- Respuestas para la pregunta 67

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('her to go', 0), ('that she go', 1), ('that she goes', 0), ('her go', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  67, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 67
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 68
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 68, 'If I _______________ to that party, I __________ a great time! Too bad I didn’t go.', 'Upper-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 68
        );
        
-- Respuestas para la pregunta 68

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('had gone / would have had', 1), ('had gone / would have', 0), ('went / would have had', 0), ('go / would', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  68, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 68
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 69
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 69, 'When you wake up tomorrow morning, I ________ driving my car 100 km away from here.', 'Upper-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 69
        );
        
-- Respuestas para la pregunta 69

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('be', 0), ('will be', 1), ('will', 0), ('would be', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  69, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 69
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 70
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 70, 'We need that report by Monday morning urgently!\nI will ________ the report by tomorrow morning for sure.', 'Upper-intermediate'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 70
        );
        
-- Respuestas para la pregunta 70

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('have written', 1), ('write', 0), ('have had written', 0), ('writing', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  70, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 70
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 71
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 71, 'You are _______ a good person. You are always helping others and that’s ___ amazing!', 'Advanced'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 71
        );
        
-- Respuestas para la pregunta 71

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('so / so', 0), ('such / so', 1), ('such / such', 0), ('so / such', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  71, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 71
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 72
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 72, 'I am selling a ______________ table from the 18th century, are you interested?\nThanks but no, thanks. I prefer modern things.', 'Advanced'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 72
        );
        
-- Respuestas para la pregunta 72

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('beautiful, wooden, round', 0), ('round, wooden, beautiful', 0), ('beautiful, round, wooden', 1), ('wooden, beautiful, round', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  72, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 72
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 73
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 73, 'This product is amazing! Not only________ clean and dry with it, but you can also use it as a tablecloth!', 'Advanced'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 73
        );
        
-- Respuestas para la pregunta 73

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('you can', 0), ('can you', 1), ('can', 0), ('you', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  73, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 73
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 74
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 74, 'Nobody knew it at that time but he ______ one of the most successful pop artist ten years later!', 'Advanced'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 74
        );
        
-- Respuestas para la pregunta 74

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('will become', 0), ('would become', 1), ('became', 0), ('would have become', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  74, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 74
        );
        

        TRUNCATE temp_respuestas  ;
        

        -- Pregunta 75
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 75, 'I have a big collection of cars, ___________ are Ferrari!', 'Advanced'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 75
        );
        
-- Respuestas para la pregunta 75

        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('from three', 0), ('three of which', 1), ('three of whom', 0), ('from which three', 0);
        

        INSERT INTO examen_ingles_respuesta_pregunta ( id_pregunta, texto_respuesta, es_correcta)
        SELECT  75, texto_respuesta, es_correcta
        FROM temp_respuestas
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_respuesta_pregunta 
            WHERE texto_respuesta = temp_respuestas.texto_respuesta 
              AND id_pregunta = 75
        );
        

        TRUNCATE temp_respuestas  ;

                -- Pregunta 76 
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 76, '____________ the complexity of the subject, the professor explained it with remarkable clarity.', 'Advanced'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 76
        );
        
        -- Respuestas para la pregunta 76
        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('However', 0), ('Despite', 1), ('Although', 0), ('Nevertheless', 0);

        INSERT INTO examen_ingles_respuesta_pregunta (id_pregunta, texto_respuesta, es_correcta)
        SELECT 76, texto_respuesta, es_correcta
        FROM temp_respuestas;
        
        TRUNCATE temp_respuestas;

        -- Pregunta 77 
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 77, 'Seldom _________ such a breathtaking performance in this theater.', 'Advanced'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 77
        );
        
        -- Respuestas para la pregunta 77
        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('we have seen', 0), ('have we seen', 1), ('we saw', 0), ('did we see', 0);

        INSERT INTO examen_ingles_respuesta_pregunta (id_pregunta, texto_respuesta, es_correcta)
        SELECT 77, texto_respuesta, es_correcta
        FROM temp_respuestas;
        
        TRUNCATE temp_respuestas;

        -- Pregunta 78 
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 78, 'Were the negotiations _________, the company would have avoided bankruptcy.', 'Advanced'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 78
        );
        
        -- Respuestas para la pregunta 78
        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('to succeed', 0), ('succeeded', 0), ('to have succeeded', 1), ('having succeeded', 0);

        INSERT INTO examen_ingles_respuesta_pregunta (id_pregunta, texto_respuesta, es_correcta)
        SELECT 78, texto_respuesta, es_correcta
        FROM temp_respuestas;
        
        TRUNCATE temp_respuestas;

        -- Pregunta 79
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 79, 'The manuscript, _________ by a 15th-century monk, was discovered in the monastery archives.', 'Advanced'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 79
        );
        
        -- Respuestas para la pregunta 79
        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('authored', 1), ('authoring', 0), ('having authored', 0), ('was authored', 0);

        INSERT INTO examen_ingles_respuesta_pregunta (id_pregunta, texto_respuesta, es_correcta)
        SELECT 79, texto_respuesta, es_correcta
        FROM temp_respuestas;
        
        TRUNCATE temp_respuestas;

        -- Pregunta 80 
        INSERT INTO examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        SELECT 80, 'Not until the final chapter _________ the true identity of the mysterious benefactor.', 'Advanced'
        WHERE NOT EXISTS (
            SELECT 1 FROM examen_ingles_pregunta 
            WHERE id_pregunta = 80
        );
        
        -- Respuestas para la pregunta 80
        INSERT INTO temp_respuestas (texto_respuesta, es_correcta)
        VALUES ('the reader discovers', 0), ('does the reader discover', 1), ('the reader does discover', 0), ('discovers the reader', 0);

        INSERT INTO examen_ingles_respuesta_pregunta (id_pregunta, texto_respuesta, es_correcta)
        SELECT 80, texto_respuesta, es_correcta
        FROM temp_respuestas;
        
        TRUNCATE temp_respuestas;

        -- Pregunta y respuesta que se setea por defecto para el test 
        -- la id respuesta es 561
        insert into examen_ingles_pregunta (id_pregunta, texto_pregunta, nivel_ingles)
        values (99, "pregunta para respuesta incorrecta", "prueba");
        insert into examen_ingles_respuesta_pregunta (id_pregunta, texto_respuesta, es_correcta)
        VALUES(99,"no contesto el usuario",0);
        

DROP TABLE  temp_respuestas;

        
select p.id_pregunta, pr.id_respuesta_pregunta, p.texto_pregunta, pr.texto_respuesta, pr.es_correcta, p.nivel_ingles from examen_ingles_pregunta p  join examen_ingles_respuesta_pregunta pr on p.id_pregunta = pr.id_pregunta ORDER BY p.id_pregunta, pr.id_respuesta_pregunta;

SELECT * FROM examen_ingles_pregunta;

--sript para asegurar que todo se califica bien
select U.nombre, E.id_examen, E.tipo_examen, P.texto_pregunta, PR.id_respuesta_pregunta,PR.texto_respuesta ,PR.es_correcta, RU.id_respuesta_pregunta from examen_ingles_usuario U 
join examen_ingles_examen E on U.id_usuario = E.id_usuario
join examen_ingles_respuesta_usuario RU on RU.id_examen = E.id_examen
join examen_ingles_pregunta P on P.id_pregunta = RU.id_pregunta
join examen_ingles_respuesta_pregunta PR on P.id_pregunta = PR.id_pregunta 
where U.id_usuario = 20 
ORDER BY U.nombre, E.id_examen, P.id_pregunta


--select * from examen_ingles_examen where id_examen = 89;

select * from examen_ingles_usuario








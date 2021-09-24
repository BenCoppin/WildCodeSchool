--1

SELECT firstname, lastname
FROM wizard
WHERE id IN (
	SELECT wizard_id
	FROM player 
	WHERE enrollement_date >= '1995-01-01' AND enrollement_date <= '1998-12-31');;
+-----------+-----------------+
| firstname | lastname        |
+-----------+-----------------+
| Hannah    | Abbott          |
| Katie     | Bell            |
| Phineas   | Nigellus        |
| Regulus   | Black           |
| Millicent | Bulstrode       |
| Michael   | Corner          |
| Cedric    | Diggory         |
| Aberforth | Dumbledore      |
| Justin    | Finch-Fletchley |
| Seamus    | Finnigan        |
| Marcus    | Flint           |
| Filius    | Flitwick        |
| Hermione  | Granger         |
| Angelina  | Johnson         |
| Lee       | Jordan          |
| Rabastan  | Lestrange       |
| Frank     | Longbottom      |
| Theodore  | Nott            |
| Garrick   | Ollivander      |
| Harry     | Potter          |
| James     | Potter          |
| Quirinus  | Quirrell        |
| Hepzibah  | Smith           |
| Severus   | Snape           |
| Alicia    | Spinnet         |
| Dean      | Thomas          |
| Ronald    | Weasley         |
| Bloody    | Baron           |
| Myrtle    | Warren          |
+-----------+-----------------+
29 rows in set (0.01 sec)


------------------------------------------------------------------------------------
--2

FROM wizard
WHERE id IN (
	SELECT wizard_id
	FROM player 
	WHERE enrollement_date >= '1995-01-01' 
        AND enrollement_date <= '1998-12-31' 
        AND role LIKE 'keeper');;
+-----------+------------+
| firstname | lastname   |
+-----------+------------+
| Regulus   | Black      |
| Cedric    | Diggory    |
| Aberforth | Dumbledore |
| Angelina  | Johnson    |
+-----------+------------+
4 rows in set (0.00 sec)

------------------------------------------------------------------------------------
--3

SELECT wizard.firstname, wizard.lastname, player.role
FROM wizard
JOIN player
ON wizard.id=player.wizard_id
WHERE wizard.id IN (
		SELECT wizard_id
                FROM player 
                WHERE enrollement_date >= '1995-01-01' 
		AND enrollement_date <= '1998-12-31' 
		AND role LIKE 'chaser');;
+-----------+------------+--------+
| firstname | lastname   | role   |
+-----------+------------+--------+
| Katie     | Bell       | chaser |
| Phineas   | Nigellus   | chaser | 
| Filius    | Flitwick   | chaser |
| Hermione  | Granger    | chaser |
| Lee       | Jordan     | chaser |
| Frank     | Longbottom | chaser |
| Theodore  | Nott       | chaser |
| Garrick   | Ollivander | chaser |
| Alicia    | Spinnet    | chaser |
| Bloody    | Baron      | chaser |
+-----------+------------+--------+
10 rows in set (0.00 sec)

-------------------------------------------------------------------------------------
--4

mysql> CREATE VIEW count_role AS (
    -> SELECT team.name, player.role, count(wizard.id) AS Nb_players FROM wizard
    -> JOIN player ON wizard.id = player.wizard_id
    -> JOIN team ON team.id = player.team_id
    -> GROUP BY team.id, player.role
    -> );
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM count_role;
+------------+--------+------------+
| name       | role   | Nb_players |
+------------+--------+------------+
| Gryffindor | beater |         11 |
| Gryffindor | chaser |         12 |
| Gryffindor | keeper |          6 |
| Gryffindor | seeker |          7 |
| Ravenclaw  | beater |          4 |
| Ravenclaw  | chaser |          8 |
| Ravenclaw  | seeker |          3 |
| Slytherin  | beater |          6 |
| Slytherin  | chaser |          9 |
| Slytherin  | keeper |          1 |
| Slytherin  | seeker |          5 |
| Hufflepuff | beater |          6 |
| Hufflepuff | chaser |          2 |
| Hufflepuff | keeper |          3 |
| Hufflepuff | seeker |          1 |
+------------+--------+------------+
15 rows in set (0.01 sec)

-------------------------------------------------------------------------------------
--5

mysql> CREATE VIEW grif_chaser AS (
    -> SELECT team.name, wizard.firstname, wizard.lastname, player.role FROM wizard
    -> JOIN player ON wizard.id = player.wizard_id
    -> JOIN team ON team.id = player.team_id
    -> WHERE player.role = 'chaser' and team.name = 'Gryffindor'
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM grif_chaser;
+------------+-----------+------------+--------+
| name       | firstname | lastname   | role   |
+------------+-----------+------------+--------+
| Gryffindor | Katie     | Bell       | chaser |
| Gryffindor | Albus     | Dumbledore | chaser |
| Gryffindor | Hermione  | Granger    | chaser |
| Gryffindor | Lee       | Jordan     | chaser |
| Gryffindor | Frank     | Longbottom | chaser |
| Gryffindor | Augusta   | Longbottom | chaser |
| Gryffindor | Neville   | Longbottom | chaser |
| Gryffindor | Peter     | Pettigrew  | chaser |
| Gryffindor | Lily      | J.         | chaser |
| Gryffindor | Alicia    | Spinnet    | chaser |
| Gryffindor | George    | Weasley    | chaser |
| Gryffindor | Oliver    | Wood       | chaser |
+------------+-----------+------------+--------+
12 rows in set (0.00 sec)
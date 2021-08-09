
#1
mysql> SELECT team.name AS team, COUNT(*) as nb_player FROM player
    -> JOIN team ON player.team_id = team.id
    -> GROUP BY team_id
    -> ORDER BY nb_player DESC;
+------------+-----------+
| team       | nb_player |
+------------+-----------+
| Gryffindor |        36 |
| Slytherin  |        21 |
| Ravenclaw  |        15 |
| Hufflepuff |        12 |
+------------+-----------+


#2
mysql> SELECT team.name AS team, COUNT(*) as nb_player FROM player
    -> JOIN team ON player.team_id = team.id
    -> GROUP BY team_id
    -> HAVING nb_player > 14
    -> ORDER BY team ASC;
+------------+-----------+
| team       | nb_player |
+------------+-----------+
| Gryffindor |        36 |
| Ravenclaw  |        15 |
| Slytherin  |        21 |
+------------+-----------+

#3
mysql> SELECT wizard.lastname, wizard.firstname FROM wizard
    -> JOIN player ON wizard.id = player.wizard_id
    -> JOIN team ON player.team_id = team.id
    -> WHERE WEEKDAY(enrollment_date) = 0  AND team.name = 'Gryffindor'
    -> ORDER BY enrollment_date ASC;
+------------+-----------+
| lastname   | firstname |
+------------+-----------+
| Weasley    | George    |
| Longbottom | Alice     |
|            | Cadogan   |
| Gryffindor | Godric    |
| Black      | Sirius    |
| Dumbledore | Aberforth |
| Longbottom | Augusta   |
+------------+-----------+
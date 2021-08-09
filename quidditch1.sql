
# Retourne les noms, prénoms, rôle et équipe de tous les joueurs, classés dans l’ordre alphabétique par équipe, puis par rôle dans l’équipe, puis par nom de famille, puis par prénom.

mysql> SELECT team.name team, player.role, wizard.lastname, wizard.firstname FROM player
    -> JOIN wizard ON wizard_id = wizard.id
    -> JOIN team ON team_id = team.id
    -> ORDER BY team.name, player.role, wizard.lastname, wizard.firstname ASC ;
+------------+--------+-----------------+-------------+
| team       | role   | lastname        | firstname   |
+------------+--------+-----------------+-------------+
| Gryffindor | beater | Black           | Sirius      |
| Gryffindor | beater | Brown           | Lavender    |
| Gryffindor | beater | Finnigan        | Seamus      |
| Gryffindor | beater | Hagrid          | Rubeus      |
| Gryffindor | beater | Longbottom      | Alice       |
| Gryffindor | beater | McGonagall      | Minerva     |
| Gryffindor | beater | Potter          | Harry       |
| Gryffindor | beater | Potter          | James       |
| Gryffindor | beater | Thomas          | Dean        |
| Gryffindor | beater | Weasley         | Arthur      |
| Gryffindor | beater | Weasley         | Percy       |
| Gryffindor | chaser | Bell            | Katie       |
| Gryffindor | chaser | Dumbledore      | Albus       |
| Gryffindor | chaser | Granger         | Hermione    |
| Gryffindor | chaser | J.              | Lily        |
| Gryffindor | chaser | Jordan          | Lee         |
| Gryffindor | chaser | Longbottom      | Augusta     |
| Gryffindor | chaser | Longbottom      | Frank       |
| Gryffindor | chaser | Longbottom      | Neville     |
| Gryffindor | chaser | Pettigrew       | Peter       |
| Gryffindor | chaser | Spinnet         | Alicia      |
| Gryffindor | chaser | Weasley         | George      |
| Gryffindor | chaser | Wood            | Oliver      |
| Gryffindor | keeper |                 | Cadogan     |
| Gryffindor | keeper | Creevey         | Dennis      |
| Gryffindor | keeper | de              | Nicholas    |
| Gryffindor | keeper | Dumbledore      | Aberforth   |
| Gryffindor | keeper | Johnson         | Angelina    |
| Gryffindor | keeper | Weasley         | Ginevra     |
| Gryffindor | seeker | Binns           | Cuthbert    |
| Gryffindor | seeker | Creevey         | Colin       |
| Gryffindor | seeker | Gryffindor      | Godric      |
| Gryffindor | seeker | Vane            | Romilda     |
| Gryffindor | seeker | Weasley         | Fred        |
| Gryffindor | seeker | Weasley         | Ronald      |
| Gryffindor | seeker | Weasley         | William     |
| Hufflepuff | beater | Abbott          | Hannah      |
| Hufflepuff | beater | Finch-Fletchley | Justin      |
| Hufflepuff | beater | Friar           | Fat         |
| Hufflepuff | beater | Smith           | Hepzibah    |
| Hufflepuff | beater | Sprout          | Pomona      |
| Hufflepuff | beater | Tonks           | Nymphadora  |
| Hufflepuff | chaser | Bones           | Amelia      |
| Hufflepuff | chaser | Scamander       | Newton      |
| Hufflepuff | keeper | Bones           | Susan       |
| Hufflepuff | keeper | Diggory         | Cedric      |
| Hufflepuff | keeper | Smith           | Zacharias   |
| Hufflepuff | seeker | Hufflepuff      | Helga       |
| Ravenclaw  | beater | Clearwater      | Penelope    |
| Ravenclaw  | beater | Quirrell        | Quirinus    |
| Ravenclaw  | beater | Ravenclaw       | Helena      |
| Ravenclaw  | beater | Warren          | Myrtle      |
| Ravenclaw  | chaser | Chang           | Cho         |
| Ravenclaw  | chaser | Edgecombe       | Marietta    |
| Ravenclaw  | chaser | Flitwick        | Filius      |
| Ravenclaw  | chaser | Goldstein       | Anthony     |
| Ravenclaw  | chaser | Lockhart        | Gilderoy    |
| Ravenclaw  | chaser | Lovegood        | Luna        |
| Ravenclaw  | chaser | Lovegood        | Xenophilius |
| Ravenclaw  | chaser | Ollivander      | Garrick     |
| Ravenclaw  | seeker | Corner          | Michael     |
| Ravenclaw  | seeker | Ravenclaw       | Rowena      |
| Ravenclaw  | seeker | Trelawney       | Sybill      |
| Slytherin  | beater | Bulstrode       | Millicent   |
| Slytherin  | beater | Crabbe          | Vincent     |
| Slytherin  | beater | Flint           | Marcus      |
| Slytherin  | beater | Parkinson       | Pansy       |
| Slytherin  | beater | Snape           | Severus     |
| Slytherin  | beater | Zabini          | Blaise      |
| Slytherin  | chaser | Baron           | Bloody      |
| Slytherin  | chaser | Lestrange       | Bellatrix   |
| Slytherin  | chaser | Lestrange       | Rodolphus   |
| Slytherin  | chaser | Malfoy          | Draco       |
| Slytherin  | chaser | Malfoy          | Lucius      |
| Slytherin  | chaser | Nigellus        | Phineas     |
| Slytherin  | chaser | Nott            | Theodore    |
| Slytherin  | chaser | Riddle          | Tom         |
| Slytherin  | chaser | Tonks           | Andromeda   |
| Slytherin  | keeper | Black           | Regulus     |
| Slytherin  | seeker | Goyle           | Gregory     |
| Slytherin  | seeker | Lestrange       | Rabastan    |
| Slytherin  | seeker | Malfoy          | Narcissa    |
| Slytherin  | seeker | Slytherin       | Salazar     |
| Slytherin  | seeker | Umbridge        | Dolores     |
+------------+--------+-----------------+-------------+
84 rows in set (0.00 sec)

#Retourne uniquement les prénoms et noms des joueurs ayant le rôle de seeker (attrapeur), classés par ordre alphabétique de nom puis prénom

mysql> SELECT wizard.lastname, wizard.firstname FROM wizard
    -> JOIN player ON wizard.id = player.wizard_id
    -> WHERE player.role = 'seeker'
    -> ORDER BY wizard.lastname, wizard.firstname ASC;
+------------+-----------+
| lastname   | firstname |
+------------+-----------+
| Binns      | Cuthbert  |
| Corner     | Michael   |
| Creevey    | Colin     |
| Goyle      | Gregory   |
| Gryffindor | Godric    |
| Hufflepuff | Helga     |
| Lestrange  | Rabastan  |
| Malfoy     | Narcissa  |
| Ravenclaw  | Rowena    |
| Slytherin  | Salazar   |
| Trelawney  | Sybill    |
| Umbridge   | Dolores   |
| Vane       | Romilda   |
| Weasley    | Fred      |
| Weasley    | Ronald    |
| Weasley    | William   |
+------------+-----------+
#Retourne la liste de tous les sorciers qui ne pratiquent pas le quidditch.

mysql> SELECT wizard.lastname, wizard.firstname FROM wizard
    -> LEFT JOIN player ON wizard.id = player.wizard_id
    -> WHERE player.wizard_id IS NULL;
+----------+-----------+
| lastname | firstname |
+----------+-----------+
| Boot     | Terry     |
|          | Crabbe    |
| Lupin    | Remus     |
| Patil    | Padma     |
| Patil    | Parvati   |
| Robins   | Demelza   |
| Slughorn | Horace    |
| Weasley  | Charles   |
| Weasley  | Molly     |
+----------+-----------+
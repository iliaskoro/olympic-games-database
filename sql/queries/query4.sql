SELECT DISTINCT
    FName, LName, Country
FROM
    athlete
        JOIN
    record_setby_athlete ON record_setby_athlete.athlete_AthleteID = athlete.AthleteID 
UNION SELECT DISTINCT
    FName, LName, Country
FROM
    athlete
        JOIN
    athlete_get_penalty ON athlete_get_penalty.athlete_AthleteID = athlete.AthleteID
   
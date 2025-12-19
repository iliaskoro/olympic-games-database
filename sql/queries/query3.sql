SELECT 
    FName, LName, Country
FROM
    athlete
        LEFT JOIN
    athlete_get_penalty ON athlete_get_penalty.athlete_AthleteID = athlete.AthleteID
WHERE
    athlete_get_penalty.athlete_AthleteID IS NULL;
   

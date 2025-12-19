SELECT 
    FName, LName, Country
FROM
    athlete
        JOIN
    record_setby_athlete ON athlete.AthleteID = record_setby_athlete.athlete_AthleteID;
    
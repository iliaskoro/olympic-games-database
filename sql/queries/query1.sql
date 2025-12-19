SELECT 
    FName, LName, Country, event.Name, Description
FROM
    athlete
        JOIN
    record_setby_athlete ON athlete.AthleteID = record_setby_athlete.athlete_AthleteID
        JOIN
    record ON record_setby_athlete.record_RecordID = record.RecordID
        JOIN
    event ON record.GameID = event.EventID
WHERE
    Country = 'USA';
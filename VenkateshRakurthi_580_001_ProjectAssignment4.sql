select * from traffic3;
select totaltraffic from traffic3;
SELECT MAX(totaltraffic) FROM traffic3;
SELECT MIN(totaltraffic) FROM traffic3;
SELECT AVG(totaltraffic) FROM traffic3;
SELECT Date FROM traffic3 WHERE totaltraffic = (SELECT MAX(totaltraffic) FROM traffic3);
SELECT street FROM traffic3 WHERE totaltraffic = (SELECT MAX(totaltraffic) FROM traffic3);
SELECT address FROM traffic3 WHERE totaltraffic = (SELECT MAX(totaltraffic) FROM traffic3);
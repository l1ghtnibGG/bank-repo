SELECT SocStatus.Stat, COUNT(*) AS Amount
FROM SocStatus 
	JOIN Clients ON SocStatus.Id = Clients.SocialStatId
GROUP BY SocStatus.Stat;
SELECT SocStatus.Stat, Clients.FirstName
FROM SocStatus 
	JOIN Clients ON SocStatus.Id = Clients.SocialStatId;

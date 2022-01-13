SELECT 
	Stat, (select COUNT(*) from Clients
			where SocialStatId = SocStatus.Id) as Amount
FROM SocStatus 
	

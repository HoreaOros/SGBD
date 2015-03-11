-- lista cu toate erorile sistem si erorile definite de user
SELECT 
	message_id, 
	severity, 
	is_event_logged,  -- daca se scrie in Windows event log
	text
FROM sys.messages
ORDER BY severity DESC, text
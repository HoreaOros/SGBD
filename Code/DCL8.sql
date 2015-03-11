SELECT 
	LOGINPROPERTY('Trishelle', 'IsLocked') IsLocked,
	LOGINPROPERTY('Trishelle', 'IsExpired') IsExpired,
	LOGINPROPERTY('Trishelle', 'IsMustChange') IsMustChange,
	LOGINPROPERTY('Trishelle', 'BadPasswordCount') BadPasswordCount,
	LOGINPROPERTY('Trishelle', 'BadPasswordTime') BadPasswordTime,
	LOGINPROPERTY('Trishelle', 'HistoryLength') HistoryLength,
	LOGINPROPERTY('Trishelle', 'LockoutTime') LockoutTime,
	LOGINPROPERTY('Trishelle', 'PasswordLastSetTime') PasswordLastSetTime,
	LOGINPROPERTY('Trishelle', 'PasswordHash') PasswordHash
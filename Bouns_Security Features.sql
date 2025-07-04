use Event_Ticketing_System
--=====Security Features for Event Ticketing System
create table Role(
RoleId int primary key,
RoleName varchar(50) not null unique
)

insert into Role values
(1,'Admin'),
(2,'Organizer'),
(3,'Customer');

--=====Create UserAccount Table
create table UserAccount(
UserId int primary key,
Username varchar(50) not null unique,
PasswordHash varbinary(256) not null,
RoleId int,
EmailEncrypted varbinary(256),
foreign key (RoleId) references Role(RoleId)
)

--=====Create Encryption Keys
create master key encryption by password = 'StrongPassword@123';
create certificate TicketCert with subject = 'Ticket System Cert';
create symmetric key TicketKey with algorithm = AES_256 encryption by certificate TicketCert;

--=====Insert Encrypted User Data
open symmetric key TicketKey decryption by certificate TicketCert;
insert into UserAccount (UserId, Username, PasswordHash, RoleId, EmailEncrypted)
values (
1,
'admin1',
hashbytes('SHA2_256', convert(varchar, 'adminpass')),
1,
encryptbykey(key_guid('TicketKey'), convert(varchar, 'admin1@example.com'))
);
close symmetric key TicketKey;

--=====Select and Decrypt Email
open symmetric key TicketKey decryption by certificate TicketCert;
select Username, convert(varchar, decryptbykey(EmailEncrypted)) as Email
from UserAccount;
close symmetric key TicketKey;

select * from UserAccount;

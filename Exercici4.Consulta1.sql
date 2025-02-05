use Exercici4;
select count(*) as numPolisses
from Polissa, Client
where Client.idClient=Polissa.Client_idClient and Client.Nom Like "%Eneko%";
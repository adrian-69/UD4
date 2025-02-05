use Exercici4;
SELECT Client.DNI as "DNI", Client.Nom "Nom", Client.Cognoms as "Cognoms", Polissa.NumPolissa as "Numero Polissa", TipusPolissa.Nom as "Tipus Polissa"
From Client, Polissa, TipusPolissa
where Client.idClient=Polissa.Client_idClient and TipusPolissa.idTipusPolissa=Polissa.TipusPolissa_idTipusPolissa and TipusPolissa.Nom Like "%Viatge%";
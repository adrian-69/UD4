use Exercici5;
Select Cita.idCita, Cita.Data as Data, Cita.Hora as Hora, Cita.Box as Box, Client.idClient, Client.Nom as Nom,
Client.Cognoms as Cognoms, Client.Correu as correu, Client.Telefon as Telefon, Client.Usuari as Usuari, Client.Contrasenya as Contraseya,
Empleat.idEmpleat, Empleat.Nom as Nom, Empleat.Cognoms as Cognoms, Empleat.Telefon as Telefon, Vehicle.idVehicle, Vehicle.NumCarroseria as NumCarroseria, Vehicle.Matricula as Matricula,
Vehicle.Marca as Marca, Vehicle.Modelo as Modelo
From Cita, Client, Empleat, Vehicle
Where Cita.idCita=Cita.Client_idClient=Client.Empleat_idEmpleat and Empleat.Vehicle_idVehicle;
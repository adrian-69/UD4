use Exercici5;
select c.idCita as num, c.Data as dia, c.Hora, v.Marca as marca, v.Modelo as modelo, cl.nom as Client
From Cita as c, Vehicle as v, Client as cl
where v.idVehicle=c.Vehicle_idVehicle and cl.idClient=v.Client_idClient and c.Data>="21/1/25";
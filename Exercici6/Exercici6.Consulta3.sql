use Exercici6;
Select Avio.Model as Model, Avio.Capacitat as Capacitat, Avio.Companyia as Companyia, Vol.Origen as Origen, Reserva.Data as Data, Vol.HArribada as HArribada
FROM Avio, Vol, Reserva
Where Avio.idAvio=Vol.Avio_idAvio and Vol.idVol=Reserva.Vol_idVol;
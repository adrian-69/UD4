use Exercici6;
Select Reserva.idReserva, Passatger.nom as Nom, Reserva.Vol_idVol, Reserva.Data as Data
From Reserva, Passatger, Vol
Where Reserva.Passatger_idPassatger=Passatger_idPassatger and Reserva.Vol_idVol=Vol.idVol and Reserva.Data Like "28/1/25%"
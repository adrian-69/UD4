use Exercici6;
SELECT Passatger.DNI AS DNI, Passatger.Nom AS Nom, Passatger.Cognom AS Cognom, Vol.Numero AS "Numero de vol"
FROM Passatger, Vol, Reserva
WHERE Passatger.idPassatger=Reserva.passatger_idPassatger and Vol.idVol=Reserva.Vol_idVol;




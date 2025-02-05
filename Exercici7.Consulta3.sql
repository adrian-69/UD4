use Exercici7;
Select count(lt.idLiniaTicket) as "Numero de Linies de Tickets"
from LiniaTickets as lt, Empleat as e, Tickets as t
where t.Empleat_idEmpleat=e.idEmpleat and lt.Tickets_idTickets and e.Nom like "L%";
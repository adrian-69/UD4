use Exercici7;
Select p.id as Codi, p.Nom as Producte, p.Descripcio as Descripcio, p.Preu as "Preu Unitari",
p.IVA as IVA, P.CodiBarres as "Codi de Barres"
From Producte as p
where p.IVA="21%" and p.CodiBarres like "84%";


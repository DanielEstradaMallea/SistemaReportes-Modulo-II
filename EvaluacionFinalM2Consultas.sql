-- A) Realice una consulta que permita listar todas las capacitaciones de un cliente
-- en particular, indicando el nombre completo, la edad y el correo electrónico de los asistentes.

select a.asistnombrecompleto as Participante,a.asistedad as Edad,a.asistcorreo as Correo
from capacitacion k join cliente c on (k.cliente_rutcliente = c.rutcliente)
join asistentes a on (a.capacitacion_idcapacitacion = k.idcapacitacion)
where rutcliente = '172576265';

-- B) Realice una consulta que permita desplegar todas las visitas en terreno realizadas
-- a los clientes que sean de la comuna de Valparaíso. Por cada visita debe indicar 
-- todos los chequeos que se hicieron en ella, junto con el estado de cumplimiento de cada uno.

select v.idvisita as "ID VISITA",v.vislugar as AreaVisista,v.viscomentarios as ComentariosVisita,
z.idchequeo, z.chenombre as Chequeo, h.cumplimiento,COALESCE( h.observacion,'Sin Observaciones') as Observaciones
from estadocumplimiento h join chequeos z on h.chequeos_idchequeo = z.idchequeo
inner join visita v on (z.visita_idvisita = v.idvisita)
inner join cliente c on (v.cliente_rutcliente = c.rutcliente)
where lower(c.clicomuna)='valparaiso';

-- C) Realice una consulta que despliegue los accidentes registrados para todos 
-- los clientes, indicando los datos de detalle del accidente, y el nombre, 
-- apellido, RUT y teléfono del cliente al que se asocia dicha situación.

select a.acciorigen as Accidente,a.acciconsecuencias as Consecuencias,
c.clinombres as Nombres,c.cliapellidos as Apellidos,c.rutcliente as Rut,c.clitelefono as Telefono
from accidente a join cliente c on (a.cliente_rutcliente = c.rutcliente);

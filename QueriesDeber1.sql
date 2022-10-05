select nombreOperacion from operacion o, norma n, pieza p where o.codigoOperacion=n.Operacion_codigoOperacion and p.codigoPieza=n.Pieza_codigoPieza and p.descripcionPieza="Lamina Bronce";
select tipoMantenimiento,fechaMantenimiento from equipo e, logmantenimiento l where e.nombreEquipo=l.Equipo_nombreEquipo and e.modeloEquipo=l.Equipo_modeloEquipo and e.nombreEquipo="Cortadora" ;

# Listar todos los obreros que hayan trabajado en alguna norma.

SELECT distinct nombreObrero, numeroObrero
FROM cumplimiento c , obrero o ,obrerodirecto od
where c.ObreroDirecto_Obrero_numeroObrero=od.Obrero_numeroObrero and od.Obrero_numeroObrero=o.numeroObrero;
 
 # Listar todos los obreros, equipos y tipo de mantenimiento que se hayan realizados.
 
 
 # Listar todos los equipos que hayan fabricado un â€œcigÃ¼eÃ±alâ€ en menos de 1hr de trabajo.
 
SELECT E.nombreEquipo, E.modeloEquipo

FROM Norma as N, 
  Equipo as E 
 
WHERE N.nombreEquipo = E.nombreEquipo AND 
  N.modeloEquipo = E.modeloEquipo AND
  N.tiempoexecNorma <= 60
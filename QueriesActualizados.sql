select nombreOperacion from operacion o, norma n, pieza p where o.codigoOperacion=n.Operacion_codigoOperacion and p.codigoPieza=n.Pieza_codigoPieza and p.descripcionPieza="Lamina Bronce";
select tipoMantenimiento,fechaMantenimiento from equipo e, obreroauxiliar oa where e.nombreEquipo=oa.Equipo_nombreEquipo and e.modeloEquipo=oa.Equipo_modeloEquipo and e.nombreEquipo="Cortadora";
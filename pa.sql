create or replace function obtener_cantidad_facturas_empleado(
    IN apellido_empleado varchar,
    OUT total_facturas varchar
)
as $BODY$
begin
    select count(distinct factura_venta.id_factura_venta) into total_facturas
	from factura_venta
	inner join empleado on empleado.id_empleado = factura_venta.id_empleado
	inner join tipo_empleado on tipo_empleado.id_tipo_empleado = empleado.id_tipo_empleado
	where apellidos_empleado = apellido_empleado;
end
$BODY$ 
language plpgsql;

select * from obtener_cantidad_facturas_empleado('Akers')

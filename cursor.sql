do $$
declare
        registro record;
        monto_mayor cursor for SELECT
            factura_venta.id_factura_venta as factura,
            cliente.nombres_cliente as nombrescliente,
            cliente.apellidos_cliente as apellidoscliente,
            empleado.nombres_empleado as nombresempleado,
            empleado.apellidos_empleado as apellidosempleado
            from factura_venta
            INNER JOIN public.cliente on cliente.id_cliente = factura_venta.id_cliente
            INNER JOIN public.empleado on empleado.id_empleado = factura_venta.id_empleado
            where factura_venta.total_factura_venta >= '600';
begin
for registro in monto_mayor loop
Raise notice 'Factura: %, Nombre Cliente: %, Apellido Cliente: %, Nombre Empleado: %, Apellido Empleado: %',
registro.factura, registro.nombrescliente, registro.apellidoscliente, registro.nombresempleado, registro.apellidosempleado;
end loop;
end $$
language 'plpgsql';
create or replace function obtener_clasificacion_producto(
    IN  nombre_instrumento varchar,
    OUT clasificacion_producto varchar
)
as $BODY$
begin
    SELECT
    clasificacion_producto.nombre_clasificacion_producto into clasificacion_producto
    from producto
    INNER JOIN public.clasificacion_producto on producto.id_producto = clasificacion_producto.id_clasificacion_producto
    where nombre_producto = nombre_instrumento;
end
$BODY$ 
language plpgsql;

select * from obtener_datos_hotel('SAXOFÓN ALTO CUSTOM EX')
create or replace function tg_crear_product_line() returns trigger
as
$tg_crear_product_line$
    declare
        stock int;
begin
        select STOCK_PRODUCTO into stock from PRODUCTO where producto.id_producto=new.id_producto;
        if(stock<=0) then
            raise exception 'Este producto no tiene stock, por tanto no se puede añadir a factura_venta_line';
        end if;
        return new;
end;
$tg_crear_product_line$
language plpgsql;

create trigger tg_crearproductline before insert
on factura_venta_line for each row
execute procedure tg_crear_product_line();
/*
insert into producto (id_producto, id_clasificacion_producto,
					  descripcion_producto, nombre_producto, 
					  precio_producto, stock_producto) 
					  values (13, 1, 'Nueva exportación reciente', 'FLAUTA ALTO CUSTOM EX', 50, 0);
*/
/*
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (48, 7, 13);
*/
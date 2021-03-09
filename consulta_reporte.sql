SELECT
factura_venta.id_factura_venta,
factura_venta.fecha_factura_venta,
factura_venta.subtotal_factura_venta,
factura_venta.iva_factura_venta,
factura_venta.total_factura_venta,
producto.nombre_producto,
producto.descripcion_producto,
producto.precio_producto,
clasificacion_producto.nombre_clasificacion_producto,
cliente.cedula_cliente,
cliente.nombres_cliente,
cliente.apellidos_cliente,
empleado.cedula_empleado,
empleado.nombres_empleado,
empleado.apellidos_empleado
from factura_venta_line
INNER JOIN public.producto on producto.id_producto = factura_venta_line.id_producto
INNER JOIN public.clasificacion_producto on clasificacion_producto.id_clasificacion_producto = producto.id_clasificacion_producto
INNER JOIN public.factura_venta on factura_venta.id_factura_venta = factura_venta_line.id_factura_venta
INNER JOIN public.cliente on cliente.id_cliente = factura_venta.id_cliente
INNER JOIN public.empleado on empleado.id_empleado = factura_venta.id_empleado
where factura_venta.id_factura_venta = 12;
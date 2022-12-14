generic

type elem is private;

package dcola is
   type cola is limited private;

   mal_uso: exception;
   overflow: exception;

   procedure cvacia (qu: out cola);
   procedure poner (qu: in out cola; x: in elem);
   procedure borrar_primero (qu: in out cola);
   function coger_primero (qu: in cola) return elem;
   function esta_vacia (qu: in cola) return boolean;
   function is_last_item(qu: in cola) return boolean;

private
   type nodo;
   type pnodo is access nodo;
   type nodo is record
      x: elem;
      sig: pnodo;
   end record;

   type cola is record
      p,q: pnodo; -- q es el puntero al incio de la cola (consulta) y p al final (inserción)
   end record;

end dcola;

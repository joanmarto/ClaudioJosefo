package body dcola is

   -- Inicializa la cola
   procedure cvacia (qu: out cola) is
      p: pnodo renames qu.p;
      q: pnodo renames qu.q;
   begin
      p := null;
      q := null;
   end cvacia;

   -- Comprueba si la cola tiene algún elemento
   function esta_vacia (qu: in cola) return boolean is
      q: pnodo renames qu.q;
   begin
      return q = null;
   end esta_vacia;

   -- Coge el primer elemento de la cola
   function coger_primero (qu: in cola) return elem is
      q: pnodo renames qu.q;
   begin
      return q.x;
   exception
         when Constraint_Error => raise mal_uso;
   end coger_primero;

   -- Coloca un elemento al final de la cola
   procedure poner (qu: in out cola; x: in elem) is
      q: pnodo renames qu.q;
      p: pnodo renames qu.p;
      r: pnodo;
   begin
      r := new nodo;
      r.all := (x, null);
      if p = null then -- La cola está vacía
         p := r;
         q := r;
      else
         p.sig := r;
         p := r;
      end if;
   exception
      when Storage_Error => raise overflow;
   end poner;

   -- Elimina el primer elemento de la cola
   procedure borrar_primero (qu: in out cola) is
      p: pnodo renames qu.p;
      q: pnodo renames qu.q;
   begin
      q := q.sig;
      if q = null then -- Hemos eliminado el único elemento de la cola
         p := null;
      end if;
   exception
      when Constraint_Error => raise mal_uso;
   end borrar_primero;

   -- Comprueba si en la cola solo hay un elemento
   function is_last_item (qu: in cola) return boolean is
      q: pnodo renames qu.q;
   begin
      return q.sig = null;
   end is_last_item;
end dcola;

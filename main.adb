with Ada.Text_IO;
with Ada.Integer_Text_IO;
with dcola;
use Ada.Text_IO;
use Ada.Integer_Text_IO;

procedure Main is
   subtype tnom is String (1..50);
   type tjugador is
      record
         nom: tnom;
         l: Natural;
      end record;
   type tpasos is new Integer range 1..100;
   fichero: File_Type;
   pasadas: tpasos;
   jugador: tjugador;
   nombre: tnom;
   s_leng: Natural;
   pasos_in: Natural;
   package dColaJugadors is new dcola(tjugador);
   use dColaJugadors;
   c: cola;
begin
   -- Abrimos el fichero con los nombres
   open(fichero, In_File, "jugadores.txt");
   -- Pedimos el número de pasos por consola
   Put("Indica el número de pasadas: ");
   Get(pasos_in);
   New_Line;
   pasadas := tpasos(pasos_in);
   -- Leemos los jugadores y los metemos en la cola
   cvacia(c);
   while not End_Of_File(fichero) loop
      Get_Line(fichero, nombre, s_leng);
      jugador := (nombre, s_leng);
      poner(c, jugador);
   end loop;

   -- Mientras no sea el ultimo ítem operamos con la cola
   while not is_last_item(c) loop
      for i in 1..pasadas loop
         jugador := coger_primero(c);
         borrar_primero(c);
         poner(c, jugador);
      end loop;
      -- "Matamos" al jugador
      borrar_primero(c);
   end loop;
   -- Imprimimos al ganador
   jugador := coger_primero(c);
   nombre := jugador.nom;
   s_leng := jugador.l;

   Put_Line("El jugador que ha quedado con vida ha sido: "&nombre(1..s_leng));
   -- Cerramos el fichero
   close(fichero);
end Main;


/*
global.dsm_settings = ds_map_create();
#macro set		global.dsm_settings

ds_map_add(set, "sound", [5,[0,10]]);
ds_map_add(set, "music", [5,[0,10]]);
ds_map_add(set, "subtitles", [0,["On", "Off"]]);
ds_map_add(set, "text_speed", [1,["Slow","Normal","Fast","Instant"]]);
*/

/*
//Establecer ventana del juego que se escala
//Y establecer la posicion "X" y "Y" en (0,0)
view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
*/

#macro MENU	0
#macro OPCIONES	1

indice = 0;
sub_menu = 0;

tiempo_sostenido_izquierdo = 0;
tiempo_sostenido_derecho = 0;

resoluciones = [ "640x360", "960x540", "1280x720", "1600x900", "1920x1080" ]

menu = [ "Empezar", "Opciones", "Salir" ];

opciones = [ ["Pantalla Completa", 1, ["Si","No"]], ["Ventana", 2, resoluciones], ["Sonido", 5, [0, 10] ], "Back" ]


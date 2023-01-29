
/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_set_halign(fa_left);
draw_set_font(f_Menu);

var _espacio_entre_texto = 40;


 if sub_menu == 0 {
	for (var i = 0; i < array_length(menu); ++i) {
		
		draw_set_color(c_white);
	
		if i == indice draw_set_color(c_teal);
	
	    draw_text(room_width * 1/10, room_height * 7/10 + _espacio_entre_texto * i, menu[i]);
	}
 }
 else{
 	for (var j = 0; j < array_length(opciones); ++j) {
	
		draw_set_color(c_white);
	
		if j == indice draw_set_color(c_teal);
		
		if is_array(opciones[j]){
		
			var _menu_lista = opciones[j];
		
			show_debug_message(_menu_lista);
			
			var _variable = _menu_lista[1];
		
			if is_real(_menu_lista[2][0]){
			
				var _cadena = _menu_lista[0] + "  " + string(_variable);
			}
			else{
		
				var _cadena = _menu_lista[0] + "  " + _menu_lista[2][_variable];
			}	
		}
		else{
		
			var _cadena = opciones[j];
		} 
	
	    draw_text(room_width * 1/10, room_height * 6/10 + _espacio_entre_texto * j, _cadena);
	}
 }


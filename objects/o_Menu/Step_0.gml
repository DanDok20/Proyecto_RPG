
var _arriba = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
var _abajo = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down);

var _seleccion = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter);

var _izquierda = keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left);
var _derecha = keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right);

var _izquierda_sostenido =  keyboard_check(ord("A")) or keyboard_check(vk_left);
var _derecha_sostenido =  keyboard_check(ord("D")) or keyboard_check(vk_right);

var _velocidad_repeticion = 8;
var _retraso_repeticion = 25;

/*
var _id = layer_background_get_id("Fondo");
var _indice_final = 17;

if (cambio == 1) and (layer_background_get_index(_id) == _indice_final) room_goto_next();
*/
if _derecha tiempo_sostenido_derecho = _retraso_repeticion;

if tiempo_sostenido_derecho > 0 {
	
	tiempo_sostenido_derecho--;
	if tiempo_sostenido_derecho == 0 and _derecha_sostenido {
	
		_derecha = true;
		tiempo_sostenido_derecho = _velocidad_repeticion;
	}
}

if _izquierda tiempo_sostenido_izquierdo =  _retraso_repeticion;

if tiempo_sostenido_izquierdo > 0 {

	tiempo_sostenido_izquierdo--;
	if tiempo_sostenido_izquierdo == 0 and _izquierda_sostenido {
	
		_izquierda = true;
		tiempo_sostenido_izquierdo = _velocidad_repeticion;
	}
}

var _movimiento = _abajo - _arriba;
var _movimiento_horizontal = _derecha - _izquierda;

if keyboard_check_pressed(vk_escape){
	
	sub_menu = 0
	indice = 1;
} 

if _movimiento != 0 {

	indice += _movimiento;

	var _tamanio_menu = array_length(menu);
	var _tamanio_opciones = array_length(opciones);
	
	if sub_menu == 0{
	
		if indice < 0 indice = _tamanio_menu - 1;
		else if indice >= _tamanio_menu indice = 0;
	}
	else{
		if indice < 0 indice = _tamanio_opciones - 1;
		else if indice >= _tamanio_opciones indice = 0;
	}
}

if _seleccion or ( sub_menu == 1 and is_array(opciones[indice]) and _movimiento_horizontal != 0 ){
	
	switch(sub_menu){
	
		case MENU:
			switch(indice){
				
				case 0:
					//layer_sequence_destroy(s_Fondo_base);
					layer_sequence_create("Fondo2", 0 ,0 , s_Fondo_empezar);
				break;
				
				case 1:
				
					sub_menu = 1;
					indice = 0;
				break;
				
				case 2:
				
					game_end();
				break;
			}	
		break;
		
		case OPCIONES:
			switch(indice){
				case 0:
				
					cambiar_variable_menu(_movimiento_horizontal, indice);
					var _variable = opciones[indice][1];
					var _pantalla = opciones[indice][2][_variable];
					if _pantalla == "Si" window_set_fullscreen(1);
					else if _pantalla == "No" window_set_fullscreen(0);
				break;
				
				case 1:
				
					cambiar_variable_menu(_movimiento_horizontal, indice);
					var _variable = opciones[indice][1];
					var _resolucion = opciones[indice][2][_variable];
					if _resolucion == "640x360" window_set_size(640,360);
					else if _resolucion == "960x540" window_set_size(960,540);
					else if _resolucion == "1280x720" window_set_size(1280,720);
					else if _resolucion == "1600x900" window_set_size(1600,900);
					else if _resolucion == "1920x1080" window_set_size(1920,1080);
				break;
				
				case 2:
				
					cambiar_variable_menu(_movimiento_horizontal, indice);
				break;
				
				case 3:
				
					sub_menu = 0;
					indice = 1;
				break;
			}	
		break;
	}
}


function cambiar_variable_menu(_movimiento_horizontal, indice){
	
	var _limites_lista = opciones[indice][2];
	
	if is_real(_limites_lista[0]){
	
		var _minimo = _limites_lista[0];
		var _maximo = _limites_lista[1];
	
	}else{
	
		var _minimo = 0;
		var _maximo = array_length(_limites_lista) - 1;		
	}
	
	opciones[indice][1] = clamp(_movimiento_horizontal + opciones[indice][1], _minimo, _maximo);
}
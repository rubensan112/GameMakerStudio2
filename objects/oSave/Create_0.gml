/// @desc Declaration of Save mode

	
//Triger mode	
trigerMode = false;
triggerActivated = false;
number = 0; //Order of saves.

//AutoSave mode
autoSaveRoom = true;

//Init vars 
xcheck = 0;
bigger_number = 0;


/// Instruciones de uso.
	/// Instruciones Generales
		//Arastrar el objeto oSave a la room. Si se introducen varias instancias de oSave en una misma room, deben ir numeradas (number), del 0 
		//(0 viene por defecto) a x. 
	/// Modo SaveRoom
		//Guarda la room en la que se encuentra el jugador, para despues dirigirle hasta el. Siempre debe tener el valor number = 0.
			/// Uso
				//Funciona simplemente arrastrando el objeto oSave a la room.
	/// Modo Trigger
		//Cuando el jugador pasa por un checkPoint (Area oSave), guarda la posicion, y la room. Despues simplemente dirigiendo a la room determinada, 
		//el oSave se encargara de cambiar la posicion del jugador.
		//Si hay varios deben ir numerados. (Se puede combinar con SaveRoom). Si se activa el triger del number 3, el number 2, y 1 seran desactivados
		//inutilizados aunque se reinicie el juego, asi al volver a pasar por estas zonas, no ocurrira nada. Valido para cualquier numero.
			/// Uso
				//Arrastrar oSave a la room. cambiar triggerMode, y triggerActivated a true, y el number en cuestion.
	/// Modo Funcion
		//Para poder guardar la partida en cualquier momento, simplemente usando una funcion.
			/// Uso
				//Arrastrar osave a la room, con los parametros de modo Trigger, y poner el area en alguna zona no accesible para el jugador.
				//O hacerla increiblemente pequeña. 
				//Para llamar a la funcion, simplemente:
					// with(oSave)
					//{
						//SaveLoadGame("Save")
					//}
				//Aunque eso solo guardaria la posicion, pero por ejemplo podria ser asi:
					// with(oSave)
					//{
						//var file;
						//file = ini_open(SAVEFILE);
						//ini_write_real("PlayerStats","hp",global.hp);
						//with(oPlayer)
						//{
							//ini_write_real("PlayerState","hp",hp);
						//}
						//ini.close();
						//SaveLoadGame("Save")
					//}
			///Pendiente de crear una funcion espedifica para los stats, vida, etc.


///Por otro lado es posible que este objeto este mal planteado.
//Ha sido construido con la idea de que que compara los triggers, y cuando encuentra uno lo deshabilita, y cambia la posicion.
//Pero tiene que ir buscando uno a uno si coincide el id.
module main

fn main() {
    println(@MOD)        // modulo actual main
    println(@FN)         // funcion actual
    println(@STRUCT)     // estructura actual
    println(@VEXE)       // posicion actual del compilador
    println(@FILE)       // archivo fuente actual
    println(@LINE)       // numero de fila actual
    println(@COLUMN)     // numero de columna actual
    println(@VHASH)      // El número vhash del compilador V actual
    println(@VMOD_FILE)  // El contenido del archivo v.mod actual se devuelve como una cadena. 
						 //Asegúrese de que el archivo v.mod exista antes de la ejecución; de lo contrario, compilará un error
}
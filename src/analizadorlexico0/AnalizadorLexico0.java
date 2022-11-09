/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorlexico0;

import java.io.File;

/**
 *
 * @author Bruni
 */
public class AnalizadorLexico0 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       String ruta="C:\\Users\\Bruni\\OneDrive\\Documentos\\NetBeansProjects\\AnalizadorLexico0\\src\\analizadorlexico0\\Lexer.flex";
              
       generarLexer(ruta);
    }
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
}

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.io.BufferedWriter;

class TOKEN {
    TOKEN (int numToken, String token, String lexico, String lexema1, String lexema2){
        this.numToken = numToken;
        this.token = new String(token); 
        this.lexico = lexico;               //token
        this.lexema1=lexema1;
        this.lexema2=lexema2;;
    }
    
    public int numToken;
    public String token;
    public String lexico;
    public String lexema1;
    public String lexema2;

    public String toString(){
        return "Token "+numToken+": "+lexico+" Lexema: "+token+"lexema1:"+lexema1+"lexema2:"+lexema2;
        }
    }


//JFlex 

%% //inicio de declaraciones
%function nextToken
%public
%class metodos
%unicode //soporte unicode representacion de caracteres

%{
    private int contador;
    private ArrayList<TOKEN> tokens;
    
    //Escribir en txt
    private void writeOutputFile() throws IOException{
        String filename = "file.out";
        BufferedWriter out= new BufferedWriter(
            new FileWriter(filename));
            for(TOKEN t: this.tokens){
                out.write(t + "\n");
                }
                out.close();
                }
%}

%init{  //contador de tokens se guarda en el constructor
    contador = 0;
    tokens = new ArrayList<TOKEN>();
%init}

%eof{       //se ejecuta una vez al fin del archivo de entrada
    try{
        this.writeOutputFile();
    }catch(IOException ioe){
        ioe.printStackTrace();
        }
%eof}

%line   //contador de lineas, variable yyline

%column //contador de columna, variable yycolumn


EXP_ALPHA=[A-Za-z_.]         //acepta letras
EXP_DIGITO=[0-9]            //acepta numeros


EXP_ALPHANUMERICO={EXP_ALPHA} | {EXP_DIGITO}
NUMERO= ({EXP_DIGITO})+                            
IDENTIFICADOR={EXP_ALPHA} ({EXP_ALPHANUMERICO})* 
ESPACIO=" "
SALTO= \n| \r| \r\n    
comentarios="\//".+//\""
LineasCom=[/*,/**]
LineasComF=[*/,**/]
ComentariosMul={LineasCom} [^"/"]*{LineasComF}
/*reglas lexicas */
%%

{NUMERO}    {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "NUM", "NUM",yytext());
    tokens.add(t);
    return t;
}

( "package" | "public" | "class" | "static" | "void" | "String" | "int" | "if" | "else" | "abstract" | "assert" | "boolean" | "break" | "byte" | "case" | "catch" | "char" | "class" | "continue" | "default" | "do" | "double" | "enum" | "extends" | "final" | "finally" | "float" | "for" | "implement" | "import" | "interface" | "long" | "native" | "new" | "private" | "protected" | "return" | "short" | "strictfp" | "super" | "switch" | "synchronized" | "this" | "throw" | "throws" | "transient" | "try" | "while" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "PALRE", yytext()," ");
    tokens.add(t);
    return t;
}
( "System.out.print" | "System.out.println") {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "PALRE", "println" ," ");
    tokens.add(t);
    return t;
}
 {IDENTIFICADOR} {
    contador++;
    TOKEN t = new TOKEN(contador,yytext(), "ID", "ID",yytext());
    tokens.add(t);
    return t;
}
( "UNPA.WinForm.compiladores"  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "ID","ID","compiladores");
    tokens.add(t);
    return t;
}
( "="  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPASI","ASI"," ");
    tokens.add(t);
    return t;
}
( "*="  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPASI","MULA"," ");
    tokens.add(t);
    return t;
}
( "/="  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPASI","DIVA"," ");
    tokens.add(t);
    return t;
}
( "%="  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPASI","MODA"," ");
    tokens.add(t);
    return t;
}
( "+="  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPASI","SUA"," ");
    tokens.add(t);
    return t;
}
( "-="  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPASI","REA"," ");
    tokens.add(t);
    return t;
}
( "+"  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPARI","SUM"," ");
    tokens.add(t);
    return t;
}
( "-"  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPARI","RES"," ");
    tokens.add(t);
    return t;
}
( "*"  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPARI","MUL"," ");
    tokens.add(t);
    return t;
}
( "/"  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPARI","DIV"," ");
    tokens.add(t);
    return t;
}
( "%"  ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPARI","MOD"," ");
    tokens.add(t);
    return t;
}
( "==" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPREL","IGU"," ");
    tokens.add(t);
    return t;
}
( "!=" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPREL","DIF"," ");
    tokens.add(t);
    return t;
}
( ">" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPREL","MAY"," ");
    tokens.add(t);
    return t;
}
( "<" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPREL","MEN"," ");
    tokens.add(t);
    return t;
}
( ">=" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPREL","MAI"," ");
    tokens.add(t);
    return t;
}
( "<=" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPREL","MEI"," ");
    tokens.add(t);
    return t;
}
( ";") {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPESP","DEL"," ");
    tokens.add(t);
    return t;
}
( ":") {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPESP","DPU"," ");
    tokens.add(t);
    return t;
}
( "{" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPESP","LLI"," ");
    tokens.add(t);
    return t;
}
( "(" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPESP","PIZ"," ");
    tokens.add(t);
    return t;
}
( ")" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPESP","PDE"," ");
    tokens.add(t);
    return t;
}
( "[" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPESP","COI"," ");
    tokens.add(t);
    return t;
}
( "]" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPESP","COD"," ");
    tokens.add(t);
    return t;
}
( "}" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPESP","LLD"," ");
    tokens.add(t);
    return t;
}
( "." ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPESP","PUN"," ");
    tokens.add(t);
    return t;
}
( "?" ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPESP","OCO"," ");
    tokens.add(t);
    return t;
}
( "," ) {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "OPESP","COM"," ");
    tokens.add(t);
    return t;
}
( "\"soy menor que 15\""| "\"soy mayor que 15\"") {
    contador++;
    TOKEN t = new TOKEN(contador, yytext(), "MSG","MSG",yytext());
    tokens.add(t);
    return t;
}
{ESPACIO} {/*Ignore*/}

{SALTO} {/*Ignore*/}

{comentarios}    {/*Ignore*/}
{ComentariosMul}    {/*Ignore*/}


grammar Car;

@parser::members {

private Car car;

public CarParser(TokenStream input, Car car) {
    this(input);
    this.car = car;
}
}


//------------------GRAMATICA-------------------------

program: sentence*;
sentence:  move_fw | move_bk | turn_lt | turn_rt | set_rgba;
move_fw: MOVE_FW expression
	{car.forward((float)$expression.value);};
move_bk: MOVE_BK expression
	{car.backwards((float)$expression.value);};
turn_lt: TURN_LT expression
	{car.left((float)$expression.value);};
turn_rt: TURN_RT expression
	{car.right((float)$expression.value);};
set_rgba: SET_RGBA e1=expression COMA e2=expression COMA e3=expression COMA e4=expression
	{car.color( (float) $e1.value, (float) $e2.value, (float) $e3.value, (float) $e4.value);};

//------------------SEMANTICA----

expression returns [Object value]:
	NUMBER {$value = Float.parseFloat($NUMBER.text);};

//------------------COMANDOS GENERALES CAR------------

MOVE_FW:'move_fw';
MOVE_BK:'move_bk';
TURN_LT:'turn_lt';
TURN_RT:'turn_rt';
SET_RGBA:'set_rgba';

//------------------PALABRAS RESERVADAS----------

DEF_VAR:'def_var';
PROC:'proc';
END:'end';
WHILE:'while';
ENDWHILE:'endwhile';
ECHO:'echo';
IF:'if';
ELSE:'else';
ENDIF:'endif';
BOOLEAN:'true'|'false';

//------------------OPERACIONES MATEMÁTICAS--------

PLUS:'+';
MINUS:'-';
MULT:'*';
DIV:'/';

//------------------EXPRESIONES LOGICAS------------

AND:'and';
OR:'or';
NOT:'not';

//------------------EXPRESIONES DE COMPARACION------------------------------------------------------------

GT:'>';
LT:'<';
GEQ:'>=';
LEQ:'<=';
//necesitamos un igual doble ya que el singular se utiliza para la signacion
EQ:'=='; 
NEQ:'<>';
ASSING:'=';

//--------------------AGRUPADORES----------------------------------------------------------------------

PAR_OPEN:'(';
PAR_CLOSE:')';
DOUBLE_POINT:':';
COMA:',';



WS:[ \t\r\n]+ -> skip;
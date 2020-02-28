grammar Car;

@parser::members {

private Car car;

public CarParser(TokenStream input, Car car) {
    this(input);
    this.car = car;
}
}

start: 'hello' 'world';

WS: [ \t\r\n]+ -> skip;
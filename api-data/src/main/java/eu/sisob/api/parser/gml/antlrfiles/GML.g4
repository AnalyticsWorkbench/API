/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

grammar GML;
gml : graph ;
graph : 'graph' WS* list ;
list : '[' WS* (keyvalue (WS+ keyvalue)*)* WS* ']' ;
keyvalue : KEY WS+ value ;
KEY : [a-zA-Z] [a-zA-Z0-9]* ;
value : NUMBER | STRING | list ;
NUMBER : SIGN? [0-9]+ ('.' [0-9]+ MANTISSA?)? ;
STRING : '"' .*? '"' [ \t]* '\r'? '\n' | '"' .*? '"' ;
MANTISSA : ('E' | 'e') SIGN? [0-9] ;
SIGN : ('+'|'-') ;
WS : [ \t\r\n] ;
CREATOR : 'Creator' .*? '\r'? '\n' -> skip ;
COMMENT : '#' .*? '\r'? '\n' -> skip ;
VERSION : 'Version' .*? '\r'? '\n' -> skip ;

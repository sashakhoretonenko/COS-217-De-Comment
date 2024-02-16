#include <stdio.h>
#include <stdlib.h>

/* Read text from stdin. Only prints characters that aren't a part of a comment,
effectively removing all comments. Does not consider string or character
literals to be comments.*/

/* Defines 8 different states from the DFA.*/

enum State {
    REG_CODE,
    SLASH,
    STAR,
    IN_COMMENT,
    IN_STRING,
    ESCAPE_STRING,
    IN_CHARLIT,
    ESCAPE_CHARLIT
};

/* DFA State for when the inpuit is regular code*/
enum State handleREG_CODE(int c){
    enum State state;

    if(c == '/'){
        state = SLASH;
    }
    /* goes inside string literal */
    else if(c == '"'){
        putchar(c);
        state = IN_STRING;
    }
    /* goes inside character literal*/
    else if (c== '\''){
        putchar(c);
        state = IN_CHARLIT;
    }
    else{
        putchar(c);
        state = REG_CODE;
    }

    return state;
}

/* DFA State for slash. If the character it receives is anything but *, it
prints a slash*/
enum State handleSLASH(int c){
    enum State state;
    
    /* beginning of a comment */
    if(c == '*'){
        putchar(' ');
        state = IN_COMMENT;
    }
    /* beginning of a string */
    else if(c == '"') {
        putchar('/');
        putchar('"');
        state = IN_STRING;
    }
    /* beginning of a character literal */
    else if(c == '\'') {
        putchar('/');
        putchar('\'');
        state = IN_CHARLIT;
    }
    /* go back to the slash state */
    else if(c == '/') {
        putchar('/');
        state = SLASH;
    }else{
        putchar('/');
        putchar(c);
        state = REG_CODE;
    }

    return state;
}

enum State handleSTAR(int c){
    enum State state;

    /* return back to star state*/
    if(c == '*'){
        state = STAR;
    }
    /* exit comment */
    else if(c == '/'){
        state = REG_CODE;
    }else{
        state = IN_COMMENT;
    }

    return state;
}

enum State handleIN_COMMENT(int c){
    enum State state;

    /* go to star state in case comment is terminating */
    if(c == '*'){
        state = STAR;
    }
    /* if we encounter a new line we want to print it*/
    else if (c == '\n'){
        putchar(c);
        state = IN_COMMENT;
    }
    /* if anything else just stay in the comment */
    else{
        state = IN_COMMENT;
    }

    return state;
}

/* handles occurrences inside the string*/
enum State handleIN_STRING(int c){
    enum State state;

   /* ends the string */
    if(c == '"'){
        putchar(c);
        state = REG_CODE;
    }
    /* escapes string, making sure that if the next character has some other
    functionality, that functionality will be ignored */
    else if(c == '\\'){
        putchar(c);
        state = ESCAPE_STRING;
    }
    /* else we stay in the string */
    else{
        putchar(c);
        state = IN_STRING;
    }

    return state;
}

/* prints a character and returns to the IN_STRING state */
enum State handleESCAPE_STRING(int c){
    putchar(c);
    return IN_STRING;
}


enum State handleIN_CHARLIT(int c){
    enum State state;

    /* breaks out of the character literal */
    if(c == '\''){
        putchar(c);
        state = REG_CODE;
    }
    /* escapes character literal, making sure that if the next character has 
    some other functionality, that functionality will be ignored */
    if( c =='\\'){
        putchar(c);
        state = ESCAPE_CHARLIT;
    }
    /* else we stay in the character literal */
    else{
        putchar(c);
        state = IN_CHARLIT;
    }

    return state;
}

/* prints a character and returns to the IN_CHARLIT state */
enum State handleESCAPE_CHARLIT(int c){
    putchar(c);
    return IN_CHARLIT;
}


/* Reads in characters until it reaches EOF and prints characters that
are not comments */

int main(void){
    int c;

    /* assume file starts with regular code */
    enum State state = REG_CODE;

    /* counts number of new lines */
    int newLineCounter = 0;

    /* counts the number of new lines in a comment*/
    int commentCount = 0;
    

    while((c = getchar()) != EOF){
        /* increments newline counter*/
        if(c == '\n'){
            newLineCounter++;
            if(state == IN_COMMENT || state == STAR) commentCount++;
            else commentCount = 0;
        }
        
        switch(state){

            case REG_CODE:
                state = handleREG_CODE(c);
                break;
            case SLASH:
                state = handleSLASH(c);
                break;
            case STAR:
                state = handleSTAR(c);
                break;
            case IN_COMMENT:
                state = handleIN_COMMENT(c);
                break;
            case IN_STRING:
                state = handleIN_STRING(c);
                break;
            case ESCAPE_STRING:
                state = handleESCAPE_STRING(c);
                break;
            case IN_CHARLIT:
                state = handleIN_CHARLIT(c);
                break;
            case ESCAPE_CHARLIT:
                state = handleESCAPE_CHARLIT(c);   
        }

    }

    if(state == IN_COMMENT || state == STAR){
    
        fprintf(stderr, "Error: line %d unterminated comment", newLineCounter);
    }
     /* we have a corner case if the last character is a slash so this accounts
    for that corner case */
    else if(c == '/') putchar(c);
    
    return 0;
}
#include <stdio.h>
#include <stdlib.h>

/* DFA states*/
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

/* handles regular code. default state. */
enum State handleREG_CODE(int c){
    /* check for possible comment start*/
    if( c == '/') return SLASH;
    /* check for string literal */
    else if (c == '"'){
        putchar(c);
        return IN_STRING;
    }
    /* check for char literal*/
    else if (c == '\''){
        putchar(c);
        return IN_CHARLIT;
    }

    /* else stay in the regular code state*/
    putchar(c);
    return REG_CODE;
}

/* handles a possible start of the comment*/
enum State handleSLASH(int c){
    /* if the next character isn't a *, then we aren't in a comment and thus
    need to print the slash character that we skipped*/
    if(c != '*'){
        putchar('/');

        /* check for string literal */
        if (c == '"'){
            putchar(c);
            return IN_STRING;
        }
        /* check for char literal*/
        if (c == '\''){
            putchar(c);
            return IN_CHARLIT;
        }
        /* stay in the comment if it's a slash*/
        if(c == '/') return SLASH;
    }
    /* this must be the start of a comment*/
    putchar(' ');
    return IN_COMMENT;
}

enum State handleIN_COMMENT(int c){
    /* possible end of a comment*/
    if(c == '*') return STAR;
    /* don't forget to print new lines*/
    else if(c == '\n'){
        putchar(c);
    }
    /* if it's not a possible end comment, we must still be in the comment*/
    return IN_COMMENT;
}

/* possible end of a comment*/
enum State handleSTAR(int c){
    if(c == '*') return STAR;
    /* don't forget to print new lines */
    if(c == '\n') putchar(c);
    /* check if it's ending the comment*/
    if(c == '/') return REG_CODE;

    /* if it gets here it's just a regular comment*/
    return IN_COMMENT;
}

/* handles the case when we're inside of a string*/
enum State handleIN_STRING(int c){
    putchar(c);

    /* end of the string*/
    if(c == '"') return (REG_CODE);
    else if (c == '\\') return ESCAPE_STRING;

    return IN_STRING;
}

/* handles the case when we're inside of a character ltieral*/
enum State handleIN_CHARLIT(int c){
    putchar(c);

    /* end of the character literal*/
    if(c == '\'') return (REG_CODE);
    else if (c == '\\') return ESCAPE_CHARLIT;

    return IN_CHARLIT;
}

/* ignoes the backslash and simply prints the character for escaped characters
in string literals */

enum State handleESCAPE_STRING(int c){
    putchar(c);
    return IN_STRING;
}

/* ignoes the backslash and simply prints the character for escaped characters
in character literals */
enum State handleESCAPE_CHARLIT(int c){
    putchar(c);
    return IN_CHARLIT;
}

int main(void){
    /* next char */
    int c;

    /* current state. starts at REG_CODE*/
    enum State state = REG_CODE;

    /* current line */
    int currLine = 1;
    /* starting line of current comment*/
    int currComLine;

    while((c = getchar()) != EOF){
        /* increments currLine whenever we find a new character */
        if(c == '\n') currLine++;


        switch(state){

            case REG_CODE:
                state = handleREG_CODE(c);
                break;
            case SLASH:
                /* updates current comment line */
                currComLine = currLine;
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

    /* corner case if the input ends in a slash */
    if(state == SLASH) putchar('/');

    /* if input ends with an unterminated comment*/
    if(state == IN_COMMENT || state == STAR){
        fprintf(stderr, "Error: line %d unterminated comment", currComLine);
        return EXIT_FAILURE;
    }

    return 0;
}




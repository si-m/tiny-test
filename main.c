/****************************************************/
/* File: main.c                                     */
/* Main program for TINY compiler                   */
/* Compiler Construction: Principles and Practice   */
/* Kenneth C. Louden                                */
/****************************************************/

/*El archivo main.c contiene el programa principal que controla el compilador. Su esqueleto respeta las siguientes líneas:
syntaxTree = parse();
buildSymtab(syntaxTree);
typeCheck(syntaxTree);
codeGen(syntaxTree, codefile);
*/

#include "globals.h"

/* set NO_PARSE to TRUE to get a scanner-only compiler */
#define NO_PARSE FALSE
/* set NO_ANALYZE to TRUE to get a parser-only compiler */
#define NO_ANALYZE FALSE

/* set NO_CODE to TRUE to get a compiler that does not
 * generate code
 */
#define NO_CODE FALSE

#include "util.h"
#if NO_PARSE
#include "scan.h"
#else
#include "parse.h"
#if !NO_ANALYZE
#include "analyze.h"
#if !NO_CODE
#include "cgen.h"
#endif
#endif
#endif

/* allocate global variables */
int lineno = 0;
FILE * source;
FILE * listing;
FILE * code;

/* allocate and set tracing flags */
int EchoSource = FALSE;
int TraceScan = TRUE;
int TraceParse = TRUE;
int TraceAnalyze = TRUE;
int TraceCode = TRUE;

int Error = FALSE;

main( int argc, char * argv[] )
{ TreeNode * syntaxTree; //inicializa el arbol
  char pgm[120]; /* source code file name */
  if (argc != 2)
    { fprintf(stderr,"usage: %s <filename>\n",argv[0]); //en caso de uso incorrecto
      exit(1);
    }
  strcpy(pgm,argv[1]) ;
  if (strchr (pgm, '.') == NULL)
     strcat(pgm,".tny"); //aqui obtengo el sample.tny, en caso de ser null devuelvo error
  source = fopen(pgm,"r");
  if (source==NULL)
  { fprintf(stderr,"File %s not found\n",pgm);
    exit(1);
  }
  listing = stdout; /* send listing to screen */
  fprintf(listing,"\nTINY COMPILATION: %s\n",pgm);
#if NO_PARSE
  while (getToken()!=ENDFILE); //si cno habilito la parte de parsing, continua generando tokens hasta en EOF.
#else
  syntaxTree = parse(); //sino.. llama al parser para que genere y devuelva el arbol de parging
  if (TraceParse) { //si esta el TraceParse en true, imprimo el arbol
    fprintf(listing,"\nSyntax tree:\n");
    printTree(syntaxTree);
  }
#if !NO_ANALYZE // a menos que cancele el analizador semantico, chequea que los tipos y las tablas de simbolos esten ok
  if (! Error)
  { if (TraceAnalyze) fprintf(listing,"\nBuilding Symbol Table...\n");
    buildSymtab(syntaxTree);
    if (TraceAnalyze) fprintf(listing,"\nChecking Types...\n");
    typeCheck(syntaxTree);
    if (TraceAnalyze) fprintf(listing,"\nType Checking Finished\n");
  }
#if !NO_CODE
  if (! Error)
  { char * codefile;
    int fnlen = strcspn(pgm,".");
    codefile = (char *) calloc(fnlen+4, sizeof(char));
    strncpy(codefile,pgm,fnlen);
    strcat(codefile,".tm");
    code = fopen(codefile,"w");
    if (code == NULL)
    { printf("Unable to open %s\n",codefile);
      exit(1);
    }
    codeGen(syntaxTree,codefile); //obtengo el codigo intermedio, preparado para la tm
    fclose(code);
  }
#endif
#endif
#endif
  fclose(source);
  return 0;
}

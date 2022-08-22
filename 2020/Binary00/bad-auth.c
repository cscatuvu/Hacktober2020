#include <stdio.h>

main() {
   FILE *fptr;

   fptr = fopen("auth.txt", "r");
   if(fptr == NULL)
   {
      printf("Error! Unable to find file.\n");
      exit(1);
   }
   fclose(fptr);

   printf("flag{d913d3378993540b909a6c6be510dcfadfab}\n");

   exit(0);
}

#include<stdio.h>

//func for add to n

int summ(int n) {
    double sum = 0;

    for (int i = 0;  i < n; i++) {
     printf("Enter a number %d\n", i);
     scanf("%d\n", n[i]);
    }

    for (int i = 0; i < n; i++){
     sum =+ n[i]; 
   }
   return sum;
}


int diff(int n) {
   double diff;

   for (int i = 0;  i < n; i++) {
      printf("Enter a number %d\n", i);
      scanf("%d\n", n[i]);
   }

   for (int i = 0; i < n; i++){
      diff =- n[i];
   }
 return diff;
}


void operation() {
   switch() {


}

}







int main() {}



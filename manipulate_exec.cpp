#include <iostream>

using namespace std;
string name;

void secret(){

   cout << "You're on a restricted area.\n";
   system("uname -a\n");

}

int main(){

    cout << "Hello, you are using my program, what is your name?\n";
    cin >> name;
    cout << "Your name is " << name << "\n";
    secret();
}

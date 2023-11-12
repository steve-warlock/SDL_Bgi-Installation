# Setup SDL_bgi pentru Xcode versiunea 13.4.1 sau mai noua
# I) -> Metoda pentru laptop-urile Macbook cu procesor intel, MacOS Ventura sau mai noua:

# 1) Instalare Homebrew (url : https://brew.sh)
	-> copiati comanda din casuta de sub ```Install Homebrew```
	-> introduceti comanda intr-o fereastra de terminal
	-> La un moment dat, o sa vi se ceara parola de la computer; Introduceti parola in prompt
 	
	-> Asteptati pana la finalizarea instalarii

# 2) Instalare SDL2
	-> scrieti in terminal:  brew install sdl2
	-> Aceasta "comanda" se va instala in folder-ul /usr/local/Cellar/

# 3) Instalare libraria SDL_bgi (url : https://sdl-bgi.sourceforge.io/#download)
	-> descarcati ultima versiune a aceste librarii (in momentul actual, 3.0.0), cu extensia .tar.gz
	-> Mergeti in folder-ul unde ati descarcat fisierul-suport (de regula, recomand in folder-ul Downloads sa-l puneti), dezarhivati zip-ul cu "Archive Utility.app" (aplicatie preinstalata in mac)
	-> Deschideti terminalul si tastati urmatoarele comenzi (se omite dollar_sign ($)):
```
	 $ cd ~/Downloads/(fisier_unde_ati_descarcat_libraria)/SDL_bgi-3.0.0/src
	 $ make
	 $ mv SDL_bgi.h /usr/local/include/SDL2
	 $ mv graphics.h /usr/local/include
	 $ mv libSDL_bgi.so /usr/local/lib
```
# 4) Adjustarea Xcode-ului pentru a putea rula libraria SDL_bgi:
	-> Deschideti Xcode si selectati "Create New Project"
	-> Alegeti "Comand Line Tool"
	-> denumiti sugestiv proiectul
 	-> Alegeti limbajul C++
  	-> Apasati "continue"/"next"
   	-> Deselectati "Create git repository"
    -> Apasati "create"
	-> (in bara de sus unde apare numele aplicatiei, langa logo-ul Apple-ului):
	 Selectati Product -> Scheme -> "Edit Scheme"
	 Selectati Run -> Diagnostics; Deselectati "Metal API Validation"
	 Selectati tot la Run, "Options" -> "Use costum working directory: "; Aici navigati la folder-ul unde gasiti "main.cpp"; Apoi dati "close" la "edit scheme"
	 In tabul din stanga, unde se regaseste "main.cpp", selectati (nume_proiect_cum_l-ati_denumit_voi).xcodeproj (este cel mai de sus din acel tab)
	 Selectati din Targets, textul care are in stanga sa o iconita cu un terminal
	 Build Phases -> "Link Binary with Libraries"; Apasati pe butonul de add "+" : "Add Other" -> "Add files..."
	 Apasati comanda "Command + Shift + G" si introduceti "/usr/local/Cellar/sdl2/2.28.5/lib"
	 Selectati urmatorul executabil : libSDL2-2.0.0.dylib
	 In aceeasi maniera, adaugati si "libSDL_bgi.so" in "Link Binary with Libraries"; Acesta il gasesti in "/usr/local/lib" (adresa pe care o introduceti dupa ce tastati comanda "Command + Shift + G")
	 Mergeti la "General", sub "Frameworks and Libraries", selectati ambele executabile sa fie "Embed & Sign"
	 Build Settings -> Architectures -> "Build Active Architecture Only" -> release; Selectati "Yes"
	 Build Settings -> "Search Path" -> "Header Search Paths"; Inserati: ``/usr/local/include`` 
	 Build Settings -> "Search Path" -> "Library Search Paths"; Inserati: ``/usr/local/Cellar/sdl2/2.28.5/lib`` 
																							(Ambele fara ghilimele)

# II) Metoda pentru laptop-urile Macbook cu procesor de tip arm (M1, M2), MacOS Ventura sau mai noua:

# 1) Instalare Homebrew (url : https://brew.sh)
	-> copiati comanda din casuta de sub ```Install Homebrew```
	-> introduceti comanda intr-o fereastra de terminal
	-> La un moment dat, o sa vi se ceara parola de la computer; Introduceti parola in prompt
        -> Faceti modificarile de la "next steps" ca sa mearga comanda brew!!!
	-> Asteptati pana la finalizarea instalarii

# 2) Instalare SDL2
	-> scrieti in terminal: brew install sdl2
	-> Aceasta "comanda" se va instala in folder-ul /opt/homebrew/Cellar

# 3) Instalare libraria SDL_bgi (url : https://sdl-bgi.sourceforge.io/#download)
	-> descarcati ultima versiune a aceste librarii (in momentul actual, 3.0.0), cu extensia .tar.gz
	-> Mergeti in folder-ul unde ati descarcat fisierul-suport (de regula, recomand in folder-ul Descarcari/Downloads sa-l puneti), dezarhivati zip-ul cu "Archive Utility.app" (aplicatie preinstalata in mac)
	-> Deschideti terminalul si tastati urmatoarele comenzi (se omite dollar_sign ($)):
```
         $ cd ~/Downloads/(fisier_unde_ati_descarcat_libraria)/SDL_bgi-3.0.0/src
	 # Inlocuiti Makefile-ul din acest folder cu cel de pe aceasta pagina
	 $ brew install pkg-config
	 $ rm Makefile
	 # Descarcati noul Makefile (aici sunt doua metode):
	 1) $ wget https://raw.githubusercontent.com/steve-warlock/SDL_Bgi-Installation/main/Makefile
	 2) $ curl -O https://raw.githubusercontent.com/steve-warlock/SDL_Bgi-Installation/main/Makefile (in cazul in care nu va merge wget)
	 $ make
	 $ mv SDL_bgi.h /opt/homebrew/include/SDL2
	 $ mv graphics.h /opt/homebrew/include
	 $ mv libSDL_bgi.so /opt/homebrew/lib
```

# 4) Adjustarea Xcode-ului pentru a putea rula libraria SDL_bgi:
	-> Deschideti Xcode si selectati "Create New Project"
	-> Alegeti "Comand Line Tool"
	-> denumiti sugestiv proiectul
 	-> Alegeti limbajul C++
 	-> Apasati "continue"/"next"
   	-> Deselectati "Create git repository"
    -> Apasati "create"
	-> (in bara de sus unde apare numele aplicatiei, langa logo-ul Apple-ului):
	Selectati Product -> Scheme -> "Edit Scheme"
	Selectati Run -> Diagnostics; Deselectati Metal API Validation
	Selectati tot la Run, "Options" -> "Use costum working directory: "; Aici navigati la folder-ul proiectului unde gasiti "main.cpp"; Apoi dati "close" la "edit scheme"
	  In tabul din stanga, unde se regaseste "main.cpp", selectati (nume_proiect_cum_l-ati_denumit_voi).xcodeproj (este cel mai de sus din acel tab)
	  Selectati din Targets, textul care are in stanga sa o iconita cu un terminal
	  Build Phases -> "Link Binary with Libraries"; Apasati pe butonul de add "+" : "Add Other" -> "Add files..."
	  Apasati comanda "Command + Shift + G" si introduceti "/opt/homebrew/Cellar/sdl2/2.28.5/lib"
	  Selectati urmatorul executabil : libSDL2-2.0.0.dylib
	  In aceeasi maniera, adaugati si "libSDL_bgi.so" in "Link Binary with Libraries"; Acesta se gaseste in "/opt/homebrew/lib" (adresa pe care o introduceti dupa ce tastati comanda "Command + Shift + G")
	  Mergeti la "General", sub "Frameworks and Libraries", selectati ambele executabile sa fie "Embed & Sign"
	  Build Settings -> Architectures -> "Build Active Architecture Only" -> release; Selectati "Yes"
	  Build Settings -> "Search Path" -> "Header Search Paths"; Inserati: ``/opt/homebrew/include`` 
	  Build Settings -> "Search Path" -> "Library Search Paths"; Inserati: ``/opt/homebrew/Cellar/sdl2/2.28.5/lib`` 																				(Ambele fara ghilimele)




# Sample Code (pentru verificare): 
```
#include <SDL2/SDL_bgi.h>
#include <graphics.h>

//std
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cmath>

// constants
#define pi 3.1415926



int main() {
    int gd = DETECT, gm;
    initgraph(&gd, &gm, NULL);
    getch();
    closegraph();
    return 0;
}
```


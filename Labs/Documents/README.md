### Tips f�r anv�ndning av Lyx
Dessa tips �r testade p� Linux (Ubuntu Mate).

##### Om det inte g�r att bygga till pdf
***
Testa att radera personliga konfigurationsfiler f�r lyx.
Detta kan g�ras genom att f�ljade s�tt:
 1. �ppna lyx
 2. KLicka Help -> About Lyx
 3. Htta "User directory:" 
 4. Radera den aktuella mappen. Denna mapp raderas inte om du avinstallerar Lyx. 

Se �ven [h�r](http://tex.stackexchange.com/questions/44156/how-can-i-revert-to-the-defaults-in-lyx)



##### Installera st�d f�r svenska
***

Installera texlive-lang-european. Se [h�r](https://launchpad.net/ubuntu/+source/texlive-lang)

Stavningskontroll p� svenska: F�r mig fungerade det att g�ra f�ljande:
 1. �ppna lyx
 2. Klicka Tools -> Preferences -> Language Settings -> Spellchecker
 3. V�lj "Enchant" under Spellchecker engine

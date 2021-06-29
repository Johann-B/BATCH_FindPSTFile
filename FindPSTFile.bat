@echo off

color B0
mode con cols=80 lines=20
TITLE Recherche PST

:: Menu d'accueil

echo.
echo.
echo   Auteur : Johann BARON
echo.
echo.
echo                 ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo                 Û                                            Û
echo                 Û   Programme de recherche de fichiers PST   Û
echo                 Û                                            Û
echo                 ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo.
echo.
echo.
echo.
echo.
echo               ÄÄÄÄÄ´ Appuyez sur une touche pour commencer ÃÄÄÄÄÄ
echo.
echo.
pause>nul

:: Analyse en cours

cls
color 70
mode con cols=72 lines=10
TITLE Recherche de fichiers PST en cours
echo.
echo.
echo                   Recherche des fichiers PST en cours.
echo.
echo                           Merci de patienter...
echo.
echo.
echo    Vous serez averti par un "beep" lorsque l'analyse sera termin‚e.
echo.

:: Rapport

set logfic=S:\Log-pst_%date:~6,4%-%date:~3,2%-%date:~0,2%_%random%.txt

echo                      [   R A P P O R T   ] >> %logfic%
echo. >> %logfic%
echo                                           ¤  Recherche de fichiers .PST  ¤              >> %logfic%
echo                       >> %logfic%
echo. >> %logfic%
echo        ================ >> %logfic%
echo              FindPSTFile       >> %logfic%
echo        ================ >> %logfic%
echo    # Auteur : Johann BARON >> %logfic%
echo    # Version : 3.0 >> %logfic%
echo    # Date version : 07/11/2015 >> %logfic%
echo. >> %logfic%
echo  ********************************************************************** >> %logfic%
echo. >> %logfic%
echo    ~ Rapport enregistré : %logfic% >> %logfic%
echo    ~ Rapport généré le : %DATE% >> %logfic%
echo    ~ Nom de l'utilisateur : %USERNAME% >> %logfic%
echo    ~ Nom de l'ordinateur : %HOSTNAME% >> %logfic%
echo . >> %logfic%
echo  ********************************************************************** >> %logfic%
echo. >> %logfic%
echo.  -------- Résultat de l'analyse -------- >> %logfic%
echo. >> %logfic%

for /r "S:" %%i in (*.pst) do set NamFic=%%~dpnxi& set DatFic=%%~ti& set sizefic=%%~zi& set diskfic=%%~di& call :log
for /r "D:" %%i in (*.pst) do set NamFic=%%~dpnxi& set DatFic=%%~ti& set sizefic=%%~zi& set diskfic=%%~di& call :log

echo. >>%logfic%
echo. >>%logfic%
echo                        * * * * * * [ %logfic% ] * * * * * * >> %logfic%

if %deplace%==n goto :note
if %deplace%==o goto :note2

:log
if %diskfic%==D: (set deplace=o) else (set deplace=n)
echo  : : %NamFic% >> %logfic%
echo 	- Date de modification : %DatFic% >> %logfic%
call :compteur
echo. >> %logfic%

goto :eof

pause

:compteur
set VrChn=%sizefic%
setlocal enabledelayedexpansion
set VrCompt=-1
goto boucle

:boucle
set /a VrCompt+=1
set test2=!VrChn:~%VrCompt%,1!
if not "%test2%"=="" goto boucle
if %VrCompt%==1 goto c1
if %VrCompt%==2 goto c1
if %VrCompt%==3 goto c1
if %VrCompt%==4 goto c4
if %VrCompt%==5 goto c5
if %VrCompt%==6 goto c6
if %VrCompt%==7 goto c7
if %VrCompt%==8 goto c8
if %VrCompt%==9 goto c9
if %VrCompt%==10 goto c10
if %VrCompt%==11 goto c11
if %VrCompt%==12 goto c12
if %VrCompt%==13 goto c13
if %VrCompt%==14 goto c14
if %VrCompt%==15 goto c15

:c1
set newsize=%VrChn% o
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c4
set /a si4ze=%VrChn%*1000/1024
goto r4

:r4
set newsize=%si4ze:~0,1%,%si4ze:~1,2% ko
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c5
set /a si5ze=%VrChn%*1000/1024
goto r5

:r5
set newsize=%si5ze:~0,2%,%si5ze:~2,2% ko
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c6
set /a si6ze=%VrChn%*1000/1024
goto r6

:r6
set newsize=%si6ze:~0,3%,%si6ze:~3,2% ko
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c7
set /a si7ze=%VrChn%/1024*1000/1024
goto r7

:r7
set newsize=%si7ze:~0,1%,%si7ze:~1,2% Mo
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c8
set /a si8ze=%VrChn%/1024*1000/1024
goto r8

:r8
set newsize=%si8ze:~0,2%,%si8ze:~2,2% Mo
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c9
set /a si9ze=%VrChn%/1024*1000/1024
goto r9

:r9
set newsize=%si9ze:~0,3%,%si9ze:~3,2% Mo
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c10
set /a si10ze=%VrChn:~0,9%/1024*1000/1024*1000/1024
goto r10

:r10
set newsize=%si10ze:~0,1%,%si10ze:~1,2% Go
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c11
set /a si11ze=%VrChn:~0,9%/1024*1000/1024*1000/1024
goto r11

:r11
set newsize=%si11ze:~0,2%,%si11ze:~2,2% Go
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c12
set /a si12ze=%VrChn:~0,9%/1024*1000/1024*1000/1024
goto r12

:r12
set newsize=%si12ze:~0,3%,%si12ze:~3,2% Go
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c13
set /a si13ze=%VrChn:~0,9%/1024*1000/1024*10000/1024*1000/1024
goto r13

:r13
set newsize=%si13ze:~0,1%,%si13ze:~1,2% To
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c14
set /a si14ze=%VrChn:~0,9%/1024*1000/1024*10000/1024*1000/1024
goto r14

:r14
set newsize=%si14ze:~0,2%,%si14ze:~2,2% To
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:c15
set /a si15ze=%VrChn:~0,9%/1024*1000/1024*10000/1024*1000/1024
goto r15

:r15
set newsize=%si15ze:~0,3%,%si15ze:~3,2% To
echo 	- Taille : %newsize% (%sizefic% octets) >> %logfic%
goto :eof

:: Analyse terminée (aucun fichier sur le D:)

:note
cls
 

cls
color A0
mode con cols=65 lines=15
TITLE Recherche de fichiers PST termin‚e
echo.
echo.
echo.
echo                        Analyse termin‚e.
echo.
echo          Aucun fichier n'a ‚t‚ trouv‚ sur le lecteur D:
echo.
echo.
echo.
echo  ÄÄÄÄ´ Appuyer sur une touche pour visualiser le rapport. ÃÄÄÄÄ
echo.
echo.
Pause>nul
notepad.exe %logfic%

goto :fin

pause

:: Analyse terminée (fichier sur le D:)

:note2
cls
 

cls
color 30
mode con cols=85 lines=20
TITLE Recherche de fichiers PST termin‚e
echo.
echo.
echo.
echo                                  Analyse termin‚e.
echo.
echo.
echo                                     ATTENTION !
echo.
echo    Vous avez actuellement un/des fichier(s) PST enregistr‚(s) sur le lecteur D:
echo.
echo                Veuillez d‚placer ce(s) fichier(s) sur le lecteur S:
echo.
echo.
echo          ÄÄÄÄÄ´ Appuyer sur une touche pour visualiser le rapport. ÃÄÄÄÄÄ
echo.
echo.
Pause>nul
notepad.exe %logfic%

goto :fin

pause

:: Fin du programme

:fin
cls
color B0
mode con cols=80 lines=20
TITLE Recherche PST
echo.
echo.
echo   Auteur : Johann BARON
echo.
echo.
echo                   ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo                   Û                                        Û
echo                   Û            Fin du programme            Û
echo                   Û                                        Û
echo                   ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo.
echo.
echo.
echo.
echo.
echo                ÄÄÄÄÄ´ Appuyez sur une touche pour quitter ÃÄÄÄÄÄ
echo.
echo.
pause>nul

exit
@echo off
title Renomear Maquina do Dominio Remoto
:home
set old=sem_dados
set new=sem_dados
set user=sem_dados
set passwd=sem_dados
cls
echo Digite o nome do computador antigo:
set /p old=
if %old% == menu goto menu
cls
echo Digite o novo nome do computador %old%:
set /p new=
cls
echo Digite do usuario de conexao com AD e a maquina local (deve ter privilegios):
set /p user=
cls
echo Digite a senha do usuario %user%:
set /p passwd=
cls
set user=%user%
echo Fazendo mudanca de nome do host %old% para %new% com o usuario %user%...
echo Aguarde...
netdom RenameComputer %old% /NewName:%new% /UserD:%user% /PasswordD:%passwd% /UserO:%user% /PasswordO:%passwd% /force /reboot
set passwd=sem_dados
set user=sem_dados
pause
cls

:menu
if %old% == menu set old=sem_dados
cls
title Renomear Maquina do Dominio Remoto
echo Escolha uma opcao:
echo 1) Pingar para %old%
echo 2) Pingar para %new%
echo 3) Pingar para IP especifico
echo 4) Limpar Cache DNS Local
echo 5) Renomear outro computador
set /p op=
if %op% == 3 echo IP:
if %op% == 3 set /p ipop=
if %op% == 4 ipconfig /flushdns
if %op% == 4 goto menu
if %op% == 5 goto home
echo Quantidade de pings:
set /p ping=
if %op% == 1 ping %old% -n %ping%
if %op% == 2 ping %new% -n %ping%
if %op% == 3 ping %ipop% -n %ping%


cls
goto menu

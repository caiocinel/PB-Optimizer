chcp 65001
@echo off
CD /D "%~dp0"
title Termos de uso
cls
@echo===============================================================================
@echo===============================================================================
@echo #######  #######    ######  ##    ## #######    ###   ######## ########    
@echo	##    ## ##    ##  ##    ## ##    ## ##        ## ##     ##    ##          
@echo	##    ## ##    ##  ##       ##    ## ##       ##   ##    ##    ##          
@echo	#######  #######   ##       ######## ######  ##     ##   ##    ########    
@echo	##    ## ##  ##    ##       ##    ## ##      #########   ##          ##    
@echo	##    ## ##   ##   ##    ## ##    ## ##      ##     ##   ##          ##    
@echo	#######  ##    ##   ######  ##    ## ####### ##     ##   ##    ########    
@echo===============================================================================
@echo=============================================================================== 
color 0A
echo Ao usar essa ferramenta você assume toda responsabilidade
echo em possíveis danos que poderão ocorrer caso haja mal uso
echo Não finalize-a precocemente, pois poderão ocorrer danos
echo ao sistema operacional, simplesmente feche o game e aguarde
echo a reversão de todas as alterações
echo.
echo Se concorda com esses termos, digite "Concordo", caso contrário
echo feche a aplicação.
echo.
IF EXIST "PB_BOOSTER\Termos.dat" GOTO Termos
set /P ANSWER=Concorda com os termos ?
if /i {%ANSWER%}=={Concordo} (goto Termos)
if /i {%ANSWER%}=={Sim} (goto Termos)

:Termos
echo Você concordou com os termos. > PB_BOOSTER\Termos.dat
IF NOT EXIST "PB_BOOSTER" mkdir PB_BOOSTER
goto ClearData

:ClearData

Del /S /F /Q %temp%
Del /S /F /Q C:\Windows\Temp
Del /S /F /Q C:\Windows\Prefetch
Del /S /F /Q C:\Users\%userprofile%\Recent
cls

goto inicio





:inicio
echo Para redefinir as configurações, apague a pasta "PB_BOOSTER"
echo Caso não saiba o que está fazendo, escolha opções seguras.
IF EXIST "PB_BOOSTER\Termos.dat" echo Você concordou com os termos.
timeout 8
goto Priority


:Priority

IF EXIST "PB_BOOSTER\PB_alta.dat" GOTO service
IF EXIST "PB_BOOSTER\pb_media.dat" GOTO service
IF EXIST "PB_BOOSTER\pb_normal.dat" GOTO service
IF EXIST "PB_BOOSTER\pb_padrao.dat" GOTO service
echo Você gostaria de alterar as configurações de Prioridade da CPU?
Echo Isso pode melhorar o desempenho, mas pode nao funcionar em todos os computadores.
echo.
echo --------------------------------------------
echo Em caso de dúvidas, não use.
echo --------------------------------------------
echo.
echo.
echo 1 - Iniciar o jogo sem alterar a prioridade (Seguro).
echo.
echo 2 - Definir prioridade manualmente (Avançado).
echo.
echo.

SET /P M=Digite um dos numeros exibidos: 
IF %M%==1 GOTO NOCPU
IF %M%==2 GOTO CPU
SET /P M=Digite o número da opção desejada e tecle ENTER.

:CPU
cls
Title Alteração da Prioridade

echo.
Echo 
echo.
echo 1 - Definir como alta (Extremamente rápido)
echo.
echo 2 - Definir como acima do normal (Rápido e seguro)
echo.
echo 3 - Definir como normal (Padrão, extremamente seguro)
echo.
SET /P M=Digite o ítem desejado.
IF %M%==1 echo Definindo como Alta Priodidade > PB_BOOSTER\PB_alta.dat
IF %M%==2 echo Definindo como Média Prioridade > PB_BOOSTER\PB_media.dat
IF %M%==3 echo Definindo como Normal > PB_BOOSTER\PB_normal.dat

goto PB_INFO

:NOCPU
cls
echo Você decidiu deixar como padrão. > PB_BOOSTER\pb_padrao.dat
timeout 5
goto service

:PB_INFO
cls
IF EXIST "PB_BOOSTER\prioridade_definida.dat" goto services
echo Previnindo problemas. > PB_BOOSTER\prioridade_definida.dat"
goto service

:service

title Opções de Serviços
IF EXIST PB_BOOSTER\user_config.dat goto user_service
IF EXIST PB_BOOSTER\no_config.dat goto GAME
	
cls
echo.
echo 1 - Escolher quais serviços parar. (Costumizado)
echo.
echo 2 - Não parar serviços (Padrão e Extremamente Seguro)
echo.
echo.
echo.
SET /P M=Escolha um dos numeros exibidos e tecle ENTER:
IF %M%==1 GOTO user_service
IF %M%==3 GOTO user_script_settings
IF %M%==2 GOTO use_no_settings

:use_no_settings
echo. > PB_BOOSTER\no_config.dat
echo Nenhuma alteração foi efetuada
pause
goto GAME

:use_script_settings
cls
echo Em desenvolvimento
goto service

:user_service

echo. > PB_BOOSTER\user_config.dat
IF EXIST PB_BOOSTER\use_user_controled_services.dat goto new_stop
@echo off
title Verificando compatibilidade com a função.
dir | findstr  PB_BOOSTER
IF %ERRORLEVEL% EQU 1 goto :ERROR
echo Usando configurações salvas. > FPS_BOOSTER\use_user_controled_services.dat
goto script
:ERROR
echo Não foi possível salvar as configurações
echo Alguns componentes estão faltando.
pause
echo Saindo...
timeout 5
goto GAME

:script
title Controle de servicos a serem parados
set M=demo
cls
echo.		 Lista de serviços
Echo Escolha quais serviços deseja parar.
echo Quando finalizar, digite "Pronto"
IF EXIST PB_BOOSTER\winupdateoff.dat echo 1 [X] Windows Updates
IF NOT EXIST PB_BOOSTER\winupdateoff.dat echo 1 [ ] Windows Updates
IF EXIST PB_BOOSTER\windefenderoff.dat echo 2 [X] Windows Defender
IF NOT EXIST PB_BOOSTER\windefenderoff.dat echo 2 [ ] Windows Defender
IF EXIST PB_BOOSTER\winbackupoff.dat echo 3 [X] Windows Backup
IF NOT EXIST PB_BOOSTER\winbackupoff.dat echo 3 [ ] Windows Backup
IF EXIST PB_BOOSTER\webclientoff.dat echo 4 [X] WebClient
IF NOT EXIST PB_BOOSTER\webclientoff.dat echo 4 [ ] WebClient
IF EXIST PB_BOOSTER\shell_hardware_detectionoff.dat echo 5 [X] Shell Hardware Detection
IF NOT EXIST PB_BOOSTER\shell_hardware_detectionoff.dat echo 5 [ ] Shell Hardware Detection
IF EXIST PB_BOOSTER\serveroff.dat echo 6 [X] Server
IF NOT EXIST PB_BOOSTER\serveroff.dat echo 6 [ ] Server
IF EXIST PB_BOOSTER\workstationoff.dat echo 7 [X] Workstation
IF NOT EXIST PB_BOOSTER\workstationoff.dat echo 7 [ ] Workstation
IF EXIST PB_BOOSTER\gfwloff.dat echo 8 [X] Windows Live ID Sign-in Assistant
IF NOT EXIST PB_BOOSTER\gfwloff.dat echo 8 [ ] Windows Live ID Sign-in Assistant
IF EXIST PB_BOOSTER\telephonyoff.dat echo 9 [X] Telephony
IF NOT EXIST PB_BOOSTER\telephonyoff.dat echo 9 [ ] Telephony
IF EXIST PB_BOOSTER\netbiosoff.dat echo 10 [X] TCP/IP NetBIOS Helper
IF NOT EXIST PB_BOOSTER\netbiosoff.dat echo 10 [ ] TCP/IP NetBIOS Helper
IF EXIST PB_BOOSTER\problem_reportsoff.dat echo 11 [X] Problem Reports and Solutions Control Panel Support
IF NOT EXIST PB_BOOSTER\problem_reportsoff.dat echo 11 [ ] Problem Reports and Solutions Control Panel Support
IF EXIST PB_BOOSTER\print_spooleroff.dat echo 12 [X] Print Spooler
IF NOT EXIST PB_BOOSTER\print_spooleroff.dat echo 12 [ ] Print Spooler
IF EXIST PB_BOOSTER\diagnosticoff.dat echo 13 [X] Diagnostic Policy Service
IF NOT EXIST PB_BOOSTER\diagnosticoff.dat echo 13 [ ] Diagnostic Policy Service
IF EXIST PB_BOOSTER\computer_browseroff.dat echo 14 [X] Computer Browser
IF NOT EXIST PB_BOOSTER\computer_browseroff.dat echo 14 [ ] Computer Browser
IF EXIST PB_BOOSTER\com_event_systemoff.dat echo 15 [X] COM+ Event System
IF NOT EXIST PB_BOOSTER\com_event_systemoff.dat echo 15 [ ] COM+ Event System
IF EXIST PB_BOOSTER\bitsoff.dat echo 16 [X] Background Intelligent Transfer Service
IF NOT EXIST PB_BOOSTER\bitsoff.dat echo 16 [ ] Background Intelligent Transfer Service
IF EXIST PB_BOOSTER\program_compatibilityoff.dat echo 17 [X] Program Compatibility Assistant Service
IF NOT EXIST PB_BOOSTER\program_compatibilityoff.dat echo 17 [ ] Program Compatibility Assistant Service
IF EXIST PB_BOOSTER\time_brokeroff.dat echo 18 [X] Time Broker
IF NOT EXIST PB_BOOSTER\time_brokeroff.dat  echo 18 [ ] Time Broker
IF EXIST PB_BOOSTER\data_collectionoff.dat echo 19 [X] Data Collection Publishing Service
IF NOT EXIST PB_BOOSTER\data_collectionoff.dat  echo 19 [ ] Data Collection Publishing Service
echo Digite "Pular" para não fazer alterações.
echo Digite "Pronto" para finalizar.

ECHO.
SET input=badInput
SET /P M=Digite o número do ítem.
IF %M%==1 GOTO :Windows_Updates
IF %M%==2 GOTO :Windows_Defender
IF %M%==3 GOTO :Windows_Backup
IF %M%==4 GOTO :WebClient
IF %M%==5 GOTO :Shell _Hardware_Detection
IF %M%==6 GOTO :Server
IF %M%==7 GOTO :Workstation
IF %M%==8 GOTO :Windows_Live_ID_Sign-in_Assistant
IF %M%==9 GOTO :Telephony
IF %M%==10 GOTO :NetBIOS_Helper
IF %M%==11 GOTO :problem_reports
IF %M%==12 GOTO :print_spooler
IF %M%==13 GOTO :diagnostic
IF %M%==14 GOTO :computer_browser
IF %M%==15 GOTO :com_event_system
IF %M%==16 GOTO :bits
IF %M%==17 GOTO :program_compatibility
IF %M%==18 GOTO :time_broker
IF %M%==19 GOTO :data_collection
IF %M%==Pular goto program
IF %M%==Pronto goto program
echo.
echo %M% é inválido
pause
goto script
:Windows_Updates
IF NOT EXIST PB_BOOSTER\winupdateoff.dat echo > PB_BOOSTER\winupdateoff.dat & goto script
IF EXIST "PB_BOOSTER\winupdateoff.dat" del PB_BOOSTER\winupdateoff.dat & goto script
echo Alguma coisa deu errado.
pause
goto script
:Windows_Defender

IF NOT EXIST PB_BOOSTER\windefenderoff.dat echo > PB_BOOSTER\windefenderoff.dat & goto script
IF EXIST PB_BOOSTER\windefenderoff.dat del PB_BOOSTER\windefenderoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:WebClient
IF NOT EXIST PB_BOOSTER\webclientoff.dat echo > PB_BOOSTER\webclientoff.dat & goto script
IF EXIST "PB_BOOSTER\webclientoff.dat" del PB_BOOSTER\webclientoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:Shell _Hardware_Detection
IF NOT EXIST PB_BOOSTER\shell_hardware_detectionoff.dat echo > PB_BOOSTER\shell_hardware_detectionoff.dat & goto script
IF EXIST "PB_BOOSTER\shell_hardware_detectionoff.dat" del PB_BOOSTER\shell_hardware_detectionoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:Windows_Backup
IF NOT EXIST PB_BOOSTER\winbackupoff.dat echo > PB_BOOSTER\winbackupoff.dat & goto script
IF EXIST "PB_BOOSTER\winbackupoff.dat" del PB_BOOSTER\winbackupoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:Server
IF NOT EXIST PB_BOOSTER\serveroff.dat echo > PB_BOOSTER\serveroff.dat & goto script
IF EXIST "PB_BOOSTER\serveroff.dat" del PB_BOOSTER\serveroff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:Workstation
IF NOT EXIST PB_BOOSTER\workstationoff.dat echo > PB_BOOSTER\workstationoff.dat & goto script
IF EXIST PB_BOOSTER\workstationoff.dat del PB_BOOSTER\workstationoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:Telephony
IF NOT EXIST PB_BOOSTER\telephonyoff.dat echo > PB_BOOSTER\telephonyoff.dat & goto script
IF EXIST "PB_BOOSTER\telephonyoff.dat" del PB_BOOSTER\telephonyoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:Windows_Live_ID_Sign-in_Assistant
IF NOT EXIST PB_BOOSTER\gfwloff.dat echo > PB_BOOSTER\gfwloff.dat & goto script
IF EXIST "PB_BOOSTER\gfwloff.dat" del PB_BOOSTER\gfwloff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:NetBIOS_Helper
IF NOT EXIST PB_BOOSTER\netbiosoff.dat echo > PB_BOOSTER\netbiosoff.dat & goto script
IF EXIST "PB_BOOSTER\netbiosoff.dat" del PB_BOOSTER\netbiosoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:problem_reports
IF NOT EXIST PB_BOOSTER\problem_reportsoff.dat echo > PB_BOOSTER\problem_reportsoff.dat & goto script
IF EXIST "PB_BOOSTER\problem_reportsoff.dat" del PB_BOOSTER\problem_reportsoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:print_spooler
IF NOT EXIST PB_BOOSTER\print_spooleroff.dat echo > PB_BOOSTER\print_spooleroff.dat & goto script
IF EXIST "PB_BOOSTER\print_spooleroff.dat" del PB_BOOSTER\print_spooleroff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:diagnostic
IF NOT EXIST PB_BOOSTER\diagnosticoff.dat echo > PB_BOOSTER\diagnosticoff.dat & goto script
IF EXIST "PB_BOOSTER\diagnosticoff.dat" del PB_BOOSTER\diagnosticoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:computer_browser
IF NOT EXIST PB_BOOSTER\computer_browseroff.dat echo > PB_BOOSTER\computer_browseroff.dat & goto script
IF EXIST "PB_BOOSTER\computer_browseroff.dat" del PB_BOOSTER\computer_browseroff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:com_event_system
IF NOT EXIST PB_BOOSTER\com_event_systemoff.dat echo > PB_BOOSTER\com_event_systemoff.dat & goto script
IF EXIST "PB_BOOSTER\com_event_systemoff.dat" del PB_BOOSTER\com_event_systemoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:bits
IF NOT EXIST PB_BOOSTER\bitsoff.dat echo > PB_BOOSTER\bitsoff.dat & goto script
IF EXIST "PB_BOOSTER\bitsoff.dat" del PB_BOOSTER\bitsoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:time_broker
IF NOT EXIST PB_BOOSTER\time_brokeroff.dat echo > PB_BOOSTER\time_brokeroff.dat & goto script
IF EXIST "PB_BOOSTER\time_brokeroff.dat" del PB_BOOSTER\time_brokeroff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:data_collection
IF NOT EXIST PB_BOOSTER\data_collectionoff.dat echo > PB_BOOSTER\data_collectionoff.dat & goto script
IF EXIST "PB_BOOSTER\data_collectionoff.dat" del PB_BOOSTER\data_collectionoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:program_compatibility
IF NOT EXIST PB_BOOSTER\program_compatibilityoff.dat echo > PB_BOOSTER\program_compatibilityoff.dat & goto script
IF EXIST "PB_BOOSTER\program_compatibilityoff.dat" del PB_BOOSTER\program_compatibilityoff.dat & goto script
echo Alguma coisa deu errado
pause
goto script
:notyetworking
echo Ainda nao implementado
pause
goto script















:program
title                   Parando Programas.
cls
echo Mostrando lista dos programas que podem ser finalizados.
echo.
IF EXIST PB_BOOSTER\dllhost_stopped.dat echo 1 [X] dllhost (usado por alguns softwares)
IF NOT EXIST PB_BOOSTER\dllhost_stopped.dat echo 1 [ ] dllhost (usado por alguns softwares)

IF EXIST PB_BOOSTER\explorer_stopped.dat echo 2 [X] explorer (A interface será reiniciada se você parar isso)
IF NOT EXIST PB_BOOSTER\explorer_stopped.dat echo 2 [ ] explorer (A interface será reiniciada se você parar isso)

IF EXIST PB_BOOSTER\firefox_stopped.dat echo 3 [X] firefox (Navegador)
IF NOT EXIST PB_BOOSTER\firefox_stopped.dat echo 3 [ ] firefox ( Navegador )

IF EXIST PB_BOOSTER\chrome_stopped.dat echo 4 [X] chrome (Navegador)
IF NOT EXIST PB_BOOSTER\chrome_stopped.dat echo 4 [ ] chrome (Navegador)

IF EXIST PB_BOOSTER\GWX_stopped.dat echo 5 [X] GWX (Atualizacao Windows 10)
IF NOT EXIST PB_BOOSTER\GWX_stopped.dat echo 5 [ ] GWX (Atualizacao Windows 10)

IF EXIST PB_BOOSTER\LiveUpdate_stopped.dat echo 6 [X] LiveUpdate (Iobit updater)
IF NOT EXIST PB_BOOSTER\LiveUpdate_stopped.dat echo 6 [ ] LiveUpdate (Iobit updater)


IF EXIST PB_BOOSTER\Monitor_stopped.dat echo 7 [X] Monitor (Iobit system Monitor)
IF NOT EXIST PB_BOOSTER\Monitor_stopped.dat echo 7 [ ] Monitor (Iobit system Monitor)

IF EXIST PB_BOOSTER\PhotosApp_stopped.dat echo 8 [X] PhotosApp (Visualizador de fotos do Windows 8)
IF NOT EXIST PB_BOOSTER\PhotosApp_stopped.dat echo 8 [ ] PhotosApp (Visualizador de fotos do Windows 8)

IF EXIST PB_BOOSTER\SkyDrive_stopped.dat echo 9 [X] SkyDrive (Servicos de dados online da Microsoft)
IF NOT EXIST PB_BOOSTER\SkyDrive_stopped.dat echo 9 [ ] SkyDrive (Servicos de dados online da Microsoft)

IF EXIST PB_BOOSTER\UninstallMonitor_stopped.dat echo 10 [X] UninstallMonitor (iobit uninstaller)
IF NOT EXIST PB_BOOSTER\UninstallMonitor_stopped.dat echo 10 [ ] UninstallMonitor (iobit uninstaller)

IF EXIST PB_BOOSTER\WWAHost_stopped.dat echo 11 [X] WWAHost (Xbox Music do Windows 8.1)
IF NOT EXIST PB_BOOSTER\WWAHost_stopped.dat echo 11 [ ] WWAHost (Xbox Music do Windows 8.1)

IF EXIST PB_BOOSTER\AppleMobileDeviceService_stopped.dat echo 12 [X] AppleMobileDeviceService (Usado pelo iTunes)
IF NOT EXIST PB_BOOSTER\AppleMobileDeviceService_stopped.dat echo 12 [ ] AppleMobileDeviceService (Usado pelo iTunes)

IF EXIST PB_BOOSTER\mDNSResponder_stopped.dat echo 13 [X] mDNSResponder (Usado pelo iTunes)
IF NOT EXIST PB_BOOSTER\mDNSResponder_stopped.dat echo 13 [ ] mDNSResponder (Usado pelo iTunes)

IF EXIST PB_BOOSTER\OneDrive_stopped.dat echo 14 [X] OneDrive (Servicos de dados online da Microsoft)
IF NOT EXIST PB_BOOSTER\OneDrive_stopped.dat echo 14 [ ] OneDrive (Servicos de dados online da Microsoft)

IF EXIST PB_BOOSTER\speechRuntime_stopped.dat echo 15 [X] speechRuntime (Usado pela Cortana)
IF NOT EXIST PB_BOOSTER\speechRuntime_stopped.dat echo 15 [ ] speechRuntime (Usado pela Cortana)

IF EXIST PB_BOOSTER\CortanaDssServer_stopped.dat echo 16 [X] CortanaDssServer (Usado pela Cortana)
IF NOT EXIST PB_BOOSTER\CortanaDssServer_stopped.dat echo 16 [ ] CortanaDssServer (Usado pela Cortana)


IF EXIST PB_BOOSTER\skype_stopped.dat echo 17 [X] skype (Skype)
IF NOT EXIST PB_BOOSTER\skype_stopped.dat echo 17 [ ] skype (Skype)
echo Digite "Voltar" para voltar para os serviços.
echo Digite "Pronto" quando estiver pronto.
echo Digite "Pular" para pular.
ECHO.
SET input=badInput
SET /P M=Digite o número de um ítem: 
IF %M%==1 GOTO :dllhost_stopped
IF %M%==2 GOTO :explorer_stopped
IF %M%==3 GOTO :firefox_stopped
IF %M%==4 GOTO :chrome_stopped
IF %M%==5 GOTO :gwxstopped
IF %M%==6 GOTO :LiveUpdate_stopped
IF %M%==7 GOTO :Monitor_stopped
IF %M%==8 GOTO :PhotosApp_stopped
IF %M%==9 GOTO :SkyDrive_stopped
IF %M%==10 GOTO :UninstallMonitor_stopped
IF %M%==11 GOTO :WWAHost_stopped
IF %M%==12 GOTO :AppleMobileDeviceService_stopped
IF %M%==13 GOTO :mDNSResponder_stopped
IF %M%==14 GOTO :OneDrive_stopped
IF %M%==15 GOTO :speechRuntime_stopped
IF %M%==16 GOTO :CortanaDssServer_stopped
IF %M%==17 GOTO :skype_stopped
IF %M%==Voltar goto script
IF %M%==Pronto goto new_stop
IF %M%==Pular goto new_stop
echo.
echo %M% é inválido.
pause
goto program

:dllhost_stopped
IF NOT EXIST PB_BOOSTER\dllhost_stopped.dat echo > PB_BOOSTER\dllhost_stopped.dat & goto program
IF EXIST PB_BOOSTER\dllhost_stopped.dat del PB_BOOSTER\dllhost_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:explorer_stopped
IF NOT EXIST PB_BOOSTER\explorer_stopped.dat echo > PB_BOOSTER\explorer_stopped.dat & goto program
IF EXIST PB_BOOSTER\explorer_stopped.dat del PB_BOOSTER\explorer_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:firefox_stopped
IF NOT EXIST PB_BOOSTER\firefox_stopped.dat echo > PB_BOOSTER\firefox_stopped.dat & goto program
IF EXIST PB_BOOSTER\firefox_stopped.dat del PB_BOOSTER\firefox_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:chrome_stopped
IF NOT EXIST PB_BOOSTER\chrome_stopped.dat echo > PB_BOOSTER\chrome_stopped.dat & goto program
IF EXIST PB_BOOSTER\chrome_stopped.dat del PB_BOOSTER\chrome_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program

:LiveUpdate_stopped
IF NOT EXIST PB_BOOSTER\LiveUpdate_stopped.dat echo > PB_BOOSTER\LiveUpdate_stopped.dat & goto program
IF EXIST PB_BOOSTER\LiveUpdate_stopped.dat del PB_BOOSTER\LiveUpdate_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:Monitor_stopped
IF NOT EXIST PB_BOOSTER\Monitor_stopped.dat echo > PB_BOOSTER\Monitor_stopped.dat & goto program
IF EXIST PB_BOOSTER\Monitor_stopped.dat del PB_BOOSTER\Monitor_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program

:UninstallMonitor_stopped
IF NOT EXIST PB_BOOSTER\UninstallMonitor_stopped.dat echo > PB_BOOSTER\UninstallMonitor_stopped.dat & goto program
IF EXIST PB_BOOSTER\UninstallMonitor_stopped.dat del PB_BOOSTER\UninstallMonitor_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:WWAHost_stopped
IF NOT EXIST PB_BOOSTER\WWAHost_stopped.dat echo > PB_BOOSTER\WWAHost_stopped.dat & goto program
IF EXIST PB_BOOSTER\WWAHost_stopped.dat del PB_BOOSTER\WWAHost_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:AppleMobileDeviceService_stopped
IF NOT EXIST PB_BOOSTER\AppleMobileDeviceService_stopped.dat echo > PB_BOOSTER\AppleMobileDeviceService_stopped.dat & goto program
IF EXIST PB_BOOSTER\AppleMobileDeviceService_stopped.dat del PB_BOOSTER\AppleMobileDeviceService_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:mDNSResponder_stopped
IF NOT EXIST PB_BOOSTER\mDNSResponder_stopped.dat echo > PB_BOOSTER\mDNSResponder_stopped.dat & goto program
IF EXIST PB_BOOSTER\mDNSResponder_stopped.dat del PB_BOOSTER\mDNSResponder_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:OneDrive_stopped
 IF NOT EXIST PB_BOOSTER\OneDrive_stopped.dat echo > PB_BOOSTER\OneDrive_stopped.dat & goto program
IF EXIST PB_BOOSTER\OneDrive_stopped.dat del PB_BOOSTER\OneDrive_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:speechRuntime_stopped
IF NOT EXIST PB_BOOSTER\speechRuntime_stopped.dat echo > PB_BOOSTER\speechRuntime_stopped.dat & goto program
IF EXIST PB_BOOSTER\speechRuntime_stopped.dat del PB_BOOSTER\speechRuntime_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:CortanaDssServer_stopped
IF NOT EXIST PB_BOOSTER\CortanaDssServer_stopped.dat echo > PB_BOOSTER\CortanaDssServer_stopped.dat & goto program
IF EXIST PB_BOOSTER\CortanaDssServer_stopped.dat del PB_BOOSTER\CortanaDssServer_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:skype_stopped
IF NOT EXIST PB_BOOSTER\skype_stopped.dat echo > PB_BOOSTER\skype_stopped.dat & goto program
IF EXIST PB_BOOSTER\skype_stopped.dat del PB_BOOSTER\skype_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:gwxstopped
IF NOT EXIST PB_BOOSTER\GWX_stopped.dat echo > PB_BOOSTER\GWX_stopped.dat & goto program
IF EXIST PB_BOOSTER\GWX_stopped.dat del PB_BOOSTER\GWX_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:PhotosApp_stopped
IF NOT EXIST PB_BOOSTER\PhotosApp_stopped.dat echo > PB_BOOSTER\PhotosApp_stopped.dat & goto program
IF EXIST PB_BOOSTER\PhotosApp_stopped.dat del PB_BOOSTER\PhotosApp_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
:SkyDrive_stopped
IF NOT EXIST PB_BOOSTER\SkyDrive_stopped.dat echo > PB_BOOSTER\SkyDrive_stopped.dat & goto program
IF EXIST PB_BOOSTER\SkyDrive_stopped.dat del PB_BOOSTER\SkyDrive_stopped.dat & goto program
echo Alguma coisa deu errado
pause
goto program
goto new_stop





:new_stop

IF NOT EXIST PB_BOOSTER\use_user_controled_services.dat goto GAME
goto GAME



:GAME
echo. > PB_BOOSTER\stop_script_worked.dat
title Parando programas e serviços selecionados
cls
IF EXIST "PB_BOOSTER\winupdateoff.dat" net stop wuauserv /y
IF EXIST PB_BOOSTER\windefenderoff.dat net stop WinDefend /y
IF EXIST "PB_BOOSTER\webclientoff.dat" net stop WebClient /y
IF EXIST "PB_BOOSTER\shell_hardware_detectionoff.dat" net stop ShellHWDetection /y
IF EXIST "PB_BOOSTER\winbackupoff.dat" net stop SDRSVC /y
IF EXIST "PB_BOOSTER\serveroff.dat" net stop LanmanServer /y
IF EXIST PB_BOOSTER\workstationoff.dat  net stop LanmanWorkstation /y
IF EXIST "PB_BOOSTER\telephonyoff.dat" net stop TapiSrv /y
IF EXIST "PB_BOOSTER\gfwloff.dat" net stop wlidsvc /y
IF EXIST "PB_BOOSTER\netbiosoff.dat" net stop lmhosts /y
IF EXIST "PB_BOOSTER\problem_reportsoff.dat" net stop wercplsupport /y
IF EXIST "PB_BOOSTER\print_spooleroff.dat" net stop Spooler /y
IF EXIST "PB_BOOSTER\diagnosticoff.dat" net stop DPS /y
IF EXIST "PB_BOOSTER\computer_browseroff.dat" net stop Browser /y
IF EXIST "PB_BOOSTER\com_event_systemoff.dat" net stop EventSystem /y
IF EXIST "PB_BOOSTER\time_brokeroff.dat" net stop TimeBroker /y
IF EXIST "PB_BOOSTER\program_compatibilityoff.dat" net stop PcaSvc /y
IF EXIST "PB_BOOSTER\bitsoff.dat" net stop BITS /y
IF EXIST "PB_BOOSTER\winupdateoff.dat" net stop wuauserv /y

IF EXIST PB_BOOSTER\dllhost_stopped.dat Taskkill /IM dllhost.exe /F



IF EXIST PB_BOOSTER\firefox_stopped.dat Taskkill /IM firefox.exe /F

IF EXIST PB_BOOSTER\chrome_stopped.dat Taskkill /IM chrome.exe /F

IF EXIST PB_BOOSTER\GWX_stopped.dat Taskkill /IM GWX.exe /F

IF EXIST PB_BOOSTER\LiveUpdate_stopped.dat Taskkill /IM LiveUpdate.exe /F

IF EXIST PB_BOOSTER\Monitor_stopped.dat Taskkill /IM Monitor.exe /F

IF EXIST PB_BOOSTER\PhotosApp_stopped.dat Taskkill /IM PhotosApp.exe /F

IF EXIST PB_BOOSTER\SkyDrive_stopped.dat Taskkill /IM SkyDrive.exe /F

IF EXIST PB_BOOSTER\UninstallMonitor_stopped.dat Taskkill /IM UninstallMonitor.exe /F

IF EXIST PB_BOOSTER\WWAHost_stopped.dat Taskkill /IM WWAHost.exe /F

IF EXIST PB_BOOSTER\AppleMobileDeviceService_stopped.dat Taskkill /IM AppleMobileDeviceService.exe /F

IF EXIST PB_BOOSTER\mDNSResponder_stopped.dat Taskkill /IM mDNSResponder.exe /F

IF EXIST PB_BOOSTER\OneDrive_stopped.dat Taskkill /IM OneDrive.exe /F

IF EXIST PB_BOOSTER\speechRuntime_stopped.dat Taskkill /IM speechRuntime.exe /F

IF EXIST PB_BOOSTER\CortanaDssServer_stopped.dat Taskkill /IM CortanaDssServer.exe /F

IF EXIST PB_BOOSTER\skype_stopped.dat Taskkill /IM skype.exe /F

:Startup

@echo off
tasklist /FI "IMAGENAME eq PointBlank.exe" | findstr "PointBlank.exe" >nul
if %ERRORLEVEL% == 0 goto Detectado
timeout 20
@echo Aguardando início do jogo...
goto Startup

:Detectado
IF EXIST "PB_BOOSTER\pb_padrao.dat" goto Startup2
Echo Definindo prioridade do jogo...
IF EXIST "PB_BOOSTER\PB_alta.dat" wmic process where name="PointBlank.exe" CALL setpriority "high priority"
IF EXIST "PB_BOOSTER\PB_media.dat" wmic process where name="PointBlank.exe" CALL setpriority "above normal"
IF EXIST "PB_BOOSTER\PB_normal.dat" wmic process where name="PointBlank.exe" CALL setpriority "normal"
IF EXIST PB_BOOSTER\explorer_stopped.dat Taskkill /IM explorer.exe /F
goto Startup2


:startup2
color 4f
timeout 20
cls
echo Deixe essa janela aberta !

:Loop
tasklist | find /i "PointBlank.exe" >nul 2>&1
IF ERRORLEVEL 1 (
  GOTO Restart
) ELSE (
  ECHO Verificando se o PointBlank está aberto...
  Timeout /T 11 /Nobreak
  cls
  GOTO LOOP
)

:Restart
color 9f
echo O jogo foi fechado.
echo Revertendo todas as alterações.
timeout 10
goto desktop


:desktop
title Saindo do Point Blank Optimizer.
IF EXIST PB_BOOSTER\user_config.dat goto all_in_one2
timeout 2
exit
:exit_tool
exit

:all_in_one2
title Restaurando alterações.
cls
IF EXIST "PB_BOOSTER\winupdateoff.dat" net start wuauserv /y
IF EXIST PB_BOOSTER\windefenderoff.dat net start WinDefend /y
IF EXIST "PB_BOOSTER\webclientoff.dat" net start WebClient /y
IF EXIST "PB_BOOSTER\shell_hardware_detectionoff.dat" net start ShellHWDetection /y
IF EXIST "PB_BOOSTER\winbackupoff.dat" net start SDRSVC /y
IF EXIST "PB_BOOSTER\serveroff.dat" net start LanmanServer /y
IF EXIST PB_BOOSTER\workstationoff.dat  net start LanmanWorkstation /y
IF EXIST "PB_BOOSTER\telephonyoff.dat" net start TapiSrv /y
IF EXIST "PB_BOOSTER\gfwloff.dat" net start wlidsvc /y
IF EXIST "PB_BOOSTER\netbiosoff.dat" net start lmhosts /y
IF EXIST "PB_BOOSTER\problem_reportsoff.dat" net start wercplsupport /y
IF EXIST "PB_BOOSTER\print_spooleroff.dat" net start Spooler /y
IF EXIST "PB_BOOSTER\diagnosticoff.dat" net start DPS /y
IF EXIST "PB_BOOSTER\computer_browseroff.dat" net start Browser /y
IF EXIST "PB_BOOSTER\com_event_systemoff.dat" net start EventSystem /y
IF EXIST "PB_BOOSTER\time_brokeroff.dat" net start TimeBroker /y
IF EXIST "PB_BOOSTER\program_compatibilityoff.dat" net start PcaSvc /y
IF EXIST "PB_BOOSTER\bitsoff.dat" net start BITS /y
IF EXIST "PB_BOOSTER\winupdateoff.dat" net start wuauserv /y
IF EXIST PB_BOOSTER\explorer_stopped.dat start explorer.exe
timeout 3
cls
echo Pronto.
echo Se você tiver problemas ao fim do uso dessa ferramenta, reinicie seu PC.
echo Caso tenha sugestões ou problemas, contate "Caillou" em BRCheats.net.br
timeout 5

start https://BRCheats.net.br
exit


:: Aprende como faz ai Hoax
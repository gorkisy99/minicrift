@ if " %DEBUG% "  ==  " "  @ echo  off
@ rem ############################################# #########################
@ rem
@ rem   Script de inicio de Gradle para Windows
@ rem
@ rem ############################################# #########################

@ rem Establece el ámbito local para las variables con el shell de Windows NT
si  " %OS% " == " Windows_NT "  setlocal

establecer  DIRNAME = %~dp0
si  " %DIRNAME% "  ==  " "  establezca  DIRNAME = .
establecer  APP_BASE_NAME = %~n0
establecer  APP_HOME = %DIRNAME%

@ rem Agregue opciones de JVM predeterminadas aquí. También puede usar JAVA_OPTS y GRADLE_OPTS para pasar opciones de JVM a este script.
establecer  DEFAULT_JVM_OPTS =

@ rem Encuentra java.exe
si está  definido JAVA_HOME ir a findJavaFromJavaHome

establecer  JAVA_EXE = java.exe
%JAVA_EXE% -versión > NUL  2 >& 1
if  " %ERRORLEVEL% "  ==  " 0 "  ir a inicio

eco _
echo ERROR: JAVA_HOME no está configurado y no se pudo encontrar ningún comando 'java' en su RUTA.
eco _
echo Establezca la variable JAVA_HOME en su entorno para que coincida con la
ubicación de eco de su instalación de Java.

ir a fallar

: findJavaFromJavaHome
establecer  JAVA_HOME = %JAVA_HOME: " =%
establezca  JAVA_EXE = %JAVA_HOME% /bin/java.exe

si  existe  " %JAVA_EXE%  " ir a inicializar

eco _
echo ERROR: JAVA_HOME está configurado en un directorio no válido: %JAVA_HOME%
eco _
echo Establezca la variable JAVA_HOME en su entorno para que coincida con la
ubicación de eco de su instalación de Java.

ir a fallar

: inicio
@ rem Obtener argumentos de línea de comandos, manejo de variantes de Windows

si  no es  " %OS% "  ==  " Windows_NT "  vaya a win9xME_args

: win9xME_args
@ rem Slurp los argumentos de la línea de comandos.
establecer  CMD_LINE_ARGS =
establecer  _SALTO = 2

: win9xME_args_slurp
if  " x %~1 "  ==  " x "  ir a ejecutar

establecer  CMD_LINE_ARGS = %*

: ejecutar
@ rem Configurar la línea de comando

establecer  CLASSPATH = %APP_HOME% \gradle\wrapper\gradle-wrapper.jar

@ rem Ejecutar Gradle
" %JAVA_EXE% "  %DEFAULT_JVM_OPTS%  %JAVA_OPTS%  %GRADLE_OPTS%  " -Dorg.gradle.appname= %APP_BASE_NAME% " -classpath " %CLASSPATH% " org.gradle.wrapper.GradleWrapperMain %CMD_LINE_ARGS%

: fin
@ rem Fin del ámbito local para las variables con shell de Windows NT
if  " %ERRORLEVEL% " == " 0 "  ir a mainEnd

: fallar
rem Establezca la variable GRADLE_EXIT_CONSOLE si necesita el código de retorno _script_ en lugar de
¡remueve el código de retorno _cmd.exe /c_!
si   no  " "  ==  " %GRADLE_EXIT_CONSOLE% "  salir  1
salir /b 1

: finprincipal
si  " %OS% " == " Windows_NT "  endlocal

: Omega

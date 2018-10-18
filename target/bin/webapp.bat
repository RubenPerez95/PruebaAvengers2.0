@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\springframework\spring-context\3.1.1.RELEASE\spring-context-3.1.1.RELEASE.jar;"%REPO%"\org\springframework\spring-aop\3.1.1.RELEASE\spring-aop-3.1.1.RELEASE.jar;"%REPO%"\aopalliance\aopalliance\1.0\aopalliance-1.0.jar;"%REPO%"\org\springframework\spring-beans\3.1.1.RELEASE\spring-beans-3.1.1.RELEASE.jar;"%REPO%"\org\springframework\spring-core\3.1.1.RELEASE\spring-core-3.1.1.RELEASE.jar;"%REPO%"\org\springframework\spring-expression\3.1.1.RELEASE\spring-expression-3.1.1.RELEASE.jar;"%REPO%"\org\springframework\spring-asm\3.1.1.RELEASE\spring-asm-3.1.1.RELEASE.jar;"%REPO%"\org\springframework\spring-webmvc\3.1.1.RELEASE\spring-webmvc-3.1.1.RELEASE.jar;"%REPO%"\org\springframework\spring-context-support\3.1.1.RELEASE\spring-context-support-3.1.1.RELEASE.jar;"%REPO%"\org\springframework\spring-web\3.1.1.RELEASE\spring-web-3.1.1.RELEASE.jar;"%REPO%"\org\aspectj\aspectjrt\1.6.10\aspectjrt-1.6.10.jar;"%REPO%"\org\slf4j\slf4j-api\1.6.6\slf4j-api-1.6.6.jar;"%REPO%"\org\slf4j\jcl-over-slf4j\1.6.6\jcl-over-slf4j-1.6.6.jar;"%REPO%"\org\slf4j\slf4j-log4j12\1.6.6\slf4j-log4j12-1.6.6.jar;"%REPO%"\log4j\log4j\1.2.15\log4j-1.2.15.jar;"%REPO%"\javax\inject\javax.inject\1\javax.inject-1.jar;"%REPO%"\javax\servlet\jstl\1.2\jstl-1.2.jar;"%REPO%"\org\seleniumhq\selenium\selenium-java\3.14.0\selenium-java-3.14.0.jar;"%REPO%"\org\seleniumhq\selenium\selenium-api\3.14.0\selenium-api-3.14.0.jar;"%REPO%"\org\seleniumhq\selenium\selenium-chrome-driver\3.14.0\selenium-chrome-driver-3.14.0.jar;"%REPO%"\org\seleniumhq\selenium\selenium-edge-driver\3.14.0\selenium-edge-driver-3.14.0.jar;"%REPO%"\org\seleniumhq\selenium\selenium-firefox-driver\3.14.0\selenium-firefox-driver-3.14.0.jar;"%REPO%"\org\seleniumhq\selenium\selenium-ie-driver\3.14.0\selenium-ie-driver-3.14.0.jar;"%REPO%"\org\seleniumhq\selenium\selenium-opera-driver\3.14.0\selenium-opera-driver-3.14.0.jar;"%REPO%"\org\seleniumhq\selenium\selenium-remote-driver\3.14.0\selenium-remote-driver-3.14.0.jar;"%REPO%"\org\seleniumhq\selenium\selenium-safari-driver\3.14.0\selenium-safari-driver-3.14.0.jar;"%REPO%"\org\seleniumhq\selenium\selenium-support\3.14.0\selenium-support-3.14.0.jar;"%REPO%"\net\bytebuddy\byte-buddy\1.8.15\byte-buddy-1.8.15.jar;"%REPO%"\org\apache\commons\commons-exec\1.3\commons-exec-1.3.jar;"%REPO%"\commons-codec\commons-codec\1.10\commons-codec-1.10.jar;"%REPO%"\commons-logging\commons-logging\1.2\commons-logging-1.2.jar;"%REPO%"\com\google\guava\guava\25.0-jre\guava-25.0-jre.jar;"%REPO%"\com\google\code\findbugs\jsr305\1.3.9\jsr305-1.3.9.jar;"%REPO%"\org\checkerframework\checker-compat-qual\2.0.0\checker-compat-qual-2.0.0.jar;"%REPO%"\com\google\errorprone\error_prone_annotations\2.1.3\error_prone_annotations-2.1.3.jar;"%REPO%"\com\google\j2objc\j2objc-annotations\1.1\j2objc-annotations-1.1.jar;"%REPO%"\org\codehaus\mojo\animal-sniffer-annotations\1.14\animal-sniffer-annotations-1.14.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.5.5\httpclient-4.5.5.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.4.9\httpcore-4.4.9.jar;"%REPO%"\com\squareup\okhttp3\okhttp\3.10.0\okhttp-3.10.0.jar;"%REPO%"\com\squareup\okio\okio\1.14.1\okio-1.14.1.jar;"%REPO%"\io\cucumber\cucumber-java\4.0.0\cucumber-java-4.0.0.jar;"%REPO%"\io\cucumber\cucumber-core\4.0.0\cucumber-core-4.0.0.jar;"%REPO%"\io\cucumber\cucumber-html\0.2.7\cucumber-html-0.2.7.jar;"%REPO%"\io\cucumber\gherkin\5.1.0\gherkin-5.1.0.jar;"%REPO%"\io\cucumber\tag-expressions\1.1.1\tag-expressions-1.1.1.jar;"%REPO%"\io\cucumber\cucumber-expressions\6.1.0\cucumber-expressions-6.1.0.jar;"%REPO%"\io\cucumber\datatable\1.1.3\datatable-1.1.3.jar;"%REPO%"\io\cucumber\datatable-dependencies\1.1.3\datatable-dependencies-1.1.3.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.5.23\tomcat-embed-core-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-annotations-api\8.5.23\tomcat-annotations-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\8.5.23\tomcat-embed-jasper-8.5.23.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.5.23\tomcat-embed-el-8.5.23.jar;"%REPO%"\org\eclipse\jdt\ecj\3.12.3\ecj-3.12.3.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\8.5.23\tomcat-jasper-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-servlet-api\8.5.23\tomcat-servlet-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\8.5.23\tomcat-juli-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\8.5.23\tomcat-el-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-api\8.5.23\tomcat-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-util-scan\8.5.23\tomcat-util-scan-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-util\8.5.23\tomcat-util-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\8.5.23\tomcat-jasper-el-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\8.5.23\tomcat-jsp-api-8.5.23.jar;"%REPO%"\com\prueba\avengers\1.0.0-BUILD-SNAPSHOT\avengers-1.0.0-BUILD-SNAPSHOT.jar

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS%  -classpath %CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" launch.Main %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%

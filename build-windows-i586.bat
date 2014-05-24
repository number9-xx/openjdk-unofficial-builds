@echo off

rem unset variables
set LD_LIBRARY_PATH=
set CLASSPATH=
set JAVA_HOME=

rem shortcuts from script directory
set BAD_SLASH_SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%BAD_SLASH_SCRIPT_DIR:\=/%
set UTILS_DIR=%SCRIPT_DIR%utils
set LIBS_DIR=%SCRIPT_DIR%libs
set VS=%UTILS_DIR%/winsdk71/vs2010e
set WINSDK=%UTILS_DIR%/winsdk71/sdk

rem utils in path
set MAKE_HOME=%UTILS_DIR%/make
set PATH_PREPEND=%UTILS_DIR%/path_prepend
set CYGWIN_HOME=%UTILS_DIR%/cygwin
set BOOTJDK_HOME=%SCRIPT_DIR%/../jdk7
set ANT_HOME=%UTILS_DIR%/ant

rem ALT_* varibles
set ALT_BOOTDIR=%BOOTJDK_HOME%
set ALT_COMPILER_PATH=%VS%/VC/Bin
set ALT_WINDOWSSDKDIR=%WINSDK%
set ALT_FREETYPE_LIB_PATH=%LIBS_DIR%/freetype/dist/7_32
set ALT_FREETYPE_HEADERS_PATH=%LIBS_DIR%/freetype/include
set ALT_MSVCRNN_DLL_PATH=%LIBS_DIR%/msvcr/7_32
set ALT_DXSDK_PATH=%LIBS_DIR%/directx
set ALT_CACERTS_FILE=%LIBS_DIR%/cacerts/cacerts

rem other openjdk variables
set UNLIMITED_CRYPTO=true
set MILESTONE=u55-unofficial
set BUILD_NUMBER=b31
set FULL_DEBUG_SYMBOLS=0
set NO_DOCS=true

rem other variables
set CYGWIN=nodosfilewarning

rem set compiler environment manually
set WINDOWSSDKDIR=%WINSDK%
set VS100COMNTOOLS=%VS%/Common7/Tools
set Configuration=Release
set WindowsSDKVersionOverride=v7.1
set ToolsVersion=4.0
set TARGET_CPU=x86
set CURRENT_CPU=x86
set PlatformToolset=Windows7.1SDK
set TARGET_PLATFORM=XP
set LIB=%VS%/VC/Lib;%WINSDK%/Lib
set LIBPATH=%VS%/VC/Lib
set PATH=%PATH_PREPEND%;%VS%/Common7/IDE;%VS%/Common7/Tools;%VS%/VC/Bin;%VS%/VC/Bin/VCPackages;%WINSDK%/Bin;C:/WINDOWS/system32;C:/WINDOWS;C:/WINDOWS/System32/Wbem;%MAKE_HOME%;%CYGWIN_HOME%/bin;%BOOTJDK_HOME%/bin;%ANT_HOME%/bin;%LIBS_DIR%/msvcr/7_32
set INCLUDE=%VS%/VC/INCLUDE;%WINSDK%/INCLUDE;%WINSDK%/INCLUDE/gl;

rem uncomment next lines for interactive build
rem echo OpenJDK build environment is ready
rem echo To start build go to sources root and type "make" 
rem echo JDK binaries will be placed into "<sources_root>\build\windows-i585\j2sdk-image"
rem bash
rem echo Press any key to close window ...
rem pause > nul

rem start obf build
bash %SCRIPT_DIR%/make-and-bundle.sh -f

rem debug build settings
rem set FULL_DEBUG_SYMBOLS=1
rem set DEBUG_CLASSFILES=true
rem set ALT_OUTPUTDIR=%SCRIPT_DIR%/../openjdk/build.debug/windows-i586/

rem bash %SCRIPT_DIR%/make-and-bundle.sh -d -f

::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAlbSBzTAES0A5EO4f7+09qSrl0UQN4deZvY0oScL+oW6VH3SbAk2n9lqs4vMD5gWy6ibQA6ulJLtWuLec6fvG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJkZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlHMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIWIRdRDDaHHws=
::eg0/rx1wNQPfEVWB+kM9LVsJDAKLMG6FFLAf+u36++OIrC0=
::fBEirQZwNQPfEVWB+kM9LVsJDCKLMG76NLA/+u36++OIrC0=
::cRolqwZ3JBvQF1fEqQIRaAtGQwOQPWb6Erpc7eno4/PHoUUcWuU6OIHa17GdYOEd7gXhbYIo2GlTl8UfTBRePhSiYgon6A4=
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFAlbSBzTAES0A5EO4f7+09qSrl0UQN4deZvY0oScL+oW6VH3SbAk2n9lqs4vMD5gWy6NZwMxllxHlSqAL8L8
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title File ReC
color 0a

::checking for Log file
:logcheck
cls
if exist FrcLog.log goto logincheck0
if not exist FrcLog.log goto createlog

::Createing .log file
:createlog
cls
echo [LOG] Log.ExistCheck_exi:False >FrcLog.log
echo [LOG] Created Log at %time%, %date% >>FrcLog.log
goto logincheck0


::checking do data file exist
:logincheck0
cls
echo [LOG] Log.ExistCheck_exi:True >>FrcLog.log
echo [STARTUP] LoginCheck-0_checking >>FrcLog.log
if exist DevLogin.frc goto checkdevlog0
if not exist DevLogin.frc goto logincheck1

:logincheck1
cls
echo [STARTUP] LoginCheck-1_checking >>FrcLog.log
if exist Frc_Data goto login0
if not exist Frc_Data goto register_frec




::Checking if "DevLogin.frc" exist in the current folder
:checkdevlog0
echo [STARTUP] DevCheck-0_LoadingContent >>FrcLog.log
echo [STARTUP] DevCheck-0_ContentCheck0 >>FrcLog.log
cls
(
set /p dl_info1=
set /p dl_info2=
set /p dl_info3=
)<DevLogin.frc
if %dl_info1%==--DevLogin$ goto checkdevlog1
if not %dl_info1%==--DevLogin$ goto fakeDL

:checkdevlog1
echo [STARTUP] DevCheck-1_ContentCheck2 >>FrcLog.log
if %dl_info2%==-userInstant- goto checkdevlog2
if not %dl_info2%==-userInstant- goto fakeDL

:checkdevlog2
echo [STARTUP] DevCheck-2_ContentCheck3 >>FrcLog.log
if %dl_info3%==-passInstant- goto main_frc
if not %dl_info3%==--DevLogin$ goto fakeDL

:fakeDL
cls
echo [WARNING] IncContent-DevLogin.frc_FakeDL >>FrcLog.log
echo Incorrect Content of DevLogin File
timeout 5 >nul
exit

:dlfc
cls
echo [INFO] Created=DevLogin >>FrcLog.log
(
echo --DevLogin$
echo -userInstant-
echo -passInstant-
)>DevLogin.frc
cls
goto main_frc




::Registering Part
:register_frec
cls
echo [REGISTRATION] MailInput >>FrcLog.log
echo Register Into FReC
echo.
echo Insert Your Email
set /p "frec_rmail=Email: "
echo %frec_rmail% >Frc_Data
echo [REGISTRATION] Mail.%frec_rmail%_Registered >>FrcLog.log
cls
echo [REGISTRATION] PasswordInput >>FrcLog.log
echo Create Password (Custom Password)
echo.
set /p "frec_rpass=Password: "
echo %frec_rpass% >>Frc_Data
echo [REGISTRATION] Password.%frec_rpass%_Registered >>FrcLog.log
cls
echo [REGISTRATION] UsernameInput >>FrcLog.log
echo Create Your Username (DO NOT USE SPACES)
echo.
set /p "frec_ruser=Username: "
echo %frec_ruser% >>Frc_Data
echo [REGISTRATION] Username.%frec_ruser%_Registered >>FrcLog.log
cls
echo [REGISTRATION] AccountCreated=%date%--%time% >>FrcLog.log
echo Your Account Has Been Created
echo Please do not delete file 'Frc_Data'
echo.
echo You Have Been Sign In.
echo.
pause
goto main_frc 

:login0
cls
echo [LOGIN] Login.LoadingFileContent >>FrcLog.log
(
set /p frec_rmail=
set /p frec_rpass=
set /p frec_ruser=
)<Frc_Data
goto login1 

:login1
cls
echo [LOGIN] LogingIn.Unfinished_Username >>FrcLog.log
echo Login Into Your Account
echo.
echo Username:
set /p "frec_luser=>> "
if %frec_luser%==%frec_ruser% goto sl_npass
if not %frec_luser%==%frec_ruser% goto inc_lop 

:sl_npass
echo [LOGIN] Login.Unfinished_Password >>FrcLog.log
echo.
echo Password:
set /p "frec_lpass=>> "
if %frec_lpass%==%frec_rpass% goto main_frc && echo [LOGIN] Login.Finished_All >>FrcLog.log
if not %frec_lpass%==%frec_rpass% goto inc_lop 






::Incorrect Username or Password
:inc_lop
cls
echo [LOGIN] Login.Failed_INCLOP >>FrcLog.log
echo Incorrect Username or Password
echo Please try again
timeout 3 >nul
goto login1 






::Main Menu
:main_frc
echo [INFO] UI.Menu_Opened >>FrcLog.log
cls
echo #== Select An Option ==#
echo.
echo [ 1 ] Change Extension of a File
echo [ 2 ] Change Name of a File
echo.
echo [ 3 ] Info
if exist DevLogin.frc echo [ 4 ] DevNotes
echo.
set /p "frec_mo=Option: "
if %frec_mo%==1 goto chng_ext
if %frec_mo%==2 goto chng_nm
if %frec_mo%==3 goto info 
if %frec_mo%==4 goto devnotes
if %frec_mo%==dlfc goto dlfc
if not %frec_mo%==1 goto main_frc
if not %frec_mo%==2 goto main_frc
if not %frec_mo%==3 goto main_frc
if not %frec_mo%==4 goto main_frc




:devnotes
echo [INFO] UI.DevNotes_Opened >>FrcLog.log
cls
if not exist DevLogin.frc echo This Option is Unavaible && timeout 3 >nul && goto main_frc
if exist DevLogin.frc echo.
if exist DevLogin.frc echo -------------DevNotes-------------
if exist DevLogin.frc echo  Function 'DevLogin' is activated 
if exist DevLogin.frc echo.
if exist DevLogin.frc echo  CodeVersion: 4.1
if exist DevLogin.frc echo  ProgramVersion: 1.5
if exist DevLogin.frc echo.
if exist DevLogin.frc echo  Status: Finished
if exist DevLogin.frc echo ----------------------------------
pause >nul
goto main_frc





::Info
:info
echo [INFO] UI.Info_Opened >>FrcLog.log
cls
echo File ReC - Info
echo.
echo Program's Full Name - File ReCreation
echo Version: 1.5
echo [Previous Versions Are NOT Public]
echo.
echo Creator:
echo -EMOJI TV YT
echo.
echo.
echo "File ReCreation" or "File ReC" for short,
echo is a Program for everyone to change
echo Extensions and Names of Certian Files
echo.
echo Custom Path Option - It will not work if in the path are spaces
pause >nul
goto main_frc







::Name Changer
:chng_nm
echo [INFO] UI.FileNameChanger_Opened.menu >>FrcLog.log
cls
echo Select File Path
echo.
echo [ 1 ] This Folder
echo [ 2 ] Custom Path
echo.
set /p "frec_mchnm=Option: "
if %frec_mchnm%==1 goto chng_nm_o1
if %frec_mchnm%==2 goto chng_nm_o2

::Name Changer - Option 1
:chng_nm_o1
echo [INFO] UI.FNC_Opened.Option1 >>FrcLog.log
cls
echo Enter File's Name and Extension
echo.
set /p "cn_o1_fn=File Name: "
cls
echo File Name: %cn_o1_fn%
echo Enter File's Extension (txt, dll, ect. just without a dot)
echo.
set /p "cn_o1_fe=File Extension: "
cls
echo File: %cn_o1_fn%.%cn_o1_fe%
echo.
echo Enter New File Name (Cannot Use Spaces)
echo.
set /p "enfn=File Name: "
ren %cn_o1_fn%.%cn_o1_fe% %enfn%.%cn_o1_fe%
cls
echo [CONVERTION] Changed %cn_o1_fn%.%cn_o1_fe% to %enfn%.%cn_o1_fe% >>FrcLog.log
echo Done.
timeout 3 >nul
goto main_frc 

::Name Changer - Option 2
:chng_nm_o2
echo [INFO] UI.FNC_Opened.Option2 >>FrcLog.log
cls
echo Enter File's Path
echo Example: C:\Users\User1\Desktop\Folder\
echo.
set /p "cn_o2_fp=Path: "
cd /D %cn_o2_fp%
cls
echo Enter File's Name and Extension
echo.
set /p "cn_o2_fn=File Name: "
cls
echo File Name: %cn_o2_fn%
echo Enter File's Extension (txt, dll, ect. just without a dot)
echo.
set /p "cn_o2_fe=File Extension: "
cls
echo File: %cn_o2_fn%.%cn_o2_fe%
echo.
echo Enter New File Name (Cannot Use Spaces)
echo.
set /p "enfn=File Name: "
ren %cn_o2_fn%.%cn_o2_fe% %enfn%.%cn_o2_fe%
cls
echo [CONVERTION] Changed %cn_o2_fn%.%cn_o2_fe% to %enfn%.%cn_o2_fe% >>FrcLog.log
echo Done.
timeout 3 >nul
goto main_frc







::Extension Changer
:chng_ext
echo [INFO] UI.FileExtensionChanger_Opened.menu >>FrcLog.log
cls
echo Select File Path
echo.
echo [ 1 ] This Folder
echo [ 2 ] Custom Path
echo.
set /p "frec_mchext=Option: "
if %frec_mchext%==1 goto chng_ext_o1
if %frec_mchext%==2 goto chng_ext_o2

::Extension Changer - Option 1
:chng_ext_o1
echo [INFO] UI.FEC_Opened.Option1 >>FrcLog.log
cls
echo Enter File's Name and Extension
echo.
set /p "ce_o1_fn=File Name: "
cls
echo File Name: %ce_o1_fn%
echo Enter File's Extension (txt, dll, ect. just without a dot)
echo.
set /p "ce_o1_fe=File Extension: "
cls
echo File: %ce_o1_fn%.%ce_o1_fe%
echo.
echo Enter New File Extension (txt, dll ect. just without the dot)
echo.
set /p "enfe=File Extension: "
ren %ce_o1_fn%.%ce_o1_fe% %ce_o1_fn%.%enfe%
cls
echo [CONVERTION] Changed %ce_o1_fn%.%ce_o1_fe% to %ce_o1_fn%.%enfe% >>FrcLog.log
echo Done.
timeout 3 >nul
goto main_frc 

::Extension Changer - Option 2
:chng_ext_o2
echo [INFO] UI.FEC_Opened.Option2 >>FrcLog.log
cls
echo Enter File's Path
echo Example: C:\Users\User1\Desktop\Folder\
echo.
set /p "ce_o2_fp=Path: "
cd /D %ce_o2_fp%
cls
echo Enter File's Name and Extension
echo.
set /p "ce_o1_fn=File Name: "
cls
echo File Name: %ce_o2_fn%
echo Enter File's Extension (txt, dll, ect. just without a dot)
echo.
set /p "ce_o1_fe=File Extension: "
cls
echo File: %ce_o2_fn%.%ce_o2_fe%
echo.
echo Enter New File Extension (txt, dll ect. just without the dot)
echo.
set /p "enfe=File Extension: "
ren %ce_o2_fn%.%ce_o2_fe% %ce_o2_fn%.%enfe%
cls
echo [CONVERTION] Changed %ce_o2_fn%.%ce_o2_fe% to %ce_o2_fn%.%enfe% >>FrcLog.log
echo Done.
timeout 3 >nul
goto main_frc
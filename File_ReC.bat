@echo off
title File ReC
color 0f

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
echo [STARTUP] DevCheck-1_ContentCheck1 >>FrcLog.log
cls
(
set /p dl_info1=
set /p dl_info2=
set /p dl_info3=
)<DevLogin.frc
if %dl_info1%==--DevLogin$ goto checkdevlog1
if not %dl_info1%==--DevLogin$ goto fakeDL

:checkdevlog1
echo [STARTUP] DevCheck-3_ContentCheck2 >>FrcLog.log
if %dl_info2%==-userInstant- goto checkdevlog2
if not %dl_info2%==-userInstant- goto fakeDL

:checkdevlog2
echo [STARTUP] DevCheck-4_ContentCheck3 >>FrcLog.log
if %dl_info3%==-passInstant- goto titlencolordev
if not %dl_info3%==--DevLogin$ goto fakeDL

:titlencolordev
title File ReC - Developer Mode
color 0a
goto main_frc

:fakeDL
cls
echo [WARNING] IncContent-DevLogin.frc_FakeDL >>FrcLog.log
echo Incorrect Content of DevLogin File
timeout 5 >nul
exit



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
echo [ 4 ] Exit
if exist DevLogin.frc echo.
if exist DevLogin.frc echo [ 5 ] DevNotes
if exist DevLogin.frc echo [ 6 ] Developer Options
echo.
set /p "frec_mo=Option: "
if %frec_mo%==1 goto chng_ext
if %frec_mo%==2 goto chng_nm
if %frec_mo%==3 goto info 
if %frec_mo%==4 goto exit0
if %frec_mo%==5 goto devnotes0
if %frec_mo%==6 goto devopt
if not %frec_mo%==1 goto main_frc
if not %frec_mo%==2 goto main_frc
if not %frec_mo%==3 goto main_frc
if not %frec_mo%==4 goto main_frc
if not %frec_mo%==5 goto main_frc
if not %frec_mo%==6 goto main_frc

:exit0
echo [INFO] UI.NotSureExit_Opened >>FrcLog.log
cls
echo Are you sure you want to close the program?
echo.
echo [ 1 ] No
echo [ 2 ] Yes
echo.
set /p "exitcho=Option: "
if %exitcho%==1 echo [INFO] NotSureExit.Option_Cancel >>FrcLog.log && goto main_frc
if %exitcho%==2 echo [INFO] NotSureExit.Option_Accept >>FrcLog.log && exit



:devnotes0
echo [INFO] UI.DevNotes_Opened >>FrcLog.log
cls
if not exist DevLogin.frc echo This Option is Unavaible && timeout 3 >nul && goto main_frc
if exist DevLogin.frc echo.
if exist DevLogin.frc echo -------------DevNotes-------------
if exist DevLogin.frc echo  Function 'DevLogin' is activated 
if exist DevLogin.frc echo.
if exist DevLogin.frc echo  CodeVersion: 4.3
if exist DevLogin.frc echo  ProgramVersion: 1.7
if exist DevLogin.frc echo.
if exist DevLogin.frc echo  Status: Finished
if exist DevLogin.frc echo ----------------------------------
pause >nul
goto main_frc

:devnotes1
echo [INFO] UI.DevNotes_Opened >>FrcLog.log
cls
if not exist DevLogin.frc echo This Option is Unavaible && timeout 3 >nul && goto main_frc
if exist DevLogin.frc echo.
if exist DevLogin.frc echo -------------DevNotes-------------
if exist DevLogin.frc echo  Function 'DevLogin' is activated 
if exist DevLogin.frc echo.
if exist DevLogin.frc echo  CodeVersion: 4.3
if exist DevLogin.frc echo  ProgramVersion: 1.7
if exist DevLogin.frc echo.
if exist DevLogin.frc echo  Status: Finished
if exist DevLogin.frc echo ----------------------------------
pause >nul
goto devopt



::Developer Options - Avaible ONLY if "DevLogin.frc" file exists and its content matches with the specific code
:devopt
echo [INFO] UI.DevOptions_Opened >>FrcLog.log
cls
if not exist DevLogin.frc echo This Option is Unavaible && timeout 3 >nul && goto main_frc
if exist DevLogin.frc echo -------------DevOptions-------------
if exist DevLogin.frc echo Select An Option
if exist DevLogin.frc echo.
if exist DevLogin.frc echo [ 1 ] Delete Log File
if exist DevLogin.frc echo [ 2 ] Delete Frc_Data
if exist DevLogin.frc echo [ 3 ] Delete DevLogin File
if exist DevLogin.frc echo [ 4 ] Open DevNotes
if exist DevLogin.frc echo.
if exist DevLogin.frc echo [ Q ] Go Back to User Menu
if exist DevLogin.frc echo.
if exist DevLogin.frc set /p "devopt=Option: "
if exist DevLogin.frc if %devopt%==1 goto dellogf
if exist DevLogin.frc if %devopt%==2 goto delfrcd
if exist DevLogin.frc if %devopt%==3 goto deldlf
if exist DevLogin.frc if %devopt%==4 goto devnotes1
if exist DevLogin.frc if %devopt%==5 goto main_frc

:dellogf
echo.
echo.
del FrcLog.log
echo Deleted: FrcLog.log
pause >nul
goto devopt

:delfrcd
echo.
echo.
del Frc_Data
echo Deleted: Frc_Data
pause >nul
goto devopt

:dellogf
echo.
echo.
del DevLogin.frc
echo Deleted: DevLogin.frc
pause >nul
goto devopt












::Info
:info
echo [INFO] UI.Info_Opened >>FrcLog.log
cls
echo File ReC - Info
echo.
echo Program's Full Name - File ReCreation
echo Version: 1.7
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

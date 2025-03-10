@echo off

REM Store the current working directory
set "original_dir=%CD%"

REM Change the current working directory to the script's location
cd /d "%~dp0"

REM Call the script in the 'language_files' folder
echo Generating files using easy_localization
cd language_files
REM Allow execution permissions on CI
chmod +x generate_language_files.cmd
call generate_language_files.cmd %*

REM Return to the main script directory
cd ..

REM Call the script in the 'freezed' folder
echo Generating files using build_runner
cd freezed
REM Allow execution permissions on CI
chmod +x generate_freezed.cmd
call generate_freezed.cmd %*
cd ..

echo Generating env files using build_runner
cd env
REM Allow execution permissions on CI
chmod +x generate_env.cmd
call generate_env.cmd %*

REM Return to the original directory
cd /d "%original_dir%"

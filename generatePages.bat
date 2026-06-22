@echo off

if exist "ALE-Psych\docs.xml" (
	set "ALE_PSYCH_XML=ALE-Psych\docs.xml"
) else (
	set "ALE_PSYCH_XML=..\ALE-Psych\docs.xml"
)

haxelib run dox -i "%ALE_PSYCH_XML%" -o docs -theme themes/ale-psych --title "ALE Psych API" -D themeColor 0xB986FF -D textColor 0xF4F7FF -D website https://github.com/ALE-Psych-Crew/ALE-Psych -D description "API documentation for ALE Psych." -D source-path https://github.com/ALE-Psych-Crew/ALE-Psych/blob/main/source/
exit /b %ERRORLEVEL%

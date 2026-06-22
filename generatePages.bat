@echo off

haxelib run dox -i ALE-Psych/docs.xml -o docs -theme themes/ale-psych --title "ALE Psych API" -D themeColor 0xB986FF -D textColor 0xF4F7FF -D website https://github.com/ALE-Psych-Crew/ALE-Psych -D description "API documentation for ALE Psych." -D source-path https://github.com/ALE-Psych-Crew/ALE-Psych/blob/main/source/

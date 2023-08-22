@echo off
robot --name Firefox --variable BROWSER:Firefox --output out\fx.xml --log none --report none %* login
robot --name IE --variable BROWSER:IE --log none --output out\ie.xml --report none %* login
rebot --name Login --outputdir out --output login.xml out\fx.xml out\ie.xml
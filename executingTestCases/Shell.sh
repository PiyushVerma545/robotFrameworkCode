#!/bin/bash
robot --name Firefox --variable BROWSER:Firefox --output out/fx.xml --log none --report none $* login
robot --name IE --variable BROWSER:IE --output out/ie.xml --log none --report none  $* login
rebot --name Login --outputdir out --output login.xml out/fx.xml out/ie.xml
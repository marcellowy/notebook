```shell
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\msys_mingw64]
@="MSYS &MinGW64"
"Icon"="D:\\msys64\\mingw64.exe"

[HKEY_CLASSES_ROOT\Directory\Background\shell\msys_mingw64\command]
@="\"D:\\msys64\\mingw64.exe\" /bin/sh -lc 'cd \"%v\"; exec bash'"


[HKEY_CLASSES_ROOT\Directory\shell\msys_mingw64]
@="MSYS &MinGW64"
"Icon"="D:\\msys64\\mingw64.exe"

[HKEY_CLASSES_ROOT\Directory\shell\msys_mingw64\command]
@="\"D:\\msys64\\mingw64.exe\" /bin/sh -lc 'cd \"%1\"; exec bash'"

```

将以上内容只在为 mingw64.reg,然后双击即可
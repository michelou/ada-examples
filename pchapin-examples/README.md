# <span id="top">Peter's Ada Examples</span> <span style="font-size:90%;">[↩](../README.md#top)</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://github.com/pchapin/tutorialada" rel="external"><img style="border:0;" src="../docs/images/2094217.jpg" width="100" alt="Peter's Project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>pchapin-examples\</code></strong> contains <a href="https://github.com/zertovitch/hac" rel="external">Ada</a> code examples coming from GitHub project <a href="https://github.com/pchapin/tutorialada"><code>tutorialada</code></a> created by <a href="https://www.pchapin.org/">Peter Chapin</a>.
  </td>
  </tr>
</table> 

## <span id="check">`Check` Example</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /a /f . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./Check/build.bat">build.bat</a>
|   <a href="./Check/build.gpr">build.gpr</a>
|   <a href="./Check/build.sh">build.sh</a>
|   <a href="./Check/Makefile">Makefile</a>
\---<b>src</b>
    \---<b>main</b>
        \---<b>ada</b>
                <a href="./Check/src/main/ada/check_buffers.adb">check_buffers.adb</a>
                <a href="./Check/src/main/ada/check_buffers.ads">check_buffers.ads</a>
                <a href="./Check/src/main/ada/check_sorters.adb">check_sorters.adb</a>
                <a href="./Check/src/main/ada/check_sorters.ads">check_sorters.ads</a>
                <a href="./Check/src/main/ada/dates-check_dates.adb">dates-check_dates.adb</a>
                <a href="./Check/src/main/ada/dates-check_dates.ads">dates-check_dates.ads</a>
                <a href="./Check/src/main/ada/primary_suite.adb">primary_suite.adb</a>
                <a href="./Check/src/main/ada/primary_suite.ads">primary_suite.ads</a>
                <a href="./Check/src/main/ada/samples_test.adb">samples_test.adb</a>
</pre>

Bach file [`build.bat`](./Check/build.bat)`-verbose clean run` generates and executes de Ada program `target\Check.exe` :

<pre style="font-size:80%;">
<b>&gt; <a href="./Check/build.bat">build</a> -verbose run</b>
Compile 9 Ada source files into directory "target\obj"
Execute Ada program "target\Check.exe"
&nbsp;
OK Buffers : Fill
OK Buffers : Reverse_Buffer
OK Buffers : Rotate_Right
OK Buffers : Rotate_Left
OK Buffers : Count_Substrings
OK Buffers : Count_Character
OK Buffers : Count_And_Erase_Character
OK Buffers : Compact
OK Buffers : Copy_Into
OK Buffers : Copy_Onto
OK Buffers : Substring
OK Dates : Create
OK Dates : Advance
OK Sorters : Selection_Sort
OK Sorters : Bubble_Sort
OK Sorters : Merge_Sort

Total Tests Run:   16
Successful Tests:  16
Failed Assertions: 0
Unexpected Errors: 0
</pre>

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html">gprbuild</a> &amp; target\Check.exe</b>

</pre>

## <span id="elaboration_order">`ElaborationOrder` Example</span>

This example has the following directory structure : 

<pre style="font-size:80%;">
<b>&gt; <a href="">tree</a> /a /f . | <a href="">findstr</a> /v /b [A-Z]</b>
|   <a href="./ElaborationOrder/build.bat">build.bat</a>
|   <a href="./ElaborationOrder/build.gpr">build.gpr</a>
|   <a href="./ElaborationOrder/build.sh">build.sh</a>
|   <a href="./ElaborationOrder/Makefile">Makefile</a>
\---<b>src</b>
    \---<b>main</b>
        \---<b>ada</b>
                <a href="./ElaborationOrder/src/main/ada/a.adb">a.adb</a>
                <a href="./ElaborationOrder/src/main/ada/a.ads">a.ads</a>
                b.adb</a>
                b.ads</a>
                c.adb</a>
                c.ads</a>
                <a href="./ElaborationOrder/src/main/ada/elaboration_demo.adb">elaboration_demo.adb</a>
                parent-child.adb</a>
                parent-child.ads</a>
                parent.adb</a>
                parent.ads</a>
</pre>

Batch file [`build.bat`](./ElaborationOrder/build.bat)`-verbose clean run` generates and executes the Ada program `target\ElaborationOrder.exe` :

<pre style="font-size:80%;">
<b>&gt; <a href="./ElaborationOrder/build.bat">build</a> -verbose clean run</b>
Compile 11 Ada source files to directory "target\obj"
Execute Ada program "target\ElaborationOrder.exe"
Printing stuff in package Parent.Child
</pre>

## <span id="hexdump">`Hexdump` Example</span>

## <span id="random">`Random` Example</span>

## <span id="rationals">`Rationals` Example</span>

## <span id="rot13">`Rot13` Example</span>

## <span id="sieve">`Sieve` Example</span>

## <span id="sieve_task">`SieveTask` Example</span>

## <span id="tagged">`Tagged` Example</span>

## <span id="vowels">`Vowels` Example</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /a /f . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./Vowels/build.bat">build.bat</a>
|   <a href="./Vowels/build.gpr">build.gpr</a>
|   <a href="./Vowels/build.sh">build.sh</a>
|   <a href="./Vowels/Makefile">Makefile</a>
\---<b>src</b>
    \---<b>main</b>
        \---<b>ada</b>
                <a href="./Vowels/src/main/ada/vowels.adb">vowels.adb</a>
</pre>

Batch file [`build.bat`](./Vowels/build.bat)`-verbose clean run` generates and executes the Ada program `target\Vowels.exe` :

<pre style="font-size:80%;">
<b>&gt; <a href="./Vowels/build.bat">build</a> -verbose clean run</b>
Compile 1 Ada source file to directory "target\obj"
Execute Ada program "target\Vowels.exe"
Total number of vowels =          11
Total number of Ys =           0
</pre>

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Gnatmake*** [↩](#anchor_01)

<dl><dd>
GNU tools such as <a href="https://gcc.gnu.org/onlinedocs/gcc/Invoking-GCC.html" reé?"extermal"><code><b>gcc</b></code></a>, <a href="https://docs.adacore.com/gnat_ugn-docs/html/gnat_ugn/gnat_ugn/building_executable_programs_with_gnat.html#the-gnat-make-program-gnatmake" rel="external"><code><b>gnatmake</b></code></a>, <a href="https://sourceware.org/binutils/docs/binutils/objdump.html" rel="external"><code><b>objdump</b></code></a> and <a href="https://sourceware.org/binutils/docs/binutils/windres.html" rel="external"><code><b>windres</b></code></a> are available both in the MSYS installation and in the GNAT 2021 installation; we use the tools from the MSYS installation which have <i>newer versions</i>.
<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where">where</a> gcc gnatmake windres</b>
C:\opt\msys64\usr\bin\gcc.exe
C:\opt\msys64\mingw64\bin\gcc.exe
C:\opt\GNAT\2021\bin\gcc.exe
C:\opt\msys64\mingw64\bin\gnatmake.exe
C:\opt\GNAT\2021\bin\gnatmake.exe
C:\opt\msys64\usr\bin\windres.exe
C:\opt\msys64\mingw64\bin\windres.exe
C:\opt\GNAT\2021\bin\windres.exe
&nbsp;
<b>&gt; C:\opt\msys64\mingw64\bin\<a href="https://gcc.gnu.org/onlinedocs/gnat_ugn/Switches-for-gnatmake.html">gnatmake.exe</a> --version</b>
GNATMAKE 13.2.0
Copyright (C) 1995-2023, Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
&nbsp;
<b>&gt; C:\opt\GNAT\2021\bin\<a href="https://gcc.gnu.org/onlinedocs/gnat_ugn/Switches-for-gnatmake.html">gnatmake.exe</a> --version</b>
GNATMAKE Community 2021 (20210519-103)
Copyright (C) 1995-2021, Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
</pre>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/February 2025* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[alr_cli]: https://alire.ada.dev/docs/#first-steps
[github_alire]: https://github.com/alire-project/alire
[gnatmake_cmd]: https://docs.adacore.com/gnat_ugn-docs/html/gnat_ugn/gnat_ugn/building_executable_programs_with_gnat.html#the-gnat-make-program-gnatmake
[gprbuild_cmd]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html
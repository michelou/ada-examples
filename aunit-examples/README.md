# <span id="top">AUnit examples</span> <span style="font-size:90%;">[↩](../README.md#top)</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="../docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>aunit-examples\</code></strong> contains <a href="https://www.adacore.com/" rel="external">Ada</a> code examples from the GitHub project <a href="https://github.com/AdaCore/aunit" rel="external"><code>AdaCore/aunit</code></a>.</td>
  </tr>
</table>

We made the following changes to the original [`AdaCore/aunit`][adacore_aunit] code examples:
- We introduce a parent project file [`Makefile.inc`](./Makefile.inc) which gathers all tool definitions and takes care of different settings for 3 environments: MSYS2, Windows and Unix.
- We require the two environment variables `GNAT_HOME` and `MSYS_HOME` to be defined when working in the MSYS2 and Windows environments (behavior is unchanged under Unix).

## <span id="calculator">`calculator` Example</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /a /f . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./calculator/harness.gpr">harness.gpr</a>
|   <a href="./calculator/Makefile">Makefile</a>
+---<b>tested_lib</b>
|   |   <a href="./calculator/tested_lib/testlib.gpr">testlib.gpr</a>
|   +---<b>lib</b>
|   \---<b>src</b>
|           <a href="./calculator/tested_lib/src/math.adb">math.adb</a>
|           <a href="./calculator/tested_lib/src/math.ads">math.ads</a>
\---<b>tests</b>
        <a href="./calculator/tests/math-test.adb">math-test.adb</A>
        math-test.ads
        math_suite.adb
        math_suite.ads
        test_math.adb
</pre>

We build this code example using the [`make.exe`][gnu_make] build tool (project file [`Makefile`](./calculator/Makefile) depends on parent file [`Makefile.inc`](./Makefile.inc)).

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/where">where</a> make</b>
C:\opt\msys64\usr\bin\make.exe
&nbsp;
<b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html">make</a></b>
"C:/opt/GNAT/2021/bin/gprbuild.exe" -p -f -Pharness
Setup
   [mkdir]        object directory for project Harness
Compile
   [Ada]          test_calculator.adb
   [...]
   [Ada]          operations-subtraction_test_fixture.adb
Build Libraries
   [gprlib]       testlib.lexch
   [archive]      libtestlib.a
   [index]        libtestlib.a
Bind
   [gprbind]      test_calculator.bexch
   [Ada]          test_calculator.ali
Link
   [link]         test_calculator.adb
&nbsp;
<b>&gt; test_calculator.exe</b>

OK Test Stack.Push
OK Test Stack.Pop
OK Test Stack.Length
OK Test Stack.Top
[...]
Total Tests Run:   14
Successful Tests:  12
Failed Assertions: 2
Unexpected Errors: 0
</pre>

## <span id="failures">`failures` Example</span>[**&#x25B4;**](#top)

Project [`failures`](./failures/) consists of 3 sets of files:
- the 3 build files [`harness.gpr`](failures/harness.gpr), [`Makefile`](failures/Makefile) and [`Makefile.inc`](./Makefile.inc) (parent file).
- the 2 library source files [`math.adb`](failures/tested_lib/src/math.adb) and [`math.ads`](failures/tested_lib/src/math.ads).
- the 5 test source files [`math-test.adb`](failures/tests/math-test.adb), [`math-test.ads`](failures/tests/math-test.ads), [`math_suite.adb`](failures/tests/math_suite.adb), [`math_suite.ads`](failures/tests/math_suite.ads), [`test_math.adb`](failures/tests/test_math.adb).

<pre style="font-size:80%;">
<b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html" rel="external">make</a></b>
"C:/opt/GNAT/2021/bin/gprbuild.exe" -p -Pharness
Setup
   [mkdir]        object directory for project TestLib
   [mkdir]        object directory for project Harness
Compile
   [Ada]          test_math.adb
   [Ada]          math.adb
   [Ada]          math_suite.adb
   [Ada]          math-test.adb
Build Libraries
   [gprlib]       testlib.lexch
   [archive]      libtestlib.a
   [index]        libtestlib.a
Bind
   [gprbind]      test_math.bexch
   [Ada]          test_math.ali
Link
   [link]         test_math.adb
&nbsp;
<b>&gt; test_math.exe</b>
&nbsp;
OK Test addition
OK Test subtraction
&nbsp;
FAIL Test addition (failure expected)
    Test should fail this assertion, as 5+3 /= 9
    at math-test.adb:29
&nbsp;
ERROR Test addition (error expected)
    CONSTRAINT_ERROR
    Exception Message: math.adb:8 overflow check failed
    Traceback:
        [%USERPROFILE%\workspace-perso\ada-examples\aunit-examples\failures\test_math.exe]
        0x7ff7f85626f2 Math."+" at math.adb:8
        0x7ff7f8561e98 Math.Test.Test_Addition_Error at math-test.adb:37
        0x7ff7f856210a Math_Suite.Caller.Run_Test at aunit-test_caller.adb:96
        0x7ff7f85664a5 aunit__assertions__TtestCFD at ???
        0x7ff7f8566767 aunit__assertions__TtestCFD at ???
        0x7ff7f8569679 aunit__assertions__TtestCFD at ???
        0x7ff7f8566249 aunit__assertions__TtestCFD at ???
        0x7ff7f85615e3 Test_Math at aunit-run.adb:88
        0x7ff7f8561d00 Main at b__test_math.adb:399
        0x7ff7f85613af __tmainCRTStartup at crtexe.c:321
        0x7ff7f85614e4 mainCRTStartup at crtexe.c:202
        [C:\WINDOWS\System32\KERNEL32.DLL]
        0x7ffc4c7d7032
        [C:\WINDOWS\SYSTEM32\ntdll.dll]
        0x7ffc4df4264f


Total Tests Run:   4
Successful Tests:  2
Failed Assertions: 1
Unexpected Errors: 1
</pre>

## <span id="liskov">`liskov` Example</span> [**&#x25B4;**](#top)

*wip*

<pre style="font-size:80%;">
<b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html" rel="external">make</a></b>
"C:/opt/GNAT/2021/bin/gprbuild.exe" -p -Pharness
Setup
   [mkdir]        object directory for project TestLib
   [mkdir]        object directory for project Harness
Compile
   [Ada]          test_liskov.adb
   [...]
   [Ada]          square-tests-suite_liskov.adb
   [Ada]          shape-tests.adb
Build Libraries
   [gprlib]       testlib.lexch
   [archive]      libtestlib.a
   [index]        libtestlib.a
Bind
   [gprbind]      test_liskov.bexch
   [Ada]          test_liskov.ali
Link
   [link]         test_liskov.adb
&nbsp;
<b>&gt; test_liskov.exe</b>

OK Rectangle : Test width
OK Rectangle : Test height
OK Rectangle : Test area
OK Square : Test width
OK Square : Test height
OK Square : Test area
OK Square as Rectangle (liskov) : Test width
OK Square as Rectangle (liskov) : Test height

FAIL Square as Rectangle (liskov) : Test area
    Wrong area returned for object rectangle
    at rectangle-tests.adb:28

Total Tests Run:   9
Successful Tests:  8
Failed Assertions: 1
Unexpected Errors: 0
</pre>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/February 2025* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[adacore_aunit]: https://github.com/AdaCore/aunit
[gnu_gnatmake]: https://gcc.gnu.org/onlinedocs/gnat_ugn/Building-with-gnatmake.html
[gnu_make]: https://www.gnu.org/software/make/manual/make.html

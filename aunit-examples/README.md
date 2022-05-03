# <span id="top">AUnit examples</span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="../docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>aunit-examples\</code></strong> contains <a href="https://www.adacore.com/" rel="external">Ada</a> code examples from the GitHub project <a href="https://github.com/AdaCore/aunit"><code>AdaCore/aunit</code></a>.
  </td>
  </tr>
</table>

We made the following changes to the original [`AdaCore/aunit`][adacore_aunit] code examples:
- We introduce a parent project file [`Makefile.inc`](./Makefile.inc) which gathers all tool definitions and takes care of different settings for 3 environments: MSYS2, Windows and Unix.
- We require the two environment variables `GNAT_HOME` and `MSYS_HOME` to be defined when working in the MSYS2 and Windows environments (behavior is unchanged under Unix).

## <span id="calculator">`calculator`</span>

We build this code example using the [`make`][gnu_make] build tool (project file [`Makefile`](./calculator/Makefile) depends on parent file [`Makefile.inc`](./Makefile.inc)).

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

## <span id="failures">`failures`</span>

*tbd*

## <span id="liskov">`liskov`</span>

*tbd*

***

*[mics](https://lampwww.epfl.ch/~michelou/)/May 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[adacore_aunit]: https://github.com/AdaCore/aunit
[gnu_gnatmake]: https://gcc.gnu.org/onlinedocs/gnat_ugn/Building-with-gnatmake.html
[gnu_make]: https://www.gnu.org/software/make/manual/make.html

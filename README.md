# <span id="top">Playing with Ada on Windows</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:25%;"><a href="https://www.adacore.com/" rel="external"><img src="docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This repository gathers <a href="https://www.adacore.com/" rel="external" title="Ada">Ada</a> code examples coming from various websites and books.<br/>
  It also includes several build scripts (<a href="https://cloudblogs.microsoft.com/opensource/2023/02/21/introducing-bash-for-beginners/l" rel="external">bash scripts</a>, <a href="https://en.wikibooks.org/wiki/Windows_Batch_Scripting" rel="external">batch files</a>, <a href="https://makefiletutorial.com/" rel="external">Make scripts</a>) for experimenting with <a href="https://www.adacore.com/" rel="external">Ada</a> on a Windows machine.</td>
  </tr>
</table>

[Akka][akka_examples], [C++][cpp_examples], [COBOL][cobol_examples], [Component Pascal][component_pascal_examples], [Dafny][dafny_examples], [Dart][dart_examples], [Deno][deno_examples], [Docker][docker_examples], [Erlang][erlang_examples], [Flix][flix_examples], [Go][golang_examples], [GraalVM][graalvm_examples], [Haskell][haskell_examples], [Kafka][kafka_examples], [Kotlin][kotlin_examples], [LLVM][llvm_examples], [Modula-2][m2_examples], [Node.js][nodejs_examples], [Rust][rust_examples], [Scala 3][scala3_examples], [Spark][spark_examples], [Spring][spring_examples], [Standard ML][sml_examples], [TruffleSqueak][trufflesqueak_examples], [WiX Toolset][wix_examples] and [Zig][zig_examples] are other topics we are continuously monitoring.

> **&#9755;** Read the document <a href="https://www.adaic.org/advantages/ada-comp-chart/" rel="external">"Ada Comparison Chart"</a> for an overview of evolution of the major features of the Ada programming language.

## <span id="proj_deps">Project dependencies</span>

This project depends on the following external software for the **Microsoft Windows** platform:

- [Git 2.51][git_releases] ([*release notes*][git_relnotes])
- [GNAT CE 2021][gnat2021_downloads] ([*announcement*][gnat2021_announcement])

Optionally one may also install the following software:

- [AdaControl 1.22][adactl_downloads] (*inactive since September 2022*)
- [Alire 2.1][alire_downloads] <sup id="anchor_01">[1](#footnote_01)</sup> ([*changes*][alire_changes])
- [ConEmu 2023][conemu_downloads] ([*release notes*][conemu_relnotes])
- [GNAT CE 2019][gnat2019_downloads] <sup id="anchor_02">[2](#footnote_02)</sup>
- [GWindows 2024][gwindows_downloads] ([*release notes*][gwindows_relnotes])
- [MSYS2 2024][msys2_downloads] <sup id="anchor_03">[3](#footnote_03)</sup> ([*changelog*][msys2_changelog])
- [Visual Studio Code 1.105][vscode_downloads] ([*release notes*][vscode_relnotes])

> **&#9755;** ***Installation policy***<br/>
> When possible we install software from a [Zip archive][zip_archive] rather than via a Windows installer. In our case we defined **`C:\opt\`** as the installation directory for optional software tools (*in reference to* the [**`/opt/`**][linux_opt] directory on Unix).

For instance our development environment looks as follows (*October 2025*) <sup id="anchor_04">[4](#footnote_04)</sup>:

<pre style="font-size:80%;">
C:\opt\adactl\       <i>( 79 MB)</i>
C:\opt\ConEmu\       <i>( 26 MB)</i>
C:\opt\Git\          <i>(397 MB)</i>
C:\opt\GNAT\2019\    <i>(1.1 GB)</i>
C:\opt\GNAT\2021\    <i>(2.8 GB)</i>
C:\opt\GWindows\     <i>( 15 MB)</i>
C:\opt\msys64\       <i>(2.8 GB)</i>
C:\opt\VSCode\       <i>(404 MB)</i>
</pre>

> **:mag_right:** [Git for Windows][git_releases] provides a BASH emulation used to run [**`git.exe`**][git_cli] from the command line (as well as over 250 Unix commands like [**`awk`**][man1_awk], [**`diff`**][man1_diff], [**`file`**][man1_file], [**`grep`**][man1_grep], [**`more`**][man1_more], [**`mv`**][man1_mv], [**`rmdir`**][man1_rmdir], [**`sed`**][man1_sed] and [**`wc`**][man1_wc]).

## <span id="structure">Directory structure</span> [**&#x25B4;**](#top)

This project has the following directory structure :

<pre style="font-size:80%;">
<a href="aunit-examples/">aunit-examples\</a>{<a href="aunit-examples/README.md">README.md</a>, <a href="aunit-examples/calculator/">calculator</a>, etc.}
<a href="bin/">bin\</a>
<a href="docs/">docs\</a>
<a href="examples/">examples\</a>{<a href="examples/README.md">README.md</a>, <a href="examples/Greetings">Greetings</a>, etc.}
<a href="gwindows-examples/">gwindows-examples\</a>{<a href="gwindows-examples/README.md">README.md</a>, <a href="gwindows-examples/tutorial1">tutorial1</a>, etc.}
<a href="hac-examples/">hac-examples</a>{<a href="hac-examples/README.md">README.md</a>, <a href="./hac-examples/Ackermann/">Ackermann</a>, ..}
<a href="intro-to-ada/">intro-to-ada\</a>{<a href="intro-to-ada/README.md">README.md</a>, <a href="intro-to-ada/Greet/">Greet</a>, <a href="intro-to-ada/Week/">Week</a>, etc.}
<a href="pchapin-exeamples/">pchapin-examples</a>{<a href="pchapin-examples/README.md">README.md</a>, <a href="pchapin-examples/Rationals/">Rationals</a>, <a href="pchapin-examples/Tagged/">Tagged</a>, <a href="pchapin-examples/Vowels/">Vowels</a>, etc.}
<a href="shvets-examples/">shvets-examples\</a>{<a href="shvets-examples/README.md">README.md</a>, <a href="shvets-examples/ch02">ch02</a>, <a href="shvets-examples/ch03">ch03</a>, etc.}
<a href="QUICKREF.md">QUICKREF.md</a>
README.md
<a href="RESOURCES.md">RESOURCES.md</a>
<a href="setenv.bat">setenv.bat</a>
<a href="SETUP.md">SETUP.md</a>
</pre>

where

- directory [**`aunit-examples\`**](aunit-examples/) contains [Ada] code examples from GitHub project [`AdaCore/aunit`](https://github.com/AdaCore/aunit).
- directory [**`bin\`**](bin/) contains utility batch files.
- directory [**`docs\`**](docs/) contains [Ada] related documents.
- directory [**`examples\`**](examples/) contains [Ada] code examples grabbed from various websites.
- directory [**`gwindows-examples\`**](./gwindows-examples/) contains [GNAVI] code examples (see [`README.md`](./gwindows-examples/README.md))
- directory [**`hac-examples\`**](./hac-examples/) contains [Ada] code examples from the [HAC](https://github.com/zertovitch/hac) project.
- directory [**`intro-to-ada\`**](intro-to-ada/) contains [Ada] code examples from AdaCore's course <a href="https://learn.adacore.com/courses/intro-to-ada" rel="external">*Introduction to Ada*</a>.
- directory [**`pchapin-examples\`**](./pchapin-examples/) contains [Ada] code examples from Peter's [Ada tutorial](https://github.com/pchapin/tutorialada).
- directory [**`shvets-examples\`**](./shvets-examples/) contains [Ada] code examples from Shvets's book <a href="https://www.apress.com/9781484254271" rel="external">*Beginning Ada Programming*</a>.
- file [**`QUICKREF.md`**](QUICKREF.md) gathers [Ada] hints and tips.
- file [**`README.md`**](README.md) is the [Markdown][github_markdown] document for this page.
- file [**`RESOURCES.md`**](RESOURCES.md) gathers [Ada] related informations.
- file [**`setenv.bat`**](setenv.bat) is the batch script for setting up our environment.
- file [**`SETUP.md`**](SETUP.md) gathers information about setting up our environment.

We also define a virtual drive &ndash; e.g. drive **`W:`** &ndash; in our working environment in order to reduce/hide the real path of our project directory (see article ["Windows command prompt limitation"][windows_limitation] from Microsoft Support).
> **:mag_right:** We use the Windows external command [**`subst`**][windows_subst] to create virtual drives; for instance:
>
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/subst" rel="external">subst</a> W: <a href="https://docs.microsoft.com/en-us/windows/deployment/usmt/usmt-recognized-environment-variables#bkmk-2" rel="external">%USERPROFILE%</a>\workspace\ada-examples</b>
> </pre>

In the next section we give a brief description of the [batch files][windows_batch_file] present in this project.

## <span id="commands">Batch commands</span>

### **`setenv.bat`** <sup id="anchor_05">[5](#footnote_05)</sup>

We execute command [**`setenv.bat`**](setenv.bat) once to setup our development environment; it makes external tools such as [**`diff.exe`**][diff_cli], [**`git.exe`**][git_cli] and [**`make.exe`**][make_cli] directly available from the command prompt.

<pre style="font-size:80%;">
<b>&gt; <a href="setenv.bat">setenv</a></b>
Tool versions:
   adactl 1.22r16c, alr 2.1.0, gcc 13.4.0, gnat Community 2021,
   Gwindows 13-Apr-2024, make 4.4.1, code 1.105.1,
   git 2.51.1, diff 3.12, bash 5.2.37(1)

<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/where_1" rel="external">where</a> code diff git make</b>
C:\opt\VSCode\Code.exe
C:\opt\Git\usr\bin\diff.exe
C:\opt\Git\bin\git.exe
C:\opt\msys64\usr\bin\make.exe
</pre>

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Alire*** [↩](#anchor_01)

<dl><dd>
 <p>
 <a href="https://alire.ada.dev/docs/" rel="external">Alire</a> is a source-based package manager for the Ada and <a href="https://learn.adacore.com/courses/intro-to-spark/chapters/01_Overview.html#what-is-it" rel="external">SPARK</a> programming languages.
 </p>
 <p >
 We install <a href="https://alire.ada.dev/docs/" rel="external">Alire</a> from the Zip file <a href="https://github.com/alire-project/alire/releases" rel="external">alr-2.1.0-bin-x86_64-windows.zip</a>; the archive contains the two files <code>bin\alr.exe</code> and <code>LICENSE.txt</code> (GNU license). We simply copy them to directory <code>%GNAT_HOME%\bin\</code> (in our case <code>GNAT_HOME=C:\opt\GNAT\2021\</code>).
</dd></dl>

<span id="footnote_02">[2]</span> ***GNAT 2019*** [↩](#anchor_02)

<dl><dd>
<a href="https://www.adacore.com/download/more" rel="external">GNAT CE 2019</a> is the latest version of GNAT CE that supports <a href="https://en.wikipedia.org/wiki/Ada_Semantic_Interface_Specification" rel="external">ASIS</a>, which is required for running <a href="https://www.adalog.fr/en/adacontrol.html" rel="external">AdaControl 1.22</a>.
</dd></dl>

<span id="footnote_03">[3]</span> ***GNAT tools in MSYS2*** [↩](#anchor_03)

<dl><dd>
The <a href="http://repo.msys2.org/distrib/x86_64/" rel="external">MSYS64</a> software distribution also includes GNAT tools whose versions may differ from the GNAT CE distribution:
</dd>
<dd>
<pre style="font-size:80%;max-width:484px;">
  <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/where_1" rel="external">where</a> /r c:\opt\msys64 gnat.exe gnatmake.exe</b>
  c:\opt\msys64\mingw64\bin\gnat.exe
  c:\opt\msys64\mingw64\bin\<a href="https://gcc.gnu.org/onlinedocs/gcc-12.1.0/gnat_ugn/Running-gnatmake.html#Running-gnatmake" rel="external">gnatmake.exe</a>
  &nbsp;
  <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/where_1" rel="external">where</a> /r c:\opt\msys64 gcc.exe make.exe pacman.exe</b>
  c:\opt\msys64\mingw64\bin\gcc.exe
  c:\opt\msys64\usr\bin\make.exe
  c:\opt\msys64\usr\bin\<a href="https://www.archlinux.org/pacman/pacman.8.html" rel="external">pacman.exe</a>
</pre>
</dd>
<dd>
<a href=""><code>gnat.exe</code>/<code>gnatmake.exe</code></a>
<pre style="font-size:80%;">
  <b>&gt; %MSYS_HOME%\mingw64\bin\gnat.exe --version | <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> GNAT</b>
  GNAT 15.2.0
&nbsp;
  <b>&gt; %MSYS_HOME%\mingw64\bin\<a href="https://gcc.gnu.org/onlinedocs/gcc-12.1.0/gnat_ugn/Running-gnatmake.html#Running-gnatmake" rel="external">gnatmake.exe</a> --version | <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> GNAT</b>
  GNATMAKE 15.2.0
</pre>
</dd>
<dd>
<a href=""><code>gcc.exe</code>/<code>make.exe</code></a>
<pre style="font-size:80%;">
  <b>&gt; %MSYS_HOME%\mingw64\bin\<a href="https://gcc.gnu.org/onlinedocs/gcc/Invoking-GCC.html" rel="external">gcc.exe</a> --version | <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> gcc</b>
  gcc.exe (Rev6, Built by MSYS2 project) 15.2.0
  &nbsp;
  <b>&gt; %MSYS_HOME%\usr\bin\<a href="https://www.gnu.org/software/make/manual/make.html" rel="external">make.exe</a> --version | <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> Make</b>
  GNU Make 4.4.1
</pre>
</dd>

<dd>
<a href="https://wiki.archlinux.org/index.php/Pacman"><code>pacman.exe</code></a> helps us to keep our MSYS2 package <code>mingw-w64-x86_64-gcc-ada</code> up-to-date:
</dd>
<dd>
<pre style="font-size:80%;">
   <b>&gt; c:\opt\msys64\usr\bin\<a href="https://www.archlinux.org/pacman/pacman.8.html" rel="external">pacman.exe</a> -Syu mingw-w64-x86_64-gcc-ada</b>
   :: Synchronizing package databases...
   [...]
   :: Running post-transaction hooks...
   (1/3) Compiling GSettings XML schema files...
   (2/3) Updating icon theme caches...
   (3/3) Updating the info directory file...
</pre>
</dd></dl>

<span id="footnote_04">[4]</span> ***Downloads*** [↩](#anchor_04)

<dl><dd>
In our case we downloaded the following installation files (see <a href="#proj_deps">section 1</a>):
</dd>
<dd>
<pre style="font-size:80%;">
<a href="https://www.adalog.fr/en/adacontrol.html" rel="external">adactl-1.22r16c-exe_windows_ce2019.zip</a>              <i>( 26 MB)</i>
<a href="https://github.com/alire-project/alire/releases/" rel="external">alr-2.1.0-bin-x86_64-windows.zip</a>                    <i>( 11 MB)</i>
<a href="https://github.com/Maximus5/ConEmu/releases/tag/v23.07.24" rel="external">ConEmuPack.230724.7z</a>                                <i>(  5 MB)</i>
<a href="https://www.adacore.com/download/more">gnat-community-2019-20190517-x86_64-windows-bin.exe</a> <i>(380 MB)</i>
<a href="https://www.adacore.com/download" rel="external">gnat-2021-20210519-x86_64-windows64-bin.exe</a>         <i>(562 MB)</i>
<a href="https://www.adacore.com/download/more">gtkada-2021-x86_64-windows64-bin.exe</a>                <i>( 59 MB)</i>
<a href="https://sourceforge.net/projects/gnavi/files/">GWindows Archive 13-Apr-2024.zip</a>                    <i>(  4 MB)</i>
<a href="https://repo.msys2.org/distrib/x86_64/">msys2-x86_64-20240727.exe</a>                           <i>( 83 MB)</i>
<a href="https://git-scm.com/download/win">PortableGit-2.51.1-64-bit.7z.exe</a>                    <i>( 46 MB)</i>
<a href="https://code.visualstudio.com/Download#" rel="external">VSCode-win32-x64-1.105.1.zip</a>                        <i>(131 MB)</i>
</pre>
</dd></dl>

<span id="footnote_05">[5]</span> **`setenv.bat` *usage*** [↩](#anchor_05)

<dl><dd>
Batch file <a href=./setenv.bat><code><b>setenv.bat</b></code></a> has specific environment variables set that enable us to use command-line developer tools more easily.
</dd>
<dd>It is similar to the setup scripts described on the page <a href="https://learn.microsoft.com/en-us/visualstudio/ide/reference/command-prompt-powershell" rel="external">"Visual Studio Developer Command Prompt and Developer PowerShell"</a> of the <a href="https://learn.microsoft.com/en-us/visualstudio/windows" rel="external">Visual Studio</a> online documentation.
</dd>
<dd>
For instance we can quickly check that the two scripts <code>Launch-VsDevShell.ps1</code> and <code>VsDevCmd.bat</code> are indeed available in our Visual Studio 2019 installation :
<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where" rel="external">where</a> /r "C:\Program Files (x86)\Microsoft Visual Studio" *vsdev*</b>
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\Launch-VsDevShell.ps1
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\vsdevcmd\core\vsdevcmd_end.bat
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\vsdevcmd\core\vsdevcmd_start.bat
</pre>
</dd>
<dd>
Concretely, in our GitHub projects which depend on Visual Studio (e.g. <a href="https://github.com/michelou/cpp-examples"><code>michelou/cpp-examples</code></a>), <a href="./setenv.bat"><code><b>setenv.bat</b></code></a> does invoke <code><b>VsDevCmd.bat</b></code> (resp. <code><b>vcvarall.bat</b></code> for older Visual Studio versions) to setup the Visual Studio tools on the command prompt. 
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/October 2025* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[ada]: https://www.adacore.com/
[adactl_downloads]: https://www.adalog.fr/en/adacontrol.html
[akka_examples]: https://github.com/michelou/akka-examples#top
[alire_changes]: https://github.com/alire-project/alire/blob/master/doc/user-changes.md#release-20-dev
[alire_downloads]: https://github.com/alire-project/alire/releases/
[cobol_examples]: https://github.com/michelou/cobol-examples#top
[conemu_downloads]: https://github.com/Maximus5/ConEmu/releases
[conemu_relnotes]: https://conemu.github.io/blog/2023/07/24/Build-230724.html
[component_pascal_examples]: https://github.com/michelou/component-pascal-examples#top
[cpp_examples]: https://github.com/michelou/cpp-examples#top
[dafny_examples]: https://github.com/michelou/dafny-examples#top
[dart_examples]: https://github.com/michelou/dart-examples#top
[deno_examples]: https://github.com/michelou/deno-examples#top
[diff_cli]: https://man7.org/linux/man-pages/man1/diff.1.html
[docker_examples]: https://github.com/michelou/docker-examples#top
[erlang_examples]: https://github.com/michelou/erlang-examples#top
[flix_examples]: https://github.com/michelou/flix-examples#top
[git_cli]: https://git-scm.com/docs/git
[git_releases]: https://git-scm.com/download/win
[git_relnotes]: https://github.com/git/git/blob/v2.51.1/Documentation/RelNotes/2.51.1.adoc
[github_markdown]: https://github.github.com/gfm/
[gnat2019_downloads]: https://www.adacore.com/download/more
[gnat2021_announcement]: https://blog.adacore.com/gnat-community-2021-is-here
[gnat2021_downloads]: https://www.adacore.com/download
[gnavi]: https://sourceforge.net/projects/gnavi/
[golang_examples]: https://github.com/michelou/golang-examples#top
[graalvm_examples]: https://github.com/michelou/graalvm-examples#top
[gwindows_downloads]: https://sourceforge.net/projects/gnavi/files/
<!--
https://sourceforge.net/p/gnavi/news/2022/11/gwindows-release-13-nov-2022-revision-459/
https://sourceforge.net/p/gnavi/news/2023/05/gwindows-release-29-may-2023-revision-480/
https://sourceforge.net/p/gnavi/news/2024/04/gwindows-release-13-apr-2024-revision-549/
-->
[gwindows_relnotes]: https://sourceforge.net/p/gnavi/news/2024/04/gwindows-release-13-apr-2024-revision-549/
[haskell_examples]: https://github.com/michelou/haskell-examples#top
[kafka_examples]: https://github.com/michelou/kafka-examples#top
[kotlin_examples]: https://github.com/michelou/kotlin-examples#top
[linux_opt]: https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html
[llvm_examples]: https://github.com/michelou/llvm-examples#top
[m2_examples]: https://github.com/michelou/m2-examples#top
[make_cli]: https://www.gnu.org/software/make/manual/html_node/Options-Summary.html
[man1_awk]: https://www.linux.org/docs/man1/awk.html
[man1_diff]: https://www.linux.org/docs/man1/diff.html
[man1_file]: https://www.linux.org/docs/man1/file.html
[man1_grep]: https://www.linux.org/docs/man1/grep.html
[man1_more]: https://www.linux.org/docs/man1/more.html
[man1_mv]: https://www.linux.org/docs/man1/mv.html
[man1_rmdir]: https://www.linux.org/docs/man1/rmdir.html
[man1_sed]: https://www.linux.org/docs/man1/sed.html
[man1_wc]: https://www.linux.org/docs/man1/wc.html
[msys2_changelog]: https://github.com/msys2/setup-msys2/blob/main/CHANGELOG.md
[msys2_downloads]: http://repo.msys2.org/distrib/x86_64/
[nodejs_examples]: https://github.com/michelou/nodejs-examples#top
[rust_examples]: https://github.com/michelou/rust-examples#top
[scala3_examples]: https://github.com/michelou/dotty-examples#top
[sml_examples]: https://github.com/michelou/sml-examples#top
[spark_examples]: https://github.com/michelou/spark-examples#top
[spring_examples]: https://github.com/michelou/spring-examples#top
[trufflesqueak_examples]: https://github.com/michelou/trufflesqueak-examples#top
[unix_opt]: https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html
[vscode_downloads]: https://code.visualstudio.com/#alt-downloads
[vscode_relnotes]: https://code.visualstudio.com/updates
[windows_batch_file]: https://en.wikibooks.org/wiki/Windows_Batch_Scripting
[windows_limitation]: https://support.microsoft.com/en-gb/help/830473/command-prompt-cmd-exe-command-line-string-limitation
[windows_subst]: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/subst
[wix_examples]: https://github.com/michelou/wix-examples#top
[zig_examples]: https://github.com/michelou/zig-examples#top
[zip_archive]: https://www.howtogeek.com/178146/htg-explains-everything-you-need-to-know-about-zipped-files/

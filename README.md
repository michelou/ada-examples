# <span id="top">Playing with Ada on Windows</span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:25%;"><a href="https://www.adacore.com/" rel="external"><img src="docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This repository gathers <a href="https://www.adacore.com/" rel="external" title="Ada">Ada</a> code examples coming from various websites and books.<br/>
  It also includes several build scripts (<a href="https://en.wikibooks.org/wiki/Windows_Batch_Scripting" rel="external">batch files</a>, <a href="https://makefiletutorial.com/" rel="external">Make scripts</a>) for experimenting with <a href="https://www.adacore.com/" rel="external">Ada</a> on a Windows machine.
  </td>
  </tr>
</table>

[Akka][akka_examples], [C++][cpp_examples], [Dart][dart_examples], [Deno][deno_examples], [Flix][flix_examples], [Golang][golang_examples], [GraalVM][graalvm_examples], [Haskell][haskell_examples], [Kafka][kafka_examples], [Kotlin][kotlin_examples], [LLVM][llvm_examples], [Node.js][nodejs_examples], [Rust][rust_examples], [Scala 3][scala3_examples], [Spark][spark_examples], [Spring][spring_examples], [TruffleSqueak][trufflesqueak_examples] and [WiX Toolset][wix_examples] are other topics we are continuously monitoring.

## <span id="proj_deps">Project dependencies</span>

This project depends on the following external software for the **Microsoft Windows** platform:

- [Git 2.39][git_releases] ([*release notes*][git_relnotes])
- [GNAT CE 2021][gnat2021_downloads] ([*announcement*][gnat2021_announcement])

Optionally one may also install the following software:

- [AdaControl 1.22][adactl_downloads]
- [Alire 1.2][alire_downloads] <sup id="anchor_01">[1](#footnote_01)</sup> ([*changes*][alire_changes])
- [GNAT CE 2019][gnat2019_downloads] <sup id="anchor_02">[2](#footnote_02)</sup>
- [GWindows][gwindows_downloads] ([*release notes*][gwindows_relnotes])
- [MSYS2 2022][msys2_downloads] <sup id="anchor_03">[3](#footnote_03)</sup>

> **&#9755;** ***Installation policy***<br/>
> When possible we install software from a [Zip archive][zip_archive] rather than via a Windows installer. In our case we defined **`C:\opt\`** as the installation directory for optional software tools (*in reference to* the [`/opt/`][linux_opt] directory on Unix).

For instance our development environment looks as follows (February 2023) <sup id="anchor_04">[4](#footnote_04)</sup>:

<pre style="font-size:80%;">
C:\opt\adactl-1.22r16c\  <i>( 79 MB)</i>
C:\opt\Git-2.39.1\       <i>(314 MB)</i>
C:\opt\GNAT\2019\        <i>(1.1 GB)</i>
C:\opt\GNAT\2021\        <i>(2.8 GB)</i>
C:\opt\msys64\           <i>(2.8 GB)</i>
</pre>

> **:mag_right:** [Git for Windows][git_releases] provides a BASH emulation used to run [**`git.exe`**][git_cli] from the command line (as well as over 250 Unix commands like [**`awk`**][man1_awk], [**`diff`**][man1_diff], [**`file`**][man1_file], [**`grep`**][man1_grep], [**`more`**][man1_more], [**`mv`**][man1_mv], [**`rmdir`**][man1_rmdir], [**`sed`**][man1_sed] and [**`wc`**][man1_wc]).

## <span id="structure">Directory structure</span> [**&#x25B4;**](#top)

This project is organized as follows:
<pre style="font-size:80%;">
<a href="docs/">docs\</a>
<a href="aunit-examples/">aunit-examples\</a>{<a href="aunit-examples/README.md">README.md</a>, <a href="aunit-examples/calculator/">calculator</a>, etc.}
<a href="examples/">examples\</a>{<a href="examples/README.md">README.md</a>, <a href="examples/Greetings">Greetings</a>, etc.}
<a href="gwindows-examples/">gwindows-examples\</a>{<a href="gwindows-examples/README.md">README.md</a>, <a href="gwindows-examples/tutorial1">tutorial1</a>, etc.}
<a href="intro-to-ada/">intro-to-ada\</a>{<a href="intro-to-ada/README.md">README.md</a>, <a href="intro-to-ada/Greet/">Greet</a>, <a href="intro-to-ada/Week/">Week</a>, etc.}
<a href="shvets-examples/">shvets-examples\</a>{<a href="shvets-examples/README.md">README.md</a>, <a href="shvets-examples/ch02">ch02</a>, <a href="shvets-examples/ch03">ch03</a>, etc.}
README.md
<a href="RESOURCES.md">RESOURCES.md</a>
<a href="setenv.bat">setenv.bat</a>
<a href="SETUP.md">SETUP.md</a>
</pre>

where

- directory [**`docs\`**](docs/) contains [Ada] related documents.
- directory [**`aunit-examples\`**](aunit-examples/) contains [Ada] code examples from GitHub project [`AdaCore/aunit`](https://github.com/AdaCore/aunit).
- directory [**`examples\`**](examples/) contains [Ada] code examples grabbed from various websites.
- directory [**`gwindows-examples\`**](./gwindows-examples/) contains [GNAVI] code examples (see [`README.md`](./gwindows-examples/README.md))
- directory [**`intro-to-ada\`**](intro-to-ada/) contains [Ada] code examples from AdaCore's course <a href="https://learn.adacore.com/courses/intro-to-ada" rel="external">*Introduction to Ada*</a>.
- directory [**`shvets-examples`**](./shvets-examples/) contains [Ada] code examples from Shvets's book <a href="https://www.apress.com/9781484254271" rel="external">*Beginning Ada Programming*</a>.
- file [**`README.md`**](README.md) is the [Markdown][github_markdown] document for this page.
- file [**`RESOURCES.md`**](RESOURCES.md) gathers [Ada] related informations.
- file [**`setenv.bat`**](setenv.bat) is the batch script for setting up our environment.
- file [**`SETUP.md`**](SETUP.md) gathers environment setup informations.


We also define a virtual drive **`W:`** in our working environment in order to reduce/hide the real path of our project directory (see article ["Windows command prompt limitation"][windows_limitation] from Microsoft Support).
> **:mag_right:** We use the Windows external command [**`subst`**][windows_subst] to create virtual drives; for instance:
>
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/subst">subst</a> W: <a href="https://docs.microsoft.com/en-us/windows/deployment/usmt/usmt-recognized-environment-variables#bkmk-2">%USERPROFILE%</a>\workspace\ada-examples</b>
> </pre>

In the next section we give a brief description of the [batch files][windows_batch_file] present in this project.

## <span id="commands">Batch commands</span>

### **`setenv.bat`**

Command [**`setenv.bat`**](setenv.bat) is executed once to setup our development environment; it makes external tools such as [**`git.exe`**][git_cli] and [**`make.exe`**][make_cli] directly available from the command prompt.

<pre style="font-size:80%;">
<b>&gt; <a href="setenv.bat">setenv</a></b>
Tool versions:
   gcc 10.3.1, gnat Community 2021, make 4.4,
   git 2.39.1.windows.1, diff 3.8, bash 5.2.12(1)-release

<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/where_1" rel="external">where</a> git make</b>
C:\opt\Git-2.39.1\bin\git.exe
C:\opt\msys64\usr\bin\make.exe
</pre>

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Alire*** [↩](#anchor_01)

<dl><dd>
 <p>
 <a href="https://alire.ada.dev/docs/">Alire</a> is a source-based package manager for the Ada and SPARK programming languages.
 </p>
 <p >
 We install <a href="https://alire.ada.dev/docs/">Alire</a> from the Zip file <a href="https://github.com/alire-project/alire/releases" rel="external">alr-1.2.2-bin-x86_64-windows.zip</a>; the archive contains the two files <code>bin\alr.exe</code> and <code>LICENSE.txt</code> (GNU license). We simply copy them to directory <code>%GNAT_HOME%</code> (in our case <code>GNAT_HOME=C:\opt\GNAT\2021\</code>).
</dd></dl>

<span id="footnote_02">[2]</span> ***GNAT 2019*** [↩](#anchor_02)

<dl><dd>
<a href="https://www.adacore.com/download/more" rel="external">GNAT CE 2019</a> is the latest version of GNAT CE that supports <a href="https://en.wikipedia.org/wiki/Ada_Semantic_Interface_Specification">ASIS</a>, which is required for running <a href="https://www.adalog.fr/en/adacontrol.html">AdaControl 1.22</a>.
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
  <b>&gt; c:\opt\msys64\mingw64\bin\gnat.exe --version | <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> GNAT</b>
  GNAT 12.2.0
&nbsp;
  <b>&gt; c:\opt\msys64\mingw64\bin\<a href="https://gcc.gnu.org/onlinedocs/gcc-12.1.0/gnat_ugn/Running-gnatmake.html#Running-gnatmake" rel="external">gnatmake.exe</a> --version | <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> GNAT</b>
  GNATMAKE 12.2.0
</pre>
</dd>
<dd>
<a href=""><code>gcc.exe</code>/<code>make.exe</code></a>
<pre style="font-size:80%;">
  <b>&gt; c:\opt\msys64\mingw64\bin\<a href="https://gcc.gnu.org/onlinedocs/gcc/Invoking-GCC.html" rel="external">gcc.exe</a> --version | <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> gcc</b>
  gcc.exe (Rev6, Built by MSYS2 project) 12.2.0
  &nbsp;
  <b>&gt; c:\opt\msys64\usr\bin\<a href="https://www.gnu.org/software/make/manual/make.html" rel="external">make.exe</a> --version | <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> Make</b>
  GNU Make 4.4
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
<a href="https://github.com/alire-project/alire/releases/" rel="external">alr-1.2.2-bin-x86_64-windows.zip</a>                    <i>(  9 MB)</i>
<a href="https://www.adacore.com/download/more">gnat-community-2019-20190517-x86_64-windows-bin.exe</a> <i>(380 MB)</i>
<a href="https://www.adacore.com/download" rel="external">gnat-2021-20210519-x86_64-windows64-bin.exe</a>         <i>(562 MB)</i>
<a href="https://www.adacore.com/download/more">gtkada-2021-x86_64-windows64-bin.exe</a>                <i>( 59 MB)</i>
<a href="https://sourceforge.net/projects/gnavi/files/">GWindows Archive 13-Nov-2022.zip</a>                    <i>(  4 MB)</i>
<a href="https://repo.msys2.org/distrib/x86_64/">msys2-x86_64-20220319.exe</a>                           <i>( 92 MB)</i>
<a href="https://git-scm.com/download/win">PortableGit-2.39.1-64-bit.7z.exe</a>                    <i>( 46 MB)</i>
</pre>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/February 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[ada]: https://www.adacore.com/
[adactl_downloads]: https://www.adalog.fr/en/adacontrol.html
[akka_examples]: https://github.com/michelou/akka-examples
[alire_changes]: https://github.com/alire-project/alire/blob/master/doc/user-changes.md#release-12
[alire_downloads]: https://github.com/alire-project/alire/releases/
[cpp_examples]: https://github.com/michelou/cpp-examples
[dart_examples]: https://github.com/michelou/dart-examples
[deno_examples]: https://github.com/michelou/deno-examples
[flix_examples]: https://github.com/michelou/flix-examples
[git_cli]: https://git-scm.com/docs/git
[git_releases]: https://git-scm.com/download/win
[git_relnotes]: https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.39.1.txt
[github_markdown]: https://github.github.com/gfm/
[gnat2019_downloads]: https://www.adacore.com/download/more
[gnat2021_announcement]: https://blog.adacore.com/gnat-community-2021-is-here
[gnat2021_downloads]: https://www.adacore.com/download
[gnavi]: https://sourceforge.net/projects/gnavi/
[golang_examples]: https://github.com/michelou/golang-examples
[graalvm_examples]: https://github.com/michelou/graalvm-examples
[gwindows_downloads]: https://sourceforge.net/projects/gnavi/files/
[gwindows_relnotes]: https://sourceforge.net/p/gnavi/news/2022/11/gwindows-release-13-nov-2022-revision-459/
[haskell_examples]: https://github.com/michelou/haskell-examples
[kafka_examples]: https://github.com/michelou/kafka-examples
[kotlin_examples]: https://github.com/michelou/kotlin-examples
[linux_opt]: https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html
[llvm_examples]: https://github.com/michelou/llvm-examples
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
[msys2_downloads]: http://repo.msys2.org/distrib/x86_64/
[nodejs_examples]: https://github.com/michelou/nodejs-examples
[rust_examples]: https://github.com/michelou/rust-examples
[scala3_examples]: https://github.com/michelou/dotty-examples
[spark_examples]: https://github.com/michelou/spark-examples
[spring_examples]: https://github.com/michelou/spring-examples
[trufflesqueak_examples]: https://github.com/michelou/trufflesqueak-examples
[unix_opt]: https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html
[windows_batch_file]: https://en.wikibooks.org/wiki/Windows_Batch_Scripting
[windows_limitation]: https://support.microsoft.com/en-gb/help/830473/command-prompt-cmd-exe-command-line-string-limitation
[windows_subst]: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/subst
[wix_examples]: https://github.com/michelou/wix-examples
[zip_archive]: https://www.howtogeek.com/178146/htg-explains-everything-you-need-to-know-about-zipped-files/

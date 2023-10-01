---
title: Make programming simple again
---

There's a [commentary](#my-bad-ill-advised-opinions) section that follows the
list, read it for purpose/background on this article. If you have suggestions,
please contact me or send a [github
PR](https://github.com/jjsullivan5196/jsullivan.cc/tree/master/content/blog/therealsuckless/index.md)
for this page.

# The List

## Consolidating implementation effort
The following sections highlight ideas that make it simpler to create and
inspect software systems.

### Fielding et al, Architectural Styles and the Design of Network-based Software Architectures
https://ics.uci.edu/~fielding/pubs/dissertation/top.htm

Roy Fielding's disseration on the design of networked applications and RESTful
architecture. Gives context to the design of modern hypermedia systems, HTTP,
the web and applications we build on top of it.

### htmx
https://htmx.org/docs/

Library that implements a modern hypermedia client in any web browser, rather
than writing a different one every time you make a webapp.

### Rich Hickey on REPLs
https://nextjournal.com/mk/rich-hickey-on-repls

REPLs aren't just about evaluating code interactively, they're a well-defined
entrypoint for the programmer to modify and inspect a system. The ceremony is
well-organized and specifically tailored to this purpose, you send data to the
program, the program evaluates it, and you get data back. Also see the linked
talk by Nada Amin, which evaluates this concept from the perspective of
implementing languages.

### Cosmopolitan LibC
https://www.youtube.com/watch?v=1ZTRb-2DZGs
https://justine.lol/cosmopolitan/index.html
https://redbean.dev/

Cosmo is a gargantuan effort to create a C library that can target multiple
platforms at once in a single binary. It has one abstraction over the system
layer that largely emulates the amd64 ABI for Linux, meaning that most
applications made for Linux can run natively on any major operating system. It
also bundles necessary functions for common tasks like HTTP servers or
multimedia manipulation. Redbean is a small application server linked against
cosmo that provides the equivalent of a full LAMP stack in one program, one
executable file that is your entire application, with its code and database state.

### Forth metacompilation
https://www.ultratechnology.com/meta.html#minmeta
https://arduino-forth.com/article/FORTH_metacompilation_intro
https://pygmy.utoh.org/pygmyforth.html

Forth is a very small programming language, phrased more as an abstract stack
machine. The machine executes words, which are procedures that manipulate data
on a shared stack. Typically the machine is defined in terms of primitive words,
implemented in native machine code. Forth metacompilers allow for this abstract
machine to be defined in Forth itself, creating a very tight loop for designing
other Forth systems.

### Bootstrapping the Forth language from a 3-instruction interpreter
https://pygmy.utoh.org/3ins4th.html

From Frank Sergeant. Essentially describes a generic protocol for a [machine
code monitor](https://en.wikipedia.org/wiki/Machine_code_monitor) over a serial
port. Using only peek, poke, and essentially a CALL instruction, a full Forth
machine can be implemented on the target from any programming language.

## Prior art
Well-executed attempts at creating a cohesive software development system

### Smalltalk-80 on the Xerox Alto
https://youtu.be/uknEhXyZgsg?si=69rb8E0Lljtr-w1E
https://computerhistory.org/blog/smalltalk-at-50/

### Hypercard!
https://www.youtube.com/watch?v=2K1C5BZKP3I

### The Self Programming Language (Java and Javascript's Dad)
https://selflanguage.org/

Self was the breeding ground for what eventually became the JVM platform and
Javascript's prototypal object system. It was a pioneer in language VM
implementation, aiming to create an entire development environment and runtime
in the same programming language.

### Genera and S-Graphics
https://www.youtube.com/watch?v=gV5obrYaogU

A complete 3D and compositing solution all running on a Symbolics Lisp Machine.
Later became the software basis for SGI and its many licensed development kits.

### Steel Bank Common Lisp
https://www.sbcl.org/porting.html

Common Lisp implementation written in itself, build process can almost skip a C
compiler.

### Oberon
https://en.wikipedia.org/wiki/Oberon_(operating_system)
https://www.youtube.com/watch?v=OJGnpmnXR5w

A complete operating system implemented in a Pascal-like language. All
interactions with the system are done thru rich text documents that can embed
programs and various objects. Running code is as simple as clicking a hyperlink.

### BTRON
https://youtu.be/7RNbIEJvjUA?si=rYcdjt8D22oHGokS&t=1505
https://en.wikipedia.org/wiki/BTRON

A core component of Japan's TRON computer platform, was meant to be a
programming environment working on the scale of the web. All resources were
presented as inspectable objects, much like Smalltalk. These could represent
simple data, hypermedia documents, remote machines, or collections of other
objects.

### Rebol
http://www.rebol.com/what-rebol.html

### PygmyForth
https://pygmy.utoh.org/pygmyforth.html

A complete Forth system for DOS that can recompile itself. Includes facilities
for interactive development and debugging.

### SmithForth
https://dacvs.neocities.org/SF/
https://www.youtube.com/watch?v=9MSJGzYELBA

A Forth 2012 compliant system implemented in legible amd64 machine code. The
interpreter bootstraps from a byte-delimited read-protocol, which defines the
primitive Forth words directly in machine code. After startup, a full Forth
system can be used to compile and run code interactively.

### JonesForth
https://github.com/nornagon/jonesforth/blob/master/jonesforth.S

Forth implemented in x86 assembler, complete with inline documentation and
diagrams explaining how it works.

## Cool stuff happening today

### GraalVM and self-hosted Java
https://www.graalvm.org/latest/reference-manual/java-on-truffle/

### Development of the UEFI ecosystem
https://stackoverflow.com/a/53057494
https://www.linuxboot.org/

## Unix haters
And they're right

### Stop Writing Dead Programs
https://www.youtube.com/watch?v=8Ab3ArE8W3s

### Replacing the UNIX tradition
https://youtu.be/L9v4Mg8wi4U

### More powerful primitives
https://dercuano.github.io/notes/powerful-primitives.html

# My bad, ill-advised opinions

This article is an annotated reading list that tracks tools for better
understanding how software is
[made](https://en.wikipedia.org/wiki/Lambda_calculus) and
[run](https://en.wikipedia.org/wiki/Turing_machine) on
[machines](https://en.wikipedia.org/wiki/Von_Neumann_architecture). It will be
loaded with a lot of my own wacky opinions of how bad software and computers
are, since it is my main motivation for constantly looking for more of these
materials.

More specifically, I want to understand why the engineering distance between a
machine and the practical applications it performs is so inordinately large. We
have excellent, high-level programming languages with appropriate primitives to
build world-scale systems, but God forbid you want to talk to a
[graphics](https://gist.github.com/Overv/7ac07356037592a121225172d7d78f2d)
[device](https://youtu.be/_36yNWw_07g?si=ne3IAwWmQEcEk6e3) and have it do a cool
trick you just thought up, or create your own [programming
language](https://llvm.org/docs/GettingStarted.html), or any number of
applications that involve negotiating with some platform. 

Smalltalk, all the way back in the 1980s, did solve all the problems related to
bootstrapping a complete programming system from bare metal, and you could
inspect any layer of that solution with the same exact tools you use to write
applications. Why can't we do that today? Why can't we create a closed
abstraction of a machine that any platform or language can use?

I lay the blame with our development tools being inadequate for understanding a
complete system as a whole, from hardware & platforms to the software that runs
on them. Any programmer should be able to spend an afternoon in any programming
language and be able to have a small kernel program that can file your taxes and
send HTTP requests on nearly anything that can run code. However, we often get
stuck in what is the right language not for the application we are making, but
rather how this language can eventually target some CPU, operating system, VM
hypervisor, container framework, web browser, game console, and so on. Even when
you do have merely adequate tools for development, they often grow legs and run
far away from your language of choice, ask you to suffer hours of tutorials or
documentation that doesn't generalize, or bring [all their 50+ year old
friends](https://github.com/emacs-mirror/emacs) to give you some light reading.

Considering our platform is a fine problem to have, but in the end it shouldn't
be something that restricts our ability to use the right tool for the problem
we're trying to solve. Platforms offer us primitives to run code, languages
arrange those primitives into useful tools for solving problems. Programming
languages should offer us the ability to solve both our application and
platform-related problems in a generic way. Despite this, we settle for [worse
is better](https://en.wikipedia.org/wiki/Worse_is_better) and have bespoke,
cryptic and non-portable solutions for abstracting over platforms. See the
demand for win32 emulation, Valve basically adopting the WINE project, the C
programming language being unable to die, and the success of Docker for evidence
of platforms being more than platforms.

Even the [conceptual](https://en.wikipedia.org/wiki/GraphQL)
[machines](https://www.destroyallsoftware.com/talks/wat) we build on top of the
real ones don't make our programs easier to comprehend. Often they ignore
[years](https://en.wikipedia.org/wiki/Self_(programming_language)) of research
work, or they haphazardly cherry pick features for some particular reason (often
not good reasons) to the
[detriment](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)
of the overall system being transparent to the person who works with it.

I enjoy masochistically pretending I can do something about all of this, so I
spend a lot of time messing with compilers and other such tools to see how we
can simplify the process of making great applications. This list documents some
of the resources I've collected to gain some insight on this issue and prior
attempts at making better tools for software development.
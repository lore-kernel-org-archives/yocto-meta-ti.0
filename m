Return-Path: <exosyst@gmail.com>
Received: from mail-pz0-f48.google.com (mail-pz0-f48.google.com
	[209.85.210.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 192BCE013EB
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 09:32:38 -0700 (PDT)
Received: by dadz8 with SMTP id z8so1549146dad.35
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 09:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=H81cHFQUPjN9fMYjz5WaNkQkpWAGj0HnNyoyRh99gt4=;
	b=uBkMn9H0AAj5tBNDlCpDAQylSa8HZBplIQs6+e4uwUditSGTK5oKIbiynGYKqGPQx7
	4s+dcQaM10UZZW7wISMXK/N4jo4jdMQuiKTb8dMov68lMytRNQFi9+tSC2kiY+SfFV1K
	fWd2yWZiBZYXm4FmB/EvZxXZTO2S2lRAanDdgs8H6cJHbTyKPGHh/6Y9BijRR8M37IxA
	msCGbmwR0i5DuxhC6ccMwCUXbETPYzrXYk6sXpzL3qdYmyoDovif2FdpmrF3IvtmqU7g
	zICNIOiL8MzF1RpPsRJGRVW2+aasjAergznYMTFIYAGMzwOCNOrwqdc/qQLB5VffzMV2
	j6HQ==
Received: by 10.68.221.39 with SMTP id qb7mr17730884pbc.120.1337185950749;
	Wed, 16 May 2012 09:32:30 -0700 (PDT)
MIME-Version: 1.0
Sender: exosyst@gmail.com
Received: by 10.68.204.162 with HTTP; Wed, 16 May 2012 09:32:09 -0700 (PDT)
In-Reply-To: <CAMKF1sq1+NSzD3WWTVJLrxJDXuzkA_w9hO7r4WrTL1CFe3hD_Q@mail.gmail.com>
References: <CAN-pQATO_EjYx2g5oM5Hja-FawTOy00wOBkDFEgutwaCRh1kxQ@mail.gmail.com>
	<CAN-pQAT-__u2-f6YiM307YeDUUeUOCOx9=AQ3+rZJBVU1sXSJA@mail.gmail.com>
	<CAMKF1sq1+NSzD3WWTVJLrxJDXuzkA_w9hO7r4WrTL1CFe3hD_Q@mail.gmail.com>
From: Nick G <exosyst+metaTI@gmail.com>
Date: Wed, 16 May 2012 17:32:09 +0100
X-Google-Sender-Auth: JWMkBa8VEqF50z_aQrFBukU3Jp4
Message-ID: <CAN-pQAS=L-VKUYqYRNqYHGOrhHf69KjZJ0PGFtFjJHccefHGng@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Building issues with meta-toolchain on Beaglebone
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 16 May 2012 16:32:38 -0000
Content-Type: multipart/alternative; boundary=e89a8ff2568897d30004c029dd79

--e89a8ff2568897d30004c029dd79
Content-Type: text/plain; charset=ISO-8859-1

On 16 May 2012 17:25, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 16, 2012 at 12:26 AM, Nick G <exosyst+metaTI@gmail.com> wrote:
> > Hey guys,
> >
> >
> > I'm basing this on poky-denzil with the denzil branch of meta-oe and
> meta-ti
> > checked out as well.
> > I set my machine to be beaglebone and added meta-oe and meta-ti to the
> > config options and managed to successfully build the core-image-minimal
> > using bitbake. I now want to generate a standalone toolchain which, *I
> > believe* is done with meta-toolchain (please correct me if I'm wrong).
> >
>
> thats right
>
> > Unfortunately this fails with the rather long error I'll post below for
> > search engines' sake.
> >
> > Is this a known bug? Is there a workaround?
> >
> > Thanks,
> > Nick
> >
> > | checking how to run the C preprocessor...  arm-poky-linux-gnueabi-gcc
> -E
> > | configure: error: in
> >
> `/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/arm-poky-linux-gnueabi/libgcc':
> > | configure: error: C preprocessor " arm-poky-linux-gnueabi-gcc -E" fails
> > sanity check
>
> these errors happen if some prerequisite did not get staged properly.
> Can you reproduce it everytime ? e.g. building from scratch ? you can
> send the config.log
> that sits on top of gcc-canadian-cross builddir that will have additional
> info
>

Hey Khem,

I clobbered the tree and built from Git instead which worked and in the
process of writing it up so can't provide more information but I do have
the config.log so hopefully that should help. I could recreate it each time
I tried to use the denzil branch but couldn't afford to spend too much time
debugging it so I moved on.

It would've been possible to do a git bisect to find where the bug occurred
but if it was just something wrong with my prerequisites then I'll have to
write it off to bad luck.

I had to make some changes to even the git version but that seems to be a
case of some patches lying unmerged so no biggy.

Thanks for your reply,
Nick

[nick@zeus beaglebone]$ cat
./tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/arm-poky-linux-gnueabi/libgcc/config.log
This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by GNU C Runtime Library configure 1.0, which was
generated by GNU Autoconf 2.64.  Invocation command line was

  $
/media/scratch/poky-denzil-7.0/beaglebone/tmp/work-shared/gcc-4.6.3+svnr184847-r25/gcc-4_6-branch/libgcc/configure
--cache-file=./config.cache --with-cross-host=i686-pokysdk-linux
--prefix=/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr
--exec_prefix=/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr
--bindir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi
--sbindir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi
--libexecdir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi
--datadir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/share
--sysconfdir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/etc
--sharedstatedir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/com
--localstatedir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/var
--libdir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi
--includedir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/include
--oldincludedir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/include
--infodir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/share/info
--mandir=/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/share/man
--disable-silent-rules --disable-dependency-tracking
--with-libtool-sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-nativesdk-pokysdk-linux
--with-gnu-ld --enable-shared --enable-threads=posix --disable-multilib
--enable-c99 --enable-long-long --enable-symvers=gnu --enable-libstdcxx-pch
--enable-target-optspace --enable-lto --enable-libssp --disable-bootstrap
--with-system-zlib --with-linker-hash-style=gnu --enable-cheaders=c_global
--with-local-prefix=/opt/poky/1.2/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr
--with-gxx-include-dir=/opt/poky/1.2/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr/include/c++
--with-build-time-tools=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/arm-poky-linux-gnueabi/bin
--with-sysroot=/opt/poky/1.2/sysroots/armv7a-vfp-neon-poky-linux-gnueabi
--with-build-sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--disable-libunwind-exceptions --disable-libssp --disable-libgomp
--disable-libmudflap --enable-nls --enable-__cxa_atexit
--enable-languages=c,c++,lto
--program-transform-name=s&^&arm-poky-linux-gnueabi-&
--disable-option-checking --with-target-subdir=arm-poky-linux-gnueabi
--build=i686-linux --host=arm-poky-linux-gnueabi
--target=arm-poky-linux-gnueabi
--srcdir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/work-shared/gcc-4.6.3+svnr184847-r25/gcc-4_6-branch/libgcc

## --------- ##
## Platform. ##
## --------- ##

hostname = zeus
uname -m = i686
uname -r = 3.3.4-4.fc17.i686
uname -s = Linux
uname -v = #1 SMP Fri May 4 18:07:55 UTC 2012

/usr/bin/uname -p = i686
/bin/uname -X     = unknown

/bin/arch              = i686
/usr/bin/arch -k       = unknown
/usr/convex/getsysinfo = unknown
/usr/bin/hostinfo      = unknown
/bin/machine           = unknown
/usr/bin/oslevel       = unknown
/bin/universe          = unknown

PATH:
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/bin/i686-pokysdk-linux
PATH:
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi
PATH:
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-nativesdk-pokysdk-linux/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/crossscripts
PATH:
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/sbin
PATH:
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/bin
PATH: /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/sbin
PATH: /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux//bin
PATH: /media/scratch/poky-denzil-7.0/scripts
PATH: /media/scratch/poky-denzil-7.0/bitbake/bin/
PATH: /usr/lib/ccache
PATH: /usr/local/bin
PATH: /bin
PATH: /usr/bin
PATH: /usr/local/sbin
PATH: /usr/sbin
PATH: /home/nick/.local/bin
PATH: /home/nick/bin
PATH: /media/scratch/poky-denzil-7.0/scripts
PATH: /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686//bin


## ----------- ##
## Core tests. ##
## ----------- ##

configure:1742: creating cache ./config.cache
configure:1903: checking for --enable-version-specific-runtime-libs
configure:1916: result: no
configure:1964: checking for a BSD-compatible install
configure:2032: result: /bin/install -c
configure:2048: checking for gawk
configure:2075: result: gawk
configure:2095: checking build system type
configure:2109: result: i686-pc-linux-gnu
configure:2129: checking host system type
configure:2142: result: arm-poky-linux-gnueabi
configure:2245: checking for arm-poky-linux-gnueabi-ar
configure:2272: result: arm-poky-linux-gnueabi-ar
configure:2337: checking for arm-poky-linux-gnueabi-lipo
configure:2364: result: arm-poky-linux-gnueabi-lipo
configure:2429: checking for arm-poky-linux-gnueabi-nm
configure:2456: result: arm-poky-linux-gnueabi-nm
configure:2521: checking for arm-poky-linux-gnueabi-ranlib
configure:2548: result: arm-poky-linux-gnueabi-ranlib
configure:2613: checking for arm-poky-linux-gnueabi-strip
configure:2640: result: arm-poky-linux-gnueabi-strip
configure:2702: checking whether ln -s works
configure:2706: result: yes
configure:2723: checking for arm-poky-linux-gnueabi-gcc
configure:2750: result:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone

configure:3019: checking for C compiler version
configure:3028:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--version >&5
arm-poky-linux-gnueabi-gcc (GCC) 4.6.4 20120303 (prerelease)
Copyright (C) 2011 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

configure:3039: $? = 0
configure:3028:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
-v >&5
Using built-in specs.
COLLECT_GCC=arm-poky-linux-gnueabi-gcc
COLLECT_LTO_WRAPPER=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/lto-wrapper
Target: arm-poky-linux-gnueabi
Configured with:
/media/scratch/poky-denzil-7.0/beaglebone/tmp/work-shared/gcc-4.6.3+svnr184847-r25/gcc-4_6-branch/configure
--build=i686-linux --host=i686-linux --target=arm-poky-linux-gnueabi
--prefix=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr
--exec_prefix=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr
--bindir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi
--sbindir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi
--libexecdir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi
--datadir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/share
--sysconfdir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/etc
--sharedstatedir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/com
--localstatedir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/var
--libdir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi
--includedir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/include
--oldincludedir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/include
--infodir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/share/info
--mandir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/share/man
--disable-silent-rules --disable-dependency-tracking
--with-libtool-sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux
--with-gnu-ld --enable-shared --enable-languages=c,c++
--enable-threads=posix --disable-multilib --enable-c99 --enable-long-long
--enable-symvers=gnu --enable-libstdcxx-pch
--program-prefix=arm-poky-linux-gnueabi- --enable-target-optspace
--enable-lto --enable-libssp --disable-bootstrap --disable-libgomp
--disable-libmudflap --with-system-zlib --with-linker-hash-style=gnu
--enable-cheaders=c_global
--with-local-prefix=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beagleboard/usr
--with-gxx-include-dir=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beagleboard/usr/include/c++
--with-sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beagleboard
--with-build-sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beagleboard
--enable-poison-system-directories
--with-headers=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beagleboard/usr/include
--disable-libunwind-exceptions
--with-mpfr=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr
--with-system-zlib --disable-nls --enable-__cxa_atexit
Thread model: posix
gcc version 4.6.4 20120303 (prerelease) (GCC)
configure:3039: $? = 0
configure:3028:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
-V >&5
arm-poky-linux-gnueabi-gcc: error: unrecognized option '-V'
arm-poky-linux-gnueabi-gcc: fatal error: no input files
compilation terminated.
configure:3039: $? = 1
configure:3028:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
-qversion >&5
arm-poky-linux-gnueabi-gcc: error: unrecognized option '-qversion'
arm-poky-linux-gnueabi-gcc: fatal error: no input files
compilation terminated.
configure:3039: $? = 1
configure:3055:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
-o conftest -g -Os   conftest.c  >&5
configure:3058: $? = 0
configure:3087: checking for C compiler default output file name
configure:3109:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
-g -Os   conftest.c  >&5
configure:3113: $? = 0
configure:3150: result: a.out
configure:3166: checking whether the C compiler works
configure:3194: result: yes
configure:3201: checking whether we are cross compiling
configure:3203: result: yes
configure:3206: checking for suffix of executables
configure:3213:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
-o conftest -g -Os   conftest.c  >&5
configure:3217: $? = 0
configure:3239: result:
configure:3246: checking for suffix of object files
configure:3268:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
-c -g -Os  conftest.c >&5
configure:3272: $? = 0
configure:3293: result: o
configure:3297: checking whether we are using the GNU C compiler
configure:3316:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
-c -g -Os  conftest.c >&5
configure:3316: $? = 0
configure:3325: result: yes
configure:3334: checking whether  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
accepts -g
configure:3354:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
-c -g  conftest.c >&5
configure:3354: $? = 0
configure:3395: result: yes
configure:3412: checking for  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
option to accept ISO C89
configure:3476:  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
-c -g -Os  conftest.c >&5
configure:3476: $? = 0
configure:3489: result: none needed
configure:3514: checking how to run the C preprocessor
configure:3584: result:  arm-poky-linux-gnueabi-gcc -E
configure:3604:  arm-poky-linux-gnueabi-gcc -E  conftest.c
In file included from
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/include-fixed/syslimits.h:7:0,
                 from
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/include-fixed/limits.h:34,
                 from conftest.c:10:
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/include-fixed/limits.h:169:61:
error: no include path in which to search for limits.h
configure:3604: $? = 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "GNU C Runtime Library"
| #define PACKAGE_TARNAME "libgcc"
| #define PACKAGE_VERSION "1.0"
| #define PACKAGE_STRING "GNU C Runtime Library 1.0"
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE_URL "http://www.gnu.org/software/libgcc/"
| /* end confdefs.h.  */
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|              Syntax error
configure:3604:  arm-poky-linux-gnueabi-gcc -E  conftest.c
In file included from
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/include-fixed/syslimits.h:7:0,
                 from
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/include-fixed/limits.h:34,
                 from conftest.c:10:
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/include-fixed/limits.h:169:61:
error: no include path in which to search for limits.h
configure:3604: $? = 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "GNU C Runtime Library"
| #define PACKAGE_TARNAME "libgcc"
| #define PACKAGE_VERSION "1.0"
| #define PACKAGE_STRING "GNU C Runtime Library 1.0"
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE_URL "http://www.gnu.org/software/libgcc/"
| /* end confdefs.h.  */
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|              Syntax error
configure:3634: error: in
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/arm-poky-linux-gnueabi/libgcc':
configure:3637: error: C preprocessor " arm-poky-linux-gnueabi-gcc -E"
fails sanity check
See `config.log' for more details.

## ---------------- ##
## Cache variables. ##
## ---------------- ##

ac_cv_build=i686-pc-linux-gnu
ac_cv_c_compiler_gnu=yes
ac_cv_env_CC_set=set
ac_cv_env_CC_value=' arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
'
ac_cv_env_CFLAGS_set=set
ac_cv_env_CFLAGS_value='-g -Os'
ac_cv_env_CPPFLAGS_set=set
ac_cv_env_CPPFLAGS_value=
ac_cv_env_CPP_set=set
ac_cv_env_CPP_value=' arm-poky-linux-gnueabi-gcc -E'
ac_cv_env_LDFLAGS_set=set
ac_cv_env_LDFLAGS_value=
ac_cv_env_LIBS_set=
ac_cv_env_LIBS_value=
ac_cv_env_build_alias_set=set
ac_cv_env_build_alias_value=i686-linux
ac_cv_env_host_alias_set=set
ac_cv_env_host_alias_value=arm-poky-linux-gnueabi
ac_cv_env_target_alias_set=set
ac_cv_env_target_alias_value=arm-poky-linux-gnueabi
ac_cv_host=arm-poky-linux-gnueabi
ac_cv_objext=o
ac_cv_path_install='/bin/install -c'
ac_cv_prog_AR=arm-poky-linux-gnueabi-ar
ac_cv_prog_AWK=gawk
ac_cv_prog_CC=' arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
'
ac_cv_prog_CPP=' arm-poky-linux-gnueabi-gcc -E'
ac_cv_prog_LIPO=arm-poky-linux-gnueabi-lipo
ac_cv_prog_NM=arm-poky-linux-gnueabi-nm
ac_cv_prog_RANLIB=arm-poky-linux-gnueabi-ranlib
ac_cv_prog_STRIP=arm-poky-linux-gnueabi-strip
ac_cv_prog_cc_c89=
ac_cv_prog_cc_g=yes
lt_cv_sys_lib_dlsearch_path_spec='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi
/opt/poky/1.2/sysroots/i686-pokysdk-linux/lib'

## ----------------- ##
## Output variables. ##
## ----------------- ##

AR='arm-poky-linux-gnueabi-ar'
AWK='gawk'
CC=' arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
'
CFLAGS='-g -Os'
CPP=' arm-poky-linux-gnueabi-gcc -E'
CPPFLAGS=''
DEFS=''
ECHO_C=''
ECHO_N='-n'
ECHO_T=''
EXEEXT=''
INSTALL_DATA='${INSTALL} -m 644'
INSTALL_PROGRAM='${INSTALL}'
INSTALL_SCRIPT='${INSTALL}'
LDFLAGS=''
LIBOBJS=''
LIBS=''
LIPO='arm-poky-linux-gnueabi-lipo'
LN_S='ln -s'
LTLIBOBJS=''
MAINT='#'
NM='arm-poky-linux-gnueabi-nm'
OBJEXT='o'
PACKAGE_BUGREPORT=''
PACKAGE_NAME='GNU C Runtime Library'
PACKAGE_STRING='GNU C Runtime Library 1.0'
PACKAGE_TARNAME='libgcc'
PACKAGE_URL='http://www.gnu.org/software/libgcc/'
PACKAGE_VERSION='1.0'
PATH_SEPARATOR=':'
RANLIB='arm-poky-linux-gnueabi-ranlib'
SHELL='/bin/sh'
STRIP='arm-poky-linux-gnueabi-strip'
ac_ct_CC=''
asm_hidden_op=''
bindir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi'
build='i686-pc-linux-gnu'
build_alias='i686-linux'
build_cpu='i686'
build_libsubdir='build-i686-linux'
build_os='linux-gnu'
build_subdir='build-i686-linux'
build_vendor='pc'
datadir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/share'
datarootdir='${prefix}/share'
decimal_float=''
docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
dvidir='${docdir}'
enable_decimal_float=''
enable_shared='yes'
exec_prefix='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr'
extra_parts=''
fixed_point=''
host='arm-poky-linux-gnueabi'
host_alias='arm-poky-linux-gnueabi'
host_cpu='arm'
host_noncanonical='arm-poky-linux-gnueabi'
host_os='linux-gnueabi'
host_subdir='.'
host_vendor='poky'
htmldir='${docdir}'
includedir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/include'
infodir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/share/info'
libdir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi'
libexecdir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi'
libgcc_topdir='/media/scratch/poky-denzil-7.0/beaglebone/tmp/work-shared/gcc-4.6.3+svnr184847-r25/gcc-4_6-branch/libgcc/..'
localedir='${datarootdir}/locale'
localstatedir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/var'
mandir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/share/man'
oldincludedir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/include'
pdfdir='${docdir}'
prefix='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr'
program_transform_name='s&^&arm-poky-linux-gnueabi-&'
psdir='${docdir}'
sbindir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi'
set_have_cc_tls=''
set_use_emutls=''
sharedstatedir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/com'
slibdir='$(exec_prefix)/$(host_noncanonical)/lib'
sysconfdir='/opt/poky/1.2/sysroots/i686-pokysdk-linux/etc'
target_alias='arm-poky-linux-gnueabi'
target_noncanonical='arm-poky-linux-gnueabi'
target_subdir='arm-poky-linux-gnueabi'
tmake_file=''
toolexecdir='$(exec_prefix)/$(target_noncanonical)'
toolexeclibdir='$(toolexecdir)/lib'
vis_hide=''

## ----------- ##
## confdefs.h. ##
## ----------- ##

/* confdefs.h */
#define PACKAGE_NAME "GNU C Runtime Library"
#define PACKAGE_TARNAME "libgcc"
#define PACKAGE_VERSION "1.0"
#define PACKAGE_STRING "GNU C Runtime Library 1.0"
#define PACKAGE_BUGREPORT ""
#define PACKAGE_URL "http://www.gnu.org/software/libgcc/"

configure: exit 1

--e89a8ff2568897d30004c029dd79
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote">On 16 May 2012 17:25, Khem Raj <span dir=3D"=
ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D"im">On Wed, May 16, 2012 at 12:26 AM, Nick G &lt;<a href=3D"m=
ailto:exosyst%2BmetaTI@gmail.com">exosyst+metaTI@gmail.com</a>&gt; wrote:<b=
r>
&gt; Hey guys,<br>
&gt;<br>
&gt;<br>
&gt; I&#39;m basing this on poky-denzil with the denzil branch of meta-oe a=
nd meta-ti<br>
&gt; checked out as well.<br>
&gt; I set my machine to be beaglebone and added meta-oe and meta-ti to the=
<br>
&gt; config options and managed to successfully build the core-image-minima=
l<br>
&gt; using bitbake. I now want to generate a standalone toolchain which, *I=
<br>
&gt; believe* is done with meta-toolchain (please correct me if I&#39;m wro=
ng).<br>
&gt;<br>
<br>
</div>thats right<br>
<div class=3D"im"><br>
&gt; Unfortunately this fails with the rather long error I&#39;ll post belo=
w for<br>
&gt; search engines&#39; sake.<br>
&gt;<br>
&gt; Is this a known bug? Is there a workaround?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Nick<br>
&gt;<br>
</div><div class=3D"im">&gt; | checking how to run the C preprocessor...=A0=
 arm-poky-linux-gnueabi-gcc -E<br>
&gt; | configure: error: in<br>
&gt; `/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pok=
ysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build=
.i686-pokysdk-linux.arm-poky-linux-gnueabi/arm-poky-linux-gnueabi/libgcc&#3=
9;:<br>


&gt; | configure: error: C preprocessor &quot; arm-poky-linux-gnueabi-gcc -=
E&quot; fails<br>
&gt; sanity check<br>
<br>
</div>these errors happen if some prerequisite did not get staged properly.=
<br>
Can you reproduce it everytime ? e.g. building from scratch ? you can<br>
send the config.log<br>
that sits on top of gcc-canadian-cross builddir that will have additional i=
nfo<br>
</blockquote></div><br>Hey Khem,<br>
<br>
I clobbered the tree and built from Git instead which worked and in the pro=
cess of writing it up so can&#39;t provide more information but I do have t=
he config.log so hopefully that should help. I could recreate it each time =
I tried to use the denzil branch but couldn&#39;t afford to spend too much =
time debugging it so I moved on. <br>

<br>It would&#39;ve been possible to do a git bisect to find where the bug =
occurred but if it was just something wrong with my prerequisites then I&#3=
9;ll have to write it off to bad luck.<br><br>I had to make some changes to=
 even the git version but that seems to be a case of some patches lying unm=
erged so no biggy.<br>

<br>Thanks for your reply,<br>Nick<br><br>[nick@zeus beaglebone]$ cat ./tmp=
/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-=
r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/arm-poky=
-linux-gnueabi/libgcc/config.log<br>

This file contains any messages produced by compilers while<br>running conf=
igure, to aid debugging if configure makes a mistake.<br><br>It was created=
 by GNU C Runtime Library configure 1.0, which was<br>generated by GNU Auto=
conf 2.64.=A0 Invocation command line was<br>

<br>=A0 $ /media/scratch/poky-denzil-7.0/beaglebone/tmp/work-shared/gcc-4.6=
.3+svnr184847-r25/gcc-4_6-branch/libgcc/configure --cache-file=3D./config.c=
ache --with-cross-host=3Di686-pokysdk-linux --prefix=3D/opt/poky/1.2/sysroo=
ts/i686-pokysdk-linux/usr --exec_prefix=3D/opt/poky/1.2/sysroots/i686-pokys=
dk-linux/usr --bindir=3D/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/bin/a=
rmv7a-vfp-neon-poky-linux-gnueabi --sbindir=3D/opt/poky/1.2/sysroots/i686-p=
okysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi --libexecdir=3D/opt=
/poky/1.2/sysroots/i686-pokysdk-linux/usr/libexec/armv7a-vfp-neon-poky-linu=
x-gnueabi --datadir=3D/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/share -=
-sysconfdir=3D/opt/poky/1.2/sysroots/i686-pokysdk-linux/etc --sharedstatedi=
r=3D/opt/poky/1.2/sysroots/i686-pokysdk-linux/com --localstatedir=3D/opt/po=
ky/1.2/sysroots/i686-pokysdk-linux/var --libdir=3D/opt/poky/1.2/sysroots/i6=
86-pokysdk-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi --includedir=3D=
/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/include --oldincludedir=3D/op=
t/poky/1.2/sysroots/i686-pokysdk-linux/usr/include --infodir=3D/opt/poky/1.=
2/sysroots/i686-pokysdk-linux/usr/share/info --mandir=3D/opt/poky/1.2/sysro=
ots/i686-pokysdk-linux/usr/share/man --disable-silent-rules --disable-depen=
dency-tracking --with-libtool-sysroot=3D/media/scratch/poky-denzil-7.0/beag=
lebone/tmp/sysroots/i686-nativesdk-pokysdk-linux --with-gnu-ld --enable-sha=
red --enable-threads=3Dposix --disable-multilib --enable-c99 --enable-long-=
long --enable-symvers=3Dgnu --enable-libstdcxx-pch --enable-target-optspace=
 --enable-lto --enable-libssp --disable-bootstrap --with-system-zlib --with=
-linker-hash-style=3Dgnu --enable-cheaders=3Dc_global --with-local-prefix=
=3D/opt/poky/1.2/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr --with-gxx=
-include-dir=3D/opt/poky/1.2/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/us=
r/include/c++ --with-build-time-tools=3D/media/scratch/poky-denzil-7.0/beag=
lebone/tmp/sysroots/i686-linux/usr/arm-poky-linux-gnueabi/bin --with-sysroo=
t=3D/opt/poky/1.2/sysroots/armv7a-vfp-neon-poky-linux-gnueabi --with-build-=
sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone=
 --disable-libunwind-exceptions --disable-libssp --disable-libgomp --disabl=
e-libmudflap --enable-nls --enable-__cxa_atexit --enable-languages=3Dc,c++,=
lto --program-transform-name=3Ds&amp;^&amp;arm-poky-linux-gnueabi-&amp; --d=
isable-option-checking --with-target-subdir=3Darm-poky-linux-gnueabi --buil=
d=3Di686-linux --host=3Darm-poky-linux-gnueabi --target=3Darm-poky-linux-gn=
ueabi --srcdir=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/work-shared/=
gcc-4.6.3+svnr184847-r25/gcc-4_6-branch/libgcc<br>

<br>## --------- ##<br>## Platform. ##<br>## --------- ##<br><br>hostname =
=3D zeus<br>uname -m =3D i686<br>uname -r =3D 3.3.4-4.fc17.i686<br>uname -s=
 =3D Linux<br>uname -v =3D #1 SMP Fri May 4 18:07:55 UTC 2012<br><br>/usr/b=
in/uname -p =3D i686<br>

/bin/uname -X=A0=A0=A0=A0 =3D unknown<br><br>/bin/arch=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 =3D i686<br>/usr/bin/arch -k=A0=A0=A0=A0=A0=A0 =3D unkno=
wn<br>/usr/convex/getsysinfo =3D unknown<br>/usr/bin/hostinfo=A0=A0=A0=A0=
=A0 =3D unknown<br>/bin/machine=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D unknown<b=
r>/usr/bin/oslevel=A0=A0=A0=A0=A0=A0 =3D unknown<br>

/bin/universe=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D unknown<br><br>PATH: /media/sc=
ratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/bin/i686-pokys=
dk-linux<br>PATH: /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i6=
86-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi<br>

PATH: /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-nativesdk=
-pokysdk-linux/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/bin/armv7a-vfp-=
neon-poky-linux-gnueabi/crossscripts<br>PATH: /media/scratch/poky-denzil-7.=
0/beaglebone/tmp/sysroots/i686-linux/usr/sbin<br>

PATH: /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr=
/bin<br>PATH: /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-l=
inux/sbin<br>PATH: /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i=
686-linux//bin<br>

PATH: /media/scratch/poky-denzil-7.0/scripts<br>PATH: /media/scratch/poky-d=
enzil-7.0/bitbake/bin/<br>PATH: /usr/lib/ccache<br>PATH: /usr/local/bin<br>=
PATH: /bin<br>PATH: /usr/bin<br>PATH: /usr/local/sbin<br>PATH: /usr/sbin<br=
>

PATH: /home/nick/.local/bin<br>PATH: /home/nick/bin<br>PATH: /media/scratch=
/poky-denzil-7.0/scripts<br>PATH: /media/scratch/poky-denzil-7.0/beaglebone=
/tmp/sysroots/i686//bin<br><br><br>## ----------- ##<br>## Core tests. ##<b=
r>

## ----------- ##<br><br>configure:1742: creating cache ./config.cache<br>c=
onfigure:1903: checking for --enable-version-specific-runtime-libs<br>confi=
gure:1916: result: no<br>configure:1964: checking for a BSD-compatible inst=
all<br>

configure:2032: result: /bin/install -c<br>configure:2048: checking for gaw=
k<br>configure:2075: result: gawk<br>configure:2095: checking build system =
type<br>configure:2109: result: i686-pc-linux-gnu<br>configure:2129: checki=
ng host system type<br>

configure:2142: result: arm-poky-linux-gnueabi<br>configure:2245: checking =
for arm-poky-linux-gnueabi-ar<br>configure:2272: result: arm-poky-linux-gnu=
eabi-ar<br>configure:2337: checking for arm-poky-linux-gnueabi-lipo<br>

configure:2364: result: arm-poky-linux-gnueabi-lipo<br>configure:2429: chec=
king for arm-poky-linux-gnueabi-nm<br>configure:2456: result: arm-poky-linu=
x-gnueabi-nm<br>configure:2521: checking for arm-poky-linux-gnueabi-ranlib<=
br>

configure:2548: result: arm-poky-linux-gnueabi-ranlib<br>configure:2613: ch=
ecking for arm-poky-linux-gnueabi-strip<br>configure:2640: result: arm-poky=
-linux-gnueabi-strip<br>configure:2702: checking whether ln -s works<br>

configure:2706: result: yes<br>configure:2723: checking for arm-poky-linux-=
gnueabi-gcc<br>configure:2750: result:=A0 arm-poky-linux-gnueabi-gcc --sysr=
oot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone --s=
ysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone=
=A0 <br>

configure:3019: checking for C compiler version<br>configure:3028:=A0 arm-p=
oky-linux-gnueabi-gcc --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone=
/tmp/sysroots/beaglebone --sysroot=3D/media/scratch/poky-denzil-7.0/beagleb=
one/tmp/sysroots/beaglebone=A0=A0 --version &gt;&amp;5<br>

arm-poky-linux-gnueabi-gcc (GCC) 4.6.4 20120303 (prerelease)<br>Copyright (=
C) 2011 Free Software Foundation, Inc.<br>This is free software; see the so=
urce for copying conditions.=A0 There is NO<br>warranty; not even for MERCH=
ANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.<br>

<br>configure:3039: $? =3D 0<br>configure:3028:=A0 arm-poky-linux-gnueabi-g=
cc --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beagl=
ebone --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/be=
aglebone=A0=A0 -v &gt;&amp;5<br>

Using built-in specs.<br>COLLECT_GCC=3Darm-poky-linux-gnueabi-gcc<br>COLLEC=
T_LTO_WRAPPER=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686=
-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gn=
ueabi/4.6.4/lto-wrapper<br>

Target: arm-poky-linux-gnueabi<br>Configured with: /media/scratch/poky-denz=
il-7.0/beaglebone/tmp/work-shared/gcc-4.6.3+svnr184847-r25/gcc-4_6-branch/c=
onfigure --build=3Di686-linux --host=3Di686-linux --target=3Darm-poky-linux=
-gnueabi --prefix=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/=
i686-linux/usr --exec_prefix=3D/media/scratch/poky-denzil-7.0/beaglebone/tm=
p/sysroots/i686-linux/usr --bindir=3D/media/scratch/poky-denzil-7.0/beagleb=
one/tmp/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi --sb=
indir=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/u=
sr/bin/armv7a-vfp-neon-poky-linux-gnueabi --libexecdir=3D/media/scratch/pok=
y-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon=
-poky-linux-gnueabi --datadir=3D/media/scratch/poky-denzil-7.0/beaglebone/t=
mp/sysroots/i686-linux/usr/share --sysconfdir=3D/media/scratch/poky-denzil-=
7.0/beaglebone/tmp/sysroots/i686-linux/etc --sharedstatedir=3D/media/scratc=
h/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/com --localstatedir=3D=
/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/var --lib=
dir=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr=
/lib/armv7a-vfp-neon-poky-linux-gnueabi --includedir=3D/media/scratch/poky-=
denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/include --oldincludedir=
=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/in=
clude --infodir=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i6=
86-linux/usr/share/info --mandir=3D/media/scratch/poky-denzil-7.0/beaglebon=
e/tmp/sysroots/i686-linux/usr/share/man --disable-silent-rules --disable-de=
pendency-tracking --with-libtool-sysroot=3D/media/scratch/poky-denzil-7.0/b=
eaglebone/tmp/sysroots/i686-linux --with-gnu-ld --enable-shared --enable-la=
nguages=3Dc,c++ --enable-threads=3Dposix --disable-multilib --enable-c99 --=
enable-long-long --enable-symvers=3Dgnu --enable-libstdcxx-pch --program-pr=
efix=3Darm-poky-linux-gnueabi- --enable-target-optspace --enable-lto --enab=
le-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap --with=
-system-zlib --with-linker-hash-style=3Dgnu --enable-cheaders=3Dc_global --=
with-local-prefix=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/=
beagleboard/usr --with-gxx-include-dir=3D/media/scratch/poky-denzil-7.0/bea=
glebone/tmp/sysroots/beagleboard/usr/include/c++ --with-sysroot=3D/media/sc=
ratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beagleboard --with-build-sysr=
oot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beagleboard --=
enable-poison-system-directories --with-headers=3D/media/scratch/poky-denzi=
l-7.0/beaglebone/tmp/sysroots/beagleboard/usr/include --disable-libunwind-e=
xceptions --with-mpfr=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysro=
ots/i686-linux/usr --with-system-zlib --disable-nls --enable-__cxa_atexit<b=
r>

Thread model: posix<br>gcc version 4.6.4 20120303 (prerelease) (GCC) <br>co=
nfigure:3039: $? =3D 0<br>configure:3028:=A0 arm-poky-linux-gnueabi-gcc --s=
ysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone =
--sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebo=
ne=A0=A0 -V &gt;&amp;5<br>

arm-poky-linux-gnueabi-gcc: error: unrecognized option &#39;-V&#39;<br>arm-=
poky-linux-gnueabi-gcc: fatal error: no input files<br>compilation terminat=
ed.<br>configure:3039: $? =3D 1<br>configure:3028:=A0 arm-poky-linux-gnueab=
i-gcc --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/be=
aglebone --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots=
/beaglebone=A0=A0 -qversion &gt;&amp;5<br>

arm-poky-linux-gnueabi-gcc: error: unrecognized option &#39;-qversion&#39;<=
br>arm-poky-linux-gnueabi-gcc: fatal error: no input files<br>compilation t=
erminated.<br>configure:3039: $? =3D 1<br>configure:3055:=A0 arm-poky-linux=
-gnueabi-gcc --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysr=
oots/beaglebone --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/s=
ysroots/beaglebone=A0=A0 -o conftest -g -Os=A0=A0 conftest.c=A0 &gt;&amp;5<=
br>

configure:3058: $? =3D 0<br>configure:3087: checking for C compiler default=
 output file name<br>configure:3109:=A0 arm-poky-linux-gnueabi-gcc --sysroo=
t=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone --sys=
root=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone=A0=
=A0 -g -Os=A0=A0 conftest.c=A0 &gt;&amp;5<br>

configure:3113: $? =3D 0<br>configure:3150: result: a.out<br>configure:3166=
: checking whether the C compiler works<br>configure:3194: result: yes<br>c=
onfigure:3201: checking whether we are cross compiling<br>configure:3203: r=
esult: yes<br>

configure:3206: checking for suffix of executables<br>configure:3213:=A0 ar=
m-poky-linux-gnueabi-gcc --sysroot=3D/media/scratch/poky-denzil-7.0/beagleb=
one/tmp/sysroots/beaglebone --sysroot=3D/media/scratch/poky-denzil-7.0/beag=
lebone/tmp/sysroots/beaglebone=A0=A0 -o conftest -g -Os=A0=A0 conftest.c=A0=
 &gt;&amp;5<br>

configure:3217: $? =3D 0<br>configure:3239: result: <br>configure:3246: che=
cking for suffix of object files<br>configure:3268:=A0 arm-poky-linux-gnuea=
bi-gcc --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/b=
eaglebone --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroot=
s/beaglebone=A0=A0 -c -g -Os=A0 conftest.c &gt;&amp;5<br>

configure:3272: $? =3D 0<br>configure:3293: result: o<br>configure:3297: ch=
ecking whether we are using the GNU C compiler<br>configure:3316:=A0 arm-po=
ky-linux-gnueabi-gcc --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/=
tmp/sysroots/beaglebone --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebo=
ne/tmp/sysroots/beaglebone=A0=A0 -c -g -Os=A0 conftest.c &gt;&amp;5<br>

configure:3316: $? =3D 0<br>configure:3325: result: yes<br>configure:3334: =
checking whether=A0 arm-poky-linux-gnueabi-gcc --sysroot=3D/media/scratch/p=
oky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone --sysroot=3D/media/scratc=
h/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone=A0=A0 accepts -g<br>

configure:3354:=A0 arm-poky-linux-gnueabi-gcc --sysroot=3D/media/scratch/po=
ky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone --sysroot=3D/media/scratch=
/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone=A0=A0 -c -g=A0 conftest=
.c &gt;&amp;5<br>

configure:3354: $? =3D 0<br>configure:3395: result: yes<br>configure:3412: =
checking for=A0 arm-poky-linux-gnueabi-gcc --sysroot=3D/media/scratch/poky-=
denzil-7.0/beaglebone/tmp/sysroots/beaglebone --sysroot=3D/media/scratch/po=
ky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone=A0=A0 option to accept ISO=
 C89<br>

configure:3476:=A0 arm-poky-linux-gnueabi-gcc --sysroot=3D/media/scratch/po=
ky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone --sysroot=3D/media/scratch=
/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone=A0=A0=A0 -c -g -Os=A0 c=
onftest.c &gt;&amp;5<br>

configure:3476: $? =3D 0<br>configure:3489: result: none needed<br>configur=
e:3514: checking how to run the C preprocessor<br>configure:3584: result:=
=A0 arm-poky-linux-gnueabi-gcc -E<br>configure:3604:=A0 arm-poky-linux-gnue=
abi-gcc -E=A0 conftest.c<br>

In file included from /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroot=
s/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-=
gnueabi/4.6.4/include-fixed/syslimits.h:7:0,<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 from /media/scratch/poky-denzil-7.0/beaglebone/tmp/sy=
sroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-l=
inux-gnueabi/4.6.4/include-fixed/limits.h:34,<br>

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 from conftest.c:10:<br>/me=
dia/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv=
7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/include-fix=
ed/limits.h:169:61: error: no include path in which to search for limits.h<=
br>

configure:3604: $? =3D 1<br>configure: failed program was:<br>| /* confdefs=
.h */<br>| #define PACKAGE_NAME &quot;GNU C Runtime Library&quot;<br>| #def=
ine PACKAGE_TARNAME &quot;libgcc&quot;<br>| #define PACKAGE_VERSION &quot;1=
.0&quot;<br>

| #define PACKAGE_STRING &quot;GNU C Runtime Library 1.0&quot;<br>| #define=
 PACKAGE_BUGREPORT &quot;&quot;<br>| #define PACKAGE_URL &quot;<a href=3D"h=
ttp://www.gnu.org/software/libgcc/">http://www.gnu.org/software/libgcc/</a>=
&quot;<br>

| /* end confdefs.h.=A0 */<br>| #ifdef __STDC__<br>| # include &lt;limits.h=
&gt;<br>| #else<br>| # include &lt;assert.h&gt;<br>| #endif<br>| =A0=A0=A0 =
=A0=A0=A0 =A0=A0=A0=A0 Syntax error<br>configure:3604:=A0 arm-poky-linux-gn=
ueabi-gcc -E=A0 conftest.c<br>

In file included from /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroot=
s/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-=
gnueabi/4.6.4/include-fixed/syslimits.h:7:0,<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 from /media/scratch/poky-denzil-7.0/beaglebone/tmp/sy=
sroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-l=
inux-gnueabi/4.6.4/include-fixed/limits.h:34,<br>

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 from conftest.c:10:<br>/me=
dia/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv=
7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/include-fix=
ed/limits.h:169:61: error: no include path in which to search for limits.h<=
br>

configure:3604: $? =3D 1<br>configure: failed program was:<br>| /* confdefs=
.h */<br>| #define PACKAGE_NAME &quot;GNU C Runtime Library&quot;<br>| #def=
ine PACKAGE_TARNAME &quot;libgcc&quot;<br>| #define PACKAGE_VERSION &quot;1=
.0&quot;<br>

| #define PACKAGE_STRING &quot;GNU C Runtime Library 1.0&quot;<br>| #define=
 PACKAGE_BUGREPORT &quot;&quot;<br>| #define PACKAGE_URL &quot;<a href=3D"h=
ttp://www.gnu.org/software/libgcc/">http://www.gnu.org/software/libgcc/</a>=
&quot;<br>

| /* end confdefs.h.=A0 */<br>| #ifdef __STDC__<br>| # include &lt;limits.h=
&gt;<br>| #else<br>| # include &lt;assert.h&gt;<br>| #endif<br>| =A0=A0=A0 =
=A0=A0=A0 =A0=A0=A0=A0 Syntax error<br>configure:3634: error: in `/media/sc=
ratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-=
cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-l=
inux.arm-poky-linux-gnueabi/arm-poky-linux-gnueabi/libgcc&#39;:<br>

configure:3637: error: C preprocessor &quot; arm-poky-linux-gnueabi-gcc -E&=
quot; fails sanity check<br>See `config.log&#39; for more details.<br><br>#=
# ---------------- ##<br>## Cache variables. ##<br>## ---------------- ##<b=
r>

<br>ac_cv_build=3Di686-pc-linux-gnu<br>ac_cv_c_compiler_gnu=3Dyes<br>ac_cv_=
env_CC_set=3Dset<br>ac_cv_env_CC_value=3D&#39; arm-poky-linux-gnueabi-gcc -=
-sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebon=
e --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beagle=
bone=A0 &#39;<br>

ac_cv_env_CFLAGS_set=3Dset<br>ac_cv_env_CFLAGS_value=3D&#39;-g -Os&#39;<br>=
ac_cv_env_CPPFLAGS_set=3Dset<br>ac_cv_env_CPPFLAGS_value=3D<br>ac_cv_env_CP=
P_set=3Dset<br>ac_cv_env_CPP_value=3D&#39; arm-poky-linux-gnueabi-gcc -E&#3=
9;<br>ac_cv_env_LDFLAGS_set=3Dset<br>

ac_cv_env_LDFLAGS_value=3D<br>ac_cv_env_LIBS_set=3D<br>ac_cv_env_LIBS_value=
=3D<br>ac_cv_env_build_alias_set=3Dset<br>ac_cv_env_build_alias_value=3Di68=
6-linux<br>ac_cv_env_host_alias_set=3Dset<br>ac_cv_env_host_alias_value=3Da=
rm-poky-linux-gnueabi<br>

ac_cv_env_target_alias_set=3Dset<br>ac_cv_env_target_alias_value=3Darm-poky=
-linux-gnueabi<br>ac_cv_host=3Darm-poky-linux-gnueabi<br>ac_cv_objext=3Do<b=
r>ac_cv_path_install=3D&#39;/bin/install -c&#39;<br>ac_cv_prog_AR=3Darm-pok=
y-linux-gnueabi-ar<br>

ac_cv_prog_AWK=3Dgawk<br>ac_cv_prog_CC=3D&#39; arm-poky-linux-gnueabi-gcc -=
-sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebon=
e --sysroot=3D/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beagle=
bone=A0 &#39;<br>

ac_cv_prog_CPP=3D&#39; arm-poky-linux-gnueabi-gcc -E&#39;<br>ac_cv_prog_LIP=
O=3Darm-poky-linux-gnueabi-lipo<br>ac_cv_prog_NM=3Darm-poky-linux-gnueabi-n=
m<br>ac_cv_prog_RANLIB=3Darm-poky-linux-gnueabi-ranlib<br>ac_cv_prog_STRIP=
=3Darm-poky-linux-gnueabi-strip<br>

ac_cv_prog_cc_c89=3D<br>ac_cv_prog_cc_g=3Dyes<br>lt_cv_sys_lib_dlsearch_pat=
h_spec=3D&#39;/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/lib/armv7a-vfp-=
neon-poky-linux-gnueabi /opt/poky/1.2/sysroots/i686-pokysdk-linux/lib&#39;<=
br>

<br>## ----------------- ##<br>## Output variables. ##<br>## --------------=
--- ##<br><br>AR=3D&#39;arm-poky-linux-gnueabi-ar&#39;<br>AWK=3D&#39;gawk&#=
39;<br>CC=3D&#39; arm-poky-linux-gnueabi-gcc --sysroot=3D/media/scratch/pok=
y-denzil-7.0/beaglebone/tmp/sysroots/beaglebone --sysroot=3D/media/scratch/=
poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone=A0 &#39;<br>

CFLAGS=3D&#39;-g -Os&#39;<br>CPP=3D&#39; arm-poky-linux-gnueabi-gcc -E&#39;=
<br>CPPFLAGS=3D&#39;&#39;<br>DEFS=3D&#39;&#39;<br>ECHO_C=3D&#39;&#39;<br>EC=
HO_N=3D&#39;-n&#39;<br>ECHO_T=3D&#39;&#39;<br>EXEEXT=3D&#39;&#39;<br>INSTAL=
L_DATA=3D&#39;${INSTALL} -m 644&#39;<br>

INSTALL_PROGRAM=3D&#39;${INSTALL}&#39;<br>INSTALL_SCRIPT=3D&#39;${INSTALL}&=
#39;<br>LDFLAGS=3D&#39;&#39;<br>LIBOBJS=3D&#39;&#39;<br>LIBS=3D&#39;&#39;<b=
r>LIPO=3D&#39;arm-poky-linux-gnueabi-lipo&#39;<br>LN_S=3D&#39;ln -s&#39;<br=
>LTLIBOBJS=3D&#39;&#39;<br>

MAINT=3D&#39;#&#39;<br>NM=3D&#39;arm-poky-linux-gnueabi-nm&#39;<br>OBJEXT=
=3D&#39;o&#39;<br>PACKAGE_BUGREPORT=3D&#39;&#39;<br>PACKAGE_NAME=3D&#39;GNU=
 C Runtime Library&#39;<br>PACKAGE_STRING=3D&#39;GNU C Runtime Library 1.0&=
#39;<br>PACKAGE_TARNAME=3D&#39;libgcc&#39;<br>

PACKAGE_URL=3D&#39;<a href=3D"http://www.gnu.org/software/libgcc/">http://w=
ww.gnu.org/software/libgcc/</a>&#39;<br>PACKAGE_VERSION=3D&#39;1.0&#39;<br>=
PATH_SEPARATOR=3D&#39;:&#39;<br>RANLIB=3D&#39;arm-poky-linux-gnueabi-ranlib=
&#39;<br>

SHELL=3D&#39;/bin/sh&#39;<br>STRIP=3D&#39;arm-poky-linux-gnueabi-strip&#39;=
<br>ac_ct_CC=3D&#39;&#39;<br>asm_hidden_op=3D&#39;&#39;<br>bindir=3D&#39;/o=
pt/poky/1.2/sysroots/i686-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-=
gnueabi&#39;<br>

build=3D&#39;i686-pc-linux-gnu&#39;<br>build_alias=3D&#39;i686-linux&#39;<b=
r>build_cpu=3D&#39;i686&#39;<br>build_libsubdir=3D&#39;build-i686-linux&#39=
;<br>build_os=3D&#39;linux-gnu&#39;<br>build_subdir=3D&#39;build-i686-linux=
&#39;<br>

build_vendor=3D&#39;pc&#39;<br>datadir=3D&#39;/opt/poky/1.2/sysroots/i686-p=
okysdk-linux/usr/share&#39;<br>datarootdir=3D&#39;${prefix}/share&#39;<br>d=
ecimal_float=3D&#39;&#39;<br>docdir=3D&#39;${datarootdir}/doc/${PACKAGE_TAR=
NAME}&#39;<br>

dvidir=3D&#39;${docdir}&#39;<br>enable_decimal_float=3D&#39;&#39;<br>enable=
_shared=3D&#39;yes&#39;<br>exec_prefix=3D&#39;/opt/poky/1.2/sysroots/i686-p=
okysdk-linux/usr&#39;<br>extra_parts=3D&#39;&#39;<br>fixed_point=3D&#39;&#3=
9;<br>host=3D&#39;arm-poky-linux-gnueabi&#39;<br>

host_alias=3D&#39;arm-poky-linux-gnueabi&#39;<br>host_cpu=3D&#39;arm&#39;<b=
r>host_noncanonical=3D&#39;arm-poky-linux-gnueabi&#39;<br>host_os=3D&#39;li=
nux-gnueabi&#39;<br>host_subdir=3D&#39;.&#39;<br>host_vendor=3D&#39;poky&#3=
9;<br>htmldir=3D&#39;${docdir}&#39;<br>

includedir=3D&#39;/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/include&#39=
;<br>infodir=3D&#39;/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/share/inf=
o&#39;<br>libdir=3D&#39;/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/lib/a=
rmv7a-vfp-neon-poky-linux-gnueabi&#39;<br>

libexecdir=3D&#39;/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/libexec/arm=
v7a-vfp-neon-poky-linux-gnueabi&#39;<br>libgcc_topdir=3D&#39;/media/scratch=
/poky-denzil-7.0/beaglebone/tmp/work-shared/gcc-4.6.3+svnr184847-r25/gcc-4_=
6-branch/libgcc/..&#39;<br>

localedir=3D&#39;${datarootdir}/locale&#39;<br>localstatedir=3D&#39;/opt/po=
ky/1.2/sysroots/i686-pokysdk-linux/var&#39;<br>mandir=3D&#39;/opt/poky/1.2/=
sysroots/i686-pokysdk-linux/usr/share/man&#39;<br>oldincludedir=3D&#39;/opt=
/poky/1.2/sysroots/i686-pokysdk-linux/usr/include&#39;<br>

pdfdir=3D&#39;${docdir}&#39;<br>prefix=3D&#39;/opt/poky/1.2/sysroots/i686-p=
okysdk-linux/usr&#39;<br>program_transform_name=3D&#39;s&amp;^&amp;arm-poky=
-linux-gnueabi-&amp;&#39;<br>psdir=3D&#39;${docdir}&#39;<br>sbindir=3D&#39;=
/opt/poky/1.2/sysroots/i686-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linu=
x-gnueabi&#39;<br>

set_have_cc_tls=3D&#39;&#39;<br>set_use_emutls=3D&#39;&#39;<br>sharedstated=
ir=3D&#39;/opt/poky/1.2/sysroots/i686-pokysdk-linux/com&#39;<br>slibdir=3D&=
#39;$(exec_prefix)/$(host_noncanonical)/lib&#39;<br>sysconfdir=3D&#39;/opt/=
poky/1.2/sysroots/i686-pokysdk-linux/etc&#39;<br>

target_alias=3D&#39;arm-poky-linux-gnueabi&#39;<br>target_noncanonical=3D&#=
39;arm-poky-linux-gnueabi&#39;<br>target_subdir=3D&#39;arm-poky-linux-gnuea=
bi&#39;<br>tmake_file=3D&#39;&#39;<br>toolexecdir=3D&#39;$(exec_prefix)/$(t=
arget_noncanonical)&#39;<br>

toolexeclibdir=3D&#39;$(toolexecdir)/lib&#39;<br>vis_hide=3D&#39;&#39;<br><=
br>## ----------- ##<br>## confdefs.h. ##<br>## ----------- ##<br><br>/* co=
nfdefs.h */<br>#define PACKAGE_NAME &quot;GNU C Runtime Library&quot;<br>#d=
efine PACKAGE_TARNAME &quot;libgcc&quot;<br>

#define PACKAGE_VERSION &quot;1.0&quot;<br>#define PACKAGE_STRING &quot;GNU=
 C Runtime Library 1.0&quot;<br>#define PACKAGE_BUGREPORT &quot;&quot;<br>#=
define PACKAGE_URL &quot;<a href=3D"http://www.gnu.org/software/libgcc/">ht=
tp://www.gnu.org/software/libgcc/</a>&quot;<br>

<br>configure: exit 1<br><br>

--e89a8ff2568897d30004c029dd79--

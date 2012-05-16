Return-Path: <exosyst@gmail.com>
Received: from mail-pz0-f48.google.com (mail-pz0-f48.google.com
	[209.85.210.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2B50E006C7
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 00:27:16 -0700 (PDT)
Received: by dadz8 with SMTP id z8so782320dad.35
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 00:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=XrEIHSUJ1iUZcgphR166ukmY68dnkgr6WMjtw5rVAdg=;
	b=Xq+uoOy5aWGHEmBF+Ixq73hd29+Xrzv6sVYtgNEnAW9PdphpCuS5Q3czCeTBwmDCTn
	tSCh8dyIV8AelBuIeyReCI2OsUfWHUiJlbqhZRIUoh7pUOUrEGXX/h7QSqVk5kryw5PQ
	fuWkD3PuWpwU7T3nHvW1CiDIn/COspXrgpQ/4HMq95+z623BBJNnfx7iAy8I7Gu2rkbp
	myAX+leXgOC8QX2UzWpIv6SsBrsVicPL11/BMjkO2BEDNUeMzB1mq3A1IeCnDsLZi6Ct
	VqFVRggpXMakMo41ThQs+BDACHEBzsgeagicMkm7B5XJ/mTVckauATifhdzQwIRWA26b
	YL6Q==
Received: by 10.68.203.40 with SMTP id kn8mr13570485pbc.162.1337153236074;
	Wed, 16 May 2012 00:27:16 -0700 (PDT)
MIME-Version: 1.0
Sender: exosyst@gmail.com
Received: by 10.68.204.162 with HTTP; Wed, 16 May 2012 00:26:55 -0700 (PDT)
In-Reply-To: <CAN-pQATO_EjYx2g5oM5Hja-FawTOy00wOBkDFEgutwaCRh1kxQ@mail.gmail.com>
References: <CAN-pQATO_EjYx2g5oM5Hja-FawTOy00wOBkDFEgutwaCRh1kxQ@mail.gmail.com>
From: Nick G <exosyst+metaTI@gmail.com>
Date: Wed, 16 May 2012 08:26:55 +0100
X-Google-Sender-Auth: _lIJD8DXFWmairtalYjEJjzgQGc
Message-ID: <CAN-pQAT-__u2-f6YiM307YeDUUeUOCOx9=AQ3+rZJBVU1sXSJA@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Building issues with meta-toolchain on Beaglebone
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
X-List-Received-Date: Wed, 16 May 2012 07:27:16 -0000
Content-Type: multipart/alternative; boundary=047d7b15a51da580a204c0223f7a

--047d7b15a51da580a204c0223f7a
Content-Type: text/plain; charset=ISO-8859-1

Hey guys,


I'm basing this on poky-denzil with the denzil branch of meta-oe and
meta-ti checked out as well.
I set my machine to be beaglebone and added meta-oe and meta-ti to the
config options and managed to successfully build the core-image-minimal
using bitbake. I now want to generate a standalone toolchain which, *I
believe* is done with meta-toolchain (please correct me if I'm wrong).

Unfortunately this fails with the rather long error I'll post below for
search engines' sake.

Is this a known bug? Is there a workaround?

Thanks,
Nick

Output as follows:
<... snip ...>
NOTE: Running noexec task 1819 of 1830 (ID: 9,
/media/scratch/poky-denzil-7.0/meta/recipes-core/meta/meta-toolchain.bb,
do_package_write)
ERROR: Function failed: do_compile (see
/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/temp/log.do_compile.1234
for further information)
ERROR: Logfile of failure stored in:
/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/temp/log.do_compile.1234
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common',
'common-linux', 'common-glibc', 'i686-linux', 'common']
| NOTE: make
ARCH_FLAGS_FOR_TARGET=--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
all-host all-target-libgcc
| make[1]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libiberty'
| make[2]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libiberty/testsuite'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libiberty/testsuite'
| make[1]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libiberty'
| make[1]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/fixincludes'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/fixincludes'
| make[1]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/lto-plugin'
| make  all-am
| make[2]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/lto-plugin'
| make[2]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/lto-plugin'
| make[1]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/lto-plugin'
| make[1]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/intl'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/intl'
| make[1]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/build-i686-linux/libiberty'
| make[2]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/build-i686-linux/libiberty/testsuite'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/build-i686-linux/libiberty/testsuite'
| make[1]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/build-i686-linux/libiberty'
| make[1]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/build-i686-linux/fixincludes'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/build-i686-linux/fixincludes'
| make[1]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libcpp'
| test -f config.h || (rm -f stamp-h1 && make stamp-h1)
| make[1]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libcpp'
| make[1]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libdecnumber'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libdecnumber'
| make[1]: Entering directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/gcc'
| make[1]: Leaving directory
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/gcc'
| Checking multilib configuration for libgcc...
| Configuring in arm-poky-linux-gnueabi/libgcc
| configure: loading cache ./config.cache
| checking for --enable-version-specific-runtime-libs... no
| checking for a BSD-compatible install... /bin/install -c
| checking for gawk... gawk
| checking build system type... i686-pc-linux-gnu
| checking host system type... arm-poky-linux-gnueabi
| checking for arm-poky-linux-gnueabi-ar... arm-poky-linux-gnueabi-ar
| checking for arm-poky-linux-gnueabi-lipo... arm-poky-linux-gnueabi-lipo
| checking for arm-poky-linux-gnueabi-nm... arm-poky-linux-gnueabi-nm
| checking for arm-poky-linux-gnueabi-ranlib...
arm-poky-linux-gnueabi-ranlib
| checking for arm-poky-linux-gnueabi-strip... arm-poky-linux-gnueabi-strip
| checking whether ln -s works... yes
| checking for arm-poky-linux-gnueabi-gcc...  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
| checking for C compiler default output file name... a.out
| checking whether the C compiler works... yes
| checking whether we are cross compiling... yes
| checking for suffix of executables...
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
accepts -g... yes
| checking for  arm-poky-linux-gnueabi-gcc
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
--sysroot=/media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone
option to accept ISO C89... none needed
| checking how to run the C preprocessor...  arm-poky-linux-gnueabi-gcc -E
| configure: error: in
`/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/arm-poky-linux-gnueabi/libgcc':
| configure: error: C preprocessor " arm-poky-linux-gnueabi-gcc -E" fails
sanity check
| See `config.log' for more details.
| make: *** [configure-tarERROR: Function failed: do_compile (see
/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/temp/log.do_compile.1234
for further information)
| get-libgcc] Error 1
| ERROR: oe_runmake failed
NOTE: package gcc-cross-canadian-arm-4.6.3+svnr184847-r25: task do_compile:
Failed
ERROR: Task 786 (/media/scratch/poky-denzil-7.0/meta/recipes-devtools/gcc/
gcc-cross-canadian_4.6.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1819 tasks of which 1807 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:
  /media/scratch/poky-denzil-7.0/meta/recipes-devtools/gcc/
gcc-cross-canadian_4.6.bb, do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--047d7b15a51da580a204c0223f7a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">Hey guys,<br><br><br>I&#39;m basing this on poky=
-denzil with the denzil branch of meta-oe and meta-ti checked out as well.<=
br>I set my machine to be beaglebone and added meta-oe and meta-ti to the c=
onfig options and managed to successfully build the core-image-minimal usin=
g bitbake. I now want to generate a standalone toolchain which, *I believe*=
 is done with meta-toolchain (please correct me if I&#39;m wrong).<br>


<br>Unfortunately this fails with the rather long error I&#39;ll post below=
 for search engines&#39; sake.<br><br>Is this a known bug? Is there a worka=
round?<br><br>Thanks,<br>Nick<br><br>Output as follows:<br>&lt;... snip ...=
&gt;<br>


NOTE: Running noexec task 1819 of 1830 (ID: 9, /media/scratch/poky-denzil-7=
.0/meta/recipes-core/meta/<a href=3D"http://meta-toolchain.bb" target=3D"_b=
lank">meta-toolchain.bb</a>, do_package_write)<br>ERROR: Function failed: d=
o_compile (see /media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nati=
vesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/temp/log.do=
_compile.1234 for further information)<br>


ERROR: Logfile of failure stored in: /media/scratch/poky-denzil-7.0/beagleb=
one/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr=
184847-r25/temp/log.do_compile.1234<br>Log data follows:<br>| DEBUG: SITE f=
iles [&#39;endian-little&#39;, &#39;bit-32&#39;, &#39;ix86-common&#39;, &#3=
9;common-linux&#39;, &#39;common-glibc&#39;, &#39;i686-linux&#39;, &#39;com=
mon&#39;]<br>


| NOTE: make ARCH_FLAGS_FOR_TARGET=3D--sysroot=3D/media/scratch/poky-denzil=
-7.0/beaglebone/tmp/sysroots/beaglebone all-host all-target-libgcc<br>| mak=
e[1]: Entering directory `/media/scratch/poky-denzil-7.0/beaglebone/tmp/wor=
k/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/=
gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libiberty&#3=
9;<br>


| make[2]: Entering directory `/media/scratch/poky-denzil-7.0/beaglebone/tm=
p/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847=
-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libiber=
ty/testsuite&#39;<br>


| make[2]: Nothing to be done for `all&#39;.<br>| make[2]: Leaving director=
y `/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysd=
k-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i6=
86-pokysdk-linux.arm-poky-linux-gnueabi/libiberty/testsuite&#39;<br>


| make[1]: Leaving directory `/media/scratch/poky-denzil-7.0/beaglebone/tmp=
/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-=
r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libibert=
y&#39;<br>


| make[1]: Entering directory `/media/scratch/poky-denzil-7.0/beaglebone/tm=
p/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847=
-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/fixincl=
udes&#39;<br>


| make[1]: Nothing to be done for `all&#39;.<br>| make[1]: Leaving director=
y `/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysd=
k-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i6=
86-pokysdk-linux.arm-poky-linux-gnueabi/fixincludes&#39;<br>


| make[1]: Entering directory `/media/scratch/poky-denzil-7.0/beaglebone/tm=
p/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847=
-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/lto-plu=
gin&#39;<br>


| make=A0 all-am<br>| make[2]: Entering directory `/media/scratch/poky-denz=
il-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-=
arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-l=
inux-gnueabi/lto-plugin&#39;<br>


| make[2]: Leaving directory `/media/scratch/poky-denzil-7.0/beaglebone/tmp=
/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-=
r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/lto-plug=
in&#39;<br>


| make[1]: Leaving directory `/media/scratch/poky-denzil-7.0/beaglebone/tmp=
/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-=
r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/lto-plug=
in&#39;<br>


| make[1]: Entering directory `/media/scratch/poky-denzil-7.0/beaglebone/tm=
p/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847=
-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/intl&#3=
9;<br>


| make[1]: Nothing to be done for `all&#39;.<br>| make[1]: Leaving director=
y `/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysd=
k-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i6=
86-pokysdk-linux.arm-poky-linux-gnueabi/intl&#39;<br>


| make[1]: Entering directory `/media/scratch/poky-denzil-7.0/beaglebone/tm=
p/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847=
-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/build-i=
686-linux/libiberty&#39;<br>


| make[2]: Entering directory `/media/scratch/poky-denzil-7.0/beaglebone/tm=
p/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847=
-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/build-i=
686-linux/libiberty/testsuite&#39;<br>


| make[2]: Nothing to be done for `all&#39;.<br>| make[2]: Leaving director=
y `/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysd=
k-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i6=
86-pokysdk-linux.arm-poky-linux-gnueabi/build-i686-linux/libiberty/testsuit=
e&#39;<br>


| make[1]: Leaving directory `/media/scratch/poky-denzil-7.0/beaglebone/tmp=
/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-=
r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/build-i6=
86-linux/libiberty&#39;<br>


| make[1]: Entering directory `/media/scratch/poky-denzil-7.0/beaglebone/tm=
p/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847=
-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/build-i=
686-linux/fixincludes&#39;<br>


| make[1]: Nothing to be done for `all&#39;.<br>| make[1]: Leaving director=
y `/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysd=
k-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i6=
86-pokysdk-linux.arm-poky-linux-gnueabi/build-i686-linux/fixincludes&#39;<b=
r>


| make[1]: Entering directory `/media/scratch/poky-denzil-7.0/beaglebone/tm=
p/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847=
-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libcpp&=
#39;<br>


| test -f config.h || (rm -f stamp-h1 &amp;&amp; make stamp-h1)<br>| make[1=
]: Leaving directory `/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i6=
86-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-=
4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libcpp&#39;<br>


| make[1]: Entering directory `/media/scratch/poky-denzil-7.0/beaglebone/tm=
p/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847=
-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/libdecn=
umber&#39;<br>


| make[1]: Nothing to be done for `all&#39;.<br>| make[1]: Leaving director=
y `/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysd=
k-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i6=
86-pokysdk-linux.arm-poky-linux-gnueabi/libdecnumber&#39;<br>


| make[1]: Entering directory `/media/scratch/poky-denzil-7.0/beaglebone/tm=
p/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847=
-r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/gcc&#39=
;<br>


| make[1]: Leaving directory `/media/scratch/poky-denzil-7.0/beaglebone/tmp=
/work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-=
r25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/gcc&#39;=
<br>


| Checking multilib configuration for libgcc...<br>| Configuring in arm-pok=
y-linux-gnueabi/libgcc<br>| configure: loading cache ./config.cache<br>| ch=
ecking for --enable-version-specific-runtime-libs... no<br>| checking for a=
 BSD-compatible install... /bin/install -c<br>


| checking for gawk... gawk<br>| checking build system type... i686-pc-linu=
x-gnu<br>| checking host system type... arm-poky-linux-gnueabi<br>| checkin=
g for arm-poky-linux-gnueabi-ar... arm-poky-linux-gnueabi-ar<br>| checking =
for arm-poky-linux-gnueabi-lipo... arm-poky-linux-gnueabi-lipo<br>


| checking for arm-poky-linux-gnueabi-nm... arm-poky-linux-gnueabi-nm<br>| =
checking for arm-poky-linux-gnueabi-ranlib... arm-poky-linux-gnueabi-ranlib=
<br>| checking for arm-poky-linux-gnueabi-strip... arm-poky-linux-gnueabi-s=
trip<br>


| checking whether ln -s works... yes<br>| checking for arm-poky-linux-gnue=
abi-gcc...=A0 arm-poky-linux-gnueabi-gcc --sysroot=3D/media/scratch/poky-de=
nzil-7.0/beaglebone/tmp/sysroots/beaglebone --sysroot=3D/media/scratch/poky=
-denzil-7.0/beaglebone/tmp/sysroots/beaglebone<br>


| checking for C compiler default output file name... a.out<br>| checking w=
hether the C compiler works... yes<br>| checking whether we are cross compi=
ling... yes<br>| checking for suffix of executables...<br>| checking for su=
ffix of object files... o<br>


| checking whether we are using the GNU C compiler... yes<br>| checking whe=
ther=A0 arm-poky-linux-gnueabi-gcc --sysroot=3D/media/scratch/poky-denzil-7=
.0/beaglebone/tmp/sysroots/beaglebone --sysroot=3D/media/scratch/poky-denzi=
l-7.0/beaglebone/tmp/sysroots/beaglebone=A0=A0 accepts -g... yes<br>


| checking for=A0 arm-poky-linux-gnueabi-gcc --sysroot=3D/media/scratch/pok=
y-denzil-7.0/beaglebone/tmp/sysroots/beaglebone --sysroot=3D/media/scratch/=
poky-denzil-7.0/beaglebone/tmp/sysroots/beaglebone=A0=A0 option to accept I=
SO C89... none needed<br>


| checking how to run the C preprocessor...=A0 arm-poky-linux-gnueabi-gcc -=
E<br>| configure: error: in `/media/scratch/poky-denzil-7.0/beaglebone/tmp/=
work/i686-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r=
25/gcc-4_6-branch/build.i686-pokysdk-linux.arm-poky-linux-gnueabi/arm-poky-=
linux-gnueabi/libgcc&#39;:<br>


| configure: error: C preprocessor &quot; arm-poky-linux-gnueabi-gcc -E&quo=
t; fails sanity check<br>| See `config.log&#39; for more details.<br>| make=
: *** [configure-tarERROR: Function failed: do_compile (see /media/scratch/=
poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysdk-linux/gcc-cross-=
canadian-arm-4.6.3+svnr184847-r25/temp/log.do_compile.1234 for further info=
rmation)<br>


| get-libgcc] Error 1<br>| ERROR: oe_runmake failed<br>NOTE: package gcc-cr=
oss-canadian-arm-4.6.3+svnr184847-r25: task do_compile: Failed<br>ERROR: Ta=
sk 786 (/media/scratch/poky-denzil-7.0/meta/recipes-devtools/gcc/<a href=3D=
"http://gcc-cross-canadian_4.6.bb" target=3D"_blank">gcc-cross-canadian_4.6=
.bb</a>, do_compile) failed with exit code &#39;1&#39;<br>


NOTE: Tasks Summary: Attempted 1819 tasks of which 1807 didn&#39;t need to =
be rerun and 1 failed.<br><br>Summary: 1 task failed:<br>=A0 /media/scratch=
/poky-denzil-7.0/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-cana=
dian_4.6.bb" target=3D"_blank">gcc-cross-canadian_4.6.bb</a>, do_compile<br=
>


Summary: There was 1 ERROR message shown, returning a non-zero exit code.<b=
r><br>
</div><br>

--047d7b15a51da580a204c0223f7a--

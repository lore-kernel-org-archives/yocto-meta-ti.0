Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1ABA2E00A7B; Fri, 14 Aug 2015 17:42:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.bimmermann[at]yahoo.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.82.97.161 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm39-vm2.bullet.mail.ir2.yahoo.com
	(nm39-vm2.bullet.mail.ir2.yahoo.com [212.82.97.161])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF67AE00A70
	for <meta-ti@yoctoproject.org>; Fri, 14 Aug 2015 17:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1439599336; bh=HyLkbYSMZXbr20mbWkYzEP8mI1CF/zaL2skFKsWJV6k=;
	h=Date:From:Reply-To:To:Subject:From:Subject;
	b=qofCEb/l5al6yKu7sSy+naz1SkVWo+cUkY4YdjjWX2hCwz6K8xhkS9Ra06tarFdxIOuF2f67+GvioU6jJwUBrEzEsQ4BPYKjlNW9Yamc1z5lkJv/HBa3GtQsUm8EJkPIVBe/6HBZGf6DbEIOO03PVXfqdxQ5kUJI2c+BwPehhRIGp+DDxIJCyB0kLQU8OkSqtAw4uGy3pMaS0cxqcR/j3/yliy9gvQDlvOvStcbFdgDAfQmh/6f8I+DXm8KokXzvc2DxyritcIFubiSIRvcVBc20WwPrUdlDe98XmpS+ASoRhqHx8+iMFNzCBwrvt5bJPhCBJYazhEZQBXZlkaL9Tw==
Received: from [212.82.98.54] by nm39.bullet.mail.ir2.yahoo.com with NNFMP;
	15 Aug 2015 00:42:16 -0000
Received: from [212.82.98.104] by tm7.bullet.mail.ir2.yahoo.com with NNFMP;
	15 Aug 2015 00:42:16 -0000
Received: from [127.0.0.1] by omp1041.mail.ir2.yahoo.com with NNFMP;
	15 Aug 2015 00:42:16 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 597684.13675.bm@omp1041.mail.ir2.yahoo.com
X-YMail-OSG: 6hEFR6kVM1neMq5kxd2jTQm0cF0Y3VJvnLO56wbE2jmtLjy4tgkNSxFQ8df68Hv
	wo1LpTwyLBqpUsRpfsL1MBdetHvcke3NgSdV1dr3csN_UyzORwsxTYRA1Rfo102sdJYwXJUISVs9
	nHKwZWX5niriTtQimb1FNDukvXxvS6G11u9ezaYP4MbCtEnF2O91b9d7PVN8DRyU3LEvclEfu0nz
	0gG5GWAXQOGylpp_1B.qf0NBMYPLRTiDWwWBOMP9euOwZk5PzFTdvbLuXYItNFx7VQunXr_wQ3fB
	DuSSMdgaAfZdcNoey0JD16HxvlunjmBosSwRroD5xssbMUKxJKzHbUAPXttT7RWY9nn3gOLUUWt4
	t3zsgMuk7V4vbqlFm_BdjGkJf5q1xchlRt82gKVfUybqQRDRKm8N0lY8rydlZt6pJ3IMoHKFT8.q
	eZg_7ecLcIM6IddzXRNx.heQ7uvKSH0Jrlfv3fglFBmmi5JsPdOGKGbSTGE13EQ72SgnJKTfpHKE
	9vRbBcdj3beCm73J5
Received: by 212.82.98.117; Sat, 15 Aug 2015 00:42:15 +0000 
Date: Sat, 15 Aug 2015 00:41:50 +0000 (UTC)
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Message-ID: <2001756708.5081859.1439599310946.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Subject: libgles-omap3 error | BeagleBoneBlack | sgx-omap.h: No such file or directory
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Benjamin Bimmermann <b.bimmermann@yahoo.de>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Aug 2015 00:42:24 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_5081858_455219850.1439599310939"

------=_Part_5081858_455219850.1439599310939
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,
i like to build the libgles-omap3 for the BeagleBoneBlack, but i get the er=
ror :=20
sgx-omap.h: No such file or directory
|=C2=A0 #include <linux/platform_data/sgx-omap.h>.
I try to create QT5 for the BeagleboneBlack. I have found and work on this =
tutorial:http://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/Co=
de: https://bitbucket.org/embarcados/meta-embarcados/src

He has the error in part2 of the tutorial and say that i must make :bitbake=
 -c cleansstate libgles-omap3bitbake libgles-omap3
but that not solve the Problem. Every Time I get this Error.
I have only change the bblayer.conf and the local.conf file. All other File=
s are from git and I have not change anything.
I hope you can help me.



---------------------------------------------------------------------------=
------------------------------------------------
My bblayer.conf:LCONF_VERSION =3D "6"
BBPATH =3D "${TOPDIR}"
BBFILES ?=3D ""
BBLAYERS ?=3D " \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/bbb/meta-emb=
arcados \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/bbb/meta-emb=
arcados/meta-bbb \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/bbb/meta-ti =
\
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/me=
ta-qt5 \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/me=
ta-openembedded/meta-oe \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/me=
ta-openembedded/meta-ruby \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/me=
ta-openembedded/meta-perl \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/me=
ta-openembedded/meta-efl \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/me=
ta-openembedded/meta-multimedia \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/me=
ta \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/me=
ta-yocto \ "
BBLAYERS_NON_REMOVABLE ?=3D " \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/meta \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/meta-yoc=
to \
=C2=A0 "
---------------------------------------------------------------------------=
------------------------------------------------
My local.conf:BB_NUMBER_THREADS =3D "7"
PARALLEL_MAKE =3D "-j7"
LICENSE_FLAGS_WHITELIST =3D "commercial"
MACHINE =3D "beaglebone"
DISTRO =3D "poky"
PACKAGE_CLASSES =3D "package_deb"
EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
CONF_VERSION =3D "1"
DISTRO_FEATURES_remove =3D "x11 wayland"
BBMASK =3D "meta-embarcados/recipes-browser/chromium/chromium_%.bbappend"

---------------------------------------------------------------------------=
------------------------------------------------
And the complete LOG:
PC@PC:~/bbb/build_spain$ bitbake libgles-omap3
WARNING: Host distribution "Ubuntu-15.04" has not been validated with this =
version of the build system; you may possibly experience unexpected failure=
s. It is recommended that you use a tested distribution.
Parsing recipes: 100% |####################################################=
###########################################################################=
#######################################| Time: 00:00:29
Parsing of 1788 .bb files complete (0 cached, 1788 parsed). 2296 targets, 3=
51 skipped, 1 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "1.26.0"
BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "x86_64-linux=
"
NATIVELSBSTRING=C2=A0=C2=A0 =3D "Ubuntu-15.04"
TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm-poky-linux-gn=
ueabi"
MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "be=
aglebone"
DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D "poky"
DISTRO_VERSION=C2=A0=C2=A0=C2=A0 =3D "1.8"
TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm armv7a vfp thumb neon callco=
nvention-hard cortexa8"
TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "vfp-neon"
meta-embarcados=C2=A0=C2=A0=20
meta-bbb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:df=
b2e27bf26b109fc6ccb3bc91924fb3bb24f655"
meta-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fi=
do:a666b94e9c676711f1389c0628e6c883ef20d5b3"
meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:fc=
026381545650e10fdd488d5b2a3b2d78f87793"
meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-ruby=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-perl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-efl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-multimedia=C2=A0=C2=A0 =3D "fido:10d3c8f85280a0bf867a8e4f84bcda81c290d=
28e"
meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20
meta-yocto=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:08d325904115=
68e7bf11612ac695a6e9c6df6286"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_compile (log file is located at /home/PC/bbb/bui=
ld_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.0=
2-r22b/temp/log.do_compile.25613)
ERROR: Logfile of failure stored in: /home/PC/bbb/build_spain/tmp/work/beag=
lebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_com=
pile.25613
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j7 -e MAKEFLAGS=3D KERNEL_SRC=3D/home/PC/bbb/build_spain/tmp/=
work-shared/beaglebone/kernel-source KERNEL_PATH=3D/home/PC/bbb/build_spain=
/tmp/work-shared/beaglebone/kernel-source KERNEL_VERSION=3D4.1.5 CC=3Darm-p=
oky-linux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-poky-linux-=
gnueabi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=3D/home/P=
C/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts BUILD=
=3Drelease TI_PLATFORM=3Dti335x SUPPORT_XORG=3D
| make -C /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source=
 M=3D`pwd`
| make[1]: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/bea=
glebone/kernel-source'
| make[2]: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/bea=
glebone/kernel-build-artifacts'
|=C2=A0=C2=A0 CC [M]=C2=A0 /home/PC/bbb/build_spain/tmp/work/beaglebone-pok=
y-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/G=
FX_Linux_KM/services4/srvkm/env/linux/module.o
| /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx=
-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srv=
km/env/linux/module.c:51:42: fatal error: linux/platform_data/sgx-omap.h: N=
o such file or directory
|=C2=A0 #include <linux/platform_data/sgx-omap.h>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
| compilation terminated.
| /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source/scripts=
/Makefile.build:258: recipe for target '/home/PC/bbb/build_spain/tmp/work/b=
eaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK=
_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o' failed
| make[3]: *** [/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnu=
eabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM=
/services4/srvkm/env/linux/module.o] Error 1
| /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source/Makefil=
e:1384: recipe for target '_module_/home/PC/bbb/build_spain/tmp/work/beagle=
bone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01=
_01_02/GFX_Linux_KM' failed
| make[2]: *** [_module_/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-l=
inux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_=
Linux_KM] Error 2
| make[2]: Leaving directory '/home/PC/bbb/build_spain/tmp/work-shared/beag=
lebone/kernel-build-artifacts'
| Makefile:146: recipe for target 'sub-make' failed
| make[1]: *** [sub-make] Error 2
| make[1]: Leaving directory '/home/PC/bbb/build_spain/tmp/work-shared/beag=
lebone/kernel-source'
| Makefile:478: recipe for target 'all' failed
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/PC/bbb/b=
uild_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01=
.02-r22b/temp/log.do_compile.25613)
ERROR: Task 119 (/home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx=
-modules_5.01.01.02.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 731 tasks of which 720 didn't need to be rer=
un and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
=C2=A0 /home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_5=
.01.01.02.bb, do_compile
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
PC@PC:~/bbb/build_spain

---------------------------------------------------------------------------=
------------------------------------------------

Thank you for your Time and I hope you can help me.Have a nice day.

------=_Part_5081858_455219850.1439599310939
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:16px"><div id=3D"yui_3_16_0=
_1_1439597765344_6479">Hello,</div><div id=3D"yui_3_16_0_1_1439597765344_66=
09"><br></div><div id=3D"yui_3_16_0_1_1439597765344_6606" dir=3D"ltr">i lik=
e to build the libgles-omap3 for the BeagleBoneBlack, but i get the error :=
 <br></div><div id=3D"yui_3_16_0_1_1439597765344_6607" dir=3D"ltr">sgx-omap=
.h: No such file or directory<br class=3D"">|&nbsp; #include &lt;linux/plat=
form_data/sgx-omap.h&gt;.</div><div id=3D"yui_3_16_0_1_1439597765344_6735" =
dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1439597765344_6736" dir=3D"lt=
r">I try to create QT5 for the BeagleboneBlack. I have found and work on th=
is tutorial:</div><div id=3D"yui_3_16_0_1_1439597765344_6762" dir=3D"ltr"><=
a id=3D"yui_3_16_0_1_1439597765344_6761" href=3D"http://www.embarcados.com.=
br/beaglebone-black-qt5-yocto-parte-1/">http://www.embarcados.com.br/beagle=
bone-black-qt5-yocto-parte-1/</a></div><div id=3D"yui_3_16_0_1_143959776534=
4_6805" dir=3D"ltr">Code: <a id=3D"yui_3_16_0_1_1439597765344_7053" href=3D=
"https://bitbucket.org/embarcados/meta-embarcados/src">https://bitbucket.or=
g/embarcados/meta-embarcados/src</a><br></div><div id=3D"yui_3_16_0_1_14395=
97765344_7052" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1439597765344_=
7021" dir=3D"ltr">He has the error in part2 of the tutorial and say that i =
must make :</div><div id=3D"yui_3_16_0_1_1439597765344_6807" dir=3D"ltr">bi=
tbake -c cleansstate libgles-omap3</div><div id=3D"yui_3_16_0_1_14395977653=
44_6806" dir=3D"ltr">bitbake libgles-omap3<br></div><div id=3D"yui_3_16_0_1=
_1439597765344_6809" dir=3D"ltr">but that not solve the Problem. Every Time=
 I get this Error.<br></div><div id=3D"yui_3_16_0_1_1439597765344_7022" dir=
=3D"ltr">I have only change the bblayer.conf and the local.conf file. All o=
ther Files are from git and I have not change anything.<br></div><div id=3D=
"yui_3_16_0_1_1439597765344_7103" dir=3D"ltr">I hope you can help me.<br></=
div><div id=3D"yui_3_16_0_1_1439597765344_6640" dir=3D"ltr"><br></div><div =
id=3D"yui_3_16_0_1_1439597765344_7134" dir=3D"ltr"><br></div><div id=3D"yui=
_3_16_0_1_1439597765344_7135" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1=
_1439597765344_7002" dir=3D"ltr">------------------------------------------=
---------------------------------------------------------------------------=
------</div><div id=3D"yui_3_16_0_1_1439597765344_7020" dir=3D"ltr"><br></d=
iv><div id=3D"yui_3_16_0_1_1439597765344_6670" dir=3D"ltr">My bblayer.conf:=
</div><div id=3D"yui_3_16_0_1_1439597765344_6710" dir=3D"ltr">LCONF_VERSION=
 =3D "6"<br class=3D"">BBPATH =3D "${TOPDIR}"<br class=3D"">BBFILES ?=3D ""=
<br class=3D"">BBLAYERS ?=3D " \<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/bbb/meta-embarcados \<br class=3D"">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/bbb/meta-embarca=
dos/meta-bbb \<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; ${HOME}/bbb/meta-ti \<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta-qt5 \<br class=3D"">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta-open=
embedded/meta-oe \<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ${HOME}/poky-fido/meta-openembedded/meta-ruby \<br class=3D"">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/me=
ta-openembedded/meta-perl \<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta-openembedded/meta-efl \<br cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky=
-fido/meta-openembedded/meta-multimedia \<br class=3D"">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta \<br class=3D"">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/me=
ta-yocto \ "<br class=3D"">BBLAYERS_NON_REMOVABLE ?=3D " \<br class=3D"">&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta \<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fi=
do/meta-yocto \<br class=3D"">&nbsp; "</div><div id=3D"yui_3_16_0_1_1439597=
765344_6986" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1439597765344_69=
96" dir=3D"ltr">-----------------------------------------------------------=
----------------------------------------------------------------</div><div =
id=3D"yui_3_16_0_1_1439597765344_7019" dir=3D"ltr"><br></div><div id=3D"yui=
_3_16_0_1_1439597765344_6978" dir=3D"ltr">My local.conf:</div><div id=3D"yu=
i_3_16_0_1_1439597765344_6871" dir=3D"ltr">BB_NUMBER_THREADS =3D "7"<br cla=
ss=3D"">PARALLEL_MAKE =3D "-j7"<br class=3D"">LICENSE_FLAGS_WHITELIST =3D "=
commercial"<br class=3D"">MACHINE =3D "beaglebone"<br class=3D"">DISTRO =3D=
 "poky"<br class=3D"">PACKAGE_CLASSES =3D "package_deb"<br class=3D"">EXTRA=
_IMAGE_FEATURES =3D "debug-tweaks"<br class=3D"">CONF_VERSION =3D "1"<br cl=
ass=3D"">DISTRO_FEATURES_remove =3D "x11 wayland"<br class=3D"">BBMASK =3D =
"meta-embarcados/recipes-browser/chromium/chromium_%.bbappend"</div><div id=
=3D"yui_3_16_0_1_1439597765344_6885" dir=3D"ltr"><br></div><div id=3D"yui_3=
_16_0_1_1439597765344_6985" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1=
439597765344_7136" dir=3D"ltr">--------------------------------------------=
---------------------------------------------------------------------------=
----</div><div id=3D"yui_3_16_0_1_1439597765344_7137" dir=3D"ltr"><br></div=
><div id=3D"yui_3_16_0_1_1439597765344_6898" dir=3D"ltr">And the complete L=
OG:</div><div id=3D"yui_3_16_0_1_1439597765344_6983" dir=3D"ltr"><br></div>=
<div id=3D"yui_3_16_0_1_1439597765344_6977" dir=3D"ltr">PC@PC:~/bbb/build_s=
pain$ bitbake libgles-omap3<br class=3D"">WARNING: Host distribution "Ubunt=
u-15.04" has not been validated with this version of the build system; you =
may possibly experience unexpected failures. It is recommended that you use=
 a tested distribution.<br class=3D"">Parsing recipes: 100% |##############=
###########################################################################=
###########################################################################=
##| Time: 00:00:29<br class=3D"">Parsing of 1788 .bb files complete (0 cach=
ed, 1788 parsed). 2296 targets, 351 skipped, 1 masked, 0 errors.<br class=
=3D"">NOTE: Resolving any missing task queue dependencies<br class=3D""><br=
 class=3D"">Build Configuration:<br class=3D"">BB_VERSION&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; =3D "1.26.0"<br class=3D"">BUILD_SYS&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "x86_64-linux"<br class=3D"">NATIVEL=
SBSTRING&nbsp;&nbsp; =3D "Ubuntu-15.04"<br class=3D"">TARGET_SYS&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm-poky-linux-gnueabi"<br class=3D"">=
MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "be=
aglebone"<br class=3D"">DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D "poky"<br class=3D"">DISTRO_VERSION&nbsp;&nbsp;&n=
bsp; =3D "1.8"<br class=3D"">TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm=
 armv7a vfp thumb neon callconvention-hard cortexa8"<br class=3D"">TARGET_F=
PU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "vfp-neon"<br class=3D"">m=
eta-embarcados&nbsp;&nbsp; <br class=3D"">meta-bbb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:dfb2e27bf26b109fc6ccb3bc91924fb3bb2=
4f655"<br class=3D"">meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; =3D "fido:a666b94e9c676711f1389c0628e6c883ef20d5b3"<br class=
=3D"">meta-qt5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "f=
ido:fc026381545650e10fdd488d5b2a3b2d78f87793"<br class=3D"">meta-oe&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br class=3D"">meta-ru=
by&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br class=3D"">meta-perl=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br class=3D"">meta-efl&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br class=3D"">meta-mul=
timedia&nbsp;&nbsp; =3D "fido:10d3c8f85280a0bf867a8e4f84bcda81c290d28e"<br =
class=3D"">meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; <br class=3D"">meta-yocto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; =3D "fido:08d32590411568e7bf11612ac695a6e9c6df6286"<br class=3D=
""><br class=3D"">NOTE: Preparing RunQueue<br class=3D"">NOTE: Executing Se=
tScene Tasks<br class=3D"">NOTE: Executing RunQueue Tasks<br class=3D"">ERR=
OR: Function failed: do_compile (log file is located at /home/PC/bbb/build_=
spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r=
22b/temp/log.do_compile.25613)<br class=3D"">ERROR: Logfile of failure stor=
ed in: /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap=
3-sgx-modules/5.01.01.02-r22b/temp/log.do_compile.25613<br class=3D"">Log d=
ata follows:<br class=3D"">| DEBUG: Executing shell function do_compile<br =
class=3D"">| NOTE: make -j7 -e MAKEFLAGS=3D KERNEL_SRC=3D/home/PC/bbb/build=
_spain/tmp/work-shared/beaglebone/kernel-source KERNEL_PATH=3D/home/PC/bbb/=
build_spain/tmp/work-shared/beaglebone/kernel-source KERNEL_VERSION=3D4.1.5=
 CC=3Darm-poky-linux-gnueabi-gcc&nbsp; -mno-thumb-interwork -marm LD=3Darm-=
poky-linux-gnueabi-ld.bfd&nbsp;&nbsp; AR=3Darm-poky-linux-gnueabi-ar&nbsp; =
O=3D/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifa=
cts BUILD=3Drelease TI_PLATFORM=3Dti335x SUPPORT_XORG=3D<br class=3D"">| ma=
ke -C /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source M=
=3D`pwd`<br class=3D"">| make[1]: Entering directory '/home/PC/bbb/build_sp=
ain/tmp/work-shared/beaglebone/kernel-source'<br class=3D"">| make[2]: Ente=
ring directory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-=
build-artifacts'<br class=3D"">|&nbsp;&nbsp; CC [M]&nbsp; /home/PC/bbb/buil=
d_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02=
-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module=
.o<br class=3D"">| /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-=
gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux=
_KM/services4/srvkm/env/linux/module.c:51:42: fatal error: linux/platform_d=
ata/sgx-omap.h: No such file or directory<br class=3D"">|&nbsp; #include &l=
t;linux/platform_data/sgx-omap.h&gt;<br class=3D"">|&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; ^<br class=3D"">| compilation terminated.<br class=3D"">| /home/PC/bbb=
/build_spain/tmp/work-shared/beaglebone/kernel-source/scripts/Makefile.buil=
d:258: recipe for target '/home/PC/bbb/build_spain/tmp/work/beaglebone-poky=
-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GF=
X_Linux_KM/services4/srvkm/env/linux/module.o' failed<br class=3D"">| make[=
3]: *** [/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/om=
ap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/servic=
es4/srvkm/env/linux/module.o] Error 1<br class=3D"">| /home/PC/bbb/build_sp=
ain/tmp/work-shared/beaglebone/kernel-source/Makefile:1384: recipe for targ=
et '_module_/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi=
/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM' fa=
iled<br class=3D"">| make[2]: *** [_module_/home/PC/bbb/build_spain/tmp/wor=
k/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_=
SDK_5_01_01_02/GFX_Linux_KM] Error 2<br class=3D"">| make[2]: Leaving direc=
tory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-arti=
facts'<br class=3D"">| Makefile:146: recipe for target 'sub-make' failed<br=
 class=3D"">| make[1]: *** [sub-make] Error 2<br class=3D"">| make[1]: Leav=
ing directory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-s=
ource'<br class=3D"">| Makefile:478: recipe for target 'all' failed<br clas=
s=3D"">| make: *** [all] Error 2<br class=3D"">| ERROR: oe_runmake failed<b=
r class=3D"">| WARNING: exit code 1 from a shell command.<br class=3D"">| E=
RROR: Function failed: do_compile (log file is located at /home/PC/bbb/buil=
d_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02=
-r22b/temp/log.do_compile.25613)<br class=3D"">ERROR: Task 119 (/home/PC/bb=
b/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb, do_c=
ompile) failed with exit code '1'<br class=3D"">NOTE: Tasks Summary: Attemp=
ted 731 tasks of which 720 didn't need to be rerun and 1 failed.<br class=
=3D"">Waiting for 0 running tasks to finish:<br class=3D""><br class=3D"">S=
ummary: 1 task failed:<br class=3D"">&nbsp; /home/PC/bbb/meta-ti/recipes-bs=
p/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb, do_compile<br class=3D""=
>Summary: There was 1 WARNING message shown.<br class=3D"">Summary: There w=
as 1 ERROR message shown, returning a non-zero exit code.<br class=3D"">PC@=
PC:~/bbb/build_spain</div><div id=3D"yui_3_16_0_1_1439597765344_6979" dir=
=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1439597765344_6980" dir=3D"ltr">=
<br></div><div id=3D"yui_3_16_0_1_1439597765344_6981" dir=3D"ltr">---------=
---------------------------------------------------------------------------=
---------------------------------------</div><div id=3D"yui_3_16_0_1_143959=
7765344_7003" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1439597765344_7=
004" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1439597765344_7005" dir=
=3D"ltr">Thank you for your Time and I hope you can help me.</div><div dir=
=3D"ltr">Have a nice day.<br></div></div></body></html>

------=_Part_5081858_455219850.1439599310939--

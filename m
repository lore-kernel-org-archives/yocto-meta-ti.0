Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A58DFE00A92; Sat, 15 Aug 2015 01:29:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.bimmermann[at]yahoo.de)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [212.82.96.236 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm19-vm3.bullet.mail.ir2.yahoo.com
	(nm19-vm3.bullet.mail.ir2.yahoo.com [212.82.96.236])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B0C9E00A70
	for <meta-ti@yoctoproject.org>; Sat, 15 Aug 2015 01:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1439627375; bh=rt8Lt2mEvhATqS3AnRueH33Lvb2+ihfk8iDs1Xagiqs=;
	h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
	b=TAcZyYvNrhhO4rLmxmAIdnti/QEKs8rxsWGNyJ/9WvxvY2gv6OhkkZYPB8erR6fIGEhamxI5rp0RT+/VgSQiiEthjIISaPtf5jCbsUaIyet3tm+ykzXx5CUAQ7umcEQf0jxXfLtGSUUbP2Vk+QMiMyT2GFUaY72mbD+qCKwbyMEJ7ctqw1Bpu1mlxr6P4xYhoo5Td50JNgjjziNOb5f9agzZMBL3HnFYWUFA72KxjODYRmtSqDX0c7nLOkROiZFNKfhbkmRo1YzxqAghI5IFsx4cp6a9IFnx5lVyRJv8u5vZpJbNj2fJNMarY/HFN3hpsh1+o9U//SXW02pOtx3+Hg==
Received: from [212.82.98.53] by nm19.bullet.mail.ir2.yahoo.com with NNFMP;
	15 Aug 2015 08:29:35 -0000
Received: from [212.82.98.111] by tm6.bullet.mail.ir2.yahoo.com with NNFMP;
	15 Aug 2015 08:29:34 -0000
Received: from [127.0.0.1] by omp1048.mail.ir2.yahoo.com with NNFMP;
	15 Aug 2015 08:29:34 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 968827.34764.bm@omp1048.mail.ir2.yahoo.com
X-YMail-OSG: 8jAujG8VM1mfVEZ3M7nBrK9JHXivUW80YKe.DW3o7uHFDwQVEtqjpIavGV.jn1.
	vTG5JlvBbIVaBDZTiiTBjI2DZmImGSB70ZcV2_ly9AYYWXdM54rkdQY3AICHmpKy4es8EnHYLQDh
	6qpijCrOAeVUVxLEyRH7hJq69yr3gV.HbjC4uSYOVtPt4Inr2dgmN4cEgax2KOhwajU9diDzq8hM
	KeOki5_XrBSlVRiysUJVwIyRhmphej5ANmS46nDm4agZRZsjNcN1AhR0l99k..gh3_1.AgvuEblK
	LaeDHqx6O1U6AGQ9K._qcuzgT8yS17mGnpySHoGR078Iw.LNZetvh9AHo0uEkbRu5UXG0bSoqlsm
	JZaB_XWGz95EiUpZkR60PnZyeVNthN74142poWT4VFaOlNG1chnpUT7RUa5e3Uvp3OHNga7J7sP_
	T.YiNoapmnsHSSlcjXDbOlYrh0V8vIr_faeXJ4r2epDBvWal9GDxISY.9NT0WaILnzPNQnTYERR8
	RCMj0WmUohrBMx.8q
Received: by 212.82.98.116; Sat, 15 Aug 2015 08:29:34 +0000 
Date: Sat, 15 Aug 2015 08:29:33 +0000 (UTC)
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <1319594131.5095777.1439627373982.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <20150815004941.GA6542@edge>
References: <20150815004941.GA6542@edge>
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: libgles-omap3 error | BeagleBoneBlack | sgx-omap.h: No such file or directory
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
X-List-Received-Date: Sat, 15 Aug 2015 08:29:43 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_5095776_1879561460.1439627373969"

------=_Part_5095776_1879561460.1439627373969
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Denys,=C2=A0ok. So if I like to use libgles-omap3 I must use the old Linux =
3.14 Kernel?=C2=A0Three=C2=A0Questions:1. What=C2=A0I must=C2=A0add / Chang=
e to build with the Kernel 3.14?2. Is for the new=C2=A0Kernel a Driver, wit=
h full grafic support that worked with QT5 ?
2.1.: Best without X11.3. What would you think it=C2=A0is better the Driver=
 with the=E2=80=9Dold=E2=80=9D Kernel 3.14 or theanswer of question two?=C2=
=A0Thanks for the fast answer.=C2=A0=C2=A0Benjamin=20


     Denys Dmytriyenko <denys@ti.com> schrieb am 2:50 Samstag, 15.August 20=
15:
  =20

 Benjamin,

Version 5.1.1.2 of libgles-omap3 only builds and works against version 3.14=
 of=20
linux-ti-staging kernel in meta-ti. The corresponding update to libgles-oma=
p3=20
to build against 4.1 kernel hasn't been released yet.

--=20
Denys


On Sat, Aug 15, 2015 at 12:41:50AM +0000, Benjamin Bimmermann wrote:
> Hello,
> i like to build the libgles-omap3 for the BeagleBoneBlack, but i get the =
error :=20
> sgx-omap.h: No such file or directory
> |=C2=A0 #include <linux/platform_data/sgx-omap.h>.
> I try to create QT5 for the BeagleboneBlack. I have found and work on thi=
s tutorial:http://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/=
Code: https://bitbucket.org/embarcados/meta-embarcados/src
>=20
> He has the error in part2 of the tutorial and say that i must make :bitba=
ke -c cleansstate libgles-omap3bitbake libgles-omap3
> but that not solve the Problem. Every Time I get this Error.
> I have only change the bblayer.conf and the local.conf file. All other Fi=
les are from git and I have not change anything.
> I hope you can help me.
>=20
>=20
>=20
> -------------------------------------------------------------------------=
--------------------------------------------------
> My bblayer.conf:LCONF_VERSION =3D "6"
> BBPATH =3D "${TOPDIR}"
> BBFILES ?=3D ""
> BBLAYERS ?=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/bbb/meta-e=
mbarcados \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/bbb/meta-e=
mbarcados/meta-bbb \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/bbb/meta-t=
i \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-qt5 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-openembedded/meta-oe \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-openembedded/meta-ruby \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-openembedded/meta-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-openembedded/meta-efl \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-openembedded/meta-multimedia \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-yocto \ "
> BBLAYERS_NON_REMOVABLE ?=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/meta \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/meta-y=
octo \
> =C2=A0 "
> -------------------------------------------------------------------------=
--------------------------------------------------
> My local.conf:BB_NUMBER_THREADS =3D "7"
> PARALLEL_MAKE =3D "-j7"
> LICENSE_FLAGS_WHITELIST =3D "commercial"
> MACHINE =3D "beaglebone"
> DISTRO =3D "poky"
> PACKAGE_CLASSES =3D "package_deb"
> EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> CONF_VERSION =3D "1"
> DISTRO_FEATURES_remove =3D "x11 wayland"
> BBMASK =3D "meta-embarcados/recipes-browser/chromium/chromium_%.bbappend"
>=20
> -------------------------------------------------------------------------=
--------------------------------------------------
> And the complete LOG:
> PC@PC:~/bbb/build_spain$ bitbake libgles-omap3
> WARNING: Host distribution "Ubuntu-15.04" has not been validated with thi=
s version of the build system; you may possibly experience unexpected failu=
res. It is recommended that you use a tested distribution.
> Parsing recipes: 100% |##################################################=
###########################################################################=
#########################################| Time: 00:00:29
> Parsing of 1788 .bb files complete (0 cached, 1788 parsed). 2296 targets,=
 351 skipped, 1 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>=20
> Build Configuration:
> BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "1.26.0"
> BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "x86_64-lin=
ux"
> NATIVELSBSTRING=C2=A0=C2=A0 =3D "Ubuntu-15.04"
> TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm-poky-linux-=
gnueabi"
> MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "=
beaglebone"
> DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D "poky"
> DISTRO_VERSION=C2=A0=C2=A0=C2=A0 =3D "1.8"
> TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm armv7a vfp thumb neon call=
convention-hard cortexa8"
> TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "vfp-neon"
> meta-embarcados=C2=A0=C2=A0=20
> meta-bbb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:=
dfb2e27bf26b109fc6ccb3bc91924fb3bb24f655"
> meta-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "=
fido:a666b94e9c676711f1389c0628e6c883ef20d5b3"
> meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:=
fc026381545650e10fdd488d5b2a3b2d78f87793"
> meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> meta-ruby=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> meta-perl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> meta-efl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> meta-multimedia=C2=A0=C2=A0 =3D "fido:10d3c8f85280a0bf867a8e4f84bcda81c29=
0d28e"
> meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20
> meta-yocto=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:08d3259041=
1568e7bf11612ac695a6e9c6df6286"
>=20
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_compile (log file is located at /home/PC/bbb/b=
uild_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01=
.02-r22b/temp/log.do_compile.25613)
> ERROR: Logfile of failure stored in: /home/PC/bbb/build_spain/tmp/work/be=
aglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_c=
ompile.25613
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j7 -e MAKEFLAGS=3D KERNEL_SRC=3D/home/PC/bbb/build_spain/tm=
p/work-shared/beaglebone/kernel-source KERNEL_PATH=3D/home/PC/bbb/build_spa=
in/tmp/work-shared/beaglebone/kernel-source KERNEL_VERSION=3D4.1.5 CC=3Darm=
-poky-linux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-poky-linu=
x-gnueabi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=3D/home=
/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts BUILD=
=3Drelease TI_PLATFORM=3Dti335x SUPPORT_XORG=3D
> | make -C /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-sour=
ce M=3D`pwd`
> | make[1]: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/b=
eaglebone/kernel-source'
> | make[2]: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/b=
eaglebone/kernel-build-artifacts'
> |=C2=A0=C2=A0 CC [M]=C2=A0 /home/PC/bbb/build_spain/tmp/work/beaglebone-p=
oky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02=
/GFX_Linux_KM/services4/srvkm/env/linux/module.o
> | /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-s=
gx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/s=
rvkm/env/linux/module.c:51:42: fatal error: linux/platform_data/sgx-omap.h:=
 No such file or directory
> |=C2=A0 #include <linux/platform_data/sgx-omap.h>
> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> | compilation terminated.
> | /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source/scrip=
ts/Makefile.build:258: recipe for target '/home/PC/bbb/build_spain/tmp/work=
/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_S=
DK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o' failed
> | make[3]: *** [/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-g=
nueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_=
KM/services4/srvkm/env/linux/module.o] Error 1
> | /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source/Makef=
ile:1384: recipe for target '_module_/home/PC/bbb/build_spain/tmp/work/beag=
lebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_=
01_01_02/GFX_Linux_KM' failed
> | make[2]: *** [_module_/home/PC/bbb/build_spain/tmp/work/beaglebone-poky=
-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GF=
X_Linux_KM] Error 2
> | make[2]: Leaving directory '/home/PC/bbb/build_spain/tmp/work-shared/be=
aglebone/kernel-build-artifacts'
> | Makefile:146: recipe for target 'sub-make' failed
> | make[1]: *** [sub-make] Error 2
> | make[1]: Leaving directory '/home/PC/bbb/build_spain/tmp/work-shared/be=
aglebone/kernel-source'
> | Makefile:478: recipe for target 'all' failed
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/PC/bbb=
/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.=
01.02-r22b/temp/log.do_compile.25613)
> ERROR: Task 119 (/home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-s=
gx-modules_5.01.01.02.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 731 tasks of which 720 didn't need to be r=
erun and 1 failed.
> Waiting for 0 running tasks to finish:
>=20
> Summary: 1 task failed:
> =C2=A0 /home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules=
_5.01.01.02.bb, do_compile
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> PC@PC:~/bbb/build_spain
>=20
> -------------------------------------------------------------------------=
--------------------------------------------------
>=20
> Thank you for your Time and I hope you can help me.Have a nice day.

> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti



  

------=_Part_5095776_1879561460.1439627373969
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:16px"><div id=3D"yui_3_16_0=
_1_1439627250773_4099"></div><div class=3D"" id=3D"yui_3_16_0_1_14396272507=
73_3010" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span class=3D"" =
id=3D"yui_3_16_0_1_1439627250773_3009" style=3D"font-size:12pt;" lang=3D"EN=
-US"><font class=3D"" id=3D"yui_3_16_0_1_1439627250773_3008" face=3D"Calibr=
i Regular">Denys,</font></span></div><div class=3D""><font class=3D"" face=
=3D"Times New Roman">

</font></div><div class=3D"" id=3D"yui_3_16_0_1_1439627250773_3012" style=
=3D"margin:0cm 0cm 0pt;line-height:normal;"><span id=3D"yui_3_16_0_1_143962=
7250773_4101" class=3D"" style=3D"font-size:12pt;" lang=3D"EN-US"><font id=
=3D"yui_3_16_0_1_1439627250773_4100" class=3D"" face=3D"Calibri Regular">&n=
bsp;</font></span></div><div class=3D""><font class=3D"" face=3D"Times New =
Roman">

</font></div><div class=3D"" id=3D"yui_3_16_0_1_1439627250773_3015" style=
=3D"margin:0cm 0cm 0pt;line-height:normal;"><span class=3D"" id=3D"yui_3_16=
_0_1_1439627250773_3014" style=3D"font-size:12pt;" lang=3D"EN-US"><font cla=
ss=3D"" id=3D"yui_3_16_0_1_1439627250773_3013" face=3D"Calibri Regular">ok.=
 So if I like to use libgles-omap3 I must use the old Linux 3.14 Kernel?</f=
ont></span></div><div class=3D""><font class=3D"" face=3D"Times New Roman">

</font></div><div class=3D"" id=3D"yui_3_16_0_1_1439627250773_3016" style=
=3D"margin:0cm 0cm 0pt;line-height:normal;"><span class=3D"" style=3D"font-=
size:12pt;" lang=3D"EN-US"><font class=3D"" face=3D"Calibri Regular">&nbsp;=
</font></span></div><div class=3D""><font class=3D"" face=3D"Times New Roma=
n">

</font></div><div class=3D"" id=3D"yiv1639325610yui_3_16_0_1_1439600919800_=
16172" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span id=3D"yui_3_1=
6_0_1_1439627250773_4103" class=3D"" style=3D"font-size:12pt;" lang=3D"EN-U=
S"><font id=3D"yui_3_16_0_1_1439627250773_4102" class=3D"" face=3D"Calibri =
Regular">Three&nbsp;Questions:</font></span></div><div class=3D""><font cla=
ss=3D"" face=3D"Times New Roman">

</font></div><div class=3D"" id=3D"yiv1639325610yui_3_16_0_1_1439600919800_=
16171" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span class=3D"" id=
=3D"yiv1639325610yui_3_16_0_1_1439600919800_16170" style=3D"font-size:12pt;=
" lang=3D"EN-US"><font class=3D"" id=3D"yiv1639325610yui_3_16_0_1_143960091=
9800_16169" face=3D"Calibri Regular">1. What&nbsp;I must&nbsp;add / Change =
to build with the Kernel 3.14?</font></span></div><div class=3D""><font cla=
ss=3D"" face=3D"Times New Roman">

</font></div><div class=3D"" id=3D"yiv1639325610yui_3_16_0_1_1439600919800_=
16167" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span class=3D"" id=
=3D"yiv1639325610yui_3_16_0_1_1439600919800_16166" style=3D"font-size:12pt;=
" lang=3D"EN-US"><font class=3D"" id=3D"yiv1639325610yui_3_16_0_1_143960091=
9800_16165" face=3D"Calibri Regular">2. Is for the new&nbsp;Kernel a Driver=
, with full grafic support that worked with QT5 ?<br></font></span></div><d=
iv class=3D""><font class=3D"" face=3D"Times New Roman">

</font></div><div class=3D"" id=3D"yui_3_16_0_1_1439627250773_3007" style=
=3D"margin:0cm 0cm 0pt;line-height:normal;"><span class=3D"" id=3D"yui_3_16=
_0_1_1439627250773_3006" style=3D"font-size:12pt;" lang=3D"EN-US"><font cla=
ss=3D"" id=3D"yui_3_16_0_1_1439627250773_3005" face=3D"Calibri Regular">2.1=
.: Best without X11.</font></span></div><div class=3D""><font class=3D"" fa=
ce=3D"Times New Roman">

</font></div><div class=3D"" id=3D"yui_3_16_0_1_1439627250773_3004" style=
=3D"margin:0cm 0cm 0pt;line-height:normal;"><span class=3D"" id=3D"yui_3_16=
_0_1_1439627250773_3003" style=3D"font-size:12pt;" lang=3D"EN-US"><font cla=
ss=3D"" id=3D"yui_3_16_0_1_1439627250773_3002" face=3D"Calibri Regular">3. =
What would you think it&nbsp;is better the Driver with the=E2=80=9Dold=E2=
=80=9D Kernel 3.14 or the
answer of question two?</font></span></div><div class=3D""><font class=3D""=
 face=3D"Times New Roman">

</font></div><div class=3D"" id=3D"yui_3_16_0_1_1439627250773_3001" style=
=3D"margin:0cm 0cm 0pt;line-height:normal;"><span class=3D"" style=3D"font-=
size:12pt;" lang=3D"EN-US"><font class=3D"" face=3D"Calibri Regular">&nbsp;=
</font></span></div><div class=3D""><font class=3D"" face=3D"Times New Roma=
n">

</font></div><div class=3D"" id=3D"yiv1639325610yui_3_16_0_1_1439600919800_=
16173" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span class=3D"" id=
=3D"yui_3_16_0_1_1439627250773_3000" style=3D"font-size:12pt;" lang=3D"EN-U=
S"><font class=3D"" id=3D"yui_3_16_0_1_1439627250773_2999" face=3D"Calibri =
Regular">Thanks for the fast answer.&nbsp;</font></span></div><div class=3D=
""><font class=3D"" face=3D"Times New Roman">

</font></div><div class=3D"" id=3D"yiv1639325610yui_3_16_0_1_1439600919800_=
16174" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span class=3D"" st=
yle=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"" face=3D"Calibri Reg=
ular">&nbsp;</font></span></div><div class=3D""><font class=3D"" face=3D"Ti=
mes New Roman">

</font></div><div class=3D"" dir=3D"ltr" id=3D"yiv1639325610yui_3_16_0_1_14=
39600919800_16175" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><div id=
=3D"yui_3_16_0_1_1439627250773_3738" dir=3D"ltr"><span id=3D"yui_3_16_0_1_1=
439627250773_4105" class=3D"" style=3D"font-size:12pt;"><font id=3D"yui_3_1=
6_0_1_1439627250773_4104" class=3D"" face=3D"Calibri Regular">Benjamin</fon=
t></span></div></div>  <br><div class=3D"qtdSeparateBR"><br><br></div><div =
style=3D"display: block;" class=3D"yahoo_quoted"> <div style=3D"font-family=
: times new roman, new york, times, serif; font-size: 16px;"> <div style=3D=
"font-family: HelveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grand=
e, sans-serif; font-size: 16px;"> <div dir=3D"ltr"> <font face=3D"Arial" si=
ze=3D"2"> Denys Dmytriyenko &lt;denys@ti.com&gt; schrieb am 2:50 Samstag, 1=
5.August 2015:<br> </font> </div>  <br><br> <div class=3D"y_msg_container">=
Benjamin,<br clear=3D"none"><br clear=3D"none">Version 5.1.1.2 of libgles-o=
map3 only builds and works against version 3.14 of <br clear=3D"none">linux=
-ti-staging kernel in meta-ti. The corresponding update to libgles-omap3 <b=
r clear=3D"none">to build against 4.1 kernel hasn't been released yet.<br c=
lear=3D"none"><br clear=3D"none">-- <br clear=3D"none">Denys<br clear=3D"no=
ne"><br clear=3D"none"><div class=3D"yqt1621541879" id=3D"yqtfd10571"><br c=
lear=3D"none">On Sat, Aug 15, 2015 at 12:41:50AM +0000, Benjamin Bimmermann=
 wrote:<br clear=3D"none">&gt; Hello,<br clear=3D"none">&gt; i like to buil=
d the libgles-omap3 for the BeagleBoneBlack, but i get the error : <br clea=
r=3D"none">&gt; sgx-omap.h: No such file or directory<br clear=3D"none">&gt=
; |&nbsp; #include &lt;linux/platform_data/sgx-omap.h&gt;.<br clear=3D"none=
">&gt; I try to create QT5 for the BeagleboneBlack. I have found and work o=
n this tutorial:<a shape=3D"rect" href=3D"http://www.embarcados.com.br/beag=
lebone-black-qt5-yocto-parte-1/Code:" target=3D"_blank">http://www.embarcad=
os.com.br/beaglebone-black-qt5-yocto-parte-1/Code: </a><a shape=3D"rect" hr=
ef=3D"https://bitbucket.org/embarcados/meta-embarcados/src" target=3D"_blan=
k">https://bitbucket.org/embarcados/meta-embarcados/src</a><br clear=3D"non=
e">&gt; <br clear=3D"none">&gt; He has the error in part2 of the tutorial a=
nd say that i must make :bitbake -c cleansstate libgles-omap3bitbake libgle=
s-omap3<br clear=3D"none">&gt; but that not solve the Problem. Every Time I=
 get this Error.<br clear=3D"none">&gt; I have only change the bblayer.conf=
 and the local.conf file. All other Files are from git and I have not chang=
e anything.<br clear=3D"none">&gt; I hope you can help me.<br clear=3D"none=
">&gt; <br clear=3D"none">&gt; <br clear=3D"none">&gt; <br clear=3D"none">&=
gt; -----------------------------------------------------------------------=
----------------------------------------------------<br clear=3D"none">&gt;=
 My bblayer.conf:LCONF_VERSION =3D "6"<br clear=3D"none">&gt; BBPATH =3D "$=
{TOPDIR}"<br clear=3D"none">&gt; BBFILES ?=3D ""<br clear=3D"none">&gt; BBL=
AYERS ?=3D " \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ${HOME}/bbb/meta-embarcados \<br clear=3D"none">&gt; &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/bbb/meta-embarca=
dos/meta-bbb \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ${HOME}/bbb/meta-ti \<br clear=3D"none">&gt; &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta-qt5 \<br =
clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
${HOME}/poky-fido/meta-openembedded/meta-oe \<br clear=3D"none">&gt; &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta-ope=
nembedded/meta-ruby \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta-openembedded/meta-perl \<br=
 clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 ${HOME}/poky-fido/meta-openembedded/meta-efl \<br clear=3D"none">&gt; &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta-o=
penembedded/meta-multimedia \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta \<br clear=3D"none"=
>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-f=
ido/meta-yocto \ "<br clear=3D"none">&gt; BBLAYERS_NON_REMOVABLE ?=3D " \<b=
r clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HO=
ME}/poky-fido/meta \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta-yocto \<br clear=3D"none">&gt; &nb=
sp; "<br clear=3D"none">&gt; ----------------------------------------------=
---------------------------------------------------------------------------=
--<br clear=3D"none">&gt; My local.conf:BB_NUMBER_THREADS =3D "7"<br clear=
=3D"none">&gt; PARALLEL_MAKE =3D "-j7"<br clear=3D"none">&gt; LICENSE_FLAGS=
_WHITELIST =3D "commercial"<br clear=3D"none">&gt; MACHINE =3D "beaglebone"=
<br clear=3D"none">&gt; DISTRO =3D "poky"<br clear=3D"none">&gt; PACKAGE_CL=
ASSES =3D "package_deb"<br clear=3D"none">&gt; EXTRA_IMAGE_FEATURES =3D "de=
bug-tweaks"<br clear=3D"none">&gt; CONF_VERSION =3D "1"<br clear=3D"none">&=
gt; DISTRO_FEATURES_remove =3D "x11 wayland"<br clear=3D"none">&gt; BBMASK =
=3D "meta-embarcados/recipes-browser/chromium/chromium_%.bbappend"<br clear=
=3D"none">&gt; <br clear=3D"none">&gt; ------------------------------------=
---------------------------------------------------------------------------=
------------<br clear=3D"none">&gt; And the complete LOG:<br clear=3D"none"=
>&gt; <a shape=3D"rect" ymailto=3D"mailto:PC@PC" href=3D"mailto:PC@PC">PC@P=
C</a>:~/bbb/build_spain$ bitbake libgles-omap3<br clear=3D"none">&gt; WARNI=
NG: Host distribution "Ubuntu-15.04" has not been validated with this versi=
on of the build system; you may possibly experience unexpected failures. It=
 is recommended that you use a tested distribution.<br clear=3D"none">&gt; =
Parsing recipes: 100% |####################################################=
###########################################################################=
#######################################| Time: 00:00:29<br clear=3D"none">&=
gt; Parsing of 1788 .bb files complete (0 cached, 1788 parsed). 2296 target=
s, 351 skipped, 1 masked, 0 errors.<br clear=3D"none">&gt; NOTE: Resolving =
any missing task queue dependencies<br clear=3D"none">&gt; <br clear=3D"non=
e">&gt; Build Configuration:<br clear=3D"none">&gt; BB_VERSION&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "1.26.0"<br clear=3D"none">&gt; BUILD_SYS=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "x86_64-linux"<br clea=
r=3D"none">&gt; NATIVELSBSTRING&nbsp;&nbsp; =3D "Ubuntu-15.04"<br clear=3D"=
none">&gt; TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm-po=
ky-linux-gnueabi"<br clear=3D"none">&gt; MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "beaglebone"<br clear=3D"none">&gt; D=
ISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=
 "poky"<br clear=3D"none">&gt; DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D "1.8"<b=
r clear=3D"none">&gt; TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm armv7a=
 vfp thumb neon callconvention-hard cortexa8"<br clear=3D"none">&gt; TARGET=
_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "vfp-neon"<br clear=3D"n=
one">&gt; meta-embarcados&nbsp;&nbsp; <br clear=3D"none">&gt; meta-bbb&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:dfb2e27bf26b109=
fc6ccb3bc91924fb3bb24f655"<br clear=3D"none">&gt; meta-ti&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:a666b94e9c676711f1389c=
0628e6c883ef20d5b3"<br clear=3D"none">&gt; meta-qt5&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:fc026381545650e10fdd488d5b2a3b2d78=
f87793"<br clear=3D"none">&gt; meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; <br clear=3D"none">&gt; meta-ruby&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br clear=3D"none">&gt; meta-perl&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br clear=3D"none">&gt; meta-efl&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br clear=3D"none">&gt; m=
eta-multimedia&nbsp;&nbsp; =3D "fido:10d3c8f85280a0bf867a8e4f84bcda81c290d2=
8e"<br clear=3D"none">&gt; meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br clear=3D"none">&gt; meta-yocto&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:08d32590411568e7bf11612ac695=
a6e9c6df6286"<br clear=3D"none">&gt; <br clear=3D"none">&gt; NOTE: Preparin=
g RunQueue<br clear=3D"none">&gt; NOTE: Executing SetScene Tasks<br clear=
=3D"none">&gt; NOTE: Executing RunQueue Tasks<br clear=3D"none">&gt; ERROR:=
 Function failed: do_compile (log file is located at /home/PC/bbb/build_spa=
in/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b=
/temp/log.do_compile.25613)<br clear=3D"none">&gt; ERROR: Logfile of failur=
e stored in: /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueab=
i/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_compile.25613<br clear=3D"n=
one">&gt; Log data follows:<br clear=3D"none">&gt; | DEBUG: Executing shell=
 function do_compile<br clear=3D"none">&gt; | NOTE: make -j7 -e MAKEFLAGS=
=3D KERNEL_SRC=3D/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel=
-source KERNEL_PATH=3D/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/k=
ernel-source KERNEL_VERSION=3D4.1.5 CC=3Darm-poky-linux-gnueabi-gcc&nbsp; -=
mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd&nbsp;&nbsp; AR=
=3Darm-poky-linux-gnueabi-ar&nbsp; O=3D/home/PC/bbb/build_spain/tmp/work-sh=
ared/beaglebone/kernel-build-artifacts BUILD=3Drelease TI_PLATFORM=3Dti335x=
 SUPPORT_XORG=3D<br clear=3D"none">&gt; | make -C /home/PC/bbb/build_spain/=
tmp/work-shared/beaglebone/kernel-source M=3D`pwd`<br clear=3D"none">&gt; |=
 make[1]: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/beag=
lebone/kernel-source'<br clear=3D"none">&gt; | make[2]: Entering directory =
'/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts=
'<br clear=3D"none">&gt; |&nbsp;&nbsp; CC [M]&nbsp; /home/PC/bbb/build_spai=
n/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/=
Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o<br =
clear=3D"none">&gt; | /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-lin=
ux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Li=
nux_KM/services4/srvkm/env/linux/module.c:51:42: fatal error: linux/platfor=
m_data/sgx-omap.h: No such file or directory<br clear=3D"none">&gt; |&nbsp;=
 #include &lt;linux/platform_data/sgx-omap.h&gt;<br clear=3D"none">&gt; |&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ^<br clear=3D"none">&gt; | compilation terminated=
.<br clear=3D"none">&gt; | /home/PC/bbb/build_spain/tmp/work-shared/beagleb=
one/kernel-source/scripts/Makefile.build:258: recipe for target '/home/PC/b=
bb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.0=
1.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux=
/module.o' failed<br clear=3D"none">&gt; | make[3]: *** [/home/PC/bbb/build=
_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-=
r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.=
o] Error 1<br clear=3D"none">&gt; | /home/PC/bbb/build_spain/tmp/work-share=
d/beaglebone/kernel-source/Makefile:1384: recipe for target '_module_/home/=
PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules=
/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM' failed<br clear=3D"n=
one">&gt; | make[2]: *** [_module_/home/PC/bbb/build_spain/tmp/work/beagleb=
one-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_=
01_02/GFX_Linux_KM] Error 2<br clear=3D"none">&gt; | make[2]: Leaving direc=
tory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-arti=
facts'<br clear=3D"none">&gt; | Makefile:146: recipe for target 'sub-make' =
failed<br clear=3D"none">&gt; | make[1]: *** [sub-make] Error 2<br clear=3D=
"none">&gt; | make[1]: Leaving directory '/home/PC/bbb/build_spain/tmp/work=
-shared/beaglebone/kernel-source'<br clear=3D"none">&gt; | Makefile:478: re=
cipe for target 'all' failed<br clear=3D"none">&gt; | make: *** [all] Error=
 2<br clear=3D"none">&gt; | ERROR: oe_runmake failed<br clear=3D"none">&gt;=
 | WARNING: exit code 1 from a shell command.<br clear=3D"none">&gt; | ERRO=
R: Function failed: do_compile (log file is located at /home/PC/bbb/build_s=
pain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r2=
2b/temp/log.do_compile.25613)<br clear=3D"none">&gt; ERROR: Task 119 (/home=
/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb=
, do_compile) failed with exit code '1'<br clear=3D"none">&gt; NOTE: Tasks =
Summary: Attempted 731 tasks of which 720 didn't need to be rerun and 1 fai=
led.<br clear=3D"none">&gt; Waiting for 0 running tasks to finish:<br clear=
=3D"none">&gt; <br clear=3D"none">&gt; Summary: 1 task failed:<br clear=3D"=
none">&gt; &nbsp; /home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-sg=
x-modules_5.01.01.02.bb, do_compile<br clear=3D"none">&gt; Summary: There w=
as 1 WARNING message shown.<br clear=3D"none">&gt; Summary: There was 1 ERR=
OR message shown, returning a non-zero exit code.<br clear=3D"none">&gt; <a=
 shape=3D"rect" ymailto=3D"mailto:PC@PC" href=3D"mailto:PC@PC">PC@PC</a>:~/=
bbb/build_spain<br clear=3D"none">&gt; <br clear=3D"none">&gt; ------------=
---------------------------------------------------------------------------=
------------------------------------<br clear=3D"none">&gt; <br clear=3D"no=
ne">&gt; Thank you for your Time and I hope you can help me.Have a nice day=
.<br clear=3D"none"><br clear=3D"none">&gt; -- <br clear=3D"none">&gt; ____=
___________________________________________<br clear=3D"none">&gt; meta-ti =
mailing list<br clear=3D"none">&gt; <a shape=3D"rect" ymailto=3D"mailto:met=
a-ti@yoctoproject.org" href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoc=
toproject.org</a><br clear=3D"none">&gt; <a shape=3D"rect" href=3D"https://=
lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blank">https://lists.yo=
ctoproject.org/listinfo/meta-ti</a><br clear=3D"none"><br clear=3D"none"></=
div><br><br></div>  </div> </div>  </div></div></body></html>

------=_Part_5095776_1879561460.1439627373969--

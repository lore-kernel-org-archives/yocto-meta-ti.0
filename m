Return-Path: <dgomez@iseebcn.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9D60E00D0A; Thu, 14 Jul 2016 08:57:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB00BE0095F
	for <meta-ti@yoctoproject.org>; Thu, 14 Jul 2016 08:57:44 -0700 (PDT)
Received: by mail-wm0-f43.google.com with SMTP id i5so118816817wmg.0
	for <meta-ti@yoctoproject.org>; Thu, 14 Jul 2016 08:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iseebcn-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=u5R5kVDn6Hr0LmwyC3xWYFPVNnUdY1AVFN4N58Az7KQ=;
	b=B3L4OLmXQQQe6E4dCLKHjZTc0Gklmw07FoP3D+aNvi46RDWBKoeARKGMRyCsjKDVXh
	CZcwPUT99x4xv/YsfMrHb/ObFlm2F02YJ8Nu7fdrKUvKFvnBgZKtTyYMSHf7KH7S6fq6
	OXYUfqqogZN3DcRlz2m6GPsZCEdKj1cQmMU1+CKDsIJItcVxJxUqoZeHmvzx5IaZn8al
	NwcXkWU8CnB7kCQ8MF6zm4LaVIFj+cAVmMFAnrLsCDVV7hTX/xbtgAts0+t8V1TpabMr
	V3CchDsnPpnHE3bKSaG5CoqrLWsAcWYNjpu5kw6InfQBlZ7cPGyZ6UusdjDDycX90LO5
	6dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=u5R5kVDn6Hr0LmwyC3xWYFPVNnUdY1AVFN4N58Az7KQ=;
	b=GGEYndKbVob+WW3RA4Q7N4aGehcK0g462CmdCalSLdXWKNhJw/2/nudkn51pk8hf+m
	aT7JxFVNRT+6velXci/RnJyuuuK/D26C8IV0eUIgi55mWT7qZvnBYj1GEYwsdBciL0VR
	COkwGEjO506n+9GfZJZ3EQ23pnXXjL+VyAMv7c63jG/JqzxeSbgFcULQ2MfaGiOUIS24
	tOyCztfU5P4db3bfWa/FUNO438OzrUjiMLgDfGqt+RpR7paa6eu9ma9JPaUJnZ/1isMY
	4Ov6FoEQk5oNdMfqKrt8E405DH5J+Zt1GnQNjP9oKZwnj28oi4pJd8pUOmnuMomRJSpj
	EVyQ==
X-Gm-Message-State: ALyK8tIeotWYqZj6cUtzWFqWKvWIWhjiPQVU88mAxLQvOD6LseqDdIn503BkHGqPrYeijJWt4mnmEyXdGMQR7Q==
X-Received: by 10.28.232.145 with SMTP id f17mr7236502wmi.15.1468511863206;
	Thu, 14 Jul 2016 08:57:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.75.134 with HTTP; Thu, 14 Jul 2016 08:57:42 -0700 (PDT)
From: Daniel Gomez <dgomez@iseebcn.com>
Date: Thu, 14 Jul 2016 17:57:42 +0200
Message-ID: <CADqvwgO+fJYtxOf4pq7LaGWsMC0H_nrpQGR7Zf3zP_pSvnGqnw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: omap3-sgx-modules kernel 3.14
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jul 2016 15:57:52 -0000
Content-Type: multipart/alternative; boundary=001a11466d9af48ecc05379a8faa

--001a11466d9af48ecc05379a8faa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to compile omap3-sgx-modules for the omap3 platform (omap3630)
against 3.14 kernel version but several errors have appeared on bc_cat.c
file compilation.

Is it possible to compile SDK 4.05 or higher against 3.13 or 3.14 kernel
versions and get SGX acceleration?

Thank you

HOST Environment:
* Kernel
Linux xubuntu-VirtualBox 3.2.0-104-generic #145-Ubuntu SMP Thu Jun 9
09:53:59 UTC 2016 i686 i686 i386 GNU/Linux

* Distro
Distributor ID:    Ubuntu
Description:    Ubuntu 12.04.5 LTS
Release:    12.04
Codename:    precise

* poky:
repo: git://git.yoctoproject.org/poky
branch: fido

* meta-ti
repo: git://git.yoctoproject.org/meta-ti
branch: fido

* machine
MACHINE=3Dbeagleboard

* recipe omap3-sgx-modules
meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
TI_PLATFORM_omap3 =3D "omap3630"

# output
$ MACHINE=3Dbeagleboard bitbake omap3-sgx-modules
WARNING: Host distribution "Ubuntu-12.04" has not been validated with this
version of the build system; you may possibly experience unexpected
failures. It is recommended that you use a tested distribution.
Loading cache: 100%
|##########################################################################=
###########################################################################=
###################################################|
ETA:  00:00:00
Loaded 2 entries from dependency cache.
Parsing recipes: 100%
|##########################################################################=
###########################################################################=
#################################################|
Time: 00:01:37
Parsing of 1059 .bb files complete (1 cached, 1058 parsed). 1469 targets,
151 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.26.0"
BUILD_SYS         =3D "i686-linux"
NATIVELSBSTRING   =3D "Ubuntu-12.04"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "beagleboard"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.8.2"
TUNE_FEATURES     =3D "arm armv7a vfp thumb neon callconvention-hard cortex=
a8"
TARGET_FPU        =3D "vfp-neon"
meta
meta-yocto
meta-yocto-bsp    =3D "fido:c9f0a99050ec0050f0dbcd55d0cd2ab18848113f"
meta-ti           =3D "fido:632ea21d490022bbca34ee43bda31bbe5678a779"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL
http://www.openssl.org/source/old/1.0.2/openssl-1.0.2h.tar.gz, attempting
MIRRORS if available
WARNING:
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM
('S') doesn't exist, please set 'S' to a proper value
WARNING: TI installer requires 32bit glibc libraries for proper operation
run 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on
Ubuntu/Debian
ERROR: Function failed: do_compile (log file is located at
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/4.05.00.03-r126c/temp/log.do_compile.6024)
ERROR: Logfile of failure stored in:
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/4.05.00.03-r126c/temp/log.do_compile.6024
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 2 -e MAKEFLAGS=3D
KERNEL_SRC=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
 -mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
 O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630
| make -C /<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
M=3D`pwd`
| make[1]: Entering directory
`/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source'
|   LD
 /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modul=
es/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty=
/bufferclass_ti/built-in.o
|   CC [M]
 /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modul=
es/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty=
/bufferclass_ti/bc_cat.o
|
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/=
bufferclass_ti/bc_cat.c:
In function 'bc_cat_init':
|
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/=
bufferclass_ti/bc_cat.c:612:6:
error: implicit declaration of function 'cpu_is_omap3530'
[-Werror=3Dimplicit-function-declaration]
|       width_align =3D cpu_is_omap3530() && ( omap_rev() <
OMAP3430_REV_ES3_0 ) ? 32 : 8;
|       ^
|
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/=
bufferclass_ti/bc_cat.c:612:6:
error: implicit declaration of function 'omap_rev'
[-Werror=3Dimplicit-function-declaration]
|
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/=
bufferclass_ti/bc_cat.c:612:56:
error: 'OMAP3430_REV_ES3_0' undeclared (first use in this function)
|       width_align =3D cpu_is_omap3530() && ( omap_rev() <
OMAP3430_REV_ES3_0 ) ? 32 : 8;
|                                                         ^
|
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/=
bufferclass_ti/bc_cat.c:612:56:
note: each undeclared identifier is reported only once for each function it
appears in
| cc1: some warnings being treated as errors
| make[4]: ***
[/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modul=
es/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty=
/bufferclass_ti/bc_cat.o]
Error 1
| make[3]: ***
[/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modul=
es/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty=
/bufferclass_ti]
Error 2
| make[2]: ***
[_module_/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-s=
gx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM]
Error 2
| make[1]: *** [sub-make] Error 2
| make[1]: Leaving directory
`/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/4.05.00.03-r126c/temp/log.do_compile.6024)
ERROR: Task 7 (/<path>/poky/meta-ti/recipes-bsp/powervr-drivers/
omap3-sgx-modules_4.05.00.03.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 417 tasks of which 0 didn't need to be rerun
and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /<path>/poky/meta-ti/recipes-bsp/powervr-drivers/
omap3-sgx-modules_4.05.00.03.bb, do_compile
Summary: There were 4 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Daniel G=C3=B3mez

--001a11466d9af48ecc05379a8faa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br>I&#39;m trying to compile omap3-sgx-module=
s for the omap3 platform (omap3630) against 3.14 kernel version but several=
 errors have appeared on bc_cat.c file compilation. <br><br>Is it possible =
to compile SDK 4.05 or higher against 3.13 or 3.14 kernel versions and get =
SGX acceleration? <br><br></div><div>Thank you<br></div><div><br><font size=
=3D"1"><span style=3D"font-family:monospace,monospace">HOST Environment:<br=
>* Kernel<br>Linux xubuntu-VirtualBox 3.2.0-104-generic #145-Ubuntu SMP Thu=
 Jun 9 09:53:59 UTC 2016 i686 i686 i386 GNU/Linux<br><br>* Distro<br>Distri=
butor ID: =C2=A0 =C2=A0Ubuntu<br>Description: =C2=A0 =C2=A0Ubuntu 12.04.5 L=
TS<br>Release: =C2=A0 =C2=A012.04<br>Codename: =C2=A0 =C2=A0precise<br><br>=
* poky:<br>repo: git://<a href=3D"http://git.yoctoproject.org/poky">git.yoc=
toproject.org/poky</a><br>branch: fido<br><br>* meta-ti<br>repo: git://<a h=
ref=3D"http://git.yoctoproject.org/meta-ti">git.yoctoproject.org/meta-ti</a=
><br>branch: fido<br><br>* machine<br>MACHINE=3Dbeagleboard<br><br>* recipe=
 omap3-sgx-modules<br>meta-ti/recipes-bsp/powervr-drivers/<a href=3D"http:/=
/omap3-sgx-modules_4.05.00.03.bb">omap3-sgx-modules_4.05.00.03.bb</a><br>TI=
_PLATFORM_omap3 =3D &quot;omap3630&quot;<br><br># output<br>$ MACHINE=3Dbea=
gleboard bitbake omap3-sgx-modules<br>WARNING: Host distribution &quot;Ubun=
tu-12.04&quot; has not been validated with this version of the build system=
; you may possibly experience unexpected failures. It is recommended that y=
ou use a tested distribution.<br>Loading cache: 100% |#####################=
###########################################################################=
###########################################################################=
#############################| ETA: =C2=A000:00:00<br>Loaded 2 entries from=
 dependency cache.<br>Parsing recipes: 100% |##############################=
###########################################################################=
###########################################################################=
##################| Time: 00:01:37<br>Parsing of 1059 .bb files complete (1=
 cached, 1058 parsed). 1469 targets, 151 skipped, 0 masked, 0 errors.<br>NO=
TE: Resolving any missing task queue dependencies<br><br>Build Configuratio=
n:<br>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.26.0&quot;<br>BUILD=
_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;i686-linux&quot;<br>NATIVELSBSTR=
ING =C2=A0 =3D &quot;Ubuntu-12.04&quot;<br>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;arm-poky-linux-gnueabi&quot;<br>MACHINE =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;beagleboard&quot;<br>DISTRO =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky&quot;<br>DISTRO_VERSION =C2=A0 =C2=
=A0=3D &quot;1.8.2&quot;<br>TUNE_FEATURES =C2=A0 =C2=A0 =3D &quot;arm armv7=
a vfp thumb neon callconvention-hard cortexa8&quot;<br>TARGET_FPU =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D &quot;vfp-neon&quot;<br>meta =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <br>meta-yocto =C2=A0 =C2=A0 =C2=A0 <br>meta-yocto-bsp=
 =C2=A0 =C2=A0=3D &quot;fido:c9f0a99050ec0050f0dbcd55d0cd2ab18848113f&quot;=
<br>meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;fido:632ea21d49002=
2bbca34ee43bda31bbe5678a779&quot;<br><br>NOTE: Preparing RunQueue<br>NOTE: =
Executing SetScene Tasks<br>NOTE: Executing RunQueue Tasks<br>WARNING: Fail=
ed to fetch URL <a href=3D"http://www.openssl.org/source/old/1.0.2/openssl-=
1.0.2h.tar.gz">http://www.openssl.org/source/old/1.0.2/openssl-1.0.2h.tar.g=
z</a>, attempting MIRRORS if available<br>WARNING: /&lt;path&gt;/poky/build=
/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c=
/Graphics_SDK_4_05_00_03/GFX_Linux_KM (&#39;S&#39;) doesn&#39;t exist, plea=
se set &#39;S&#39; to a proper value<br>WARNING: TI installer requires 32bi=
t glibc libraries for proper operation<br>run &#39;yum install glibc.i686&#=
39; on Fedora or &#39;apt-get install ia32-libs&#39; on Ubuntu/Debian<br>ER=
ROR: Function failed: do_compile (log file is located at /&lt;path&gt;/poky=
/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03=
-r126c/temp/log.do_compile.6024)<br>ERROR: Logfile of failure stored in: /&=
lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mo=
dules/4.05.00.03-r126c/temp/log.do_compile.6024<br>Log data follows:<br>| D=
EBUG: Executing shell function do_compile<br>| NOTE: make -j 2 -e MAKEFLAGS=
=3D KERNEL_SRC=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kerne=
l-source KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard=
/kernel-source KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnu=
eabi-gcc =C2=A0-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bf=
d =C2=A0 AR=3Darm-poky-linux-gnueabi-ar =C2=A0O=3D/&lt;path&gt;/poky/build/=
tmp/work-shared/beagleboard/kernel-build-artifacts BUILD=3Drelease TI_PLATF=
ORM=3Domap3630<br>| make -C /&lt;path&gt;/poky/build/tmp/work-shared/beagle=
board/kernel-source M=3D`pwd`<br>| make[1]: Entering directory `/&lt;path&g=
t;/poky/build/tmp/work-shared/beagleboard/kernel-source&#39;<br>| =C2=A0 LD=
 =C2=A0 =C2=A0 =C2=A0/&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-lin=
ux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_L=
inux_KM/services4/3rdparty/bufferclass_ti/built-in.o<br>| =C2=A0 CC [M] =C2=
=A0/&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-s=
gx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/=
3rdparty/bufferclass_ti/bc_cat.o<br>| /&lt;path&gt;/poky/build/tmp/work/bea=
gleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK=
_4_05_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.c: In fun=
ction &#39;bc_cat_init&#39;:<br>| /&lt;path&gt;/poky/build/tmp/work/beagleb=
oard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_0=
5_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.c:612:6: erro=
r: implicit declaration of function &#39;cpu_is_omap3530&#39; [-Werror=3Dim=
plicit-function-declaration]<br>| =C2=A0 =C2=A0 =C2=A0 width_align =3D cpu_=
is_omap3530() &amp;&amp; ( omap_rev() &lt; OMAP3430_REV_ES3_0 ) ? 32 : 8;<b=
r>| =C2=A0 =C2=A0 =C2=A0 ^<br>| /&lt;path&gt;/poky/build/tmp/work/beagleboa=
rd-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_=
00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.c:612:6: error:=
 implicit declaration of function &#39;omap_rev&#39; [-Werror=3Dimplicit-fu=
nction-declaration]<br>| /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky=
-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/G=
FX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.c:612:56: error: &#39;=
OMAP3430_REV_ES3_0&#39; undeclared (first use in this function)<br>| =C2=A0=
 =C2=A0 =C2=A0 width_align =3D cpu_is_omap3530() &amp;&amp; ( omap_rev() &l=
t; OMAP3430_REV_ES3_0 ) ? 32 : 8;<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^<br>| /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-lin=
ux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_L=
inux_KM/services4/3rdparty/bufferclass_ti/bc_cat.c:612:56: note: each undec=
lared identifier is reported only once for each function it appears in<br>|=
 cc1: some warnings being treated as errors<br>| make[4]: *** [/&lt;path&gt=
;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05=
.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/buffer=
class_ti/bc_cat.o] Error 1<br>| make[3]: *** [/&lt;path&gt;/poky/build/tmp/=
work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Grap=
hics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti] Error 2=
<br>| make[2]: *** [_module_/&lt;path&gt;/poky/build/tmp/work/beagleboard-p=
oky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_0=
3/GFX_Linux_KM] Error 2<br>| make[1]: *** [sub-make] Error 2<br>| make[1]: =
Leaving directory `/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/ker=
nel-source&#39;<br>| make: *** [all] Error 2<br>| ERROR: oe_runmake failed<=
br>| WARNING: exit code 1 from a shell command.<br>| ERROR: Function failed=
: do_compile (log file is located at /&lt;path&gt;/poky/build/tmp/work/beag=
leboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/temp/log.do_c=
ompile.6024)<br>ERROR: Task 7 (/&lt;path&gt;/poky/meta-ti/recipes-bsp/power=
vr-drivers/<a href=3D"http://omap3-sgx-modules_4.05.00.03.bb">omap3-sgx-mod=
ules_4.05.00.03.bb</a>, do_compile) failed with exit code &#39;1&#39;<br>NO=
TE: Tasks Summary: Attempted 417 tasks of which 0 didn&#39;t need to be rer=
un and 1 failed.<br>Waiting for 0 running tasks to finish:<br><br>Summary: =
1 task failed:<br>=C2=A0 /&lt;path&gt;/poky/meta-ti/recipes-bsp/powervr-dri=
vers/<a href=3D"http://omap3-sgx-modules_4.05.00.03.bb">omap3-sgx-modules_4=
.05.00.03.bb</a>, do_compile<br>Summary: There were 4 WARNING messages show=
n.<br>Summary: There was 1 ERROR message shown, returning a non-zero exit c=
ode.</span></font><br><br clear=3D"all"><div><div class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Daniel G=C3=B3mez</div=
></div></div>
</div></div>

--001a11466d9af48ecc05379a8faa--

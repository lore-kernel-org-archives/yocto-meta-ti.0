Return-Path: <dgomez@iseebcn.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11B60E00C1E; Mon, 18 Jul 2016 01:34:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C2A1E009CD
	for <meta-ti@yoctoproject.org>; Mon, 18 Jul 2016 01:34:45 -0700 (PDT)
Received: by mail-wm0-f48.google.com with SMTP id f65so93292840wmi.0
	for <meta-ti@yoctoproject.org>; Mon, 18 Jul 2016 01:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iseebcn-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GNQYiXnjoauK9yUkT2HcMjZxueedpk5nmEEyBfc2PEA=;
	b=Lek0GpfmbGwjhnKTHJBsUXcmh7YanDACrs3CXzKm0nHDiY3AYLkM3U+Iukpm7TmNtI
	iO0jiNVKUvj3VPrE3fXsjxf5smEqDxKZvpF9jt+tleeUZhFEc8obd5oA7U3C0PiyWMLA
	SMvnKfV1lB60cf7ghEVdjQZ9mGkkKXPm31GcbKbWTThqh58Pav8+mRE87WF34Ms2d8xz
	0KpsDro69zVzFW5UToeidqsDIUu3oCV9iFv3EfAzqG7aeVgi1hBt9o/GEs2O1tyXwmdH
	CrAZAgpi+3H766m9EhjD13SaKLswnTXd8Rcbn7DE/KBMIMo8K6Aj2yuO9FFrbGQJ1QJi
	JN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GNQYiXnjoauK9yUkT2HcMjZxueedpk5nmEEyBfc2PEA=;
	b=NhXCPFysK3wCRuSfr1mB1OXSgx58e+ttrbRB/QCNc+J2ssKXdPNEwofEeHcTeeVVQm
	xZURDbPWK1fJTg5dPdaoIP+yuGlxB0fDKHdtYGLq7V+nSibzWhxjD0Q/CWEIO7RKKuqS
	YDektvzO7yVjgAJ88RBQ9rX5yQJIOIWzYlGivpMZcldW6rhycUxOzLu7H4ewMTz6DE66
	HKK+pXTAj0F/m09uepir8vD7fW2c3VZTt25zuyDXtmD7ooqvXPp4Pnf9s99hD1KzWH0J
	k6xoFG3kGKIh82SlteO71nksDou0WD3gb9SBuWQH5WMNZaPiNF3q6+ihhfOy3+FLkY+w
	8aQg==
X-Gm-Message-State: ALyK8tI23OiaAiEw2ZXN52LQcowf3yzGQZKC/jbQ5M0wEyrvmMnWUOlVfpcpnJ7WRUOAodUyuHHRGV3rieQZcQ==
X-Received: by 10.28.30.83 with SMTP id e80mr34316743wme.97.1468830884299;
	Mon, 18 Jul 2016 01:34:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.75.134 with HTTP; Mon, 18 Jul 2016 01:34:43 -0700 (PDT)
In-Reply-To: <CADqvwgPA+qcSjcqD-=MCPfm69Oz5PsF0nhwvnu2yBnm3dq2cww@mail.gmail.com>
References: <CADqvwgO+fJYtxOf4pq7LaGWsMC0H_nrpQGR7Zf3zP_pSvnGqnw@mail.gmail.com>
	<20160714162913.GF32054@edge>
	<CADqvwgPA+qcSjcqD-=MCPfm69Oz5PsF0nhwvnu2yBnm3dq2cww@mail.gmail.com>
From: Daniel Gomez <dgomez@iseebcn.com>
Date: Mon, 18 Jul 2016 10:34:43 +0200
Message-ID: <CADqvwgMwxd-n+i3SMZPM3svM3A-kKUrQZSiEU_NYPCAqDiy3dQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: omap3-sgx-modules kernel 3.14
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
X-List-Received-Date: Mon, 18 Jul 2016 08:34:51 -0000
Content-Type: multipart/alternative; boundary=001a114b43721818750537e4d729

--001a114b43721818750537e4d729
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Denys,

I have repeated the same procedure in another environment and this is the
result:

HOST Environment:
* Kernel
Linux dgx1404 4.2.0-42-generic #49~14.04.1-Ubuntu SMP Wed Jun 29 20:22:11
UTC 2016 x86_64 x86_64 x86_64 GNU/Linux

* Distro
Distributor ID:    Ubuntu
Description:    Ubuntu 14.04.4 LTS
Release:    14.04
Codename:    trusty

# Steps:
$ git clone -b fido git://git.yoctoproject.org/poky
$ cd poky; git clone -b fido git://git.yoctoproject.org/meta-ti
$ source oe-env-xx

# added 'meta-ti' to conf/bblayers.conf
# added MACHINE ?=3D "beagleboard" into the conf/local.conf
# added PREFERRED_VERSION_omap3-sgx-modules =3D "5.01.01.01" into the
conf/local.conf
# added PREFERRED_VERSION_libgles-omap3 =3D "5.01.01.01" into the
conf/local.conf

$ bitbake omap3-sgx-modules -v

# output
Log data follows:
| DEBUG: Executing shell function do_compile
| +
| cd
|
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM
|
|
| +
| do_compile
|
|
| +
| module_do_compile
|
|
| +
| unset
|  CFLAGS
|  CPPFLAGS
|  CXXFLAGS
|  LDFLAGS
|
|
| +
| oe_runmake
|  KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-sour=
ce
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
| + oe_runmake_call
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
| + bbnote make -j 4 -e MAKEFLAGS=3D
KERNEL_SRC=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
| + echo NOTE: make -j 4 -e MAKEFLAGS=3D
KERNEL_SRC=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
| NOTE: make -j 4 -e MAKEFLAGS=3D
KERNEL_SRC=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
| + make -j 4 -e MAKEFLAGS=3D
KERNEL_SRC=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
|
| make -C /<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
M=3D`pwd`
|
| make[1]: Entering directory
`/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source'
|
|   CC [M]
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/=
dc_omapfb3_linux/omaplfb_linux.o
|
|
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/=
dc_omapfb3_linux/omaplfb_linux.c:
In function 'OMAPLFBWaitForVSync':
|
|
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/=
dc_omapfb3_linux/omaplfb_linux.c:180:92:
error: 'struct omap_dss_device' has no member named 'output'
|  #define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man =3D
(dev) !=3D NULL ? (dev)->output->manager : NULL
|
^
|
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/=
dc_omapfb3_linux/omaplfb_linux.c:821:2:
note: in expansion of macro 'OMAP_DSS_MANAGER'
|   OMAP_DSS_MANAGER(psDSSMan, psDSSDev);
|   ^
|
| + cd
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM
| + do_compile
| + module_do_compile
| + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
| + oe_runmake
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
| + oe_runmake_call
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
| + bbnote make -j 4 -e MAKEFLAGS=3D
KERNEL_SRC=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
| + echo NOTE: make -j 4 -e MAKEFLAGS=3D
KERNEL_SRC=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
| NOTE: make -j 4 -e MAKEFLAGS=3D
KERNEL_SRC=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
| + make -j 4 -e MAKEFLAGS=3D
KERNEL_SRC=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
-mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
AR=3Darm-poky-linux-gnueabi-ar
O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D
| make -C /<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
M=3D`pwd`
| make[1]: Entering directory
`/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source'
|   CC [M]
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/=
dc_omapfb3_linux/omaplfb_linux.o
|
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/=
dc_omapfb3_linux/omaplfb_linux.c:
In function 'OMAPLFBWaitForVSync':
| /<path>/poky/build/tmpmake[4]: ***
[/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modul=
es/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty=
/dc_omapfb3_linux/omaplfb_linux.o]
Error 1
|
| make[3]: ***
[/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modul=
es/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty=
/dc_omapfb3_linux]
Error 2
|
| make[2]: ***
[_module_/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-s=
gx-modules/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM]
Error 2
|
| make[1]: *** [sub-make] Error 2
| make[1]: Leaving directory
`/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source'
|
| make: *** [all] Error 2
|
| + die oe_runmake failed
| + bbfatal oe_runmake failed
| + echo ERROR: oe_runmake failed
| ERROR: oe_runmake failed
| + exit 1
| + bb_exit_handler
| + ret=3D1
| + echo WARNING: exit code 1 from a shell command.
| WARNING: exit code 1 from a shell command.
| + exit 1
|
|
/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r126d/Gra=
phics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omapl=
fb_linux.c:180:92:
error: 'struct omap_dss_device' has no member named 'output'
|  #define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man =3D
(dev) !=3D NULL ? (dev)->output->manager : NULL
|
^
|
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/=
dc_omapfb3_linux/omaplfb_linux.c:821:2:
note: in expansion of macro 'OMAP_DSS_MANAGER'
|   OMAP_DSS_MANAGER(psDSSMan, psDSSDev);
|   ^
| make[4]: ***
[/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modul=
es/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty=
/dc_omapfb3_linux/omaplfb_linux.o]
Error 1
| make[3]: ***
[/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modul=
es/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty=
/dc_omapfb3_linux]
Error 2
| make[2]: ***
[_module_/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-s=
gx-modules/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM]
Error 2
| make[1]: *** [sub-make] Error 2
| make[1]: Leaving directory
`/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source'
| make: *** [all] Error 2
| + die oe_runmake failed
| + bbfatal oe_runmake failed
| + echo ERROR: oe_runmake failed
| ERROR: oe_runmake failed
| + exit 1
| + bb_exit_handler
| + ret=3D1
| + echo WARNING: exit code 1 from a shell command.
| WARNING: exit code 1 from a shell command.
| + exit 1
| ERROR: Function failed: do_compile (log file is located at
/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-module=
s/5.01.01.01-r126d/temp/log.do_compile.12455)
ERROR: Task 7 (/<path>/poky/meta-ti/recipes-bsp/powervr-drivers/
omap3-sgx-modules_5.01.01.01.bb, do_compile) failed with exit code '1'


There is any kernel patch needed to supply this output member? Or this
omaplfb_linux source file needs an update/patch?

Thank you in advance


Daniel G=C3=B3mez

2016-07-15 9:14 GMT+02:00 Daniel Gomez <dgomez@iseebcn.com>:

> Hi Denys,
>
> I'm using this kernel recipe (linux-mainline):
>
> * Recipe:
> meta-ti/recipes-kernel/linux-mainline-3.14.bb
>
> $ bitbake -s
> ..
> linux-mainline
> :3.14.43-r0
>
>
> omap3.inc file has not been modified:
> poky/meta-ti/conf$ grep -r "linux" .
> ..
> ./machine/include/omap3.inc:PREFERRED_PROVIDER_virtual/kernel =3D
> "linux-mainline"
>
>
>
> Daniel G=C3=B3mez
>
> 2016-07-14 18:29 GMT+02:00 Denys Dmytriyenko <denys@ti.com>:
>
>> On Thu, Jul 14, 2016 at 05:57:42PM +0200, Daniel Gomez wrote:
>> > Hi,
>> >
>> > I'm trying to compile omap3-sgx-modules for the omap3 platform
>> (omap3630)
>> > against 3.14 kernel version but several errors have appeared on bc_cat=
.c
>> > file compilation.
>> >
>> > Is it possible to compile SDK 4.05 or higher against 3.13 or 3.14 kern=
el
>> > versions and get SGX acceleration?
>>
>> What kernel recipe/tree is being used?
>>
>>
>> > Thank you
>> >
>> > HOST Environment:
>> > * Kernel
>> > Linux xubuntu-VirtualBox 3.2.0-104-generic #145-Ubuntu SMP Thu Jun 9
>> > 09:53:59 UTC 2016 i686 i686 i386 GNU/Linux
>> >
>> > * Distro
>> > Distributor ID:    Ubuntu
>> > Description:    Ubuntu 12.04.5 LTS
>> > Release:    12.04
>> > Codename:    precise
>> >
>> > * poky:
>> > repo: git://git.yoctoproject.org/poky
>> > branch: fido
>> >
>> > * meta-ti
>> > repo: git://git.yoctoproject.org/meta-ti
>> > branch: fido
>> >
>> > * machine
>> > MACHINE=3Dbeagleboard
>> >
>> > * recipe omap3-sgx-modules
>> > meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
>> > TI_PLATFORM_omap3 =3D "omap3630"
>> >
>> > # output
>> > $ MACHINE=3Dbeagleboard bitbake omap3-sgx-modules
>> > WARNING: Host distribution "Ubuntu-12.04" has not been validated with
>> this
>> > version of the build system; you may possibly experience unexpected
>> > failures. It is recommended that you use a tested distribution.
>> > Loading cache: 100%
>> >
>> |#######################################################################=
###########################################################################=
######################################################|
>> > ETA:  00:00:00
>> > Loaded 2 entries from dependency cache.
>> > Parsing recipes: 100%
>> >
>> |#######################################################################=
###########################################################################=
####################################################|
>> > Time: 00:01:37
>> > Parsing of 1059 .bb files complete (1 cached, 1058 parsed). 1469
>> targets,
>> > 151 skipped, 0 masked, 0 errors.
>> > NOTE: Resolving any missing task queue dependencies
>> >
>> > Build Configuration:
>> > BB_VERSION        =3D "1.26.0"
>> > BUILD_SYS         =3D "i686-linux"
>> > NATIVELSBSTRING   =3D "Ubuntu-12.04"
>> > TARGET_SYS        =3D "arm-poky-linux-gnueabi"
>> > MACHINE           =3D "beagleboard"
>> > DISTRO            =3D "poky"
>> > DISTRO_VERSION    =3D "1.8.2"
>> > TUNE_FEATURES     =3D "arm armv7a vfp thumb neon callconvention-hard
>> cortexa8"
>> > TARGET_FPU        =3D "vfp-neon"
>> > meta
>> > meta-yocto
>> > meta-yocto-bsp    =3D "fido:c9f0a99050ec0050f0dbcd55d0cd2ab18848113f"
>> > meta-ti           =3D "fido:632ea21d490022bbca34ee43bda31bbe5678a779"
>> >
>> > NOTE: Preparing RunQueue
>> > NOTE: Executing SetScene Tasks
>> > NOTE: Executing RunQueue Tasks
>> > WARNING: Failed to fetch URL
>> > http://www.openssl.org/source/old/1.0.2/openssl-1.0.2h.tar.gz,
>> attempting
>> > MIRRORS if available
>> > WARNING:
>> >
>> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mod=
ules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM
>> > ('S') doesn't exist, please set 'S' to a proper value
>> > WARNING: TI installer requires 32bit glibc libraries for proper
>> operation
>> > run 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' =
on
>> > Ubuntu/Debian
>> > ERROR: Function failed: do_compile (log file is located at
>> >
>> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mod=
ules/4.05.00.03-r126c/temp/log.do_compile.6024)
>> > ERROR: Logfile of failure stored in:
>> >
>> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mod=
ules/4.05.00.03-r126c/temp/log.do_compile.6024
>> > Log data follows:
>> > | DEBUG: Executing shell function do_compile
>> > | NOTE: make -j 2 -e MAKEFLAGS=3D
>> > KERNEL_SRC=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-sou=
rce
>> > KERNEL_PATH=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-so=
urce
>> > KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc
>> >  -mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd
>> > AR=3Darm-poky-linux-gnueabi-ar
>> >  O=3D/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artif=
acts
>> > BUILD=3Drelease TI_PLATFORM=3Domap3630
>> > | make -C /<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
>> > M=3D`pwd`
>> > | make[1]: Entering directory
>> > `/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source'
>> > |   LD
>> >
>> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mod=
ules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdpar=
ty/bufferclass_ti/built-in.o
>> > |   CC [M]
>> >
>> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mod=
ules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdpar=
ty/bufferclass_ti/bc_cat.o
>> > |
>> >
>> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mod=
ules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdpar=
ty/bufferclass_ti/bc_cat.c:
>> > In function 'bc_cat_init':
>> > |
>> >
>> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mod=
ules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdpar=
ty/bufferclass_ti/bc_cat.c:612:6:
>> > error: implicit declaration of function 'cpu_is_omap3530'
>> > [-Werror=3Dimplicit-function-declaration]
>> > |       width_align =3D cpu_is_omap3530() && ( omap_rev() <
>> > OMAP3430_REV_ES3_0 ) ? 32 : 8;
>> > |       ^
>> > |
>> >
>> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mod=
ules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdpar=
ty/bufferclass_ti/bc_cat.c:612:6:
>> > error: implicit declaration of function 'omap_rev'
>> > [-Werror=3Dimplicit-function-declaration]
>> > |
>> >
>> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mod=
ules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdpar=
ty/bufferclass_ti/bc_cat.c:612:56:
>> > error: 'OMAP3430_REV_ES3_0' undeclared (first use in this function)
>> > |       width_align =3D cpu_is_omap3530() && ( omap_rev() <
>> > OMAP3430_REV_ES3_0 ) ? 32 : 8;
>> > |                                                         ^
>> > |
>> >
>> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mod=
ules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdpar=
ty/bufferclass_ti/bc_cat.c:612:56:
>> > note: each undeclared identifier is reported only once for each
>> function it
>> > appears in
>> > | cc1: some warnings being treated as errors
>> > | make[4]: ***
>> >
>> [/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mo=
dules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdpa=
rty/bufferclass_ti/bc_cat.o]
>> > Error 1
>> > | make[3]: ***
>> >
>> [/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mo=
dules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdpa=
rty/bufferclass_ti]
>> > Error 2
>> > | make[2]: ***
>> >
>> [_module_/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap=
3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM]
>> > Error 2
>> > | make[1]: *** [sub-make] Error 2
>> > | make[1]: Leaving directory
>> > `/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source'
>> > | make: *** [all] Error 2
>> > | ERROR: oe_runmake failed
>> > | WARNING: exit code 1 from a shell command.
>> > | ERROR: Function failed: do_compile (log file is located at
>> >
>> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-mod=
ules/4.05.00.03-r126c/temp/log.do_compile.6024)
>> > ERROR: Task 7 (/<path>/poky/meta-ti/recipes-bsp/powervr-drivers/
>> > omap3-sgx-modules_4.05.00.03.bb, do_compile) failed with exit code '1'
>> > NOTE: Tasks Summary: Attempted 417 tasks of which 0 didn't need to be
>> rerun
>> > and 1 failed.
>> > Waiting for 0 running tasks to finish:
>> >
>> > Summary: 1 task failed:
>> >   /<path>/poky/meta-ti/recipes-bsp/powervr-drivers/
>> > omap3-sgx-modules_4.05.00.03.bb, do_compile
>> > Summary: There were 4 WARNING messages shown.
>> > Summary: There was 1 ERROR message shown, returning a non-zero exit
>> code.
>> >
>> > Daniel G=C3=B3mez
>>
>> > --
>> > _______________________________________________
>> > meta-ti mailing list
>> > meta-ti@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-ti
>>
>>
>

--001a114b43721818750537e4d729
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Denys,<br><br></div>I have repeated the =
same procedure in another environment and this is the result:<br><br><font =
size=3D"1"><span style=3D"font-family:monospace,monospace">HOST Environment=
:<br>* Kernel<br>Linux dgx1404 4.2.0-42-generic #49~14.04.1-Ubuntu SMP Wed =
Jun 29 20:22:11 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux<br><br>* Distro<br>=
Distributor ID:=C2=A0=C2=A0=C2=A0 Ubuntu<br>Description:=C2=A0=C2=A0=C2=A0 =
Ubuntu 14.04.4 LTS<br>Release:=C2=A0=C2=A0=C2=A0 14.04<br>Codename:=C2=A0=
=C2=A0=C2=A0 trusty<br></span></font></div><font size=3D"1"><span style=3D"=
font-family:monospace,monospace"><br></span></font></div><font size=3D"1"><=
span style=3D"font-family:monospace,monospace"># Steps:<br></span></font><f=
ont size=3D"1"><span style=3D"font-family:monospace,monospace">$ git clone =
-b fido git://<a href=3D"http://git.yoctoproject.org/poky" target=3D"_blank=
">git.yoctoproject.org/poky</a></span></font><div><div><div><div><font size=
=3D"1"><span style=3D"font-family:monospace,monospace">$ cd poky; git clone=
 -b fido </span></font><font size=3D"1"><span style=3D"font-family:monospac=
e,monospace">git://<a href=3D"http://git.yoctoproject.org/meta-ti" target=
=3D"_blank">git.yoctoproject.org/meta-ti</a><br></span></font></div><div><f=
ont size=3D"1"><span style=3D"font-family:monospace,monospace">$ source oe-=
env-xx<br></span></font></div><div><font size=3D"1"><span style=3D"font-fam=
ily:monospace,monospace"><br># added &#39;meta-ti&#39; to conf/bblayers.con=
f<br></span></font></div><div><font size=3D"1"><span style=3D"font-family:m=
onospace,monospace"># added MACHINE ?=3D &quot;beagleboard&quot; into the c=
onf/local.conf <br></span></font></div><div><font size=3D"1"><span style=3D=
"font-family:monospace,monospace"># added </span></font><font size=3D"1"><s=
pan style=3D"font-family:monospace,monospace"><font size=3D"1"><span style=
=3D"font-family:monospace,monospace">PREFERRED_VERSION_omap3-sgx-modules =
=3D &quot;5.01.01.01&quot;</span></font> into the conf/local.conf<br></span=
></font></div><div><font size=3D"1"><span style=3D"font-family:monospace,mo=
nospace"># added </span></font><font size=3D"1"><span style=3D"font-family:=
monospace,monospace"><font size=3D"1"><span style=3D"font-family:monospace,=
monospace">PREFERRED_VERSION_libgles-omap3 =3D &quot;5.01.01.01&quot;</span=
></font> into the conf/local.conf<br><br>$ bitbake omap3-sgx-modules -v<br>=
</span></font></div><div><font size=3D"1"><span style=3D"font-family:monosp=
ace,monospace"><br></span></font></div><div><font size=3D"1"><span style=3D=
"font-family:monospace,monospace"># output<br>Log data follows:<br>| DEBUG:=
 Executing shell function do_compile<br>| +<br>| cd<br>|=C2=A0 /&lt;path&gt=
;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/5.01=
.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM<br>| <br>| <br>| +<br>| d=
o_compile<br>| <br>| <br>| +<br>| module_do_compile<br>| <br>| <br>| +<br>|=
 unset<br>|=C2=A0 CFLAGS<br>|=C2=A0 CPPFLAGS<br>|=C2=A0 CXXFLAGS<br>|=C2=A0=
 LDFLAGS<br>| <br>| <br>| +<br>| oe_runmake<br>|=C2=A0 KERNEL_PATH=3D/&lt;p=
ath&gt;/poky/build/tmp/work-shared/beagleboard/kernel-source KERNEL_VERSION=
=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc=C2=A0 -mno-thumb-int=
erwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-l=
inux-gnueabi-ar=C2=A0 O=3D/&lt;path&gt;/poky/build/tmp/work-shared/beaglebo=
ard/kernel-build-artifacts BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_X=
ORG=3D<br>| + oe_runmake_call KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp/wo=
rk-shared/beagleboard/kernel-source KERNEL_VERSION=3D3.14.43-g1325370701 CC=
=3Darm-poky-linux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-pok=
y-linux-gnueabi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=
=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-build-artifa=
cts BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D<br>| + bbnote ma=
ke -j 4 -e MAKEFLAGS=3D KERNEL_SRC=3D/&lt;path&gt;/poky/build/tmp/work-shar=
ed/beagleboard/kernel-source KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp/wor=
k-shared/beagleboard/kernel-source KERNEL_VERSION=3D3.14.43-g1325370701 CC=
=3Darm-poky-linux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-pok=
y-linux-gnueabi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=
=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-build-artifa=
cts BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D<br>| + echo NOTE=
: make -j 4 -e MAKEFLAGS=3D KERNEL_SRC=3D/&lt;path&gt;/poky/build/tmp/work-=
shared/beagleboard/kernel-source KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp=
/work-shared/beagleboard/kernel-source KERNEL_VERSION=3D3.14.43-g1325370701=
 CC=3Darm-poky-linux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-=
poky-linux-gnueabi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 =
O=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-build-artif=
acts BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D<br>| NOTE: make=
 -j 4 -e MAKEFLAGS=3D KERNEL_SRC=3D/&lt;path&gt;/poky/build/tmp/work-shared=
/beagleboard/kernel-source KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp/work-=
shared/beagleboard/kernel-source KERNEL_VERSION=3D3.14.43-g1325370701 CC=3D=
arm-poky-linux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-poky-l=
inux-gnueabi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=3D/&=
lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts B=
UILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D<br>| + make -j 4 -e M=
AKEFLAGS=3D KERNEL_SRC=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboa=
rd/kernel-source KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp/work-shared/bea=
gleboard/kernel-source KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-l=
inux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-poky-linux-gnuea=
bi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=3D/&lt;path&gt=
;/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts BUILD=3Drel=
ease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D<br>| <br>| make -C /&lt;path&gt=
;/poky/build/tmp/work-shared/beagleboard/kernel-source M=3D`pwd`<br>| <br>|=
 make[1]: Entering directory `/&lt;path&gt;/poky/build/tmp/work-shared/beag=
leboard/kernel-source&#39;<br>| <br>|=C2=A0=C2=A0 CC [M]=C2=A0 /&lt;path&gt=
;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/5.01=
.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_oma=
pfb3_linux/omaplfb_linux.o<br>| <br>| /&lt;path&gt;/poky/build/tmp/work/bea=
gleboard-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r126d/Graphics_SDK=
_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.=
c: In function &#39;OMAPLFBWaitForVSync&#39;:<br>| <br>| /&lt;path&gt;/poky=
/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01=
-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_l=
inux/omaplfb_linux.c:180:92: error: &#39;struct omap_dss_device&#39; has no=
 member named &#39;output&#39;<br>|=C2=A0 #define OMAP_DSS_MANAGER(man, dev=
) struct omap_overlay_manager *man =3D (dev) !=3D NULL ? (dev)-&gt;output-&=
gt;manager : NULL<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>| /&lt;path&gt;/po=
ky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.=
01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3=
_linux/omaplfb_linux.c:821:2: note: in expansion of macro &#39;OMAP_DSS_MAN=
AGER&#39;<br>|=C2=A0=C2=A0 OMAP_DSS_MANAGER(psDSSMan, psDSSDev);<br>|=C2=A0=
=C2=A0 ^<br>| <br>| + cd /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky=
-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/G=
FX_Linux_KM<br>| + do_compile<br>| + module_do_compile<br>| + unset CFLAGS =
CPPFLAGS CXXFLAGS LDFLAGS<br>| + oe_runmake KERNEL_PATH=3D/&lt;path&gt;/pok=
y/build/tmp/work-shared/beagleboard/kernel-source KERNEL_VERSION=3D3.14.43-=
g1325370701 CC=3Darm-poky-linux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -mar=
m LD=3Darm-poky-linux-gnueabi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueab=
i-ar=C2=A0 O=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-=
build-artifacts BUILD=3Drelease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D<br>|=
 + oe_runmake_call KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp/work-shared/b=
eagleboard/kernel-source KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky=
-linux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-poky-linux-gnu=
eabi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=3D/&lt;path&=
gt;/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts BUILD=3Dr=
elease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D<br>| + bbnote make -j 4 -e MA=
KEFLAGS=3D KERNEL_SRC=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboar=
d/kernel-source KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp/work-shared/beag=
leboard/kernel-source KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-li=
nux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueab=
i-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=3D/&lt;path&gt;=
/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts BUILD=3Drele=
ase TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D<br>| + echo NOTE: make -j 4 -e M=
AKEFLAGS=3D KERNEL_SRC=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboa=
rd/kernel-source KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp/work-shared/bea=
gleboard/kernel-source KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-l=
inux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-poky-linux-gnuea=
bi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=3D/&lt;path&gt=
;/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts BUILD=3Drel=
ease TI_PLATFORM=3Domap3630 SUPPORT_XORG=3D<br>| NOTE: make -j 4 -e MAKEFLA=
GS=3D KERNEL_SRC=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/ker=
nel-source KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboa=
rd/kernel-source KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-g=
nueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.=
bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=3D/&lt;path&gt;/poky=
/build/tmp/work-shared/beagleboard/kernel-build-artifacts BUILD=3Drelease T=
I_PLATFORM=3Domap3630 SUPPORT_XORG=3D<br>| + make -j 4 -e MAKEFLAGS=3D KERN=
EL_SRC=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-source=
 KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-=
source KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc=
=C2=A0 -mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd=C2=A0=
=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=3D/&lt;path&gt;/poky/build/tm=
p/work-shared/beagleboard/kernel-build-artifacts BUILD=3Drelease TI_PLATFOR=
M=3Domap3630 SUPPORT_XORG=3D<br>| make -C /&lt;path&gt;/poky/build/tmp/work=
-shared/beagleboard/kernel-source M=3D`pwd`<br>| make[1]: Entering director=
y `/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-source&#39;<=
br>|=C2=A0=C2=A0 CC [M]=C2=A0 /&lt;path&gt;/poky/build/tmp/work/beagleboard=
-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r126d/Graphics_SDK_5_01_01=
_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.o<br>| /=
&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-m=
odules/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdp=
arty/dc_omapfb3_linux/omaplfb_linux.c: In function &#39;OMAPLFBWaitForVSync=
&#39;:<br>| /&lt;path&gt;/poky/build/tmpmake[4]: *** [/&lt;path&gt;/poky/bu=
ild/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r1=
26d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linu=
x/omaplfb_linux.o] Error 1<br>| <br>| make[3]: *** [/&lt;path&gt;/poky/buil=
d/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r126=
d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux]=
 Error 2<br>| <br>| make[2]: *** [_module_/&lt;path&gt;/poky/build/tmp/work=
/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r126d/Graphics=
_SDK_5_01_01_01/GFX_Linux_KM] Error 2<br>| <br>| make[1]: *** [sub-make] Er=
ror 2<br>| make[1]: Leaving directory `/&lt;path&gt;/poky/build/tmp/work-sh=
ared/beagleboard/kernel-source&#39;<br>| <br>| make: *** [all] Error 2<br>|=
 <br>| + die oe_runmake failed<br>| + bbfatal oe_runmake failed<br>| + echo=
 ERROR: oe_runmake failed<br>| ERROR: oe_runmake failed<br>| + exit 1<br>| =
+ bb_exit_handler<br>| + ret=3D1<br>| + echo WARNING: exit code 1 from a sh=
ell command.<br>| WARNING: exit code 1 from a shell command.<br>| + exit 1<=
br>| <br>| /work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.0=
1-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_=
linux/omaplfb_linux.c:180:92: error: &#39;struct omap_dss_device&#39; has n=
o member named &#39;output&#39;<br>|=C2=A0 #define OMAP_DSS_MANAGER(man, de=
v) struct omap_overlay_manager *man =3D (dev) !=3D NULL ? (dev)-&gt;output-=
&gt;manager : NULL<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>| /&lt;path&gt;/po=
ky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.=
01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3=
_linux/omaplfb_linux.c:821:2: note: in expansion of macro &#39;OMAP_DSS_MAN=
AGER&#39;<br>|=C2=A0=C2=A0 OMAP_DSS_MANAGER(psDSSMan, psDSSDev);<br>|=C2=A0=
=C2=A0 ^<br>| make[4]: *** [/&lt;path&gt;/poky/build/tmp/work/beagleboard-p=
oky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r126d/Graphics_SDK_5_01_01_0=
1/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.o] Error 1=
<br>| make[3]: *** [/&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/omap3-sgx-modules/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Li=
nux_KM/services4/3rdparty/dc_omapfb3_linux] Error 2<br>| make[2]: *** [_mod=
ule_/&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-=
sgx-modules/5.01.01.01-r126d/Graphics_SDK_5_01_01_01/GFX_Linux_KM] Error 2<=
br>| make[1]: *** [sub-make] Error 2<br>| make[1]: Leaving directory `/&lt;=
path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-source&#39;<br>| mak=
e: *** [all] Error 2<br>| + die oe_runmake failed<br>| + bbfatal oe_runmake=
 failed<br>| + echo ERROR: oe_runmake failed<br>| ERROR: oe_runmake failed<=
br>| + exit 1<br>| + bb_exit_handler<br>| + ret=3D1<br>| + echo WARNING: ex=
it code 1 from a shell command.<br>| WARNING: exit code 1 from a shell comm=
and.<br>| + exit 1<br>| ERROR: Function failed: do_compile (log file is loc=
ated at /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/om=
ap3-sgx-modules/5.01.01.01-r126d/temp/log.do_compile.12455)<br>ERROR: Task =
7 (/&lt;path&gt;/poky/meta-ti/recipes-bsp/powervr-drivers/<a href=3D"http:/=
/omap3-sgx-modules_5.01.01.01.bb">omap3-sgx-modules_5.01.01.01.bb</a>, do_c=
ompile) failed with exit code &#39;1&#39;<br><br><br></span></font></div><d=
iv><font size=3D"1"><span style=3D"font-family:monospace,monospace">There i=
s any kernel patch needed to supply this output member? Or this omaplfb_lin=
ux source file needs an update/patch?<br><br></span></font></div><div><font=
 size=3D"1"><span style=3D"font-family:monospace,monospace">Thank you in ad=
vance<br></span></font></div><div><font size=3D"1"><span style=3D"font-fami=
ly:monospace,monospace"><br></span></font></div></div></div></div></div><di=
v class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Daniel G=C3=B3mez</d=
iv></div></div>
<br><div class=3D"gmail_quote">2016-07-15 9:14 GMT+02:00 Daniel Gomez <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:dgomez@iseebcn.com" target=3D"_blank">dg=
omez@iseebcn.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">Hi Denys,<br><br>I&#39;m using this kernel recipe (linux-mainline)=
:<br><br>* Recipe:<br><span style=3D"font-family:monospace,monospace">meta-=
ti/recipes-kernel/<a href=3D"http://linux-mainline-3.14.bb" target=3D"_blan=
k">linux-mainline-3.14.bb</a><br><br>$ bitbake -s<br>..<br>linux-mainline=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :3.14.43-r0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br></sp=
an><br><br>omap3.inc file has not been modified:<br><span style=3D"font-fam=
ily:monospace,monospace">poky/meta-ti/conf$ grep -r &quot;linux&quot; .<br>=
..<br>./machine/include/omap3.inc:PREFERRED_PROVIDER_virtual/kernel =3D &qu=
ot;linux-mainline&quot;<br><br></span><div><br></div><div class=3D"gmail_ex=
tra"><br clear=3D"all"><div><div data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr">Daniel G=C3=B3mez</div></div></div><div><div class=3D"h5">
<br><div class=3D"gmail_quote">2016-07-14 18:29 GMT+02:00 Denys Dmytriyenko=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">de=
nys@ti.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><span>On Thu, Jul 14, 2016 at 05:57:42PM +0200, Daniel Gomez wrote:<br=
>
&gt; Hi,<br>
&gt;<br>
&gt; I&#39;m trying to compile omap3-sgx-modules for the omap3 platform (om=
ap3630)<br>
&gt; against 3.14 kernel version but several errors have appeared on bc_cat=
.c<br>
&gt; file compilation.<br>
&gt;<br>
&gt; Is it possible to compile SDK 4.05 or higher against 3.13 or 3.14 kern=
el<br>
&gt; versions and get SGX acceleration?<br>
<br>
</span>What kernel recipe/tree is being used?<br>
<div><div><br>
<br>
&gt; Thank you<br>
&gt;<br>
&gt; HOST Environment:<br>
&gt; * Kernel<br>
&gt; Linux xubuntu-VirtualBox 3.2.0-104-generic #145-Ubuntu SMP Thu Jun 9<b=
r>
&gt; 09:53:59 UTC 2016 i686 i686 i386 GNU/Linux<br>
&gt;<br>
&gt; * Distro<br>
&gt; Distributor ID:=C2=A0 =C2=A0 Ubuntu<br>
&gt; Description:=C2=A0 =C2=A0 Ubuntu 12.04.5 LTS<br>
&gt; Release:=C2=A0 =C2=A0 12.04<br>
&gt; Codename:=C2=A0 =C2=A0 precise<br>
&gt;<br>
&gt; * poky:<br>
&gt; repo: git://<a href=3D"http://git.yoctoproject.org/poky" rel=3D"norefe=
rrer" target=3D"_blank">git.yoctoproject.org/poky</a><br>
&gt; branch: fido<br>
&gt;<br>
&gt; * meta-ti<br>
&gt; repo: git://<a href=3D"http://git.yoctoproject.org/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">git.yoctoproject.org/meta-ti</a><br>
&gt; branch: fido<br>
&gt;<br>
&gt; * machine<br>
&gt; MACHINE=3Dbeagleboard<br>
&gt;<br>
&gt; * recipe omap3-sgx-modules<br>
&gt; meta-ti/recipes-bsp/powervr-drivers/<a href=3D"http://omap3-sgx-module=
s_4.05.00.03.bb" rel=3D"noreferrer" target=3D"_blank">omap3-sgx-modules_4.0=
5.00.03.bb</a><br>
&gt; TI_PLATFORM_omap3 =3D &quot;omap3630&quot;<br>
&gt;<br>
&gt; # output<br>
&gt; $ MACHINE=3Dbeagleboard bitbake omap3-sgx-modules<br>
&gt; WARNING: Host distribution &quot;Ubuntu-12.04&quot; has not been valid=
ated with this<br>
&gt; version of the build system; you may possibly experience unexpected<br=
>
&gt; failures. It is recommended that you use a tested distribution.<br>
&gt; Loading cache: 100%<br>
&gt; |#####################################################################=
###########################################################################=
########################################################|<br>
&gt; ETA:=C2=A0 00:00:00<br>
&gt; Loaded 2 entries from dependency cache.<br>
&gt; Parsing recipes: 100%<br>
&gt; |#####################################################################=
###########################################################################=
######################################################|<br>
&gt; Time: 00:01:37<br>
&gt; Parsing of 1059 .bb files complete (1 cached, 1058 parsed). 1469 targe=
ts,<br>
&gt; 151 skipped, 0 masked, 0 errors.<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.26.0&quot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;i686-linux&quot;<=
br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Ubuntu-12.04&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-poky-linux-gnueabi=
&quot;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;beagleboard&=
quot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky&quot;<b=
r>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;1.8.2&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv7a vfp thumb neon c=
allconvention-hard cortexa8&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;vfp-neon&quot;<br>
&gt; meta<br>
&gt; meta-yocto<br>
&gt; meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;fido:c9f0a99050ec0050f0dbcd55d0c=
d2ab18848113f&quot;<br>
&gt; meta-ti=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;fido:632ea21=
d490022bbca34ee43bda31bbe5678a779&quot;<br>
&gt;<br>
&gt; NOTE: Preparing RunQueue<br>
&gt; NOTE: Executing SetScene Tasks<br>
&gt; NOTE: Executing RunQueue Tasks<br>
&gt; WARNING: Failed to fetch URL<br>
&gt; <a href=3D"http://www.openssl.org/source/old/1.0.2/openssl-1.0.2h.tar.=
gz" rel=3D"noreferrer" target=3D"_blank">http://www.openssl.org/source/old/=
1.0.2/openssl-1.0.2h.tar.gz</a>, attempting<br>
&gt; MIRRORS if available<br>
&gt; WARNING:<br>
&gt; /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3=
-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM<br>
&gt; (&#39;S&#39;) doesn&#39;t exist, please set &#39;S&#39; to a proper va=
lue<br>
&gt; WARNING: TI installer requires 32bit glibc libraries for proper operat=
ion<br>
&gt; run &#39;yum install glibc.i686&#39; on Fedora or &#39;apt-get install=
 ia32-libs&#39; on<br>
&gt; Ubuntu/Debian<br>
&gt; ERROR: Function failed: do_compile (log file is located at<br>
&gt; /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3=
-sgx-modules/4.05.00.03-r126c/temp/log.do_compile.6024)<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3=
-sgx-modules/4.05.00.03-r126c/temp/log.do_compile.6024<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing shell function do_compile<br>
&gt; | NOTE: make -j 2 -e MAKEFLAGS=3D<br>
&gt; KERNEL_SRC=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kern=
el-source<br>
&gt; KERNEL_PATH=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/ker=
nel-source<br>
&gt; KERNEL_VERSION=3D3.14.43-g1325370701 CC=3Darm-poky-linux-gnueabi-gcc<b=
r>
&gt;=C2=A0 -mno-thumb-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd<br=
>
&gt; AR=3Darm-poky-linux-gnueabi-ar<br>
&gt;=C2=A0 O=3D/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-=
build-artifacts<br>
&gt; BUILD=3Drelease TI_PLATFORM=3Domap3630<br>
&gt; | make -C /&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-=
source<br>
&gt; M=3D`pwd`<br>
&gt; | make[1]: Entering directory<br>
&gt; `/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-source&#3=
9;<br>
&gt; |=C2=A0 =C2=A0LD<br>
&gt;=C2=A0 /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi=
/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/se=
rvices4/3rdparty/bufferclass_ti/built-in.o<br>
&gt; |=C2=A0 =C2=A0CC [M]<br>
&gt;=C2=A0 /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi=
/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/se=
rvices4/3rdparty/bufferclass_ti/bc_cat.o<br>
&gt; |<br>
&gt; /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3=
-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services=
4/3rdparty/bufferclass_ti/bc_cat.c:<br>
&gt; In function &#39;bc_cat_init&#39;:<br>
&gt; |<br>
&gt; /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3=
-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services=
4/3rdparty/bufferclass_ti/bc_cat.c:612:6:<br>
&gt; error: implicit declaration of function &#39;cpu_is_omap3530&#39;<br>
&gt; [-Werror=3Dimplicit-function-declaration]<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0width_align =3D cpu_is_omap3530() &amp;&am=
p; ( omap_rev() &lt;<br>
&gt; OMAP3430_REV_ES3_0 ) ? 32 : 8;<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; |<br>
&gt; /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3=
-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services=
4/3rdparty/bufferclass_ti/bc_cat.c:612:6:<br>
&gt; error: implicit declaration of function &#39;omap_rev&#39;<br>
&gt; [-Werror=3Dimplicit-function-declaration]<br>
&gt; |<br>
&gt; /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3=
-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services=
4/3rdparty/bufferclass_ti/bc_cat.c:612:56:<br>
&gt; error: &#39;OMAP3430_REV_ES3_0&#39; undeclared (first use in this func=
tion)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0width_align =3D cpu_is_omap3530() &amp;&am=
p; ( omap_rev() &lt;<br>
&gt; OMAP3430_REV_ES3_0 ) ? 32 : 8;<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; |<br>
&gt; /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3=
-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services=
4/3rdparty/bufferclass_ti/bc_cat.c:612:56:<br>
&gt; note: each undeclared identifier is reported only once for each functi=
on it<br>
&gt; appears in<br>
&gt; | cc1: some warnings being treated as errors<br>
&gt; | make[4]: ***<br>
&gt; [/&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap=
3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/service=
s4/3rdparty/bufferclass_ti/bc_cat.o]<br>
&gt; Error 1<br>
&gt; | make[3]: ***<br>
&gt; [/&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap=
3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/service=
s4/3rdparty/bufferclass_ti]<br>
&gt; Error 2<br>
&gt; | make[2]: ***<br>
&gt; [_module_/&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnue=
abi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM=
]<br>
&gt; Error 2<br>
&gt; | make[1]: *** [sub-make] Error 2<br>
&gt; | make[1]: Leaving directory<br>
&gt; `/&lt;path&gt;/poky/build/tmp/work-shared/beagleboard/kernel-source&#3=
9;<br>
&gt; | make: *** [all] Error 2<br>
&gt; | ERROR: oe_runmake failed<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
&gt; | ERROR: Function failed: do_compile (log file is located at<br>
&gt; /&lt;path&gt;/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3=
-sgx-modules/4.05.00.03-r126c/temp/log.do_compile.6024)<br>
&gt; ERROR: Task 7 (/&lt;path&gt;/poky/meta-ti/recipes-bsp/powervr-drivers/=
<br>
&gt; <a href=3D"http://omap3-sgx-modules_4.05.00.03.bb" rel=3D"noreferrer" =
target=3D"_blank">omap3-sgx-modules_4.05.00.03.bb</a>, do_compile) failed w=
ith exit code &#39;1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 417 tasks of which 0 didn&#39;t need to=
 be rerun<br>
&gt; and 1 failed.<br>
&gt; Waiting for 0 running tasks to finish:<br>
&gt;<br>
&gt; Summary: 1 task failed:<br>
&gt;=C2=A0 =C2=A0/&lt;path&gt;/poky/meta-ti/recipes-bsp/powervr-drivers/<br=
>
&gt; <a href=3D"http://omap3-sgx-modules_4.05.00.03.bb" rel=3D"noreferrer" =
target=3D"_blank">omap3-sgx-modules_4.05.00.03.bb</a>, do_compile<br>
&gt; Summary: There were 4 WARNING messages shown.<br>
&gt; Summary: There was 1 ERROR message shown, returning a non-zero exit co=
de.<br>
&gt;<br>
&gt; Daniel G=C3=B3mez<br>
<br>
</div></div><span><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@=
yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
<br>
</font></span></blockquote></div><br></div></div></div></div>
</blockquote></div><br></div>

--001a114b43721818750537e4d729--

Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CEBFE00CC4; Mon,  4 Dec 2017 15:41:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EC48E00B48
	for <meta-ti@yoctoproject.org>; Mon,  4 Dec 2017 15:41:50 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB4NfnE3005600;
	Mon, 4 Dec 2017 17:41:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512430909;
	bh=sPjk0bL7UvR0MCmemH5fdbo8FL5e+4V2m7FP99924N8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OaP2kpGwk9+SUp2J6H9d97XGCgTLNOmH96pI+IKRUJoO9mm2chIfdAEy3WE1A+u4Y
	hAk5w8WVRsC7S1ZAAm0400Kuq5iD5Ic+POwCHN24w1M0us/fGLZ2webbKuTtPPgAhH
	8A+qWZhgUMSyIQR5P5tBwSh1dwJp2xyz4Mg9mUdk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4NfnS7024260;
	Mon, 4 Dec 2017 17:41:49 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 4 Dec 2017 17:41:49 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 4 Dec 2017 17:41:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4NfnAY006846;
	Mon, 4 Dec 2017 17:41:49 -0600
Date: Mon, 4 Dec 2017 18:41:33 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Avinash Kurup <kurup.avinash@gmail.com>
Message-ID: <20171204234133.GC19692@edge>
References: <CABYUYYf9HU92nSubv9cjfaF4st+w78CA8hudgPCj=7b-tCQFBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABYUYYf9HU92nSubv9cjfaF4st+w78CA8hudgPCj=7b-tCQFBA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: Poky 2.4 build errors: u-boot-ti-staging ('PLAIN-VERSION' undeclared), linux-ti-staging (.scmversion exceeds 64 characters).
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
X-List-Received-Date: Mon, 04 Dec 2017 23:41:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

Looks like you are using u-boot 2016.05 while building for morty.

Any particular reason for that version? Can you use 2017.01 instead? That's 
the one we use and support on morty, along with kernel 4.9... I personally 
haven't used 2016.05 since krogoth.

-- 
Denys


On Wed, Nov 29, 2017 at 12:00:52PM +0530, Avinash Kurup wrote:
> Hi all,
> 
>    I am facing this problem with my yocto meta-ti build (morty branch) for
> my beagleboard-XM.
> I saw in the mailing list, https://lists.yoctoproject.
> org/pipermail/meta-ti/2016-October/009114.html however i still face this
> issue. Plz help me to resolve this. Thank you.
> 
> Build details.
> -------------
> 
> Loading cache...done.
> Loaded 2243 entries from dependency cache.
> WARNING: No bb files matched BBFILE_PATTERN_openembedded-core
> '^/home/avi/Projects/BoardLabSetup/poky/openembedded-core/'
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION        = "1.36.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "universal"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "beagleboard"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.4"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard"
> TARGET_FPU        = "hard"
> meta
> meta-poky
> meta-yocto-bsp    = "morty:f7b90ab3eaf832bd81f3efc1dab4dcf6863ac284"
> meta-ti           = "morty:5f3a1169d307fec41626f850f5c700437dedbe93"
> meta-qt5          = "morty:2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b"
> openembedded-core = "morty:bfa04fa71c47e8fe9528208848cfcec2e232777d"
> meta-ruby
> meta-oe           = "morty:55c8a76da5dc099a7bc3838495c672140cedb78e"
> 
> u-boot error:
> -------------
> 
> DEBUG: Executing shell function do_compile
> NOTE: make -j 4 CROSS_COMPILE=arm-poky-linux-gnueabi-
> CC=arm-poky-linux-gnueabi-gcc  --sysroot=/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot V=1 HOSTCC=gcc
> -isystem/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/include -O2 -pipe -L/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
> -L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1 -C
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git
> O=/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/build
> omap3_beagle_config
> make: Entering directory '/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git'
> make -C /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/build
> KBUILD_SRC=/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git \
> -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/Makefile
> omap3_beagle_config
> make[1]: Entering directory '/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/build'
> make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
> obj=scripts/basic
> ln -fsn /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git source
> /bin/bash /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/mkmakefile
> \
>     /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git . 2016 05
>   GEN     ./Makefile
> rm -f .tmp_quiet_recordmcount
> make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
> obj=scripts/kconfig omap3_beagle_config
> scripts/kconfig/conf  --defconfig=arch/../configs/omap3_beagle_defconfig
> Kconfig
> #
> # configuration written to .config
> #
> make[1]: Leaving directory '/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/build'
> make: Leaving directory '/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git'
> NOTE: make -j 4 CROSS_COMPILE=arm-poky-linux-gnueabi-
> CC=arm-poky-linux-gnueabi-gcc  --sysroot=/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot V=1 HOSTCC=gcc
> -isystem/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/include -O2 -pipe -L/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
> -L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1 -C
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git
> O=/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/build all
> make: Entering directory '/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git'
> make -C /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/build
> KBUILD_SRC=/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git \
> -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/Makefile all
> make[1]: Entering directory '/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/build'
> make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/Makefile
> silentoldconfig
> make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
> obj=scripts/basic
> ln -fsn /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git source
> rm -f .tmp_quiet_recordmcount
> /bin/bash /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/mkmakefile
> \
>     /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git . 2016 05
>   GEN     ./Makefile
> make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
> obj=scripts/kconfig silentoldconfig
> mkdir -p include/config include/generated
> scripts/kconfig/conf  --silentoldconfig Kconfig
> make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/scripts/Makefile.autoconf || \
>     { rm -f include/config/auto.conf; false; }
> mkdir -p include/asm
> if [ -d /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/arch/arm/mach-omap3/include/mach ]; then    \
>     dest=arch/arm/mach-omap3/include/mach;            \
> else                                    \
>     dest=arch/arm/include/asm/arch-omap3;    \
> fi;                                    \
> ln -fsn /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/$dest
> include/asm/arch
> set -e; : '  CHK     include/config.h'; mkdir -p include/;     (echo "/*
> Automatically generated - do not edit */"; for i in $(echo "NAND" | sed
> 's/,/ /g'); do echo \#define CONFIG_$i | sed '/=/ {s/=/    /;q; } ; {
> s/$/    1/; }'; done; echo \#define CONFIG_BOARDDIR board/ti/beagle; echo
> \#include \<config_defaults.h\>; echo \#include \<config_uncmd_spl.h\>;
> echo \#include \<configs/"omap3_beagle".h\>; echo \#include
> \<asm/config.h\>; echo \#include \<config_fallbacks.h\>;) <
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/scripts/Makefile.autoconf > include/config.h.tmp; if [ -r
> include/config.h ] && cmp -s include/config.h include/config.h.tmp; then rm
> -f include/config.h.tmp; else : '  UPD     include/config.h'; mv -f
> include/config.h.tmp include/config.h; fi
> mkdir -p spl/include/
>   arm-poky-linux-gnueabi-gcc  --sysroot=/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot -E -Wall
> -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os
> -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage
> -Wno-format-nonliteral -Werror=date-time  -D__KERNEL__ -D__UBOOT__
> -D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux
> -mword-relocations  -fno-pic  -mno-unaligned-access  -ffunction-sections
> -fdata-sections -fno-common -ffixed-r9  -msoft-float   -pipe -Iinclude
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
> -include /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/include/linux/kconfig.h  -nostdinc -isystem /home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/
> bin/arm-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/
> gcc/arm-poky-linux-gnueabi/7.2.0/include  -DDO_DEPS_ONLY -dM
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include/common.h
> > include/autoconf.mk.tmp && { sed -n -f /home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/tools/scripts/define2mk.sed
> include/autoconf.mk.tmp | while read line; do if [ -n "" ] || ! grep -q
> "${line%=*}=" include/config/auto.conf; then echo "$line"; fi done >
> include/autoconf.mk; rm include/autoconf.mk.tmp; } || { rm
> include/autoconf.mk.tmp; false; }
>   arm-poky-linux-gnueabi-gcc  --sysroot=/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot -x c -DDO_DEPS_ONLY -M -MP
> -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding
> -Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage
> -Wno-format-nonliteral -Werror=date-time  -D__KERNEL__ -D__UBOOT__
> -D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux
> -mword-relocations  -fno-pic  -mno-unaligned-access  -ffunction-sections
> -fdata-sections -fno-common -ffixed-r9  -msoft-float   -pipe -Iinclude
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
> -include /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/include/linux/kconfig.h  -nostdinc -isystem /home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/
> bin/arm-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/
> gcc/arm-poky-linux-gnueabi/7.2.0/include -MQ include/config/auto.conf
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include/common.h
> > include/autoconf.mk.dep || { rm include/autoconf.mk.dep; false; }
>   arm-poky-linux-gnueabi-gcc  --sysroot=/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot -E -Wall
> -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os
> -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage
> -Wno-format-nonliteral -Werror=date-time  -D__KERNEL__ -D__UBOOT__
> -D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux
> -mword-relocations  -fno-pic  -mno-unaligned-access  -ffunction-sections
> -fdata-sections -fno-common -ffixed-r9  -msoft-float   -pipe -Iinclude
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
> -include /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/include/linux/kconfig.h  -nostdinc -isystem /home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/
> bin/arm-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/
> gcc/arm-poky-linux-gnueabi/7.2.0/include -DCONFIG_SPL_BUILD -DDO_DEPS_ONLY
> -dM /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include/common.h
> > spl/include/autoconf.mk.tmp && { sed -n -f /home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/tools/scripts/define2mk.sed
> spl/include/autoconf.mk.tmp | while read line; do if [ -n "" ] || ! grep -q
> "${line%=*}=" include/config/auto.conf; then echo "$line"; fi done >
> spl/include/autoconf.mk; rm spl/include/autoconf.mk.tmp; } || { rm
> spl/include/autoconf.mk.tmp; false; }
> touch include/config/auto.conf
> set -e; : '  CHK     include/config/uboot.release'; mkdir -p
> include/config/;     echo "2016.05$(/bin/bash /home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/setlocalversion
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git)" <
> include/config/auto.conf > include/config/uboot.release.tmp; if [ -r
> include/config/uboot.release ] && cmp -s include/config/uboot.release
> include/config/uboot.release.tmp; then rm -f include/config/uboot.release.tmp;
> else : '  UPD     include/config/uboot.release'; mv -f
> include/config/uboot.release.tmp include/config/uboot.release; fi
> ln -fsn /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git source
> set -e; : '  CHK     include/generated/timestamp_autogenerated.h'; mkdir -p
> include/generated/;     (if test -n "${SOURCE_DATE_EPOCH}"; then
> SOURCE_DATE="@${SOURCE_DATE_EPOCH}"; DATE=""; for date in gdate date.gnu
> date; do ${date} -u -d "${SOURCE_DATE}" >/dev/null 2>&1 && DATE="${date}";
> done; if test -n "${DATE}"; then LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
> +'#define U_BOOT_DATE "%b %d %C%y"'; LC_ALL=C ${DATE} -u -d
> "${SOURCE_DATE}" +'#define U_BOOT_TIME "%T"'; LC_ALL=C ${DATE} -u -d
> "${SOURCE_DATE}" +'#define U_BOOT_TZ "%z"'; LC_ALL=C ${DATE} -u -d
> "${SOURCE_DATE}" +'#define U_BOOT_DMI_DATE "%m/%d/%Y"'; else return 42; fi;
> else LC_ALL=C date +'#define U_BOOT_DATE "%b %d %C%y"'; LC_ALL=C date
> +'#define U_BOOT_TIME "%T"'; LC_ALL=C date +'#define U_BOOT_TZ "%z"';
> LC_ALL=C date +'#define U_BOOT_DMI_DATE "%m/%d/%Y"'; fi) <
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/Makefile >
> include/generated/timestamp_autogenerated.h.tmp; if [ -r
> include/generated/timestamp_autogenerated.h ] && cmp -s
> include/generated/timestamp_autogenerated.h
> include/generated/timestamp_autogenerated.h.tmp;
> then rm -f include/generated/timestamp_autogenerated.h.tmp; else : '
> UPD     include/generated/timestamp_autogenerated.h'; mv -f
> include/generated/timestamp_autogenerated.h.tmp
> include/generated/timestamp_autogenerated.h;
> fi
> /bin/bash /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/mkmakefile
> \
>     /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git . 2016 05
> make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
> obj=scripts/basic
>   GEN     ./Makefile
> rm -f .tmp_quiet_recordmcount
> if [ -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/.config -o
> -d /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include/config
> ]; then \
>     echo >&2 "  /home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git is not clean, please run 'make
> mrproper'"; \
>     echo >&2 "  in the '/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git' directory.";\
>     /bin/false; \
> fi;
> set -e; : '  CHK     include/generated/version_autogenerated.h'; mkdir -p
> include/generated/;     (echo \#define PLAIN_VERSION \"2016.05-gb340c262b >
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/build/.scmversion
>         echo -gb340c262b\"; echo \#define U_BOOT_VERSION \"U-Boot \"
> PLAIN_VERSION; echo \#define CC_VERSION_STRING \"$(arm-poky-linux-gnueabi-gcc
> --sysroot=/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot
> --version | head -n 1)\"; echo \#define LD_VERSION_STRING
> \"$(arm-poky-linux-gnueabi-ld.bfd --version | head -n 1)\"; ) <
> include/config/uboot.release > include/generated/version_autogenerated.h.tmp;
> if [ -r include/generated/version_autogenerated.h ] && cmp -s
> include/generated/version_autogenerated.h
> include/generated/version_autogenerated.h.tmp;
> then rm -f include/generated/version_autogenerated.h.tmp; else : '  UPD
> include/generated/version_autogenerated.h'; mv -f
> include/generated/version_autogenerated.h.tmp
> include/generated/version_autogenerated.h; fi
> make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
> obj=.
> mkdir -p lib/
> mkdir -p arch/arm/lib/
> set -e; : '  CHK     include/generated/generic-asm-offsets.h'; mkdir -p
> include/generated/;     (set -e; echo "#ifndef __GENERIC_ASM_OFFSETS_H__";
> echo "#define __GENERIC_ASM_OFFSETS_H__"; echo "/*"; echo " * DO NOT
> MODIFY."; echo " *"; echo " * This file was generated by Kbuild"; echo "
> */"; echo ""; sed -ne     "s:[[:space:]]*\.ascii[[:space:]]*\"\(.*\)\":\1:;
> /^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([-0-9]*\)
> \(.*\):#define \1 \2 /* \3 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\)
> \(.*\):#define \1 \2 /* \3 */:; s:->::; p;}"; echo ""; echo "#endif" ) <
> lib/asm-offsets.s > include/generated/generic-asm-offsets.h.tmp; if [ -r
> include/generated/generic-asm-offsets.h ] && cmp -s
> include/generated/generic-asm-offsets.h
> include/generated/generic-asm-offsets.h.tmp;
> then rm -f include/generated/generic-asm-offsets.h.tmp; else : '  UPD
> include/generated/generic-asm-offsets.h'; mv -f
> include/generated/generic-asm-offsets.h.tmp
> include/generated/generic-asm-offsets.h;
> fi
> set -e; : '  CHK     include/generated/asm-offsets.h'; mkdir -p
> include/generated/;     (set -e; echo "#ifndef __ASM_OFFSETS_H__"; echo
> "#define __ASM_OFFSETS_H__"; echo "/*"; echo " * DO NOT MODIFY."; echo "
> *"; echo " * This file was generated by Kbuild"; echo " */"; echo ""; sed
> -ne     "s:[[:space:]]*\.ascii[[:space:]]*\"\(.*\)\":\1:;
> /^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([-0-9]*\)
> \(.*\):#define \1 \2 /* \3 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\)
> \(.*\):#define \1 \2 /* \3 */:; s:->::; p;}"; echo ""; echo "#endif" ) <
> arch/arm/lib/asm-offsets.s > include/generated/asm-offsets.h.tmp; if [ -r
> include/generated/asm-offsets.h ] && cmp -s include/generated/asm-offsets.h
> include/generated/asm-offsets.h.tmp; then rm -f
> include/generated/asm-offsets.h.tmp; else : '  UPD
> include/generated/asm-offsets.h'; mv -f include/generated/asm-offsets.h.tmp
> include/generated/asm-offsets.h; fi
> make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
> obj=tools
>   gcc  -isystem/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/include -O2
> -pipe -L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/lib -L/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1
> -Wp,-MD,tools/.mkenvimage.o.d -Itools -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer -include /home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/include/libfdt_env.h
> -idirafterinclude -idirafter/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/include -idirafter/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/lib/libfdt
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools
> -DCONFIG_SYS_TEXT_BASE=0x80100000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
> -D_GNU_SOURCE -c -o tools/mkenvimage.o /home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/tools/mkenvimage.c
>   gcc  -isystem/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/include -O2
> -pipe -L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/lib -L/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1
> -Wp,-MD,tools/.image-host.o.d -Itools -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer -include /home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/include/libfdt_env.h
> -idirafterinclude -idirafter/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/include -idirafter/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/lib/libfdt
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools
> -DCONFIG_SYS_TEXT_BASE=0x80100000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
> -D_GNU_SOURCE -c -o tools/image-host.o /home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/tools/image-host.c
>   gcc  -isystem/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/include -O2
> -pipe -L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/lib -L/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1
> -Wp,-MD,tools/.mxsimage.o.d -Itools -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer -include /home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/include/libfdt_env.h
> -idirafterinclude -idirafter/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/include -idirafter/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/lib/libfdt
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools
> -DCONFIG_SYS_TEXT_BASE=0x80100000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
> -D_GNU_SOURCE -c -o tools/mxsimage.o /home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/tools/mxsimage.c
>   gcc  -isystem/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/include -O2
> -pipe -L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/lib -L/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
> -Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1
> -Wp,-MD,tools/.fit_image.o.d -Itools -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer -include /home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/include/libfdt_env.h
> -idirafterinclude -idirafter/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/include -idirafter/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/lib/libfdt
> -I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools
> -DCONFIG_SYS_TEXT_BASE=0x80100000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
> -D_GNU_SOURCE -c -o tools/fit_image.o /home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/tools/fit_image.c
> In file included from /home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/tools/fdt_host.h:11:0,
>                  from /home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/tools/mkimage.h:22,
>                  from /home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git/tools/image-host.c:12:
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools/image-host.c:
> In function 'fit_image_write_sig':
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/tools/image-host.c:126:7: error: 'PLAIN_VERSION' undeclared (first
> use in this function)
>        PLAIN_VERSION);
>        ^
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/tools/../include/libfdt.h:1449:44: note: in definition of macro
> 'fdt_setprop_string'
>   fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
>                                             ^
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/tools/image-host.c:126:7: note: each undeclared identifier is
> reported only once for each function it appears in
>        PLAIN_VERSION);
>        ^
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/tools/../include/libfdt.h:1449:44: note: in definition of macro
> 'fdt_setprop_string'
>   fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
>                                             ^
> scripts/Makefile.host:111: recipe for target 'tools/image-host.o' failed
> make[2]: *** [tools/image-host.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools/mkenvimage.c:
> In function 'main':
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/tools/mkenvimage.c:120:35: error: 'PLAIN_VERSION' undeclared (first
> use in this function)
>     printf("%s version %s\n", prg, PLAIN_VERSION);
>                                    ^
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/tools/mkenvimage.c:120:35: note: each undeclared identifier is
> reported only once for each function it appears in
> scripts/Makefile.host:111: recipe for target 'tools/mkenvimage.o' failed
> make[2]: *** [tools/mkenvimage.o] Error 1
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools/fit_image.c:
> In function 'fit_build_fdt':
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/tools/fit_image.c:299:57: error: 'PLAIN_VERSION' undeclared (first
> use in this function)
>   fdt_property_strf(fdt, "creator", "U-Boot mkimage %s", PLAIN_VERSION);
>                                                          ^
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/git/tools/fit_image.c:299:57: note: each undeclared identifier is
> reported only once for each function it appears in
> scripts/Makefile.host:111: recipe for target 'tools/fit_image.o' failed
> make[2]: *** [tools/fit_image.o] Error 1
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/Makefile:1221:
> recipe for target 'tools' failed
> make[1]: *** [tools] Error 2
> make[1]: Leaving directory '/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/build'
> Makefile:150: recipe for target 'sub-make' failed
> make: *** [sub-make] Error 2
> make: Leaving directory '/home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
> 2016.05+gitAUTOINC+340c262b4b-r35/git'
> ERROR: oe_runmake failed
> WARNING: exit code 1 from a shell command.
> ERROR: Function failed: do_compile (log file is located at
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
> r35/temp/log.do_compile.4675)
> 
> linux-ti-staging error:
> -----------------------
> 
> DEBUG: Executing shell function do_compile
> NOTE: make -j 4 HOSTCC=gcc  -isystem/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
> 91+gitAUTOINC+9d9bc78b62-r127a/recipe-sysroot-native/usr/include -O2 -pipe
> -L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/linux-ti-staging/4.4.91+gitAUTOINC+9d9bc78b62-
> r127a/recipe-sysroot-native/usr/lib -L/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
> 91+gitAUTOINC+9d9bc78b62-r127a/recipe-sysroot-native/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
> 91+gitAUTOINC+9d9bc78b62-r127a/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
> 91+gitAUTOINC+9d9bc78b62-r127a/recipe-sysroot-native/lib
> -Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/linux-ti-staging/4.4.91+gitAUTOINC+9d9bc78b62-
> r127a/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
> BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
> 91+gitAUTOINC+9d9bc78b62-r127a/recipe-sysroot-native/lib -Wl,-O1
> HOSTCPP=gcc  -E zImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork
> -marm -fuse-ld=bfd -ffile-prefix-map=/home/avi/Projects/BoardLabSetup/tmp/
> work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
> 91+gitAUTOINC+9d9bc78b62-r127a/git=/kernel-source/
> LD=arm-poky-linux-gnueabi-ld.bfd
>   CHK     include/config/kernel.release
>   GEN     ./Makefile
>   CHK     include/generated/uapi/linux/version.h
>   CHK     include/generated/utsrelease.h
> "4.4.91-gb9d9bc78b > /home/avi/Projects/BoardLabSetup/tmp/work/
> beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
> 91+gitAUTOINC+9d9bc78b62-r127a/build/.scmversion     echo -gb9d9bc78b"
> exceeds 64 characters
> /home/avi/Projects/BoardLabSetup/tmp/work-shared/beagleboard/kernel-source/Makefile:1038:
> recipe for target 'include/generated/utsrelease.h' failed
> make[2]: *** [include/generated/utsrelease.h] Error 1
> ERROR: oe_runmake failed
> Makefile:150: recipe for target 'sub-make' failed
> make[1]: *** [sub-make] Error 2
> Makefile:24: recipe for target '__sub-make' failed
> make: *** [__sub-make] Error 2
> WARNING: exit code 1 from a shell command.
> ERROR: Function failed: do_compile (log file is located at
> /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
> gnueabi/linux-ti-staging/4.4.91+gitAUTOINC+9d9bc78b62-
> r127a/temp/log.do_compile.4529)

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti



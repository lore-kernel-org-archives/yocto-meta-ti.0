Return-Path: <kurup.avinash@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A494FE00BEA; Tue, 28 Nov 2017 22:30:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.182 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (kurup.avinash[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34475E00AF2
	for <meta-ti@yoctoproject.org>; Tue, 28 Nov 2017 22:30:54 -0800 (PST)
Received: by mail-wr0-f182.google.com with SMTP id k61so2342727wrc.4
	for <meta-ti@yoctoproject.org>; Tue, 28 Nov 2017 22:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=WeOPDenQfypIYVcm3VVJ3+cyhRgurRwl8VsA3Amxj6g=;
	b=naBzaFh0TyUy0kDfYO82NbwkRB2zu0M7U1f9BpWWkUC1dZt1dIuAok4OMJUKNBeG09
	8+52RPDvVqezpou8umqmxV/494GILthbvkryeIv5fW1FlIOb5ERMPRoLb81IZlVrmQIg
	uFwhwX34wK+pb/xZM2B4vlRe43gNJC3Y5OUBzQUvNWzqV9iW8aUNrsMPuz9y7M4Sne7O
	aJr0NufM/WH+XY2mOCN52DCTAYGHs0JYsvUxB/YqTDokFu/Z9P7TrNS8moulE6trAp7C
	ZPUIqMtbqQg5dyCXFbCF/kzJZOrfP4zMW9muTxZ7naWtnxLcrs0V7v0CNk+tmy5TqeN9
	p4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=WeOPDenQfypIYVcm3VVJ3+cyhRgurRwl8VsA3Amxj6g=;
	b=moki9ma6jxg1HUlJ5/SNQI3gKFQX26/Ufpwk6PttD/Z+QoXdyX4OS6YamdCWFo6khq
	OzDauk9uMoSBu1o1rAcso27TpsGIM4xsr9YSyttBjfraQNJzoFSd543Qju8wQAOZUe6Q
	suO5XKXEQjKHr/WVYN2pukUIVTqXLyvCrYcr6RQ+AohAwyINCqiymp6Y8VoKQpelKbG5
	IjhBCW49X5slM3zF/LVOA0u9bOMVbyuUJxk637nEwmYXnsuss9kCa7oFY3Zn0Dn0fzOL
	ycLobiK21nhI2KgxvRT0jxjQ8jcIDGFZ2ZCjeIm5qMpBp5bzHZab+Nwr2M7YU01g3VlW
	QJLw==
X-Gm-Message-State: AJaThX7Cod4clAr3vbwRaewHfdCfKqUiYVWMmKrBU377t0tF6vaDdAPG
	tTvlaOKdQPrUfM4KW1/s56M52x7yQ6K0pioCMIo=
X-Google-Smtp-Source: AGs4zMagM3P0br0Uzvdk8oDk1iIHIAtBXESNegaOoRHP8cxAcFu1x6SkjC3Ku1uWZknJJgovrkZtFmTm3VpJ0r1fuzY=
X-Received: by 10.223.183.17 with SMTP id l17mr1425427wre.1.1511937053142;
	Tue, 28 Nov 2017 22:30:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.156.17 with HTTP; Tue, 28 Nov 2017 22:30:52 -0800 (PST)
From: Avinash Kurup <kurup.avinash@gmail.com>
Date: Wed, 29 Nov 2017 12:00:52 +0530
Message-ID: <CABYUYYf9HU92nSubv9cjfaF4st+w78CA8hudgPCj=7b-tCQFBA@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Poky 2.4 build errors: u-boot-ti-staging ('PLAIN-VERSION' undeclared), linux-ti-staging (.scmversion exceeds 64 characters).
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
X-List-Received-Date: Wed, 29 Nov 2017 06:30:59 -0000
Content-Type: multipart/alternative; boundary="f40304389738f9b520055f194661"

--f40304389738f9b520055f194661
Content-Type: text/plain; charset="UTF-8"

Hi all,

   I am facing this problem with my yocto meta-ti build (morty branch) for
my beagleboard-XM.
I saw in the mailing list, https://lists.yoctoproject.
org/pipermail/meta-ti/2016-October/009114.html however i still face this
issue. Plz help me to resolve this. Thank you.

Build details.
-------------

Loading cache...done.
Loaded 2243 entries from dependency cache.
WARNING: No bb files matched BBFILE_PATTERN_openembedded-core
'^/home/avi/Projects/BoardLabSetup/poky/openembedded-core/'
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.36.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "universal"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "poky"
DISTRO_VERSION    = "2.4"
TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard"
TARGET_FPU        = "hard"
meta
meta-poky
meta-yocto-bsp    = "morty:f7b90ab3eaf832bd81f3efc1dab4dcf6863ac284"
meta-ti           = "morty:5f3a1169d307fec41626f850f5c700437dedbe93"
meta-qt5          = "morty:2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b"
openembedded-core = "morty:bfa04fa71c47e8fe9528208848cfcec2e232777d"
meta-ruby
meta-oe           = "morty:55c8a76da5dc099a7bc3838495c672140cedb78e"

u-boot error:
-------------

DEBUG: Executing shell function do_compile
NOTE: make -j 4 CROSS_COMPILE=arm-poky-linux-gnueabi-
CC=arm-poky-linux-gnueabi-gcc  --sysroot=/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot V=1 HOSTCC=gcc
-isystem/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/include -O2 -pipe -L/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
-L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1 -C
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git
O=/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/build
omap3_beagle_config
make: Entering directory '/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git'
make -C /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/build
KBUILD_SRC=/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git \
-f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/Makefile
omap3_beagle_config
make[1]: Entering directory '/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/build'
make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
obj=scripts/basic
ln -fsn /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git source
/bin/bash /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/mkmakefile
\
    /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git . 2016 05
  GEN     ./Makefile
rm -f .tmp_quiet_recordmcount
make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
obj=scripts/kconfig omap3_beagle_config
scripts/kconfig/conf  --defconfig=arch/../configs/omap3_beagle_defconfig
Kconfig
#
# configuration written to .config
#
make[1]: Leaving directory '/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/build'
make: Leaving directory '/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git'
NOTE: make -j 4 CROSS_COMPILE=arm-poky-linux-gnueabi-
CC=arm-poky-linux-gnueabi-gcc  --sysroot=/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot V=1 HOSTCC=gcc
-isystem/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/include -O2 -pipe -L/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
-L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1 -C
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git
O=/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/build all
make: Entering directory '/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git'
make -C /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/build
KBUILD_SRC=/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git \
-f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/Makefile all
make[1]: Entering directory '/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/build'
make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/Makefile
silentoldconfig
make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
obj=scripts/basic
ln -fsn /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git source
rm -f .tmp_quiet_recordmcount
/bin/bash /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/mkmakefile
\
    /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git . 2016 05
  GEN     ./Makefile
make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
obj=scripts/kconfig silentoldconfig
mkdir -p include/config include/generated
scripts/kconfig/conf  --silentoldconfig Kconfig
make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/scripts/Makefile.autoconf || \
    { rm -f include/config/auto.conf; false; }
mkdir -p include/asm
if [ -d /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/arch/arm/mach-omap3/include/mach ]; then    \
    dest=arch/arm/mach-omap3/include/mach;            \
else                                    \
    dest=arch/arm/include/asm/arch-omap3;    \
fi;                                    \
ln -fsn /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/$dest
include/asm/arch
set -e; : '  CHK     include/config.h'; mkdir -p include/;     (echo "/*
Automatically generated - do not edit */"; for i in $(echo "NAND" | sed
's/,/ /g'); do echo \#define CONFIG_$i | sed '/=/ {s/=/    /;q; } ; {
s/$/    1/; }'; done; echo \#define CONFIG_BOARDDIR board/ti/beagle; echo
\#include \<config_defaults.h\>; echo \#include \<config_uncmd_spl.h\>;
echo \#include \<configs/"omap3_beagle".h\>; echo \#include
\<asm/config.h\>; echo \#include \<config_fallbacks.h\>;) <
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/scripts/Makefile.autoconf > include/config.h.tmp; if [ -r
include/config.h ] && cmp -s include/config.h include/config.h.tmp; then rm
-f include/config.h.tmp; else : '  UPD     include/config.h'; mv -f
include/config.h.tmp include/config.h; fi
mkdir -p spl/include/
  arm-poky-linux-gnueabi-gcc  --sysroot=/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot -E -Wall
-Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os
-fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage
-Wno-format-nonliteral -Werror=date-time  -D__KERNEL__ -D__UBOOT__
-D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux
-mword-relocations  -fno-pic  -mno-unaligned-access  -ffunction-sections
-fdata-sections -fno-common -ffixed-r9  -msoft-float   -pipe -Iinclude
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
-include /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/include/linux/kconfig.h  -nostdinc -isystem /home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/
bin/arm-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/
gcc/arm-poky-linux-gnueabi/7.2.0/include  -DDO_DEPS_ONLY -dM
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include/common.h
> include/autoconf.mk.tmp && { sed -n -f /home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/tools/scripts/define2mk.sed
include/autoconf.mk.tmp | while read line; do if [ -n "" ] || ! grep -q
"${line%=*}=" include/config/auto.conf; then echo "$line"; fi done >
include/autoconf.mk; rm include/autoconf.mk.tmp; } || { rm
include/autoconf.mk.tmp; false; }
  arm-poky-linux-gnueabi-gcc  --sysroot=/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot -x c -DDO_DEPS_ONLY -M -MP
-Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding
-Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage
-Wno-format-nonliteral -Werror=date-time  -D__KERNEL__ -D__UBOOT__
-D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux
-mword-relocations  -fno-pic  -mno-unaligned-access  -ffunction-sections
-fdata-sections -fno-common -ffixed-r9  -msoft-float   -pipe -Iinclude
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
-include /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/include/linux/kconfig.h  -nostdinc -isystem /home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/
bin/arm-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/
gcc/arm-poky-linux-gnueabi/7.2.0/include -MQ include/config/auto.conf
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include/common.h
> include/autoconf.mk.dep || { rm include/autoconf.mk.dep; false; }
  arm-poky-linux-gnueabi-gcc  --sysroot=/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot -E -Wall
-Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os
-fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage
-Wno-format-nonliteral -Werror=date-time  -D__KERNEL__ -D__UBOOT__
-D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux
-mword-relocations  -fno-pic  -mno-unaligned-access  -ffunction-sections
-fdata-sections -fno-common -ffixed-r9  -msoft-float   -pipe -Iinclude
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
-include /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/include/linux/kconfig.h  -nostdinc -isystem /home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/
bin/arm-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/
gcc/arm-poky-linux-gnueabi/7.2.0/include -DCONFIG_SPL_BUILD -DDO_DEPS_ONLY
-dM /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include/common.h
> spl/include/autoconf.mk.tmp && { sed -n -f /home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/tools/scripts/define2mk.sed
spl/include/autoconf.mk.tmp | while read line; do if [ -n "" ] || ! grep -q
"${line%=*}=" include/config/auto.conf; then echo "$line"; fi done >
spl/include/autoconf.mk; rm spl/include/autoconf.mk.tmp; } || { rm
spl/include/autoconf.mk.tmp; false; }
touch include/config/auto.conf
set -e; : '  CHK     include/config/uboot.release'; mkdir -p
include/config/;     echo "2016.05$(/bin/bash /home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/setlocalversion
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git)" <
include/config/auto.conf > include/config/uboot.release.tmp; if [ -r
include/config/uboot.release ] && cmp -s include/config/uboot.release
include/config/uboot.release.tmp; then rm -f include/config/uboot.release.tmp;
else : '  UPD     include/config/uboot.release'; mv -f
include/config/uboot.release.tmp include/config/uboot.release; fi
ln -fsn /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git source
set -e; : '  CHK     include/generated/timestamp_autogenerated.h'; mkdir -p
include/generated/;     (if test -n "${SOURCE_DATE_EPOCH}"; then
SOURCE_DATE="@${SOURCE_DATE_EPOCH}"; DATE=""; for date in gdate date.gnu
date; do ${date} -u -d "${SOURCE_DATE}" >/dev/null 2>&1 && DATE="${date}";
done; if test -n "${DATE}"; then LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_DATE "%b %d %C%y"'; LC_ALL=C ${DATE} -u -d
"${SOURCE_DATE}" +'#define U_BOOT_TIME "%T"'; LC_ALL=C ${DATE} -u -d
"${SOURCE_DATE}" +'#define U_BOOT_TZ "%z"'; LC_ALL=C ${DATE} -u -d
"${SOURCE_DATE}" +'#define U_BOOT_DMI_DATE "%m/%d/%Y"'; else return 42; fi;
else LC_ALL=C date +'#define U_BOOT_DATE "%b %d %C%y"'; LC_ALL=C date
+'#define U_BOOT_TIME "%T"'; LC_ALL=C date +'#define U_BOOT_TZ "%z"';
LC_ALL=C date +'#define U_BOOT_DMI_DATE "%m/%d/%Y"'; fi) <
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/Makefile >
include/generated/timestamp_autogenerated.h.tmp; if [ -r
include/generated/timestamp_autogenerated.h ] && cmp -s
include/generated/timestamp_autogenerated.h
include/generated/timestamp_autogenerated.h.tmp;
then rm -f include/generated/timestamp_autogenerated.h.tmp; else : '
UPD     include/generated/timestamp_autogenerated.h'; mv -f
include/generated/timestamp_autogenerated.h.tmp
include/generated/timestamp_autogenerated.h;
fi
/bin/bash /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/mkmakefile
\
    /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git . 2016 05
make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
obj=scripts/basic
  GEN     ./Makefile
rm -f .tmp_quiet_recordmcount
if [ -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/.config -o
-d /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/include/config
]; then \
    echo >&2 "  /home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git is not clean, please run 'make
mrproper'"; \
    echo >&2 "  in the '/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git' directory.";\
    /bin/false; \
fi;
set -e; : '  CHK     include/generated/version_autogenerated.h'; mkdir -p
include/generated/;     (echo \#define PLAIN_VERSION \"2016.05-gb340c262b >
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/build/.scmversion
        echo -gb340c262b\"; echo \#define U_BOOT_VERSION \"U-Boot \"
PLAIN_VERSION; echo \#define CC_VERSION_STRING \"$(arm-poky-linux-gnueabi-gcc
--sysroot=/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot
--version | head -n 1)\"; echo \#define LD_VERSION_STRING
\"$(arm-poky-linux-gnueabi-ld.bfd --version | head -n 1)\"; ) <
include/config/uboot.release > include/generated/version_autogenerated.h.tmp;
if [ -r include/generated/version_autogenerated.h ] && cmp -s
include/generated/version_autogenerated.h
include/generated/version_autogenerated.h.tmp;
then rm -f include/generated/version_autogenerated.h.tmp; else : '  UPD
include/generated/version_autogenerated.h'; mv -f
include/generated/version_autogenerated.h.tmp
include/generated/version_autogenerated.h; fi
make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
obj=.
mkdir -p lib/
mkdir -p arch/arm/lib/
set -e; : '  CHK     include/generated/generic-asm-offsets.h'; mkdir -p
include/generated/;     (set -e; echo "#ifndef __GENERIC_ASM_OFFSETS_H__";
echo "#define __GENERIC_ASM_OFFSETS_H__"; echo "/*"; echo " * DO NOT
MODIFY."; echo " *"; echo " * This file was generated by Kbuild"; echo "
*/"; echo ""; sed -ne     "s:[[:space:]]*\.ascii[[:space:]]*\"\(.*\)\":\1:;
/^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([-0-9]*\)
\(.*\):#define \1 \2 /* \3 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\)
\(.*\):#define \1 \2 /* \3 */:; s:->::; p;}"; echo ""; echo "#endif" ) <
lib/asm-offsets.s > include/generated/generic-asm-offsets.h.tmp; if [ -r
include/generated/generic-asm-offsets.h ] && cmp -s
include/generated/generic-asm-offsets.h
include/generated/generic-asm-offsets.h.tmp;
then rm -f include/generated/generic-asm-offsets.h.tmp; else : '  UPD
include/generated/generic-asm-offsets.h'; mv -f
include/generated/generic-asm-offsets.h.tmp
include/generated/generic-asm-offsets.h;
fi
set -e; : '  CHK     include/generated/asm-offsets.h'; mkdir -p
include/generated/;     (set -e; echo "#ifndef __ASM_OFFSETS_H__"; echo
"#define __ASM_OFFSETS_H__"; echo "/*"; echo " * DO NOT MODIFY."; echo "
*"; echo " * This file was generated by Kbuild"; echo " */"; echo ""; sed
-ne     "s:[[:space:]]*\.ascii[[:space:]]*\"\(.*\)\":\1:;
/^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([-0-9]*\)
\(.*\):#define \1 \2 /* \3 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\)
\(.*\):#define \1 \2 /* \3 */:; s:->::; p;}"; echo ""; echo "#endif" ) <
arch/arm/lib/asm-offsets.s > include/generated/asm-offsets.h.tmp; if [ -r
include/generated/asm-offsets.h ] && cmp -s include/generated/asm-offsets.h
include/generated/asm-offsets.h.tmp; then rm -f
include/generated/asm-offsets.h.tmp; else : '  UPD
include/generated/asm-offsets.h'; mv -f include/generated/asm-offsets.h.tmp
include/generated/asm-offsets.h; fi
make -f /home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/scripts/Makefile.build
obj=tools
  gcc  -isystem/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/include -O2
-pipe -L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/lib -L/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1
-Wp,-MD,tools/.mkenvimage.o.d -Itools -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -include /home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/include/libfdt_env.h
-idirafterinclude -idirafter/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/include -idirafter/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/lib/libfdt
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools
-DCONFIG_SYS_TEXT_BASE=0x80100000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
-D_GNU_SOURCE -c -o tools/mkenvimage.o /home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/tools/mkenvimage.c
  gcc  -isystem/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/include -O2
-pipe -L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/lib -L/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1
-Wp,-MD,tools/.image-host.o.d -Itools -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -include /home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/include/libfdt_env.h
-idirafterinclude -idirafter/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/include -idirafter/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/lib/libfdt
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools
-DCONFIG_SYS_TEXT_BASE=0x80100000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
-D_GNU_SOURCE -c -o tools/image-host.o /home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/tools/image-host.c
  gcc  -isystem/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/include -O2
-pipe -L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/lib -L/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1
-Wp,-MD,tools/.mxsimage.o.d -Itools -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -include /home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/include/libfdt_env.h
-idirafterinclude -idirafter/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/include -idirafter/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/lib/libfdt
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools
-DCONFIG_SYS_TEXT_BASE=0x80100000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
-D_GNU_SOURCE -c -o tools/mxsimage.o /home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/tools/mxsimage.c
  gcc  -isystem/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/include -O2
-pipe -L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/lib -L/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib
-Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/recipe-sysroot-native/lib -Wl,-O1
-Wp,-MD,tools/.fit_image.o.d -Itools -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -include /home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/include/libfdt_env.h
-idirafterinclude -idirafter/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/include -idirafter/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/arch/arm/include
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/lib/libfdt
-I/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools
-DCONFIG_SYS_TEXT_BASE=0x80100000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
-D_GNU_SOURCE -c -o tools/fit_image.o /home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/tools/fit_image.c
In file included from /home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/tools/fdt_host.h:11:0,
                 from /home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/tools/mkimage.h:22,
                 from /home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git/tools/image-host.c:12:
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools/image-host.c:
In function 'fit_image_write_sig':
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/tools/image-host.c:126:7: error: 'PLAIN_VERSION' undeclared (first
use in this function)
       PLAIN_VERSION);
       ^
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/tools/../include/libfdt.h:1449:44: note: in definition of macro
'fdt_setprop_string'
  fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
                                            ^
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/tools/image-host.c:126:7: note: each undeclared identifier is
reported only once for each function it appears in
       PLAIN_VERSION);
       ^
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/tools/../include/libfdt.h:1449:44: note: in definition of macro
'fdt_setprop_string'
  fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
                                            ^
scripts/Makefile.host:111: recipe for target 'tools/image-host.o' failed
make[2]: *** [tools/image-host.o] Error 1
make[2]: *** Waiting for unfinished jobs....
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools/mkenvimage.c:
In function 'main':
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/tools/mkenvimage.c:120:35: error: 'PLAIN_VERSION' undeclared (first
use in this function)
    printf("%s version %s\n", prg, PLAIN_VERSION);
                                   ^
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/tools/mkenvimage.c:120:35: note: each undeclared identifier is
reported only once for each function it appears in
scripts/Makefile.host:111: recipe for target 'tools/mkenvimage.o' failed
make[2]: *** [tools/mkenvimage.o] Error 1
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/tools/fit_image.c:
In function 'fit_build_fdt':
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/tools/fit_image.c:299:57: error: 'PLAIN_VERSION' undeclared (first
use in this function)
  fdt_property_strf(fdt, "creator", "U-Boot mkimage %s", PLAIN_VERSION);
                                                         ^
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/git/tools/fit_image.c:299:57: note: each undeclared identifier is
reported only once for each function it appears in
scripts/Makefile.host:111: recipe for target 'tools/fit_image.o' failed
make[2]: *** [tools/fit_image.o] Error 1
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-r35/git/Makefile:1221:
recipe for target 'tools' failed
make[1]: *** [tools] Error 2
make[1]: Leaving directory '/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/build'
Makefile:150: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2
make: Leaving directory '/home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/u-boot-ti-staging/
2016.05+gitAUTOINC+340c262b4b-r35/git'
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.
ERROR: Function failed: do_compile (log file is located at
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+340c262b4b-
r35/temp/log.do_compile.4675)

linux-ti-staging error:
-----------------------

DEBUG: Executing shell function do_compile
NOTE: make -j 4 HOSTCC=gcc  -isystem/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
91+gitAUTOINC+9d9bc78b62-r127a/recipe-sysroot-native/usr/include -O2 -pipe
-L/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/linux-ti-staging/4.4.91+gitAUTOINC+9d9bc78b62-
r127a/recipe-sysroot-native/usr/lib -L/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
91+gitAUTOINC+9d9bc78b62-r127a/recipe-sysroot-native/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
91+gitAUTOINC+9d9bc78b62-r127a/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
91+gitAUTOINC+9d9bc78b62-r127a/recipe-sysroot-native/lib
-Wl,-rpath,/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/linux-ti-staging/4.4.91+gitAUTOINC+9d9bc78b62-
r127a/recipe-sysroot-native/usr/lib -Wl,-rpath,/home/avi/Projects/
BoardLabSetup/tmp/work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
91+gitAUTOINC+9d9bc78b62-r127a/recipe-sysroot-native/lib -Wl,-O1
HOSTCPP=gcc  -E zImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork
-marm -fuse-ld=bfd -ffile-prefix-map=/home/avi/Projects/BoardLabSetup/tmp/
work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
91+gitAUTOINC+9d9bc78b62-r127a/git=/kernel-source/
LD=arm-poky-linux-gnueabi-ld.bfd
  CHK     include/config/kernel.release
  GEN     ./Makefile
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
"4.4.91-gb9d9bc78b > /home/avi/Projects/BoardLabSetup/tmp/work/
beagleboard-poky-linux-gnueabi/linux-ti-staging/4.4.
91+gitAUTOINC+9d9bc78b62-r127a/build/.scmversion     echo -gb9d9bc78b"
exceeds 64 characters
/home/avi/Projects/BoardLabSetup/tmp/work-shared/beagleboard/kernel-source/Makefile:1038:
recipe for target 'include/generated/utsrelease.h' failed
make[2]: *** [include/generated/utsrelease.h] Error 1
ERROR: oe_runmake failed
Makefile:150: recipe for target 'sub-make' failed
make[1]: *** [sub-make] Error 2
Makefile:24: recipe for target '__sub-make' failed
make: *** [__sub-make] Error 2
WARNING: exit code 1 from a shell command.
ERROR: Function failed: do_compile (log file is located at
/home/avi/Projects/BoardLabSetup/tmp/work/beagleboard-poky-linux-
gnueabi/linux-ti-staging/4.4.91+gitAUTOINC+9d9bc78b62-
r127a/temp/log.do_compile.4529)

--f40304389738f9b520055f194661
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>=C2=A0=C2=A0 I am facing this problem with =
my yocto meta-ti build (morty branch) for my beagleboard-XM.<br>I saw in th=
e mailing list, <a href=3D"https://lists.yoctoproject.org/pipermail/meta-ti=
/2016-October/009114.html" target=3D"_blank">https://lists.yoctoproject.<wb=
r>org/pipermail/meta-ti/2016-<wbr>October/009114.html</a> however i still f=
ace this issue. Plz help me to resolve this. Thank you.<br><br>Build detail=
s.<br>-------------<br><br>Loading cache...done.<br>Loaded 2243 entries fro=
m dependency cache.<br>WARNING: No bb files matched BBFILE_PATTERN_openembe=
dded-<wbr>core &#39;^/home/avi/Projects/<wbr>BoardLabSetup/poky/<wbr>openem=
bedded-core/&#39;<br>NOTE: Resolving any missing task queue dependencies<br=
><br>Build Configuration:<br>BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &quot;1.36.0&quot;<br>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;x86_64-linux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0=
 =3D &quot;universal&quot;<br>TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;arm-poky-linux-gnueabi&quot;<br>MACHINE=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;beagleboard&quot;<b=
r>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;poky&quot;<br>DISTRO_VERSION=C2=A0=C2=A0=C2=A0 =3D &quot;2.4&quot=
;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;arm armv7a vfp thumb n=
eon callconvention-hard&quot;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;hard&quot;<br>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-poky=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-yocto-bsp=C2=A0=C2=A0=C2=A0 =3D =
&quot;morty:<wbr>f7b90ab3eaf832bd81f3efc1dab4dc<wbr>f6863ac284&quot;<br>met=
a-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;=
morty:<wbr>5f3a1169d307fec41626f850f5c700<wbr>437dedbe93&quot;<br>meta-qt5=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;morty:<wbr=
>2c9f0e4eb0e9097f6f872ec1e1d817<wbr>68a8ab5f1b&quot;<br>openembedded-core =
=3D &quot;morty:<wbr>bfa04fa71c47e8fe9528208848cfce<wbr>c2e232777d&quot;<br=
>meta-ruby=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-oe=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;morty:<=
wbr>55c8a76da5dc099a7bc3838495c672<wbr>140cedb78e&quot;<br><br>u-boot error=
:<br>-------------<br><br>DEBUG: Executing shell function do_compile<br>NOT=
E: make -j 4 CROSS_COMPILE=3Darm-poky-linux-<wbr>gnueabi- CC=3Darm-poky-lin=
ux-gnueabi-gcc=C2=A0 --sysroot=3D/home/avi/Projects/<wbr>BoardLabSetup/tmp/=
work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.0=
5+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot V=3D1 HOSTCC=3Dgcc=C2=A0 -i=
system/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-=
linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wb=
r>r35/recipe-sysroot-native/usr/<wbr>include -O2 -pipe -L/home/avi/Projects=
/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boo=
t-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-nat=
ive/usr/<wbr>lib -L/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beag=
leboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+3=
40c262b4b-<wbr>r35/recipe-sysroot-native/lib -Wl,-rpath-link,/home/avi/<wbr=
>Projects/BoardLabSetup/tmp/<wbr>work/beagleboard-poky-linux-<wbr>gnueabi/u=
-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot=
-native/usr/<wbr>lib -Wl,-rpath-link,/home/avi/<wbr>Projects/BoardLabSetup/=
tmp/<wbr>work/beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>20=
16.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/lib -Wl,-rpath,/=
home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<=
wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/r=
ecipe-sysroot-native/usr/<wbr>lib -Wl,-rpath,/home/avi/Projects/<wbr>BoardL=
abSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging=
/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/lib -Wl,=
-O1 -C /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky=
-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<w=
br>r35/git O=3D/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beaglebo=
ard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c2=
62b4b-<wbr>r35/build omap3_beagle_config<br>make: Entering directory &#39;/=
home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<=
wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/g=
it&#39;<br>make -C /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beag=
leboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+3=
40c262b4b-<wbr>r35/build KBUILD_SRC=3D/home/avi/Projects/<wbr>BoardLabSetup=
/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2=
016.05+gitAUTOINC+340c262b4b-<wbr>r35/git \<br>-f /home/avi/Projects/<wbr>B=
oardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-st=
aging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/Makefile omap3_beagle=
_config<br>make[1]: Entering directory &#39;/home/avi/Projects/<wbr>BoardLa=
bSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/=
<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/build&#39;<br>make -f /home/avi=
/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnue=
abi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/scrip=
ts/Makefile.build obj=3Dscripts/basic<br>ln -fsn /home/avi/Projects/<wbr>Bo=
ardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-sta=
ging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git source<br>/bin/bash /h=
ome/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<w=
br>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/gi=
t/scripts/mkmakefile \<br>=C2=A0=C2=A0=C2=A0 /home/avi/Projects/<wbr>BoardL=
abSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging=
/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git . 2016 05<br>=C2=A0 GEN=C2=
=A0=C2=A0=C2=A0=C2=A0 ./Makefile<br>rm -f .tmp_quiet_recordmcount<br>make -=
f /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linu=
x-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r3=
5/git/scripts/Makefile.build obj=3Dscripts/kconfig omap3_beagle_config<br>s=
cripts/kconfig/conf=C2=A0 --defconfig=3Darch/../configs/<wbr>omap3_beagle_d=
efconfig Kconfig<br>#<br># configuration written to .config<br>#<br>make[1]=
: Leaving directory &#39;/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wb=
r>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUT=
OINC+340c262b4b-<wbr>r35/build&#39;<br>make: Leaving directory &#39;/home/a=
vi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gn=
ueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git&#39=
;<br>NOTE: make -j 4 CROSS_COMPILE=3Darm-poky-linux-<wbr>gnueabi- CC=3Darm-=
poky-linux-gnueabi-gcc=C2=A0 --sysroot=3D/home/avi/Projects/<wbr>BoardLabSe=
tup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wb=
r>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot V=3D1 HOSTCC=3Dgcc=
=C2=A0 -isystem/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beaglebo=
ard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c2=
62b4b-<wbr>r35/recipe-sysroot-native/usr/<wbr>include -O2 -pipe -L/home/avi=
/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnue=
abi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sy=
sroot-native/usr/<wbr>lib -L/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/=
<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+git=
AUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/lib -Wl,-rpath-link,/home=
/avi/<wbr>Projects/BoardLabSetup/tmp/<wbr>work/beagleboard-poky-linux-<wbr>=
gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recip=
e-sysroot-native/usr/<wbr>lib -Wl,-rpath-link,/home/avi/<wbr>Projects/Board=
LabSetup/tmp/<wbr>work/beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-stagin=
g/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/lib -Wl=
,-rpath,/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-pok=
y-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<=
wbr>r35/recipe-sysroot-native/usr/<wbr>lib -Wl,-rpath,/home/avi/Projects/<w=
br>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-t=
i-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native=
/lib -Wl,-O1 -C /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleb=
oard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c=
262b4b-<wbr>r35/git O=3D/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr=
>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTO=
INC+340c262b4b-<wbr>r35/build all<br>make: Entering directory &#39;/home/av=
i/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnu=
eabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git&#39;=
<br>make -C /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard=
-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b=
4b-<wbr>r35/build KBUILD_SRC=3D/home/avi/Projects/<wbr>BoardLabSetup/tmp/wo=
rk/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+=
gitAUTOINC+340c262b4b-<wbr>r35/git \<br>-f /home/avi/Projects/<wbr>BoardLab=
Setup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<=
wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/Makefile all<br>make[1]: Ent=
ering directory &#39;/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>be=
agleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC=
+340c262b4b-<wbr>r35/build&#39;<br>make -f /home/avi/Projects/<wbr>BoardLab=
Setup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<=
wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/Makefile silentoldconfig<br>=
make -f /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-pok=
y-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<=
wbr>r35/git/scripts/Makefile.build obj=3Dscripts/basic<br>ln -fsn /home/avi=
/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnue=
abi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git sourc=
e<br>rm -f .tmp_quiet_recordmcount<br>/bin/bash /home/avi/Projects/<wbr>Boa=
rdLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-stag=
ing/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/scripts/mkmakefile \<br=
>=C2=A0=C2=A0=C2=A0 /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>bea=
gleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+=
340c262b4b-<wbr>r35/git . 2016 05<br>=C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 ./M=
akefile<br>make -f /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beag=
leboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+3=
40c262b4b-<wbr>r35/git/scripts/Makefile.build obj=3Dscripts/kconfig silento=
ldconfig<br>mkdir -p include/config include/generated<br>scripts/kconfig/co=
nf=C2=A0 --silentoldconfig Kconfig<br>make -f /home/avi/Projects/<wbr>Board=
LabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-stagin=
g/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/scripts/Makefile.<wbr>aut=
oconf || \<br>=C2=A0=C2=A0=C2=A0 { rm -f include/config/auto.conf; false; }=
<br>mkdir -p include/asm<br>if [ -d /home/avi/Projects/<wbr>BoardLabSetup/t=
mp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>201=
6.05+gitAUTOINC+340c262b4b-<wbr>r35/git/arch/arm/mach-omap3/<wbr>include/ma=
ch ]; then=C2=A0=C2=A0=C2=A0 \<br>=C2=A0=C2=A0=C2=A0 dest=3Darch/arm/mach-o=
map3/<wbr>include/mach;=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 \<br>else=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 \<br>=C2=A0=C2=A0=C2=A0 dest=3Darch/=
arm/include/asm/<wbr>arch-omap3;=C2=A0=C2=A0=C2=A0 \<br>fi;=C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 \<br>ln -fsn /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>=
beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOI=
NC+340c262b4b-<wbr>r35/git/$dest include/asm/arch<br>set -e; : &#39;=C2=A0 =
CHK=C2=A0=C2=A0=C2=A0=C2=A0 include/config.h&#39;; mkdir -p include/; =C2=
=A0=C2=A0=C2=A0 (echo &quot;/* Automatically generated - do not edit */&quo=
t;; for i in $(echo &quot;NAND&quot; | sed &#39;s/,/ /g&#39;); do echo \#de=
fine CONFIG_$i | sed &#39;/=3D/ {s/=3D/=C2=A0=C2=A0=C2=A0 /;q; } ; { s/$/=
=C2=A0=C2=A0=C2=A0 1/; }&#39;; done; echo \#define CONFIG_BOARDDIR board/ti=
/beagle; echo \#include \&lt;config_defaults.h\&gt;; echo \#include \&lt;co=
nfig_uncmd_spl.h\&gt;; echo \#include \&lt;configs/&quot;omap3_beagle&quot;=
.h\&gt;; echo \#include \&lt;asm/config.h\&gt;; echo \#include \&lt;config_=
fallbacks.h\&gt;;) &lt; /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr=
>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTO=
INC+340c262b4b-<wbr>r35/git/scripts/Makefile.<wbr>autoconf &gt; include/con=
fig.h.tmp; if [ -r include/config.h ] &amp;&amp; cmp -s include/config.h in=
clude/config.h.tmp; then rm -f include/config.h.tmp; else : &#39;=C2=A0 UPD=
=C2=A0=C2=A0=C2=A0=C2=A0 include/config.h&#39;; mv -f include/config.h.tmp =
include/config.h; fi<br>mkdir -p spl/include/<br>=C2=A0 arm-poky-linux-gnue=
abi-gcc=C2=A0 --sysroot=3D/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<w=
br>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAU=
TOINC+340c262b4b-<wbr>r35/recipe-sysroot -E -Wall -Wstrict-prototypes -Wno-=
format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -fno-d=
elete-null-pointer-<wbr>checks -g -fstack-usage -Wno-format-nonliteral -Wer=
ror=3Ddate-time=C2=A0 -D__KERNEL__ -D__UBOOT__=C2=A0=C2=A0 -D__ARM__ -marm =
-mno-thumb-interwork=C2=A0 -mabi=3Daapcs-linux=C2=A0 -mword-relocations=C2=
=A0 -fno-pic=C2=A0 -mno-unaligned-access=C2=A0 -ffunction-sections -fdata-s=
ections -fno-common -ffixed-r9=C2=A0 -msoft-float=C2=A0=C2=A0 -pipe -Iinclu=
de=C2=A0 -I/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-=
poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4=
b-<wbr>r35/git/include -I/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wb=
r>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUT=
OINC+340c262b4b-<wbr>r35/git/arch/arm/include -include /home/avi/Projects/<=
wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-=
ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/include/linux/kc=
onfig.<wbr>h=C2=A0 -nostdinc -isystem /home/avi/Projects/<wbr>BoardLabSetup=
/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2=
016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/usr/<wbr>bin/ar=
m-poky-linux-gnueabi/../<wbr>../lib/arm-poky-linux-gnueabi/<wbr>gcc/arm-pok=
y-linux-gnueabi/7.<wbr>2.0/include=C2=A0 -DDO_DEPS_ONLY -dM /home/avi/Proje=
cts/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-=
boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/include/com=
mon.h &gt; include/autoconf.mk.tmp &amp;&amp; { sed -n -f /home/avi/Project=
s/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-bo=
ot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools/scripts=
/<wbr>define2mk.sed include/autoconf.mk.tmp | while read line; do if [ -n &=
quot;&quot; ] || ! grep -q &quot;${line%=3D*}=3D&quot; include/config/auto.=
conf; then echo &quot;$line&quot;; fi done &gt; include/<a href=3D"http://a=
utoconf.mk" target=3D"_blank">autoconf.mk</a>; rm include/autoconf.mk.tmp; =
} || { rm include/autoconf.mk.tmp; false; }<br>=C2=A0 arm-poky-linux-gnueab=
i-gcc=C2=A0 --sysroot=3D/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr=
>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTO=
INC+340c262b4b-<wbr>r35/recipe-sysroot -x c -DDO_DEPS_ONLY -M -MP -Wall -Ws=
trict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-=
stack-protector -fno-delete-null-pointer-<wbr>checks -g -fstack-usage -Wno-=
format-nonliteral -Werror=3Ddate-time=C2=A0 -D__KERNEL__ -D__UBOOT__=C2=A0=
=C2=A0 -D__ARM__ -marm -mno-thumb-interwork=C2=A0 -mabi=3Daapcs-linux=C2=A0=
 -mword-relocations=C2=A0 -fno-pic=C2=A0 -mno-unaligned-access=C2=A0 -ffunc=
tion-sections -fdata-sections -fno-common -ffixed-r9=C2=A0 -msoft-float=C2=
=A0=C2=A0 -pipe -Iinclude=C2=A0 -I/home/avi/Projects/<wbr>BoardLabSetup/tmp=
/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.=
05+gitAUTOINC+340c262b4b-<wbr>r35/git/include -I/home/avi/Projects/<wbr>Boa=
rdLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-stag=
ing/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/arch/arm/include -inclu=
de /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-lin=
ux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r=
35/git/include/linux/kconfig.<wbr>h=C2=A0 -nostdinc -isystem /home/avi/Proj=
ects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u=
-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot=
-native/usr/<wbr>bin/arm-poky-linux-gnueabi/../<wbr>../lib/arm-poky-linux-g=
nueabi/<wbr>gcc/arm-poky-linux-gnueabi/7.<wbr>2.0/include -MQ include/confi=
g/auto.conf /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard=
-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b=
4b-<wbr>r35/git/include/common.h &gt; include/autoconf.mk.dep || { rm inclu=
de/autoconf.mk.dep; false; }<br>=C2=A0 arm-poky-linux-gnueabi-gcc=C2=A0 --s=
ysroot=3D/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-po=
ky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-=
<wbr>r35/recipe-sysroot -E -Wall -Wstrict-prototypes -Wno-format-security -=
fno-builtin -ffreestanding -Os -fno-stack-protector -fno-delete-null-pointe=
r-<wbr>checks -g -fstack-usage -Wno-format-nonliteral -Werror=3Ddate-time=
=C2=A0 -D__KERNEL__ -D__UBOOT__=C2=A0=C2=A0 -D__ARM__ -marm -mno-thumb-inte=
rwork=C2=A0 -mabi=3Daapcs-linux=C2=A0 -mword-relocations=C2=A0 -fno-pic=C2=
=A0 -mno-unaligned-access=C2=A0 -ffunction-sections -fdata-sections -fno-co=
mmon -ffixed-r9=C2=A0 -msoft-float=C2=A0=C2=A0 -pipe -Iinclude=C2=A0 -I/hom=
e/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr=
>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/=
include -I/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-p=
oky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b=
-<wbr>r35/git/arch/arm/include -include /home/avi/Projects/<wbr>BoardLabSet=
up/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr=
>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/include/linux/kconfig.<wbr>h=C2=
=A0 -nostdinc -isystem /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>=
beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOI=
NC+340c262b4b-<wbr>r35/recipe-sysroot-native/usr/<wbr>bin/arm-poky-linux-gn=
ueabi/../<wbr>../lib/arm-poky-linux-gnueabi/<wbr>gcc/arm-poky-linux-gnueabi=
/7.<wbr>2.0/include -DCONFIG_SPL_BUILD -DDO_DEPS_ONLY -dM /home/avi/Project=
s/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-bo=
ot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/include/commo=
n.h &gt; spl/include/autoconf.mk.tmp &amp;&amp; { sed -n -f /home/avi/Proje=
cts/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-=
boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools/scrip=
ts/<wbr>define2mk.sed spl/include/autoconf.mk.tmp | while read line; do if =
[ -n &quot;&quot; ] || ! grep -q &quot;${line%=3D*}=3D&quot; include/config=
/auto.conf; then echo &quot;$line&quot;; fi done &gt; spl/include/<a href=
=3D"http://autoconf.mk" target=3D"_blank">autoconf.mk</a>; rm spl/include/a=
utoconf.mk.tmp; } || { rm spl/include/autoconf.mk.tmp; false; }<br>touch in=
clude/config/auto.conf<br>set -e; : &#39;=C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0=
 include/config/uboot.release&#39;; mkdir -p include/config/; =C2=A0=C2=A0=
=C2=A0 echo &quot;2016.05$(/bin/bash /home/avi/Projects/<wbr>BoardLabSetup/=
tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>20=
16.05+gitAUTOINC+340c262b4b-<wbr>r35/git/scripts/<wbr>setlocalversion /home=
/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>=
gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git)&=
quot; &lt; include/config/auto.conf &gt; include/config/uboot.release.<wbr>=
tmp; if [ -r include/config/uboot.release ] &amp;&amp; cmp -s include/confi=
g/uboot.release include/config/uboot.release.<wbr>tmp; then rm -f include/c=
onfig/uboot.release.<wbr>tmp; else : &#39;=C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=
=A0 include/config/uboot.release&#39;; mv -f include/config/uboot.release.<=
wbr>tmp include/config/uboot.release; fi<br>ln -fsn /home/avi/Projects/<wbr=
>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-=
staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git source<br>set -e; :=
 &#39;=C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/timestamp_<wbr>a=
utogenerated.h&#39;; mkdir -p include/generated/; =C2=A0=C2=A0=C2=A0 (if te=
st -n &quot;${SOURCE_DATE_EPOCH}&quot;; then SOURCE_DATE=3D&quot;@${SOURCE_=
DATE_<wbr>EPOCH}&quot;; DATE=3D&quot;&quot;; for date in gdate date.gnu dat=
e; do ${date} -u -d &quot;${SOURCE_DATE}&quot; &gt;/dev/null 2&gt;&amp;1 &a=
mp;&amp; DATE=3D&quot;${date}&quot;; done; if test -n &quot;${DATE}&quot;; =
then LC_ALL=3DC ${DATE} -u -d &quot;${SOURCE_DATE}&quot; +&#39;#define U_BO=
OT_DATE &quot;%b %d %C%y&quot;&#39;; LC_ALL=3DC ${DATE} -u -d &quot;${SOURC=
E_DATE}&quot; +&#39;#define U_BOOT_TIME &quot;%T&quot;&#39;; LC_ALL=3DC ${D=
ATE} -u -d &quot;${SOURCE_DATE}&quot; +&#39;#define U_BOOT_TZ &quot;%z&quot=
;&#39;; LC_ALL=3DC ${DATE} -u -d &quot;${SOURCE_DATE}&quot; +&#39;#define U=
_BOOT_DMI_DATE &quot;%m/%d/%Y&quot;&#39;; else return 42; fi; else LC_ALL=
=3DC date +&#39;#define U_BOOT_DATE &quot;%b %d %C%y&quot;&#39;; LC_ALL=3DC=
 date +&#39;#define U_BOOT_TIME &quot;%T&quot;&#39;; LC_ALL=3DC date +&#39;=
#define U_BOOT_TZ &quot;%z&quot;&#39;; LC_ALL=3DC date +&#39;#define U_BOOT=
_DMI_DATE &quot;%m/%d/%Y&quot;&#39;; fi) &lt; /home/avi/Projects/<wbr>Board=
LabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-stagin=
g/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/Makefile &gt; include/gen=
erated/timestamp_<wbr>autogenerated.h.tmp; if [ -r include/generated/timest=
amp_<wbr>autogenerated.h ] &amp;&amp; cmp -s include/generated/timestamp_<w=
br>autogenerated.h include/generated/timestamp_<wbr>autogenerated.h.tmp; th=
en rm -f include/generated/timestamp_<wbr>autogenerated.h.tmp; else : &#39;=
=C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/timestamp_<wbr>autogen=
erated.h&#39;; mv -f include/generated/timestamp_<wbr>autogenerated.h.tmp i=
nclude/generated/timestamp_<wbr>autogenerated.h; fi<br>/bin/bash /home/avi/=
Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnuea=
bi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/script=
s/mkmakefile \<br>=C2=A0=C2=A0=C2=A0 /home/avi/Projects/<wbr>BoardLabSetup/=
tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>20=
16.05+gitAUTOINC+340c262b4b-<wbr>r35/git . 2016 05<br>make -f /home/avi/Pro=
jects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/=
u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/scripts/M=
akefile.build obj=3Dscripts/basic<br>=C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 ./M=
akefile<br>rm -f .tmp_quiet_recordmcount<br>if [ -f /home/avi/Projects/<wbr=
>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-=
staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/.config -o -d /home=
/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>=
gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/i=
nclude/config ]; then \<br>=C2=A0=C2=A0=C2=A0 echo &gt;&amp;2 &quot;=C2=A0 =
/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-=
<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/=
git is not clean, please run &#39;make mrproper&#39;&quot;; \<br>=C2=A0=C2=
=A0=C2=A0 echo &gt;&amp;2 &quot;=C2=A0 in the &#39;/home/avi/Projects/<wbr>=
BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-s=
taging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git&#39; directory.&quot=
;;\<br>=C2=A0=C2=A0=C2=A0 /bin/false; \<br>fi;<br>set -e; : &#39;=C2=A0 CHK=
=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/version_<wbr>autogenerated.h&#39=
;; mkdir -p include/generated/; =C2=A0=C2=A0=C2=A0 (echo \#define PLAIN_VER=
SION \&quot;2016.05-gb340c262b &gt; /home/avi/Projects/<wbr>BoardLabSetup/t=
mp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>201=
6.05+gitAUTOINC+340c262b4b-<wbr>r35/build/.scmversion =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 echo -gb340c262b\&quot;; echo \#define U_BOOT_VERSION \&=
quot;U-Boot \&quot; PLAIN_VERSION; echo \#define CC_VERSION_STRING \&quot;$=
(arm-poky-linux-gnueabi-<wbr>gcc=C2=A0 --sysroot=3D/home/avi/Projects/<wbr>=
BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-s=
taging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot --version=
 | head -n 1)\&quot;; echo \#define LD_VERSION_STRING \&quot;$(arm-poky-lin=
ux-gnueabi-ld.<wbr>bfd --version | head -n 1)\&quot;; ) &lt; include/config=
/uboot.release &gt; include/generated/version_<wbr>autogenerated.h.tmp; if =
[ -r include/generated/version_<wbr>autogenerated.h ] &amp;&amp; cmp -s inc=
lude/generated/version_<wbr>autogenerated.h include/generated/version_<wbr>=
autogenerated.h.tmp; then rm -f include/generated/version_<wbr>autogenerate=
d.h.tmp; else : &#39;=C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/v=
ersion_<wbr>autogenerated.h&#39;; mv -f include/generated/version_<wbr>auto=
generated.h.tmp include/generated/version_<wbr>autogenerated.h; fi<br>make =
-f /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-lin=
ux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r=
35/git/scripts/Makefile.build obj=3D.<br>mkdir -p lib/<br>mkdir -p arch/arm=
/lib/<br>set -e; : &#39;=C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 include/generate=
d/generic-asm-<wbr>offsets.h&#39;; mkdir -p include/generated/; =C2=A0=C2=
=A0=C2=A0 (set -e; echo &quot;#ifndef __GENERIC_ASM_OFFSETS_H__&quot;; echo=
 &quot;#define __GENERIC_ASM_OFFSETS_H__&quot;; echo &quot;/*&quot;; echo &=
quot; * DO NOT MODIFY.&quot;; echo &quot; *&quot;; echo &quot; * This file =
was generated by Kbuild&quot;; echo &quot; */&quot;; echo &quot;&quot;; sed=
 -ne =C2=A0=C2=A0=C2=A0 &quot;s:[[:space:]]*\.ascii[[:<wbr>space:]]*\&quot;=
\(.*\)\&quot;:\1:; /^-&gt;/{s:-&gt;#\(.*\):/* \1 */:; s:^-&gt;\([^ ]*\) [\$=
#]*\([-0-9]*\) \(.*\):#define \1 \2 /* \3 */:; s:^-&gt;\([^ ]*\) [\$#]*\([^=
 ]*\) \(.*\):#define \1 \2 /* \3 */:; s:-&gt;::; p;}&quot;; echo &quot;&quo=
t;; echo &quot;#endif&quot; ) &lt; lib/asm-offsets.s &gt; include/generated=
/generic-asm-<wbr>offsets.h.tmp; if [ -r include/generated/generic-asm-<wbr=
>offsets.h ] &amp;&amp; cmp -s include/generated/generic-asm-<wbr>offsets.h=
 include/generated/generic-asm-<wbr>offsets.h.tmp; then rm -f include/gener=
ated/generic-asm-<wbr>offsets.h.tmp; else : &#39;=C2=A0 UPD=C2=A0=C2=A0=C2=
=A0=C2=A0 include/generated/generic-asm-<wbr>offsets.h&#39;; mv -f include/=
generated/generic-asm-<wbr>offsets.h.tmp include/generated/generic-asm-<wbr=
>offsets.h; fi<br>set -e; : &#39;=C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 include=
/generated/asm-offsets.<wbr>h&#39;; mkdir -p include/generated/; =C2=A0=C2=
=A0=C2=A0 (set -e; echo &quot;#ifndef __ASM_OFFSETS_H__&quot;; echo &quot;#=
define __ASM_OFFSETS_H__&quot;; echo &quot;/*&quot;; echo &quot; * DO NOT M=
ODIFY.&quot;; echo &quot; *&quot;; echo &quot; * This file was generated by=
 Kbuild&quot;; echo &quot; */&quot;; echo &quot;&quot;; sed -ne =C2=A0=C2=
=A0=C2=A0 &quot;s:[[:space:]]*\.ascii[[:<wbr>space:]]*\&quot;\(.*\)\&quot;:=
\1:; /^-&gt;/{s:-&gt;#\(.*\):/* \1 */:; s:^-&gt;\([^ ]*\) [\$#]*\([-0-9]*\)=
 \(.*\):#define \1 \2 /* \3 */:; s:^-&gt;\([^ ]*\) [\$#]*\([^ ]*\) \(.*\):#=
define \1 \2 /* \3 */:; s:-&gt;::; p;}&quot;; echo &quot;&quot;; echo &quot=
;#endif&quot; ) &lt; arch/arm/lib/asm-offsets.s &gt; include/generated/asm-=
offsets.<wbr>h.tmp; if [ -r include/generated/asm-offsets.<wbr>h ] &amp;&am=
p; cmp -s include/generated/asm-offsets.<wbr>h include/generated/asm-offset=
s.<wbr>h.tmp; then rm -f include/generated/asm-offsets.<wbr>h.tmp; else : &=
#39;=C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/asm-offsets.<wbr>h=
&#39;; mv -f include/generated/asm-offsets.<wbr>h.tmp include/generated/asm=
-offsets.<wbr>h; fi<br>make -f /home/avi/Projects/<wbr>BoardLabSetup/tmp/wo=
rk/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+=
gitAUTOINC+340c262b4b-<wbr>r35/git/scripts/Makefile.build obj=3Dtools<br>=
=C2=A0 gcc=C2=A0 -isystem/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wb=
r>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUT=
OINC+340c262b4b-<wbr>r35/recipe-sysroot-native/usr/<wbr>include -O2 -pipe -=
L/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux=
-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35=
/recipe-sysroot-native/usr/<wbr>lib -L/home/avi/Projects/<wbr>BoardLabSetup=
/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2=
016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/lib -Wl,-rpath-=
link,/home/avi/<wbr>Projects/BoardLabSetup/tmp/<wbr>work/beagleboard-poky-l=
inux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr=
>r35/recipe-sysroot-native/usr/<wbr>lib -Wl,-rpath-link,/home/avi/<wbr>Proj=
ects/BoardLabSetup/tmp/<wbr>work/beagleboard-poky-linux-<wbr>gnueabi/u-boot=
-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-nati=
ve/lib -Wl,-rpath,/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagl=
eboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+34=
0c262b4b-<wbr>r35/recipe-sysroot-native/usr/<wbr>lib -Wl,-rpath,/home/avi/P=
rojects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueab=
i/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysr=
oot-native/lib -Wl,-O1 -Wp,-MD,tools/.mkenvimage.o.d -Itools -Wall -Wstrict=
-prototypes -O2 -fomit-frame-pointer -include /home/avi/Projects/<wbr>Board=
LabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-stagin=
g/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/include/libfdt_env.h -idi=
rafterinclude -idirafter/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr=
>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTO=
INC+340c262b4b-<wbr>r35/git/include -idirafter/home/avi/Projects/<wbr>Board=
LabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-stagin=
g/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/arch/arm/include=C2=A0=C2=
=A0 -I/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-=
linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wb=
r>r35/git/lib/libfdt=C2=A0=C2=A0 -I/home/avi/Projects/<wbr>BoardLabSetup/tm=
p/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016=
.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools -DCONFIG_SYS_TEXT_BASE=3D<wbr>=
0x80100000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE -c -o tools/m=
kenvimage.o /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard=
-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b=
4b-<wbr>r35/git/tools/mkenvimage.c<br>=C2=A0 gcc=C2=A0 -isystem/home/avi/Pr=
ojects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi=
/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysro=
ot-native/usr/<wbr>include -O2 -pipe -L/home/avi/Projects/<wbr>BoardLabSetu=
p/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>=
2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/usr/<wbr>lib -=
L/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux=
-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35=
/recipe-sysroot-native/lib -Wl,-rpath-link,/home/avi/<wbr>Projects/BoardLab=
Setup/tmp/<wbr>work/beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<=
wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/usr/<wbr>l=
ib -Wl,-rpath-link,/home/avi/<wbr>Projects/BoardLabSetup/tmp/<wbr>work/beag=
leboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+3=
40c262b4b-<wbr>r35/recipe-sysroot-native/lib -Wl,-rpath,/home/avi/Projects/=
<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot=
-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-nati=
ve/usr/<wbr>lib -Wl,-rpath,/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<=
wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitA=
UTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/lib -Wl,-O1 -Wp,-MD,tools/=
.image-host.o.d -Itools -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer =
-include /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-po=
ky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-=
<wbr>r35/git/include/libfdt_env.h -idirafterinclude -idirafter/home/avi/Pro=
jects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/=
u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/include -=
idirafter/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-po=
ky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-=
<wbr>r35/git/arch/arm/include=C2=A0=C2=A0 -I/home/avi/Projects/<wbr>BoardLa=
bSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/=
<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/lib/libfdt=C2=A0=C2=A0 -I/h=
ome/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<w=
br>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/gi=
t/tools -DCONFIG_SYS_TEXT_BASE=3D<wbr>0x80100000 -DUSE_HOSTCC -D__KERNEL_ST=
RICT_NAMES -D_GNU_SOURCE -c -o tools/image-host.o /home/avi/Projects/<wbr>B=
oardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-st=
aging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools/image-host.c<br=
>=C2=A0 gcc=C2=A0 -isystem/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<w=
br>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAU=
TOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/usr/<wbr>include -O2 -pipe =
-L/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linu=
x-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r3=
5/recipe-sysroot-native/usr/<wbr>lib -L/home/avi/Projects/<wbr>BoardLabSetu=
p/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>=
2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/lib -Wl,-rpath=
-link,/home/avi/<wbr>Projects/BoardLabSetup/tmp/<wbr>work/beagleboard-poky-=
linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wb=
r>r35/recipe-sysroot-native/usr/<wbr>lib -Wl,-rpath-link,/home/avi/<wbr>Pro=
jects/BoardLabSetup/tmp/<wbr>work/beagleboard-poky-linux-<wbr>gnueabi/u-boo=
t-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-nat=
ive/lib -Wl,-rpath,/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beag=
leboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+3=
40c262b4b-<wbr>r35/recipe-sysroot-native/usr/<wbr>lib -Wl,-rpath,/home/avi/=
Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnuea=
bi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sys=
root-native/lib -Wl,-O1 -Wp,-MD,tools/.mxsimage.o.d -Itools -Wall -Wstrict-=
prototypes -O2 -fomit-frame-pointer -include /home/avi/Projects/<wbr>BoardL=
abSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging=
/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/include/libfdt_env.h -idir=
afterinclude -idirafter/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>=
beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOI=
NC+340c262b4b-<wbr>r35/git/include -idirafter/home/avi/Projects/<wbr>BoardL=
abSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging=
/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/arch/arm/include=C2=A0=C2=
=A0 -I/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-=
linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wb=
r>r35/git/lib/libfdt=C2=A0=C2=A0 -I/home/avi/Projects/<wbr>BoardLabSetup/tm=
p/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016=
.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools -DCONFIG_SYS_TEXT_BASE=3D<wbr>=
0x80100000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE -c -o tools/m=
xsimage.o /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-p=
oky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b=
-<wbr>r35/git/tools/mxsimage.c<br>=C2=A0 gcc=C2=A0 -isystem/home/avi/Projec=
ts/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-b=
oot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-n=
ative/usr/<wbr>include -O2 -pipe -L/home/avi/Projects/<wbr>BoardLabSetup/tm=
p/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016=
.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/usr/<wbr>lib -L/ho=
me/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wb=
r>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/rec=
ipe-sysroot-native/lib -Wl,-rpath-link,/home/avi/<wbr>Projects/BoardLabSetu=
p/tmp/<wbr>work/beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>=
2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/usr/<wbr>lib -=
Wl,-rpath-link,/home/avi/<wbr>Projects/BoardLabSetup/tmp/<wbr>work/beaglebo=
ard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c2=
62b4b-<wbr>r35/recipe-sysroot-native/lib -Wl,-rpath,/home/avi/Projects/<wbr=
>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-=
staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/recipe-sysroot-native/u=
sr/<wbr>lib -Wl,-rpath,/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>=
beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOI=
NC+340c262b4b-<wbr>r35/recipe-sysroot-native/lib -Wl,-O1 -Wp,-MD,tools/.fit=
_image.o.d -Itools -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -incl=
ude /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-li=
nux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>=
r35/git/include/libfdt_env.h -idirafterinclude -idirafter/home/avi/Projects=
/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boo=
t-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/include -idira=
fter/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-li=
nux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>=
r35/git/arch/arm/include=C2=A0=C2=A0 -I/home/avi/Projects/<wbr>BoardLabSetu=
p/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>=
2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/lib/libfdt=C2=A0=C2=A0 -I/home/a=
vi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gn=
ueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/too=
ls -DCONFIG_SYS_TEXT_BASE=3D<wbr>0x80100000 -DUSE_HOSTCC -D__KERNEL_STRICT_=
NAMES -D_GNU_SOURCE -c -o tools/fit_image.o /home/avi/Projects/<wbr>BoardLa=
bSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/=
<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools/fit_image.c<br>In fil=
e included from /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleb=
oard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c=
262b4b-<wbr>r35/git/tools/fdt_host.h:11:0,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from =
/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-=
<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/=
git/tools/mkimage.h:22,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /home/avi/Projects/<w=
br>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-t=
i-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools/image-host.=
c:12:<br>/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-po=
ky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-=
<wbr>r35/git/tools/image-host.c: In function &#39;fit_image_write_sig&#39;:=
<br>/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-li=
nux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>=
r35/git/tools/image-host.c:<wbr>126:7: error: &#39;PLAIN_VERSION&#39; undec=
lared (first use in this function)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
PLAIN_VERSION);<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>/home/avi/Proj=
ects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u=
-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools/../i=
nclude/<wbr>libfdt.h:1449:44: note: in definition of macro &#39;fdt_setprop=
_string&#39;<br>=C2=A0 fdt_setprop((fdt), (nodeoffset), (name), (str), strl=
en(str)+1)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>/home/avi/Proje=
cts/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-=
boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools/image=
-host.c:<wbr>126:7: note: each undeclared identifier is reported only once =
for each function it appears in<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PLA=
IN_VERSION);<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>/home/avi/Project=
s/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-bo=
ot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools/../incl=
ude/<wbr>libfdt.h:1449:44: note: in definition of macro &#39;fdt_setprop_st=
ring&#39;<br>=C2=A0 fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(=
str)+1)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>scripts/Makefile.h=
ost:111: recipe for target &#39;tools/image-host.o&#39; failed<br>make[2]: =
*** [tools/image-host.o] Error 1<br>make[2]: *** Waiting for unfinished job=
s....<br>/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-po=
ky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-=
<wbr>r35/git/tools/mkenvimage.c: In function &#39;main&#39;:<br>/home/avi/P=
rojects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueab=
i/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools/m=
kenvimage.c:<wbr>120:35: error: &#39;PLAIN_VERSION&#39; undeclared (first u=
se in this function)<br>=C2=A0=C2=A0=C2=A0 printf(&quot;%s version %s\n&quo=
t;, prg, PLAIN_VERSION);<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=
=A0=C2=A0=C2=A0 ^<br>/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>be=
agleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC=
+340c262b4b-<wbr>r35/git/tools/mkenvimage.c:<wbr>120:35: note: each undecla=
red identifier is reported only once for each function it appears in<br>scr=
ipts/Makefile.host:111: recipe for target &#39;tools/mkenvimage.o&#39; fail=
ed<br>make[2]: *** [tools/mkenvimage.o] Error 1<br>/home/avi/Projects/<wbr>=
BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-s=
taging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools/fit_image.c: I=
n function &#39;fit_build_fdt&#39;:<br>/home/avi/Projects/<wbr>BoardLabSetu=
p/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>=
2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git/tools/fit_image.c:299:<wbr>57: e=
rror: &#39;PLAIN_VERSION&#39; undeclared (first use in this function)<br>=
=C2=A0 fdt_property_strf(fdt, &quot;creator&quot;, &quot;U-Boot mkimage %s&=
quot;, PLAIN_VERSION);<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>=
/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-=
<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/=
git/tools/fit_image.c:299:<wbr>57: note: each undeclared identifier is repo=
rted only once for each function it appears in<br>scripts/Makefile.host:111=
: recipe for target &#39;tools/fit_image.o&#39; failed<br>make[2]: *** [too=
ls/fit_image.o] Error 1<br>/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<=
wbr>beagleboard-poky-linux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitA=
UTOINC+340c262b4b-<wbr>r35/git/Makefile:1221: recipe for target &#39;tools&=
#39; failed<br>make[1]: *** [tools] Error 2<br>make[1]: Leaving directory &=
#39;/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-li=
nux-<wbr>gnueabi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>=
r35/build&#39;<br>Makefile:150: recipe for target &#39;sub-make&#39; failed=
<br>make: *** [sub-make] Error 2<br>make: Leaving directory &#39;/home/avi/=
Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnuea=
bi/u-boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/git&#39;<b=
r>ERROR: oe_runmake failed<br>WARNING: exit code 1 from a shell command.<br=
>ERROR: Function failed: do_compile (log file is located at /home/avi/Proje=
cts/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueabi/u-=
boot-ti-staging/<wbr>2016.05+gitAUTOINC+340c262b4b-<wbr>r35/temp/log.do_com=
pile.4675)<br><br>linux-ti-staging error:<br>-----------------------<br><br=
>DEBUG: Executing shell function do_compile<br>NOTE: make -j 4 HOSTCC=3Dgcc=
=C2=A0 -isystem/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beaglebo=
ard-poky-linux-<wbr>gnueabi/linux-ti-staging/4.4.<wbr>91+gitAUTOINC+9d9bc78=
b62-<wbr>r127a/recipe-sysroot-native/<wbr>usr/include -O2 -pipe -L/home/avi=
/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnue=
abi/linux-ti-staging/4.4.<wbr>91+gitAUTOINC+9d9bc78b62-<wbr>r127a/recipe-sy=
sroot-native/<wbr>usr/lib -L/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/=
<wbr>beagleboard-poky-linux-<wbr>gnueabi/linux-ti-staging/4.4.<wbr>91+gitAU=
TOINC+9d9bc78b62-<wbr>r127a/recipe-sysroot-native/<wbr>lib -Wl,-rpath-link,=
/home/avi/<wbr>Projects/BoardLabSetup/tmp/<wbr>work/beagleboard-poky-linux-=
<wbr>gnueabi/linux-ti-staging/4.4.<wbr>91+gitAUTOINC+9d9bc78b62-<wbr>r127a/=
recipe-sysroot-native/<wbr>usr/lib -Wl,-rpath-link,/home/avi/<wbr>Projects/=
BoardLabSetup/tmp/<wbr>work/beagleboard-poky-linux-<wbr>gnueabi/linux-ti-st=
aging/4.4.<wbr>91+gitAUTOINC+9d9bc78b62-<wbr>r127a/recipe-sysroot-native/<w=
br>lib -Wl,-rpath,/home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagl=
eboard-poky-linux-<wbr>gnueabi/linux-ti-staging/4.4.<wbr>91+gitAUTOINC+9d9b=
c78b62-<wbr>r127a/recipe-sysroot-native/<wbr>usr/lib -Wl,-rpath,/home/avi/P=
rojects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnueab=
i/linux-ti-staging/4.4.<wbr>91+gitAUTOINC+9d9bc78b62-<wbr>r127a/recipe-sysr=
oot-native/<wbr>lib -Wl,-O1 HOSTCPP=3Dgcc=C2=A0 -E zImage CC=3Darm-poky-lin=
ux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm -fuse-ld=3Dbfd -ffile-prefi=
x-map=3D/home/avi/<wbr>Projects/BoardLabSetup/tmp/<wbr>work/beagleboard-pok=
y-linux-<wbr>gnueabi/linux-ti-staging/4.4.<wbr>91+gitAUTOINC+9d9bc78b62-<wb=
r>r127a/git=3D/kernel-source/=C2=A0 LD=3Darm-poky-linux-gnueabi-ld.<wbr>bfd=
=C2=A0 <br>=C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 include/config/kernel.release=
<br>=C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 ./Makefile<br>=C2=A0 CHK=C2=A0=C2=A0=
=C2=A0=C2=A0 include/generated/uapi/linux/<wbr>version.h<br>=C2=A0 CHK=C2=
=A0=C2=A0=C2=A0=C2=A0 include/generated/utsrelease.h<br>&quot;4.4.91-gb9d9b=
c78b &gt; /home/avi/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-p=
oky-linux-<wbr>gnueabi/linux-ti-staging/4.4.<wbr>91+gitAUTOINC+9d9bc78b62-<=
wbr>r127a/build/.scmversion=C2=A0=C2=A0=C2=A0=C2=A0 echo -gb9d9bc78b&quot; =
exceeds 64 characters<br>/home/avi/Projects/<wbr>BoardLabSetup/tmp/work-sha=
red/<wbr>beagleboard/kernel-source/<wbr>Makefile:1038: recipe for target &#=
39;include/generated/utsrelease.<wbr>h&#39; failed<br>make[2]: *** [include=
/generated/utsrelease.<wbr>h] Error 1<br>ERROR: oe_runmake failed<br>Makefi=
le:150: recipe for target &#39;sub-make&#39; failed<br>make[1]: *** [sub-ma=
ke] Error 2<br>Makefile:24: recipe for target &#39;__sub-make&#39; failed<b=
r>make: *** [__sub-make] Error 2<br>WARNING: exit code 1 from a shell comma=
nd.<br>ERROR: Function failed: do_compile (log file is located at /home/avi=
/Projects/<wbr>BoardLabSetup/tmp/work/<wbr>beagleboard-poky-linux-<wbr>gnue=
abi/linux-ti-staging/4.4.<wbr>91+gitAUTOINC+9d9bc78b62-<wbr>r127a/temp/log.=
do_compile.<wbr>4529)<br></div>

--f40304389738f9b520055f194661--

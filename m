Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 962EAE00948; Thu, 28 Jan 2016 01:00:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_LOW,
	STOX_REPLY_TYPE autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.4 STOX_REPLY_TYPE STOX_REPLY_TYPE
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3688CE00838
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 01:00:31 -0800 (PST)
Received: by mail-pf0-f182.google.com with SMTP id n128so20258370pfn.3
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 01:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:references:in-reply-to:subject:date:mime-version
	:content-type:content-transfer-encoding:importance;
	bh=jqDPPZX2u3UiEuXmGX13iQkaJVbdi6QXOOW2o3QeirI=;
	b=O9TN/oX3ryP2P5CTw5GIvXL9xY1J3IPj6NNU4BX+rrx5OlsPCbsNgVrqZqqRhR26Cp
	YosJNxAdgevg+gtCID5NrYcqt5hQE4MJGo5Mlgw6tydquhkEq6yaw2a/yXqC8J80mEWI
	VmLi8aE1VK3GyMHKQveOdWti/7aUlspSZuPbEPC6dVZpeU4Oti+WoD3FR+tc/8aMORGt
	R6w6L/WXE8EmeEKMZVhKCRQ0dKN/NM9uHcC7yWWANbDleB+oMKo2zcjoyUkZJg7gRtDj
	Yf30bY+HQOaMSjrqWRyg5chCiCfjtLaik1uI6pkcO/KYEOcIUdEpk8SwrXr68AFVXmLq
	o2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:references:in-reply-to
	:subject:date:mime-version:content-type:content-transfer-encoding
	:importance;
	bh=jqDPPZX2u3UiEuXmGX13iQkaJVbdi6QXOOW2o3QeirI=;
	b=GOW1azUo6YoDbRr+Iqatm94b4VJiiITfyNR+eKfzub/4b0lW/4k3T9bGyivonwbDK+
	Ac1xSpbm4fs0fOIIG/q7qAWBpKk+svtuYmakr8IZT03oXuOMpIO/2ZysCIjGTAbjb2nv
	pL/3WjrYmEqSe5OeqbXZwFycR32K3H0fOlpsjB5yZ+sCP+6l7BbfZdl/3T2DjZ0yp2oE
	G1T6uLKdyWiIOtOBKKpYNR+N9ui8GItIUNoe4vRAHAGKKTLcQY5nLXLbo/fk+kdDTp88
	Dn9EihmiygTTPMEHaI3TcYKB1ICIhQHAHnZL8MHqyUPxseQGgQArgBfTooHlxRroyq7r
	hfsA==
X-Gm-Message-State: AG10YOSdefcyEocpdgdMuid4H8cpcDwFa6U2R2OrZMAT7DX0553qzwaPNngOqSIz7IEPwQ==
X-Received: by 10.98.72.24 with SMTP id v24mr813536pfa.15.1453971630960;
	Thu, 28 Jan 2016 01:00:30 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	b28sm14542018pfd.24.2016.01.28.01.00.27
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jan 2016 01:00:29 -0800 (PST)
Message-ID: <A6BAB694CCB64D07B1F044525E64943D@RD3>
From: <winiston@futuraautomation.com>
To: "Anders Darander" <anders@chargestorm.se>,
	<meta-ti@yoctoproject.org>
References: <7A144FD2E22B42C29D1455BA473BACE1@RD3><CAMKF1spT+uLPxQJvRFjjTxtXN4crg34a4cQw=Q8TJ9iYLLZHCg@mail.gmail.com><28AA3DBF5F3343948A98AC47A80A2AA7@RD3>
	<20160128073854.GC7112@ad.chargestorm.se>
In-Reply-To: <20160128073854.GC7112@ad.chargestorm.se>
Date: Thu, 28 Jan 2016 14:34:45 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Subject: Re: Build Error for AM437x-evm
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
X-List-Received-Date: Thu, 28 Jan 2016 09:00:37 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Dear,

please see the details build configuration and log data.

winiston@winiston-VirtualBox:~/poky/build$ bitbake core-image-minimal
Parsing recipes: 100% |#######################| ETA:  00:00:00
Parsing of 1060 .bb files complete (0 cached, 1060 parsed). 1496 targets, 
137 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.28.0"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "am437x-evm"
DISTRO            = "poky"
DISTRO_VERSION    = "2.0.1"
TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard cortexa9"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "jethro:b9ad87b18fd7a664b8d5e385ffb09496c679036c"
meta-ti           = "master:963c35fc490a733a533c0c30471f9974eed451d6"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (log file is located at 
/home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-ti-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.23933)
ERROR: Logfile of failure stored in: 
/home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-ti-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.23933
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 1 CROSS_COMPILE=arm-poky-linux-gnueabi- 
CC=arm-poky-linux-gnueabi-gcc  --sysroot=/home/winiston/poky/build/tmp/sysroots/am437x-evm 
V=1 
OSTCC=gcc  -isystem/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/include 
 -O2 -pipe -L/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -L/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-O1 am43xx_evm_config
| make -f ./scripts/Makefile.build obj=scripts/basic
| rm -f .tmp_quiet_recordmcount
| make -f ./scripts/Makefile.build obj=scripts/kconfig am43xx_evm_config
| scripts/kconfig/conf --defconfig=arch/../configs/am43xx_evm_defconfig 
Kconfig
| #
| # configuration written to .config
| #
| NOTE: make -j 1 CROSS_COMPILE=arm-poky-linux-gnueabi- 
CC=arm-poky-linux-gnueabi-gcc  --sysroot=/home/winiston/poky/build/tmp/sysroots/am437x-evm 
V=1 
OSTCC=gcc  -isystem/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/include 
 -O2 -pipe -L/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -L/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-O1 all
| make -f ./Makefile silentoldconfig
| make -f ./scripts/Makefile.build obj=scripts/basic
| rm -f .tmp_quiet_recordmcount
| make -f ./scripts/Makefile.build obj=scripts/kconfig silentoldconfig
| mkdir -p include/config include/generated
| scripts/kconfig/conf --silentoldconfig Kconfig
| make -f ./scripts/Makefile.autoconf || \
|         { rm -f include/config/auto.conf; false; }
| if [ -d arch/arm/mach-am33xx/include/mach ]; then    \
|         dest=../../mach-am33xx/include/mach;        \
|     else                            \
|         dest=arch-am33xx;            \
|     fi;                            \
|     ln -fsn $dest arch/arm/include/asm/arch
| if [ -d board/ti/common/include ]; then        \
|         dest=board/ti/common/include;            \
|     else                            \
|         dest=board/ti/common;                \
|     fi;                            \
|     ln -fsn ../$dest include/board-common
| set -e; : '  CHK     include/config.h'; mkdir -p include/; (echo "/* 
Automatically generated - do not edit */"; for i in $(echo 
"SERIAL1,CONS_INDEX=1,NAND" | sed 's/,/ /g'); do echo \#define CONFIG_$i | 
sed '/=/ {s/=/    /;q; } ; { s/$/    1/; }'; done; echo \#define 
CONFIG_BOARDDIR board/ti/am43xx; echo \#include \<config_defaults.h\>; echo 
\#include \<config_uncmd_spl.h\>; echo \#include \<configs/"am43xx_evm".h\>; 
echo \#include \<asm/config.h\>; echo \#include \<config_fallbacks.h\>;) < 
scripts/Makefile.autoconf > include/config.h.tmp; if [ -r include/config.h ] 
&& cmp -s include/config.h include/config.h.tmp; then rm -f 
include/config.h.tmp; else : '  UPD     include/config.h'; mv -f 
include/config.h.tmp include/config.h; fi
| 
 arm-poky-linux-gnueabi-gcc  --sysroot=/home/winiston/poky/build/tmp/sysroots/am437x-evm 
 -E -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding 
 -Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage -Wno-format-nonliteral 
 -Werror=date-time  -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x80800000 
   -D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux  -mword-relocations 
  -mno-unaligned-access  -ffunction-sections -fdata-sections -fno-common -ffixed-r9 
  -msoft-float  -pipe -Iinclude  -I./arch/arm/include -include 
./include/linux/kconfig.h  -nostdinc -isystem 
/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.2.0/include 
  -DDO_DEPS_ONLY -dM ./include/common.h > include/autoconf.mk.tmp && { 
sed -n -f ./tools/scripts/define2mk.sed include/autoconf.mk.tmp | while read 
line; do if [ -n "" ] || ! grep -q "${line%=*}=" include/config/auto.conf; 
then echo "$line"; fi done > include/autoconf.mk; rm 
include/autoconf.mk.tmp; } || { rm include/autoconf.mk.tmp; false; }
| 
 arm-poky-linux-gnueabi-gcc  --sysroot=/home/winiston/poky/build/tmp/sysroots/am437x-evm 
 -x 
c -DDO_DEPS_ONLY -M -MP -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin 
 -ffreestanding -Os -fno-stack-protector -fno-delete-null-pointer-checks -g  
-fstack-usage -Wno-format-nonliteral -Werror=date-time  -D__KERNEL__ -D__UBOOT__ 
 -DCONFIG_SYS_TEXT_BASE=0x80800000   -D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux 
  -mword-relocations  -mno-unaligned-access  -ffunction-sections -fdata-sections 
 -fno-common -ffixed-r9  -msoft-float  -pipe -Iinclude  -I./arch/arm/include 
 -include ./include/linux/kconfig.h  -nostdinc -isystem 
/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.2.0/include 
 -MQ include/config/auto.conf ./include/common.h > include/autoconf.mk.dep 
|| { rm include/autoconf.mk.dep; false; }
| mkdir -p spl/include/
| 
 arm-poky-linux-gnueabi-gcc  --sysroot=/home/winiston/poky/build/tmp/sysroots/am437x-evm 
 -E -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding 
 -Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage -Wno-format-nonliteral 
 -Werror=date-time  -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x80800000 
   -D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux  -mword-relocations 
  -mno-unaligned-access  -ffunction-sections -fdata-sections -fno-common -ffixed-r9 
  -msoft-float  -pipe -Iinclude  -I./arch/arm/include -include 
./include/linux/kconfig.h  -nostdinc -isystem 
/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.2.0/include 
 -DCONFIG_SPL_BUILD -DDO_DEPS_ONLY -dM ./include/common.h > 
spl/include/autoconf.mk.tmp && { sed -n -f ./tools/scripts/define2mk.sed 
spl/include/autoconf.mk.tmp | while read line; do if [ -n "" ] || ! grep -q 
"${line%=*}=" include/config/auto.conf; then echo "$line"; fi done > 
spl/include/autoconf.mk; rm spl/include/autoconf.mk.tmp; } || { rm 
spl/include/autoconf.mk.tmp; false; }
| touch include/config/auto.conf
| set -e; : '  CHK     include/config/uboot.release'; mkdir -p 
include/config/;     echo "2015.07$(/bin/bash ./scripts/setlocalversion .)" 
< include/config/auto.conf > include/config/uboot.release.tmp; if [ -r 
include/config/uboot.release ] && cmp -s include/config/uboot.release 
include/config/uboot.release.tmp; then rm -f 
include/config/uboot.release.tmp; else : '  UPD 
include/config/uboot.release'; mv -f include/config/uboot.release.tmp 
include/config/uboot.release; fi
| set -e; : '  CHK     include/generated/version_autogenerated.h'; mkdir -p 
include/generated/;     (echo \#define PLAIN_VERSION \"2015.07\"; echo 
\#define U_BOOT_VERSION \"U-Boot \" PLAIN_VERSION; echo \#define 
CC_VERSION_STRING 
"$(arm-poky-linux-gnueabi-gcc  --sysroot=/home/winiston/poky/build/tmp/sysroots/am437x-evm 
 --version | head -n 1)\"; echo \#define LD_VERSION_STRING 
\"$(arm-poky-linux-gnueabi-ld.bfd --version | head -n 1)\"; ) < 
include/config/uboot.release > 
include/generated/version_autogenerated.h.tmp; if [ -r 
include/generated/version_autogenerated.h ] && cmp -s 
include/generated/version_autogenerated.h 
include/generated/version_autogenerated.h.tmp; then rm -f 
include/generated/version_autogenerated.h.tmp; else : '  UPD 
include/generated/version_autogenerated.h'; mv -f 
include/generated/version_autogenerated.h.tmp 
include/generated/version_autogenerated.h; fi
| set -e; : '  CHK     include/generated/timestamp_autogenerated.h'; 
mkdir -p include/generated/;     (LC_ALL=C date +'#define U_BOOT_DATE "%b %d 
%C%y"'; LC_ALL=C date +'#define U_BOOT_TIME "%T"'; LC_ALL=C date +'#define 
U_BOOT_TZ "%z"') < Makefile > 
include/generated/timestamp_autogenerated.h.tmp; if [ -r 
include/generated/timestamp_autogenerated.h ] && cmp -s 
include/generated/timestamp_autogenerated.h 
include/generated/timestamp_autogenerated.h.tmp; then rm -f 
include/generated/timestamp_autogenerated.h.tmp; else : '  UPD 
include/generated/timestamp_autogenerated.h'; mv -f 
include/generated/timestamp_autogenerated.h.tmp 
include/generated/timestamp_autogenerated.h; fi
| make -f ./scripts/Makefile.build obj=scripts/basic
| rm -f .tmp_quiet_recordmcount
| make -f ./scripts/Makefile.build obj=.
| mkdir -p lib/
| set -e; : '  CHK     include/generated/generic-asm-offsets.h'; mkdir -p 
include/generated/;     (set -e; echo "#ifndef __GENERIC_ASM_OFFSETS_H__"; 
echo "#define __GENERIC_ASM_OFFSETS_H__"; echo "/*"; echo " * DO NOT 
MODIFY."; echo " *"; echo " * This file was generated by Kbuild"; echo " 
*/"; echo ""; sed -ne     "s:[[:space:]]*\.ascii[[:space:]]*\"\(.*\)\":\1:; 
/^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([-0-9]*\) \(.*\):#define 
\1 \2 /* \3 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 
*/:; s:->::; p;}"; echo ""; echo "#endif" ) < lib/asm-offsets.s > 
include/generated/generic-asm-offsets.h.tmp; if [ -r 
include/generated/generic-asm-offsets.h ] && cmp -s 
include/generated/generic-asm-offsets.h 
include/generated/generic-asm-offsets.h.tmp; then rm -f 
include/generated/generic-asm-offsets.h.tmp; else : '  UPD 
include/generated/generic-asm-offsets.h'; mv -f 
include/generated/generic-asm-offsets.h.tmp 
include/generated/generic-asm-offsets.h; fi
| mkdir -p arch/arm/lib/
| set -e; : '  CHK     include/generated/asm-offsets.h'; mkdir -p 
include/generated/;     (set -e; echo "#ifndef __ASM_OFFSETS_H__"; echo 
"#define __ASM_OFFSETS_H__"; echo "/*"; echo " * DO NOT MODIFY."; echo " *"; 
echo " * This file was generated by Kbuild"; echo " */"; echo ""; sed -ne 
"s:[[:space:]]*\.ascii[[:space:]]*\"\(.*\)\":\1:; /^->/{s:->#\(.*\):/* \1 
*/:; s:^->\([^ ]*\) [\$#]*\([-0-9]*\) \(.*\):#define \1 \2 /* \3 */:; 
s:^->\([^ ]*\) [\$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; s:->::; p;}"; 
echo ""; echo "#endif" ) < arch/arm/lib/asm-offsets.s > 
include/generated/asm-offsets.h.tmp; if [ -r 
include/generated/asm-offsets.h ] && cmp -s include/generated/asm-offsets.h 
include/generated/asm-offsets.h.tmp; then rm -f 
include/generated/asm-offsets.h.tmp; else : '  UPD 
include/generated/asm-offsets.h'; mv -f include/generated/asm-offsets.h.tmp 
include/generated/asm-offsets.h; fi
| make -f ./scripts/Makefile.build obj=tools
| 
 gcc  -isystem/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/include  
-O2 -pipe -L/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -L/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-O1 -Wp,-MD,tools/.mkenvimage.o.d -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer 
   -include 
./include/libfdt_env.h -idirafterinclude -idirafter./arch/arm/include -I./lib/libfdt 
 -I./tools -DCONFIG_SYS_TEXT_BASE=0x80800000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES 
 -D_GNU_SOURCE  -c -o tools/mkenvimage.o tools/mkenvimage.c
| 
 gcc  -isystem/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/include  
-O2 -pipe -L/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -L/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-O1  -o tools/mkenvimage tools/mkenvimage.o tools/os_support.o 
tools/lib/crc32.o
| 
 gcc  -isystem/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/include  
-O2 -pipe -L/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -L/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-O1 -Wp,-MD,tools/.image-host.o.d -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer 
   -include 
./include/libfdt_env.h -idirafterinclude -idirafter./arch/arm/include -I./lib/libfdt 
 -I./tools -DCONFIG_SYS_TEXT_BASE=0x80800000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES 
 -D_GNU_SOURCE  -c -o tools/image-host.o tools/image-host.c
| 
 gcc  -isystem/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/include  
-O2 -pipe -L/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -L/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-O1 -Wp,-MD,tools/.dumpimage.o.d -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer 
   -include 
./include/libfdt_env.h -idirafterinclude -idirafter./arch/arm/include -I./lib/libfdt 
 -I./tools -DCONFIG_SYS_TEXT_BASE=0x80800000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES 
 -D_GNU_SOURCE  -c -o tools/dumpimage.o tools/dumpimage.c
| 
 gcc  -isystem/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/include  
-O2 -pipe -L/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -L/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-O1  -o tools/dumpimage tools/aisimage.o tools/atmelimage.o 
tools/common/bootm.o tools/lib/crc32.o tools/default_image.o 
tools/lib/fdtdec_common.o tools/lib/fdtdec.o tools/fit_common.o 
tools/fit_image.o tools/gpimage.o tools/gpimage-common.o 
tools/common/image-fit.o tools/image-host.o tools/common/image.o 
tools/imagetool.o tools/imximage.o tools/kwbimage.o tools/lib/md5.o 
tools/lpc32xximage.o tools/mxsimage.o tools/omapimage.o tools/os_support.o 
tools/pblimage.o tools/pbl_crc32.o tools/socfpgaimage.o tools/lib/sha1.o 
tools/lib/sha256.o tools/common/hash.o tools/ublimage.o 
tools/lib/libfdt/fdt.o tools/lib/libfdt/fdt_ro.o tools/lib/libfdt/fdt_rw.o 
tools/lib/libfdt/fdt_strerror.o tools/lib/libfdt/fdt_wip.o tools/dumpimage.o
| 
 gcc  -isystem/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/include  
-O2 -pipe -L/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -L/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-O1 -Wp,-MD,tools/.mkimage.o.d -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer 
   -include 
./include/libfdt_env.h -idirafterinclude -idirafter./arch/arm/include -I./lib/libfdt 
 -I./tools -DCONFIG_SYS_TEXT_BASE=0x80800000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES 
 -D_GNU_SOURCE  -c -o tools/mkimage.o tools/mkimage.c
| 
 gcc  -isystem/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/include  
-O2 -pipe -L/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -L/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath-link,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib -Wl,-rpath,/home/winiston/poky/build/tmp/sysroots/i686-linux/lib 
 -Wl,-O1  -o tools/mkimage tools/aisimage.o tools/atmelimage.o 
tools/common/bootm.o tools/lib/crc32.o tools/default_image.o 
tools/lib/fdtdec_common.o tools/lib/fdtdec.o tools/fit_common.o 
tools/fit_image.o tools/gpimage.o tools/gpimage-common.o 
tools/common/image-fit.o tools/image-host.o tools/common/image.o 
tools/imagetool.o tools/imximage.o tools/kwbimage.o tools/lib/md5.o 
tools/lpc32xximage.o tools/mxsimage.o tools/omapimage.o tools/os_support.o 
tools/pblimage.o tools/pbl_crc32.o tools/socfpgaimage.o tools/lib/sha1.o 
tools/lib/sha256.o tools/common/hash.o tools/ublimage.o 
tools/lib/libfdt/fdt.o tools/lib/libfdt/fdt_ro.o tools/lib/libfdt/fdt_rw.o 
tools/lib/libfdt/fdt_strerror.o tools/lib/libfdt/fdt_wip.o tools/mkimage.o
| make -f ./scripts/Makefile.build obj=arch/arm/cpu
| make -f ./scripts/Makefile.build obj=arch/arm/cpu/armv7
| make -f ./scripts/Makefile.build obj=arch/arm/cpu/armv7/am33xx
| make -f ./scripts/Makefile.build obj=arch/arm/cpu/armv7/omap-common
| make -f ./scripts/Makefile.build obj=arch/arm/lib
| make -f ./scripts/Makefile.build obj=board/ti/am43xx
| make -f ./scripts/Makefile.build obj=board/ti/common
| make -f ./scripts/Makefile.build obj=common
| 
 arm-poky-linux-gnueabi-gcc  --sysroot=/home/winiston/poky/build/tmp/sysroots/am437x-evm 
 -Wp,-MD,common/.main.o.d  -nostdinc -isystem 
/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.2.0/include 
 -Iinclude  -I./arch/arm/include -include 
./include/linux/kconfig.h -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x80800000 
 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding  
-Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage -Wno-format-nonliteral 
 -Werror=date-time -D__ARM__ -Wa,-mimplicit-it=always -mthumb -mthumb-interwork 
 -mabi=aapcs-linux -mword-relocations -mno-unaligned-access -ffunction-sections 
 -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a    
 -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(main)"  -D"KBUILD_MODNAME=KBUILD_STR(main)" 
 -c -o common/main.o common/main.c
| 
 arm-poky-linux-gnueabi-gcc  --sysroot=/home/winiston/poky/build/tmp/sysroots/am437x-evm 
 -Wp,-MD,common/.board_f.o.d  -nostdinc -isystem 
/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.2.0/include 
 -Iinclude  -I./arch/arm/include -include 
./include/linux/kconfig.h -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x80800000 
 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding  
-Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage -Wno-format-nonliteral 
 -Werror=date-time -D__ARM__ -Wa,-mimplicit-it=always -mthumb -mthumb-interwork 
 -mabi=aapcs-linux -mword-relocations -mno-unaligned-access -ffunction-sections 
 -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a    
 -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(board_f)"  -D"KBUILD_MODNAME=KBUILD_STR(board_f)" 
 -c -o common/board_f.o common/board_f.c
| 
 arm-poky-linux-gnueabi-gcc  --sysroot=/home/winiston/poky/build/tmp/sysroots/am437x-evm 
 -Wp,-MD,common/.cmd_version.o.d  -nostdinc -isystem 
/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.2.0/include 
 -Iinclude  -I./arch/arm/include -include 
./include/linux/kconfig.h -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x80800000 
 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding  
-Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage -Wno-format-nonliteral 
 -Werror=date-time -D__ARM__ -Wa,-mimplicit-it=always -mthumb -mthumb-interwork 
 -mabi=aapcs-linux -mword-relocations -mno-unaligned-access -ffunction-sections 
 -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a    
 -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(cmd_version)"  -D"KBUILD_MODNAME=KBUILD_STR(cmd_version)" 
 -c -o common/cmd_version.o common/cmd_version.c
|    arm-poky-linux-gnueabi-ld.bfd     -r -o common/built-in.o common/main.o 
common/exports.o common/hash.o common/cli_hush.o common/autoboot.o 
common/board_f.o common/board_r.o common/cmd_boot.o common/cmd_bootm.o 
common/bootm.o common/bootm_os.o common/cmd_help.o common/cmd_version.o 
common/env_attr.o common/env_callback.o common/env_flags.o common/env_fat.o 
common/cmd_source.o common/cmd_bdinfo.o common/cmd_console.o 
common/cmd_echo.o common/cmd_eeprom.o common/cmd_exit.o common/cmd_ext4.o 
common/cmd_ext2.o common/cmd_fat.o common/cmd_fdt.o common/fdt_support.o 
common/cmd_fs.o common/cmd_gpio.o common/cmd_i2c.o common/cmd_itest.o 
common/cmd_load.o common/cmd_mem.o common/miiphyutil.o common/cmd_mii.o 
common/cmd_mdio.o common/cmd_misc.o common/cmd_mmc.o common/cmd_mtdparts.o 
common/cmd_nand.o common/cmd_net.o common/cmd_part.o common/cmd_pcmcia.o 
common/cmd_sf.o common/cmd_setexpr.o common/cmd_spi.o common/cmd_test.o 
common/cmd_usb.o common/usb.o common/usb_hub.o common/usb_storage.o 
common/cmd_ximg.o common/cmd_spl.o common/flash.o common/splash.o 
common/cmd_dfu.o common/cmd_gpt.o common/cmd_nvedit.o common/env_common.o 
common/console.o common/dlmalloc.o common/image.o common/image-fdt.o 
common/memsize.o common/stdio.o common/cli_simple.o common/cli.o 
common/cli_readline.o common/command.o common/s_record.o common/xyzModem.o 
common/cmd_disk.o
| make -f ./scripts/Makefile.build obj=disk
| make -f ./scripts/Makefile.build obj=drivers
| make -f ./scripts/Makefile.build obj=drivers/block
| make -f ./scripts/Makefile.build obj=drivers/crypto
| make -f ./scripts/Makefile.build obj=drivers/crypto/fsl
| make -f ./scripts/Makefile.build obj=drivers/crypto/rsa_mod_exp
| make -f ./scripts/Makefile.build obj=drivers/dfu
| make -f ./scripts/Makefile.build obj=drivers/hwmon
| make -f ./scripts/Makefile.build obj=drivers/input
| make -f ./scripts/Makefile.build obj=drivers/memory
| make -f ./scripts/Makefile.build obj=drivers/misc
| make -f ./scripts/Makefile.build obj=drivers/pcmcia
| make -f ./scripts/Makefile.build obj=drivers/pwm
| make -f ./scripts/Makefile.build obj=drivers/rtc
| make -f ./scripts/Makefile.build obj=drivers/soc
| make -f ./scripts/Makefile.build obj=drivers/sound
| make -f ./scripts/Makefile.build obj=drivers/thermal
| make -f ./scripts/Makefile.build obj=drivers/tpm
| make -f ./scripts/Makefile.build obj=drivers/twserial
| make -f ./scripts/Makefile.build obj=drivers/video
| make -f ./scripts/Makefile.build obj=drivers/watchdog
| make -f ./scripts/Makefile.build obj=drivers/dma
| make -f ./scripts/Makefile.build obj=drivers/gpio
| make -f ./scripts/Makefile.build obj=drivers/i2c
| make -f ./scripts/Makefile.build obj=drivers/mmc
| make -f ./scripts/Makefile.build obj=drivers/mtd
| make -f ./scripts/Makefile.build obj=drivers/mtd/nand
| make -f ./scripts/Makefile.build obj=drivers/mtd/onenand
| make -f ./scripts/Makefile.build obj=drivers/mtd/spi
| make -f ./scripts/Makefile.build obj=drivers/net
| make -f ./scripts/Makefile.build obj=drivers/net/phy
| make -f ./scripts/Makefile.build obj=drivers/pci
| make -f ./scripts/Makefile.build obj=drivers/power
| make -f ./scripts/Makefile.build obj=drivers/power/battery
| make -f ./scripts/Makefile.build obj=drivers/power/fuel_gauge
| make -f ./scripts/Makefile.build obj=drivers/power/mfd
| make -f ./scripts/Makefile.build obj=drivers/power/pmic
| make -f ./scripts/Makefile.build obj=drivers/power/regulator
| make -f ./scripts/Makefile.build obj=drivers/serial
| make -f ./scripts/Makefile.build obj=drivers/spi
| make -f ./scripts/Makefile.build obj=drivers/usb/dwc3
| make -f ./scripts/Makefile.build obj=drivers/usb/emul
| make -f ./scripts/Makefile.build obj=drivers/usb/eth
| make -f ./scripts/Makefile.build obj=drivers/usb/gadget
| make -f ./scripts/Makefile.build obj=drivers/usb/gadget/udc
| make -f ./scripts/Makefile.build obj=drivers/usb/host
| 
 arm-poky-linux-gnueabi-gcc  --sysroot=/home/winiston/poky/build/tmp/sysroots/am437x-evm 
 -Wp,-MD,drivers/usb/host/.xhci-omap.o.d  -nostdinc -isystem 
/home/winiston/poky/build/tmp/sysroots/i686-linux/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.2.0/include 
 -Iinclude  -I./arch/arm/include -include 
./include/linux/kconfig.h -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x80800000 
 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding  
-Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage -Wno-format-nonliteral 
 -Werror=date-time -D__ARM__ -Wa,-mimplicit-it=always -mthumb -mthumb-interwork 
 -mabi=aapcs-linux -mword-relocations -mno-unaligned-access -ffunction-sections 
 -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a    
 -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(xhci_omap)"  -D"KBUILD_MODNAME=KBUILD_STR(xhci_omap)" 
 -c -o drivers/usb/host/xhci-omap.o drivers/usb/host/xhci-omap.c
| drivers/usb/host/xhci-omap.c:34:5: error: 'board_usb_init' aliased to 
external symbol '__board_usb_init'
|  int board_usb_init(int index, enum usb_init_type init)
|      ^
| make[1]: *** [drivers/usb/host/xhci-omap.o] Error 1
| make: *** [drivers/usb/host] Error 2
| WARNING: exit code 1 from a shell command.
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at 
/home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-ti-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.23933)
ERROR: Task 73 
(/home/winiston/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb, 
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1910 tasks of which 1909 didn't need to be 
rerun and 1 failed.
No currently running tasks (1909 of 2055)

Summary: 1 task failed:
  /home/winiston/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb, 
do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
winiston@winiston-VirtualBox:~/poky/build$



Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291
-----Original Message----- 
From: Anders Darander
Sent: Thursday, January 28, 2016 1:08 PM
To: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] Build Error for AM437x-evm

* winiston@futuraautomation.com <winiston@futuraautomation.com> [160128 
07:17]:
> BB_VERSION        = "1.28.0"
> BUILD_SYS         = "i686-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "am437x-evm"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.0.1"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard 
> cortexa9"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto        = "jethro:b9ad87b18fd7a664b8d5e385ffb09496c679036c"
> meta-ti           = "master:963c35fc490a733a533c0c30471f9974eed451d6"

Good that this info is provided.


> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile (log file is located at 
> /home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-ti-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.18321)
> ERROR: Logfile of failure stored in: 
> /home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-ti-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.18321
> Log data follows:
> Huge log data resides here.... at the end of log data, it is showing the 
> error as follows,
>
> | make[1]: *** [drivers/usb/host/xhci-omap.o] Error 1

You just cut the log prior after the actual error. The line above just
confirms that make has seen that something went wrong.

Could you provide the error?

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB
-- 
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti 



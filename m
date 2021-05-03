Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.34847.1620053895967558961
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 May 2021 07:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DC98940C56;
	Mon,  3 May 2021 14:58:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjm1jpjfumzT; Mon,  3 May 2021 14:58:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BD66F40A47;
	Mon,  3 May 2021 14:58:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F24CC1745D3; Mon,  3 May 2021 10:58:12 -0400 (EDT)
Date: Mon, 3 May 2021 10:58:12 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Alessio Igor Bogani <alessioigorbogani@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Fail to build a kernel module
Message-ID: <20210503145812.GA21867@denix.org>
References: <CAPk1OjHUGA2hje_esMUtM0qWj_NcHeXev-B4oWGYKtD=RWGA2Q@mail.gmail.com>
 <20210430171636.GZ15937@denix.org>
 <CAPk1OjFyvDpVivr5S7HrWcQZPfBTP6pi+VzrxySyaMEELPmzZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPk1OjFyvDpVivr5S7HrWcQZPfBTP6pi+VzrxySyaMEELPmzZg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

-msoft-float

Do you have the same output for beaglebone-yocto build?


On Mon, May 03, 2021 at 08:40:11AM +0200, Alessio Igor Bogani wrote:
> Hi Denys,
> 
> On Fri, 30 Apr 2021 at 19:16, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > # uname -mpi
> 
> root@MiWiFi-R3600-srv:~/a2720-mod# uname -mpi
> armv7l armv7l armv7l
> 
> > # make V=1
> 
> root@MiWiFi-R3600-srv:~/a2720-mod# make V=1
> make -C /lib/modules/5.4.106-g023faefa70/build M=/home/root/a2720-mod
> make[1]: Entering directory '/lib/modules/5.4.106-g023faefa70/build'
> test -e include/generated/autoconf.h -a -e include/config/auto.conf || ( \
> echo >&2; \
> echo >&2 "  ERROR: Kernel configuration is invalid."; \
> echo >&2 "         include/generated/autoconf.h or
> include/config/auto.conf are missing.";\
> echo >&2 "         Run 'make oldconfig && make prepare' on kernel src
> to fix it."; \
> echo >&2 ; \
> /bin/false)
> make -f ./scripts/Makefile.build obj=/home/root/a2720-mod \
> single-build= \
> need-builtin=1 need-modorder=1
> make[2]: Warning: File 'include/config/auto.conf' has modification
> time 156 s in the future
>   rm -f /home/root/a2720-mod/built-in.a; ar cDPrST
> /home/root/a2720-mod/built-in.a
>   gcc -Wp,-MD,/home/root/a2720-mod/.a2720.o.d -nostdinc -isystem
> /usr/lib/gcc/arm-poky-linux-gnueabi/9.3.0/include -I./arch/arm/include
> -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi
> -I./arch/arm/include/generated/uapi -I./include/uapi
> -I./include/generated/uapi -include ./include/linux/kconfig.h -include
> ./include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -Wall
> -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing
> -fno-common -fshort-wchar -fno-PIE
> -Werror=implicit-function-declaration -Werror=implicit-int
> -Werror=return-type -Wno-format-security -std=gnu89
> -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mfpu=vfp
> -funwind-tables -marm -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7
> -march=armv5t -Wa,-march=armv7-a -msoft-float -Uarm
> -fno-delete-null-pointer-checks -Wno-frame-address
> -Wno-format-truncation -Wno-format-overflow
> -Wno-address-of-packed-member -O2 --param=allow-store-data-races=0
> -Wframe-larger-than=1024 -fstack-protector-strong
> -Wno-unused-but-set-variable -Wimplicit-fallthrough
> -Wno-unused-const-variable -fomit-frame-pointer
> -fno-var-tracking-assignments -Wdeclaration-after-statement -Wvla
> -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds
> -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized
> -fno-strict-overflow -fno-merge-all-constants -fmerge-constants
> -fno-stack-check -fconserve-stack -Werror=date-time
> -Werror=incompatible-pointer-types -Werror=designated-init
> -fmacro-prefix-map=./= -Wno-packed-not-aligned  -DMODULE
> -DKBUILD_BASENAME='"a2720"' -DKBUILD_MODNAME='"a2720"' -c -o
> /home/root/a2720-mod/a2720.o /home/root/a2720-mod/a2720.c
> /tmp/ccTUKWZH.s: Assembler messages:
> /tmp/ccTUKWZH.s:93: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:101: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:118: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:126: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:211: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/ccTUKWZH.s:225: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/ccTUKWZH.s:238: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:253: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:268: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:283: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:298: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:313: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:328: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:343: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:358: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:373: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:389: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:405: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:421: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:437: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:453: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:469: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:484: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:544: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:555: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:567: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:579: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:591: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:603: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:615: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:627: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:639: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:650: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:661: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:672: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:683: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:694: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:706: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:718: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:730: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:742: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:754: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:785: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/ccTUKWZH.s:799: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/ccTUKWZH.s:823: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:843: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:869: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:888: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:928: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/ccTUKWZH.s:943: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/ccTUKWZH.s:961: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:983: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:994: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/ccTUKWZH.s:1005: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1016: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1027: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1038: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1049: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1060: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1071: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1082: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1094: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1106: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1118: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1130: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1142: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1154: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1165: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1214: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:1254: Error: selected processor does not support `isb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1269: Error: selected processor does not support `isb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1287: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:1326: Error: selected processor does not support `isb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1566: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/ccTUKWZH.s:1574: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:1593: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:1609: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/ccTUKWZH.s:1774: Error: selected processor does not support `dsb
> st' in ARM mode
> make[2]: *** [scripts/Makefile.build:262: /home/root/a2720-mod/a2720.o] Error 1
> make[1]: *** [Makefile:1734: /home/root/a2720-mod] Error 2
> make[1]: Leaving directory '/lib/modules/5.4.106-g023faefa70/build'
> make: *** [Makefile:7: all] Error 2
> root@MiWiFi-R3600-srv:~/a2720-mod#
> 
> Thanks!
> 
> Ciao,
> Alessio


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

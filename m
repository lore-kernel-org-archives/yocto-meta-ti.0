Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.30277.1620024030425236477
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 02 May 2021 23:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iLhQBrKr;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: alessioigorbogani@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 130so6196380ybd.10
        for <meta-ti@lists.yoctoproject.org>; Sun, 02 May 2021 23:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t5YIB24HCGkbbECBbJDpiHhnIM5gZNM34MRHR84ndEg=;
        b=iLhQBrKrJkYNa6V35nohgtL8MlzMR0c0eE6sgEgGoqCaxwspTgupcuWVnTTBaKULiB
         T2nWSBON9BXCvd/nxBYSupshIckjKiyS8ZoiZ8emqB7Fy/wREcmWiKBIqp4rcZCthooq
         DidV4vjzCj8GsaVuK0T2B6LWjNuVJlUCMOP+9hetoWGNOOWDCxiuEhWdos2cYocjgb6N
         4YbaXswMyY2mIyEGZh0vY28aDHItCGWaqPNBVjrvH9GITVt2BwPzta3pKNzNyLxISx0J
         TZjF2TRZt/tksiNCWGLeKeTZDEo+xe1FkwLO8iKL6PbreSfq5NxRxdBlc+NRSv6/bGco
         7ljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t5YIB24HCGkbbECBbJDpiHhnIM5gZNM34MRHR84ndEg=;
        b=cFiJoPHoYiQIWjiKCmdiMxkhnIQnv2VEUvCZdIjzF/QhZFwbIoIfmMli1a/aeu2W+W
         ld2iBvLKGy7r5Oj3iziLUep8uzP0SY3cFfB3z2OVJQ1cV/pOsQ1XUgLjjMMDNskCoXrA
         duysclt8fWAJX26oJjJCJ/XHWJwfYBO4OTa55oUIDxKIvE9hJA+gsDAxq+5mZTDoundd
         9jTt28RtO8uiByWOc0ElvDyG9j3abxGcynkepFKKxCTJLJGXWr5iO9FLp1Ezq7X/pWoU
         W0TpfjHujAsMmJUIqvrIXvbGCBCkL/qpMpGohZK7e0dqhoHXkTQz4RLrqMiwEC6P1VQq
         LXcQ==
X-Gm-Message-State: AOAM530w1wpFAfHnAn2H6s5ufmm/qWwPBs5AATn1ZqXOjzKyftv+CP2z
	0VF/+Pk6W5YRbP5ef1QgKedGtEfJcTF0GCylBjY=
X-Google-Smtp-Source: ABdhPJxkzyZ/XlhhKAcQdqH6lAEwVndoWW25Sk4sDicd7QR4lWq5adKfOPzSo2fAn+/n3SonaBHsSORu3d/eB0V0HIY=
X-Received: by 2002:a25:5d08:: with SMTP id r8mr23250818ybb.464.1620024029250;
 Sun, 02 May 2021 23:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAPk1OjHUGA2hje_esMUtM0qWj_NcHeXev-B4oWGYKtD=RWGA2Q@mail.gmail.com>
 <20210430171636.GZ15937@denix.org>
In-Reply-To: <20210430171636.GZ15937@denix.org>
From: "Alessio Igor Bogani" <alessioigorbogani@gmail.com>
Date: Mon, 3 May 2021 08:40:11 +0200
Message-ID: <CAPk1OjFyvDpVivr5S7HrWcQZPfBTP6pi+VzrxySyaMEELPmzZg@mail.gmail.com>
Subject: Re: [meta-ti] Fail to build a kernel module
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

On Fri, 30 Apr 2021 at 19:16, Denys Dmytriyenko <denis@denix.org> wrote:
>
> # uname -mpi

root@MiWiFi-R3600-srv:~/a2720-mod# uname -mpi
armv7l armv7l armv7l

> # make V=1

root@MiWiFi-R3600-srv:~/a2720-mod# make V=1
make -C /lib/modules/5.4.106-g023faefa70/build M=/home/root/a2720-mod
make[1]: Entering directory '/lib/modules/5.4.106-g023faefa70/build'
test -e include/generated/autoconf.h -a -e include/config/auto.conf || ( \
echo >&2; \
echo >&2 "  ERROR: Kernel configuration is invalid."; \
echo >&2 "         include/generated/autoconf.h or
include/config/auto.conf are missing.";\
echo >&2 "         Run 'make oldconfig && make prepare' on kernel src
to fix it."; \
echo >&2 ; \
/bin/false)
make -f ./scripts/Makefile.build obj=/home/root/a2720-mod \
single-build= \
need-builtin=1 need-modorder=1
make[2]: Warning: File 'include/config/auto.conf' has modification
time 156 s in the future
  rm -f /home/root/a2720-mod/built-in.a; ar cDPrST
/home/root/a2720-mod/built-in.a
  gcc -Wp,-MD,/home/root/a2720-mod/.a2720.o.d -nostdinc -isystem
/usr/lib/gcc/arm-poky-linux-gnueabi/9.3.0/include -I./arch/arm/include
-I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi
-I./arch/arm/include/generated/uapi -I./include/uapi
-I./include/generated/uapi -include ./include/linux/kconfig.h -include
./include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -Wall
-Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing
-fno-common -fshort-wchar -fno-PIE
-Werror=implicit-function-declaration -Werror=implicit-int
-Werror=return-type -Wno-format-security -std=gnu89
-fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mfpu=vfp
-funwind-tables -marm -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7
-march=armv5t -Wa,-march=armv7-a -msoft-float -Uarm
-fno-delete-null-pointer-checks -Wno-frame-address
-Wno-format-truncation -Wno-format-overflow
-Wno-address-of-packed-member -O2 --param=allow-store-data-races=0
-Wframe-larger-than=1024 -fstack-protector-strong
-Wno-unused-but-set-variable -Wimplicit-fallthrough
-Wno-unused-const-variable -fomit-frame-pointer
-fno-var-tracking-assignments -Wdeclaration-after-statement -Wvla
-Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds
-Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized
-fno-strict-overflow -fno-merge-all-constants -fmerge-constants
-fno-stack-check -fconserve-stack -Werror=date-time
-Werror=incompatible-pointer-types -Werror=designated-init
-fmacro-prefix-map=./= -Wno-packed-not-aligned  -DMODULE
-DKBUILD_BASENAME='"a2720"' -DKBUILD_MODNAME='"a2720"' -c -o
/home/root/a2720-mod/a2720.o /home/root/a2720-mod/a2720.c
/tmp/ccTUKWZH.s: Assembler messages:
/tmp/ccTUKWZH.s:93: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:101: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:118: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:126: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:211: Error: selected processor does not support `isb '
in ARM mode
/tmp/ccTUKWZH.s:225: Error: selected processor does not support `isb '
in ARM mode
/tmp/ccTUKWZH.s:238: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:253: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:268: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:283: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:298: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:313: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:328: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:343: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:358: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:373: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:389: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:405: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:421: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:437: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:453: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:469: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:484: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:544: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:555: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:567: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:579: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:591: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:603: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:615: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:627: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:639: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:650: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:661: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:672: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:683: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:694: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:706: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:718: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:730: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:742: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:754: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:785: Error: selected processor does not support `isb '
in ARM mode
/tmp/ccTUKWZH.s:799: Error: selected processor does not support `isb '
in ARM mode
/tmp/ccTUKWZH.s:823: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:843: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:869: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:888: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:928: Error: selected processor does not support `isb '
in ARM mode
/tmp/ccTUKWZH.s:943: Error: selected processor does not support `isb '
in ARM mode
/tmp/ccTUKWZH.s:961: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:983: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:994: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccTUKWZH.s:1005: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1016: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1027: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1038: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1049: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1060: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1071: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1082: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1094: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1106: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1118: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1130: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1142: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1154: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1165: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1214: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:1254: Error: selected processor does not support `isb
' in ARM mode
/tmp/ccTUKWZH.s:1269: Error: selected processor does not support `isb
' in ARM mode
/tmp/ccTUKWZH.s:1287: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:1326: Error: selected processor does not support `isb
' in ARM mode
/tmp/ccTUKWZH.s:1566: Error: selected processor does not support `dsb
' in ARM mode
/tmp/ccTUKWZH.s:1574: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:1593: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:1609: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccTUKWZH.s:1774: Error: selected processor does not support `dsb
st' in ARM mode
make[2]: *** [scripts/Makefile.build:262: /home/root/a2720-mod/a2720.o] Error 1
make[1]: *** [Makefile:1734: /home/root/a2720-mod] Error 2
make[1]: Leaving directory '/lib/modules/5.4.106-g023faefa70/build'
make: *** [Makefile:7: all] Error 2
root@MiWiFi-R3600-srv:~/a2720-mod#

Thanks!

Ciao,
Alessio

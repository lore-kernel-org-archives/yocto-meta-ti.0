Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web09.35785.1620057267386845922
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 May 2021 08:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZqK8p3pS;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: alessioigorbogani@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id x131so8110618ybg.11
        for <meta-ti@lists.yoctoproject.org>; Mon, 03 May 2021 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JJbCot8g99QQFv6iMy1URZClcdTdTz7GVFTHnG9qjY4=;
        b=ZqK8p3pSJB+5ZRH9SEbke0VqGJ7OSuKfiChoUH/Te42b9OkEzOFDs/zQN9J7PWVFPN
         pEWrGAM+MUaLv9oVYkL/VxQK0+UJUsxIf7QgGMlPdIppiqK0Q28MGWyvueFCVxVjNwlj
         6TSFMqBDsXNF1sFeN6n5lSSdlMeF/Ar9Nl5uUQeP6fGbVfhVM5lizJz5NO9moHuOTjQf
         Uu/2OabABtmVydkfYoCaI3Nkl+Z9fHtnEo4nEKlYXYKxfIvF+ZcUvTNcEhCiqHNFnVTy
         TA65pHgIrLE7oojRVkCRAU2kyzgnfs3tR+AMJL1cjO3pnxku9I8I7uD8I5CUMDWq2Gyv
         2G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JJbCot8g99QQFv6iMy1URZClcdTdTz7GVFTHnG9qjY4=;
        b=LtzSC6GHBBq9FRl0N6fHoS5XScLFRzwMKSiYtVDBYH16auPyRIABojaMLvHlV5bAIL
         iw19FFZCTiyGYrEoTdsZM7dTVc8Z3dc5zINDg9x8L2Z77wD82jGvGf8LkF5dY78xwyW4
         sq419bEUzaabB6pa2/FqKxEsW61EAZa9/nU59nrtPrY+v6733AEHpdiiS6qdUK64GvfJ
         FjpoAxOCeJDSd/V/fAxWQXf1zcmDvM8Nh2ZjlBGU+8dXyZwCoIgrOKpRjvxUO6FT1TWI
         De6HmNK16wzG3ich9NIOYiSCEENML90HqUmje68EVuBIU0kKTP/iSefxizQY0di3r8bk
         i6xA==
X-Gm-Message-State: AOAM532AP93d2X4xeaUpOwAvVyKb2iVbqA1FNQgOaxpPHj7o3u7zvs+E
	KoUc6vnXzVSl2HZoS5++w4jgv8b5raOMj5wm/BR0xVttATAXgg==
X-Google-Smtp-Source: ABdhPJz95xSmAe/8XD+9txe7wep4oVMGbwsDcN2LhmmksY7SQ1yktqO+jMBPPh69PUz8pJHQww/oL8GL3wlo/0JDymM=
X-Received: by 2002:a25:9085:: with SMTP id t5mr26423443ybl.504.1620057266414;
 Mon, 03 May 2021 08:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAPk1OjHUGA2hje_esMUtM0qWj_NcHeXev-B4oWGYKtD=RWGA2Q@mail.gmail.com>
 <20210430171636.GZ15937@denix.org> <CAPk1OjFyvDpVivr5S7HrWcQZPfBTP6pi+VzrxySyaMEELPmzZg@mail.gmail.com>
 <20210503145812.GA21867@denix.org>
In-Reply-To: <20210503145812.GA21867@denix.org>
From: "Alessio Igor Bogani" <alessioigorbogani@gmail.com>
Date: Mon, 3 May 2021 17:54:08 +0200
Message-ID: <CAPk1OjF85ZRVwgkrDLFrO3iOEvBQwdnAsx06WsQtc9z=WJggtg@mail.gmail.com>
Subject: Re: [meta-ti] Fail to build a kernel module
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Denys,

On Mon, 3 May 2021 at 16:58, Denys Dmytriyenko <denis@denix.org> wrote:
>
> -msoft-float
>
> Do you have the same output for beaglebone-yocto build?

Yes I have got:

> # uname -mpi
armv7l armv7l armv7l

> # make V=1
make -C /lib/modules/5.4.58-yocto-standard/build M=/home/root/a2720-mod
make[1]: Entering directory '/lib/modules/5.4.58-yocto-standard/build'
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
-Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra
-mabi=aapcs-linux -mfpu=vfp -funwind-tables -marm
-Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7 -march=armv7-a
-Wa,-march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks
-Wno-frame-address -Wno-format-truncation -Wno-format-overflow
-Wno-address-of-packed-member -Os --param=allow-store-data-races=0
-Wframe-larger-than=1024 -fstack-protector-strong
-Wno-unused-but-set-variable -Wimplicit-fallthrough
-Wno-unused-const-variable -fno-var-tracking-assignments -g -pg
-Wdeclaration-after-statement -Wvla -Wno-pointer-sign
-Wno-stringop-truncation -Wno-array-bounds -Wno-stringop-overflow
-Wno-restrict -Wno-maybe-uninitialized -fno-strict-overflow
-fno-merge-all-constants -fmerge-constants -fno-stack-check
-fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types
-Werror=designated-init -fmacro-prefix-map=./= -Wno-packed-not-aligned
 -DMODULE  -DKBUILD_BASENAME='"a2720"' -DKBUILD_MODNAME='"a2720"' -c
-o /home/root/a2720-mod/a2720.o /home/root/a2720-mod/a2720.c
   if [ /home/root/a2720-mod/a2720.o != "scripts/mod/empty.o" ]; then
./scripts/recordmcount  "/home/root/a2720-mod/a2720.o"; fi;
  { echo  /home/root/a2720-mod/a2720.o; echo; } > /home/root/a2720-mod/a2720.mod
{   echo /home/root/a2720-mod/a2720.ko; :; } \
| awk '!x[$0]++' - > /home/root/a2720-mod/modules.order
make -f ./scripts/Makefile.modpost
  sed 's/ko$/o/' /home/root/a2720-mod/modules.order |
scripts/mod/modpost   -i ./Module.symvers -I
/home/root/a2720-mod/Module.symvers  -o
/home/root/a2720-mod/Module.symvers     -s -T -
make -f ./scripts/Makefile.modfinal
  gcc -Wp,-MD,/home/root/a2720-mod/.a2720.mod.o.d -nostdinc -isystem
/usr/lib/gcc/arm-poky-linux-gnueabi/9.3.0/include -I./arch/arm/include
-I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi
-I./arch/arm/include/generated/uapi -I./include/uapi
-I./include/generated/uapi -include ./include/linux/kconfig.h -include
./include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -Wall
-Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing
-fno-common -fshort-wchar -fno-PIE
-Werror=implicit-function-declaration -Werror=implicit-int
-Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra
-mabi=aapcs-linux -mfpu=vfp -funwind-tables -marm
-Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7 -march=armv7-a
-Wa,-march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks
-Wno-frame-address -Wno-format-truncation -Wno-format-overflow
-Wno-address-of-packed-member -Os --param=allow-store-data-races=0
-Wframe-larger-than=1024 -fstack-protector-strong
-Wno-unused-but-set-variable -Wimplicit-fallthrough
-Wno-unused-const-variable -fno-var-tracking-assignments -g -pg
-Wdeclaration-after-statement -Wvla -Wno-pointer-sign
-Wno-stringop-truncation -Wno-array-bounds -Wno-stringop-overflow
-Wno-restrict -Wno-maybe-uninitialized -fno-strict-overflow
-fno-merge-all-constants -fmerge-constants -fno-stack-check
-fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types
-Werror=designated-init -fmacro-prefix-map=./= -Wno-packed-not-aligned
 -DMODULE  -DKBUILD_BASENAME='"a2720.mod"' -DKBUILD_MODNAME='"a2720"'
-c -o /home/root/a2720-mod/a2720.mod.o
/home/root/a2720-mod/a2720.mod.c
  ld -r -EL --build-id  -T ./scripts/module-common.lds -T
./arch/arm/kernel/module.lds -o /home/root/a2720-mod/a2720.ko
/home/root/a2720-mod/a2720.o /home/root/a2720-mod/a2720.mod.o;  true
make[1]: Leaving directory '/lib/modules/5.4.58-yocto-standard/build'
root@MiWiFi-R3600-srv:~/a2720-mod#

Thank you very much!

Ciao,
Alessio

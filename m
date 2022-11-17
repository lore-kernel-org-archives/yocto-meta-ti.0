Return-Path: <mrchapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE87C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 21:10:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.2043.1668719434520984100
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Nov 2022 13:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gXMHhncx;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: mrchapp@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id d9so5892740wrm.13
        for <meta-ti@lists.yoctoproject.org>; Thu, 17 Nov 2022 13:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dx1H7kj5+m9mB88mH4PGQ8lSzWIMWSVYHsSMkCfauN8=;
        b=gXMHhncxHotsuPwAbp/ImihaOUoTltUvl47X7VeHbuHp0FdvN11ZIi8BBBa9hyuT6y
         gigtf/SV2sJ9GPwOlY6nlMO5/X3F0mqyhJ4ikmVqn9O9zMQwfevI+x+KH6Fq8GsBv1HP
         07t4ufD3yEGwC1ZTTP8JhTrbLd8gE+8CrIc3udeAwIehXwr0YLKx7G21ekKpVoYXhosm
         h7hFklZ980WRwyFK1CdwXScwL47tcfcfe+q8B0lPS+RXmy0qPksxUlicxx/rbZtTESeW
         V/hoyQIUTU7YRTZyLUgaCj0vuFkCJd5zuWbPE/vl7N29SBuHkRz98F7jcUIrmHJmEV+P
         3gtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dx1H7kj5+m9mB88mH4PGQ8lSzWIMWSVYHsSMkCfauN8=;
        b=PGG4ED4mvfvq/cLtOIGrer/hTLqMkHalZogjsYlJRtNcaT0RhI35Xt6NqkbG2fn4jw
         2+by8M7gWjxsYcWSSoPn0EK7Ziq0yKuQjaiMuxgHgFqs8KmElDJUYwL5hVEl/ZPIOJTt
         uLDQOilRaup0o12t8hsxK+aZi7aj41JG32oCBNtbvtAQfdqxC0gg/KtqNIKawt2AGpgW
         wLqu5LGzgvkQhH3NG0jNCywmfHzIrqPiZ80rcXkh6nYbL+DaM5hItLGAsYgK35/a/Zha
         DqJahJpB4MkA/h9VZDdfqBvuJCI81yPknSr7xCWlbRA0+7c+EvVsOwQqPwbwma1+rU4c
         vZdg==
X-Gm-Message-State: ANoB5pmxKom35OCAdx1g1ETq+UrjbcOaf3ck7mGDVMULo8xAU3+QpsfU
	rEOmdSkHplIQH8X5y//x5RY5tAcU5p6UlWADZIM=
X-Google-Smtp-Source: AA0mqf6HJ6ZuPaYOWFB19Vjfojacs4xQVieU6CKAYzby3HPYZwpd/xwQ9o2tQvydXzOFWXTlq/qp6MQuMEJTxnvZc2E=
X-Received: by 2002:adf:ec49:0:b0:22e:28fe:39d6 with SMTP id
 w9-20020adfec49000000b0022e28fe39d6mr2595386wrn.701.1668719432807; Thu, 17
 Nov 2022 13:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20221111011815.1980210-1-denis@denix.org>
In-Reply-To: <20221111011815.1980210-1-denis@denix.org>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <mrchapp@gmail.com>
Date: Thu, 17 Nov 2022 15:10:20 -0600
Message-ID: <CAELJN2=VYqdGGSOhxMQOrkkeG5b3f8ONr6OgcuJ0AzTKwpv6HA@mail.gmail.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH] conf/machine/omapl138:
 correct few of the machine settings
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Nov 2022 21:10:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15347

Hello!

On Thu, Nov 10, 2022 at 7:18 PM Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> Cleanup and unify again - omapl138-lcdk is the only platform supported in
> the OMAP-L1 family. Plus there's no longer DaVinci family with correspond=
ing
> settings. Adjust accordingly.

We used to be able to build for am57xx-evm and beaglebone with just
meta-ti-bsp. This patch seems to add a dependency on meta-ti-extras.
Was this intended or has this always been required?

Without meta-ti-extras:

Parsing recipes...ERROR: ParseError at
../meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb:2: Could
not include required file recipes-ti/includes/ti-paths.inc
ERROR: Parsing halted due to errors, see error messages above

Thanks and greetings!

Daniel D=C3=ADaz
yosoy@danieldiaz.org



> Please note, there's currently a bug building Rust on ARMv5 platforms:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14967
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-ti-bsp/conf/machine/include/omapl1.inc   |  2 --
>  meta-ti-bsp/conf/machine/include/omapl138.inc | 14 +++++++++-
>  meta-ti-bsp/conf/machine/omapl138-lcdk.conf   |  1 -
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  1 -
>  .../linux/bundle-devicetree.inc               | 26 -------------------
>  .../linux/linux-ti-staging_5.10.bb            |  1 -
>  .../recipes-ti/includes/ti-paths.inc          |  3 ---
>  7 files changed, 13 insertions(+), 35 deletions(-)
>  delete mode 100644 meta-ti-bsp/conf/machine/include/omapl1.inc
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/bundle-devicetree.in=
c
>
> diff --git a/meta-ti-bsp/conf/machine/include/omapl1.inc b/meta-ti-bsp/co=
nf/machine/include/omapl1.inc
> deleted file mode 100644
> index d0262c3f..00000000
> --- a/meta-ti-bsp/conf/machine/include/omapl1.inc
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require conf/machine/include/ti-soc.inc
> -SOC_FAMILY:append =3D ":omapl1"
> diff --git a/meta-ti-bsp/conf/machine/include/omapl138.inc b/meta-ti-bsp/=
conf/machine/include/omapl138.inc
> index c6eb0cd9..2e4a47a5 100644
> --- a/meta-ti-bsp/conf/machine/include/omapl138.inc
> +++ b/meta-ti-bsp/conf/machine/include/omapl138.inc
> @@ -1,2 +1,14 @@
> -require conf/machine/include/omapl1.inc
> +require conf/machine/include/ti-soc.inc
>  SOC_FAMILY:append =3D ":omapl138"
> +
> +require conf/machine/include/arm/armv5/tune-arm926ejs.inc
> +
> +KERNEL_IMAGETYPE =3D "zImage"
> +
> +PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
> +PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
> +PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
> +
> +EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
> +
> +MACHINE_FEATURES =3D "kernel26 serial ethernet usbhost usbgadget mmc als=
a"
> diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/co=
nf/machine/omapl138-lcdk.conf
> index ba4d5645..b318f82d 100644
> --- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
> +++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
> @@ -2,7 +2,6 @@
>  #@NAME: OMAP-L138 LCDK
>  #@DESCRIPTION: Machine configuration for the TI OMAP-L138 LCDK board
>
> -require conf/machine/include/davinci.inc
>  require conf/machine/include/omapl138.inc
>
>  UBOOT_MACHINE =3D "omapl138_lcdk_config"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
> index c0f876e3..d87dcbe1 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -55,7 +55,6 @@ SYSROOT_DIRS +=3D "/boot"
>  # SPL (Second Program Loader) to be loaded over UART
>  SPL_UART_BINARY =3D "u-boot-spl.bin"
>  SPL_UART_BINARY:k3r5 =3D ""
> -SPL_UART_BINARY:lego-ev3 =3D ""
>
>  SPL_UART_IMAGE ?=3D "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
>  SPL_UART_SYMLINK ?=3D "${SPL_UART_BINARY}-${MACHINE}"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/bundle-devicetree.inc b/met=
a-ti-bsp/recipes-kernel/linux/bundle-devicetree.inc
> deleted file mode 100644
> index d259e58c..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/bundle-devicetree.inc
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -# Upstream kernel-devicetree.bbclass only supports bundling the DTB with
> -# zImage. The factory u-boot on lego-ev3 EEPROM only supports uImage, so=
 we
> -# append the DTB to the final uImage here.
> -
> -do_deploy:append() {
> -    if [ "${KERNEL_DEVICETREE_BUNDLE}" =3D "1" ]; then
> -        install -d ${DEPLOYDIR}
> -        for dtbf in ${KERNEL_DEVICETREE}; do
> -            dtb=3D`normalize_dtb "$dtbf"`
> -            dtb_ext=3D${dtb##*.}
> -            dtb_base_name=3D`basename $dtb .$dtb_ext`
> -            for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> -                if [ "$type" =3D "uImage" ]; then
> -                    cat ${D}/${KERNEL_IMAGEDEST}/$type \
> -                    ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_=
ext \
> -                    > ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_NAM=
E}.$dtb_ext.bin
> -                    ln -sf $type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_=
ext.bin \
> -                    ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_LINK_=
NAME}.$dtb_ext.bin
> -                    cat ${D}/${KERNEL_IMAGEDEST}/$type \
> -                    ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_=
ext \
> -                    > ${DEPLOYDIR}/$type
> -                fi
> -            done
> -        done
> -    fi
> -}
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index a0af03c5..bf230dbc 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -8,7 +8,6 @@ inherit kernel
>  DEFCONFIG_BUILDER =3D "${S}/ti_config_fragments/defconfig_builder.sh"
>  require recipes-kernel/linux/setup-defconfig.inc
>  require recipes-kernel/linux/ti-uio.inc
> -require recipes-kernel/linux/bundle-devicetree.inc
>  require recipes-kernel/linux/kernel-rdepends.inc
>  require recipes-kernel/linux/ti-kernel.inc
>
> diff --git a/meta-ti-extras/recipes-ti/includes/ti-paths.inc b/meta-ti-ex=
tras/recipes-ti/includes/ti-paths.inc
> index 5994ff0a..63c00e8c 100644
> --- a/meta-ti-extras/recipes-ti/includes/ti-paths.inc
> +++ b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
> @@ -104,8 +104,5 @@ export TI_CGT7X_INSTALL_DIR        =3D "${STAGING_DIR=
_NATIVE}${TI_CGT7X_INSTALL_DI
>  export TI_K3_SECDEV_INSTALL_DIR =3D "${STAGING_DIR_NATIVE}${TI_K3_SECDEV=
_INSTALL_DIR_RECIPE}"
>
>
> -DSPSUFFIX:omapl137 =3D "x674"
>  DSPSUFFIX:omapl138 =3D "x674"
> -DSPSUFFIX_ti816x =3D "xe674"
> -DSPSUFFIX_ti814x =3D "xe674"
>  DSPSUFFIX ?=3D "x64P"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15341): https://lists.yoctoproject.org/g/meta-ti/mess=
age/15341
> Mute This Topic: https://lists.yoctoproject.org/mt/94950211/1051867
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [mrchapp@gmai=
l.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


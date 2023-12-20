Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE8CC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 16:43:42 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web10.26445.1703090621468994809
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Dec 2023 08:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lPm2zv/v;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7cbebe9ca1dso997891241.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 20 Dec 2023 08:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703090620; x=1703695420; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lkbX6dpwpRlApQ1mZCfDUOlG1mEtECVlkQ5/lhr2EFg=;
        b=lPm2zv/vXkM64njBkolOiHkbvJ2FR8+jk8KELRLo6mY2yH0tFw6eFSq6IHlesdtJ8K
         +/zM+q6oRVQ0cgdzXvRxQxy7i2PYC5Y6iB156KrN4W7KfCn+JFbKyqZvo9lVhE8Tbg3y
         gRUeoHLVI1wuQ2aCs+omSr3QI5iClhpjEo03IR3q3JS01SJWkobWNhKLe5qeOwy8Q+Ai
         sbv6IZX1kJmxsnfhCWZZUOWzXFazdOE+tq6Qi/HiYijwSdeunOJ0lwEAEITnvIDa79D2
         BxcdHVOw1BA0JXhyNKpEMTydN7DJrnGvPTiXVciCcXF9ZM7EW1hSLp6dc8X2H3Fcf8MY
         bxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703090620; x=1703695420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkbX6dpwpRlApQ1mZCfDUOlG1mEtECVlkQ5/lhr2EFg=;
        b=a6nForw2CoNUW6ivATjYRJSvfNhE65Xqmk3iNnUBAv9gK5C2+tj/088gfPuQQGU45Y
         zaPkV/AusCEqoJYxSaGdAS9Plg/lAEIIfR8fkQtsCo4TEtIHmyOZywPBamUocmp6CvrV
         1lq6R6kitPrwUwoNQPQatII0orvWHstgxpNR4P3ZV11nImmANP2TTzpPBa5dDiQrKeNq
         M7pxZE8tEo/bgova4UB7YsEFMII+TvAfghI8lu8XJH8W2eyhawUTyJcM23sOT6ndyyQI
         cx8mWrw7wlYGttBqfC2TgidrS/JFKxfwC4GldIbMI7/cjbIRmkHBgOOPJNvEt+qPpxFf
         4VRw==
X-Gm-Message-State: AOJu0Yx6PutElS6s0LkRNBDa8xjXcb6Y/PRHhN+AakD3KMq3OoElml9Q
	ZP05HUgC3btaB5wujk40lOEkrK49CsIAJL9py4w=
X-Google-Smtp-Source: AGHT+IGLWICFTwG8ToSfdZxd5mMwbXcKONtYjhVZpHsJOM0eBnWDgNsceWhy7zD+2VSDNtvh3WO524DXEFrOscSJ5KQ=
X-Received: by 2002:a05:6102:474e:b0:465:fcde:b4a7 with SMTP id
 ej14-20020a056102474e00b00465fcdeb4a7mr12084013vsb.9.1703090619942; Wed, 20
 Dec 2023 08:43:39 -0800 (PST)
MIME-Version: 1.0
References: <20231220160737.40535-1-afd@ti.com> <dd3accba-30ea-4f0c-afe9-04475209c381@ti.com>
In-Reply-To: <dd3accba-30ea-4f0c-afe9-04475209c381@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 20 Dec 2023 16:43:28 +0000
Message-ID: <CANPvuRkzkVt=PeknKaFaQ6URoeJ--U2SF59pYF+XH0_0tmD-ag@mail.gmail.com>
Subject: Re: [meta-ti][master/kirkstone][RFC] meta-ti-bsp: Build R5 bootloader
 without multiconfig
To: reatmon@ti.com
Cc: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org, 
	Ricardo Salveti <ricardo@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000006c10cc060cf3af51"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Dec 2023 16:43:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17354

--0000000000006c10cc060cf3af51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

I believe this patchset can help fix some of the remaining issues mainly in
the kirstone branch.
I will test it but maybe only next year.

Jose

Ryan Eatmon via lists.yoctoproject.org <reatmon=3D
ti.com@lists.yoctoproject.org> escreveu no dia quarta, 20/12/2023 =C3=A0(s)
16:14:

>
>
> On 12/20/2023 10:07 AM, Andrew Davis wrote:
> > The R5 SPL bootloader is the only software we build using the R5 (arm32=
)
> > multiconfig environment. Using multiconfig pulls in a large number of
> > build dependencies (see the -native environment in baremetal tmp dir)
> > this increases build time and space.
> >
> > Using multiconfig for a deploy target also leads to several oddities in
> > the bitbake build system forcing use of a non-standard deploy directory
> > and careful checks that no recipe built in both configuration deploy
> > the same files.
> >
> > While I believe we will get more use out of multiconfig for future
> > devices, today let's simplify the K3 build infrastructure here by
> > building R5 SPL like a normal firmware using a foreign targeting cross
> > compiler. This is the technique meta-arm uses to build firmware (see
> > scp-firmware and trusted-firmware-m recipes). Add a new tiboot3 firmwar=
e
> > recipe here.
> >
> > With that we can also drop all the related k3r5 multiconfig files and
> > definitions. Do that here.
>
> On first glance, this looks good.  Let me do some test builds.
>
>
> > Signed-off-by: Andrew Davis <afd@ti.com>
> > ---
> >   meta-ti-bsp/classes/ti-secdev.bbclass         |  3 -
> >   .../conf/machine/am62axx-evm-k3r5.conf        | 11 ----
> >   meta-ti-bsp/conf/machine/am62axx-evm.conf     |  5 ++
> >   .../conf/machine/am62pxx-evm-k3r5.conf        | 12 ----
> >   meta-ti-bsp/conf/machine/am62pxx-evm.conf     |  5 ++
> >   meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf | 12 ----
> >   meta-ti-bsp/conf/machine/am62xx-evm.conf      |  5 ++
> >   .../conf/machine/am62xx-lp-evm-k3r5.conf      | 11 ----
> >   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  5 ++
> >   .../conf/machine/am62xxsip-evm-k3r5.conf      | 16 -----
> >   meta-ti-bsp/conf/machine/am62xxsip-evm.conf   | 10 +++
> >   meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf | 11 ----
> >   meta-ti-bsp/conf/machine/am64xx-evm.conf      |  5 ++
> >   meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf | 11 ----
> >   meta-ti-bsp/conf/machine/am65xx-evm.conf      |  5 ++
> >   .../conf/machine/am65xx-hs-evm-k3r5.conf      | 11 ----
> >   meta-ti-bsp/conf/machine/am65xx-hs-evm.conf   |  5 ++
> >   .../conf/machine/beaglebone-ai64-k3r5.conf    | 17 -----
> >   meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  5 ++
> >   meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 14 ----
> >   meta-ti-bsp/conf/machine/beagleplay.conf      |  5 ++
> >   meta-ti-bsp/conf/machine/include/k3.inc       |  4 +-
> >   meta-ti-bsp/conf/machine/include/k3r5.inc     | 27 --------
> >   meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf  | 11 ----
> >   meta-ti-bsp/conf/machine/j7200-evm.conf       |  5 ++
> >   .../conf/machine/j7200-hs-evm-k3r5.conf       | 11 ----
> >   meta-ti-bsp/conf/machine/j7200-hs-evm.conf    |  5 ++
> >   meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf  | 11 ----
> >   meta-ti-bsp/conf/machine/j721e-evm.conf       |  5 ++
> >   .../conf/machine/j721e-hs-evm-k3r5.conf       | 11 ----
> >   meta-ti-bsp/conf/machine/j721e-hs-evm.conf    |  3 +-
> >   meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf | 11 ----
> >   meta-ti-bsp/conf/machine/j721s2-evm.conf      |  5 ++
> >   .../conf/machine/j721s2-hs-evm-k3r5.conf      | 11 ----
> >   meta-ti-bsp/conf/machine/j721s2-hs-evm.conf   |  2 +
> >   meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf | 11 ----
> >   meta-ti-bsp/conf/machine/j784s4-evm.conf      |  5 ++
> >   .../conf/machine/j784s4-hs-evm-k3r5.conf      | 11 ----
> >   meta-ti-bsp/conf/machine/j784s4-hs-evm.conf   |  2 +
> >   meta-ti-bsp/conf/multiconfig/k3r5.conf        | 10 ---
> >   .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  3 -
> >   .../u-boot/tiboot3-staging_2023.5.bb          | 65 ++++++++++++++++++=
+
> >   .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   |  2 -
> >   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 40 ------------
> >   44 files changed, 152 insertions(+), 303 deletions(-)
> >   delete mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/include/k3r5.inc
> >   delete mode 100644 meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
> >   delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5.conf
> >   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/
> tiboot3-staging_2023.5.bb
> >
> > diff --git a/meta-ti-bsp/classes/ti-secdev.bbclass
> b/meta-ti-bsp/classes/ti-secdev.bbclass
> > index b3d70e5c..18d15269 100644
> > --- a/meta-ti-bsp/classes/ti-secdev.bbclass
> > +++ b/meta-ti-bsp/classes/ti-secdev.bbclass
> > @@ -2,14 +2,11 @@
> >
> >   # K3 SECDEV scripts use OpenSSL
> >   DEPENDS:append:k3 =3D " openssl-native"
> > -DEPENDS:append:k3r5 =3D " openssl-native"
> >
> >   # Use package version of TI SECDEV for K3 if one is not provided
> through the environment
> >   DEPENDS:append:k3 =3D "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') els=
e '
> ti-k3-secdev-native' }"
> > -DEPENDS:append:k3r5 =3D "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') el=
se
> ' ti-k3-secdev-native' }"
> >   TI_K3_SECDEV_INSTALL_DIR =3D
> "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
> >   TI_SECURE_DEV_PKG:k3 =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or
> d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> > -TI_SECURE_DEV_PKG:k3r5 =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or
> d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> >
> >   # For non-K3 we require the SECDEV tools be provided through the
> environment with the following vars
> >   TI_SECURE_DEV_PKG:ti33x =3D "${TI_SECURE_DEV_PKG_CAT}/am3x"
> > diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> > deleted file mode 100644
> > index 2af3317e..00000000
> > --- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: AM62A HS-FS EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI AM62A EVM (R5F core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "am62ax"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs-fs"
> > -
> > -UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf
> b/meta-ti-bsp/conf/machine/am62axx-evm.conf
> > index 22f61401..59884629 100644
> > --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
> > @@ -14,4 +14,9 @@ KERNEL_DEVICETREE =3D " \
> >       ti/k3-am62a7-sk.dtb \
> >   "
> >
> > +SYSFW_SOC =3D "am62ax"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "hs-fs"
> > +
> > +UBOOT_MACHINE_R5 =3D "am62ax_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "am62ax_evm_a53_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> > deleted file mode 100644
> > index 36915381..00000000
> > --- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: AM62PX EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI AM62Px EVM (R5F core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -require conf/machine/include/ti-extras.inc
> > -
> > -SYSFW_SOC =3D "am62px"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs-fs"
> > -
> > -UBOOT_MACHINE =3D "am62px_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> > index d7c9f589..116d819b 100644
> > --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> > @@ -15,4 +15,9 @@ KERNEL_DEVICETREE =3D " \
> >       ti/k3-am62p5-sk.dtb \
> >   "
> >
> > +SYSFW_SOC =3D "am62px"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "hs-fs"
> > +
> > +UBOOT_MACHINE_R5 =3D "am62px_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "am62px_evm_a53_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> > deleted file mode 100644
> > index 548369ca..00000000
> > --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: AM62XX EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -require conf/machine/include/ti-extras.inc
> > -
> > -SYSFW_SOC =3D "am62x"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs-fs"
> > -
> > -UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> > index fadbc6f4..6f234811 100644
> > --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> > @@ -14,4 +14,9 @@ KERNEL_DEVICETREE =3D " \
> >       ti/k3-am625-sk.dtb \
> >   "
> >
> > +SYSFW_SOC =3D "am62x"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "hs-fs"
> > +
> > +UBOOT_MACHINE_R5 =3D "am62x_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> > deleted file mode 100644
> > index aa9422cd..00000000
> > --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: AM62XX LP GP EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EVM (R5F
> core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "am62x"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs-fs"
> > -
> > -UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> > index 229b74bc..e33b60e2 100644
> > --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> > @@ -16,4 +16,9 @@ KERNEL_DEVICETREE =3D " \
> >       ti/k3-am62-lp-sk.dtb \
> >   "
> >
> > +SYSFW_SOC =3D "am62x"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "hs-fs"
> > +
> > +UBOOT_MACHINE_R5 =3D "am62x_lpsk_r5_defconfig"
> >   UBOOT_MACHINE =3D "am62x_lpsk_a53_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> > deleted file mode 100644
> > index 0daff2b9..00000000
> > --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: AM62XX SIP EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI AM62xx SIP EVM (R5F
> core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "am62x"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs-fs"
> > -
> > -UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
> > -
> > -# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments
> which has to be build
> > -# along with the base defconfig mentioned in UBOOT_MACHINE. Refer
> u-boot-mergeconfig.inc
> > -# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
> > -UBOOT_CONFIG_FRAGMENTS =3D "am62xsip_sk_r5.config"
> > diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> > index b5dd18f1..2e077f75 100644
> > --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> > @@ -13,4 +13,14 @@ KERNEL_DEVICETREE =3D " \
> >       ti/k3-am625-sk.dtb \
> >   "
> >
> > +SYSFW_SOC =3D "am62x"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "hs-fs"
> > +
> > +UBOOT_MACHINE_R5 =3D "am62x_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
> > +
> > +# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments
> which has to be build
> > +# along with the base defconfig mentioned in UBOOT_MACHINE. Refer
> u-boot-mergeconfig.inc
> > +# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
> > +UBOOT_CONFIG_FRAGMENTS_R5 =3D "am62xsip_sk_r5.config"
> > diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
> > deleted file mode 100644
> > index e932928a..00000000
> > --- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: AM64xx EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI AM64xx EVM (R5F core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "am64x_sr2"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs-fs"
> > -
> > -UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am64xx-evm.conf
> b/meta-ti-bsp/conf/machine/am64xx-evm.conf
> > index c6ba2a87..dc21c174 100644
> > --- a/meta-ti-bsp/conf/machine/am64xx-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/am64xx-evm.conf
> > @@ -4,4 +4,9 @@
> >
> >   require conf/machine/include/am64xx.inc
> >
> > +SYSFW_SOC =3D "am64x_sr2"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "hs-fs"
> > +
> >   UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
> > +UBOOT_MACHINE_R5 =3D "am64x_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
> > deleted file mode 100644
> > index 8744ac3e..00000000
> > --- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: AM65xx EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI AM65xx EVM (R5F core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "am65x_sr2"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "gp"
> > -
> > -UBOOT_MACHINE =3D "am65x_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf
> b/meta-ti-bsp/conf/machine/am65xx-evm.conf
> > index f6eb6f0c..9b050b03 100644
> > --- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
> > @@ -4,6 +4,11 @@
> >
> >   require conf/machine/include/am65xx.inc
> >
> > +SYSFW_SOC =3D "am65x_sr2"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "gp"
> > +
> > +UBOOT_MACHINE_R5 =3D "am65x_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "am65x_evm_a53_defconfig"
> >
> >   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw-am65x-sr2
> pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> > diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> > deleted file mode 100644
> > index 337c8413..00000000
> > --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: AM65xx HS EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F cor=
e)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "am65x_sr2"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs"
> > -
> > -UBOOT_MACHINE =3D "am65x_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
> b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
> > index f8221f31..4164ae53 100644
> > --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
> > @@ -4,4 +4,9 @@
> >
> >   require conf/machine/include/am65xx.inc
> >
> > +SYSFW_SOC =3D "am65x_sr2"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "hs"
> > +
> > +UBOOT_MACHINE_R5 =3D "am65x_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "am65x_evm_a53_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> > deleted file mode 100644
> > index b893f380..00000000
> > --- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: BeagleBone AI-64 (R5F)
> > -#@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (R5F cor=
e)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "j721e"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "gp"
> > -
> > -SPL_BINARY =3D "spl/u-boot-spl.${UBOOT_SUFFIX}"
> > -SPL_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
> > -UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
> > -UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> > -UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> > -
> > -UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> > index e529f565..bad86a22 100644
> > --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> > +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> > @@ -4,6 +4,11 @@
> >
> >   require conf/machine/include/j721e.inc
> >
> > +SYSFW_SOC =3D "j721e"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "gp"
> > +
> > +UBOOT_MACHINE_R5 =3D "j721e_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "j721e_evm_a72_config"
> >
> >   PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
> > diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
> b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
> > deleted file mode 100644
> > index c40615c9..00000000
> > --- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: BeaglePlay (R5F)
> > -#@DESCRIPTION: Machine configuration for the BeaglePlay (R5F core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
> > -PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
> > -
> > -SYSFW_SOC =3D "am62x"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "gp"
> > -
> > -UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf
> b/meta-ti-bsp/conf/machine/beagleplay.conf
> > index ac4a202a..312fc503 100644
> > --- a/meta-ti-bsp/conf/machine/beagleplay.conf
> > +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> > @@ -18,6 +18,11 @@ TFA_K3_SYSTEM_SUSPEND =3D "1"
> >
> >   OPTEEMACHINE =3D "k3-am62x"
> >
> > +SYSFW_SOC =3D "am62x"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "gp"
> > +
> > +UBOOT_MACHINE_R5 =3D "am62x_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
> >
> >   PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
> > diff --git a/meta-ti-bsp/conf/machine/include/k3.inc
> b/meta-ti-bsp/conf/machine/include/k3.inc
> > index 2415f0ba..84feee08 100644
> > --- a/meta-ti-bsp/conf/machine/include/k3.inc
> > +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> > @@ -5,8 +5,6 @@ SOC_FAMILY:append =3D ":k3"
> >
> >   require conf/machine/include/arm/arch-arm64.inc
> >
> > -BBMULTICONFIG +=3D "k3r5"
> > -
> >   # Increase this everytime you change something in the kernel
> >   MACHINE_KERNEL_PR =3D "r0"
> >
> > @@ -62,7 +60,7 @@ MACHINE_FEATURES +=3D "efi"
> >   WKS_FILE ?=3D "${@bb.utils.contains("MACHINE_FEATURES", "efi", "
> sdimage-2part-efi.wks.in", "sdimage-2part.wks", d)}"
> >
> >   do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
> > -do_image[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy"
> > +do_image[depends] +=3D "tiboot3-staging:do_deploy"
> >
> >   SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
> >   SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
> > diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc
> b/meta-ti-bsp/conf/machine/include/k3r5.inc
> > deleted file mode 100644
> > index 63267a5e..00000000
> > --- a/meta-ti-bsp/conf/machine/include/k3r5.inc
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -# TI K3 Armv7 profile for Cortex-R5F cores
> > -
> > -require conf/machine/include/ti-soc.inc
> > -SOC_FAMILY:append =3D ":k3r5"
> > -
> > -# The closest of existing tunes for Cortex-R5F
> > -DEFAULTTUNE =3D "armv7athf"
> > -require conf/machine/include/arm/armv7a/tune-cortexa8.inc
> > -
> > -# R5 runs early bootloader and loads SYSFW
> > -#
> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_evm.r=
st
> > -#
> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/am62x_sk.rs=
t
> > -# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/k3.rst
> > -PREFERRED_PROVIDER_virtual/kernel =3D "linux-dummy"
> > -PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
> > -PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
> > -
> > -SPL_SUFFIX =3D "bin"
> > -SPL_BINARY =3D
> "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"
> > -SPL_SYMLINK =3D "tiboot3.${SPL_SUFFIX}"
> > -UBOOT_SUFFIX =3D "bin"
> > -UBOOT_BINARY =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
> > -UBOOT_IMAGE =3D "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFI=
X}"
> > -UBOOT_SYMLINK =3D "u-boot-r5spl-${MAINMACHINE}.${UBOOT_SUFFIX}"
> > -
> > -PACKAGECONFIG:pn-u-boot-ti-staging =3D ""
> > -PACKAGECONFIG:pn-u-boot-ti-mainline =3D ""
> > diff --git a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
> > deleted file mode 100644
> > index 68061883..00000000
> > --- a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: J7200 EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI J7200 EVM (R5F core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "j7200"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "gp"
> > -
> > -UBOOT_MACHINE =3D "j7200_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf
> b/meta-ti-bsp/conf/machine/j7200-evm.conf
> > index dff1da69..e733d15a 100644
> > --- a/meta-ti-bsp/conf/machine/j7200-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
> > @@ -10,4 +10,9 @@ KERNEL_DEVICETREE =3D " \
> >       ti/k3-j7200-common-proc-board.dtb \
> >   "
> >
> > +SYSFW_SOC =3D "j7200"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "gp"
> > +
> > +UBOOT_MACHINE_R5 =3D "j7200_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "j7200_evm_a72_config"
> > diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
> > deleted file mode 100644
> > index 1922d5c8..00000000
> > --- a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: J7200 HS EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM (R5F core=
)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "j7200_sr2"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs"
> > -
> > -UBOOT_MACHINE =3D "j7200_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
> b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
> > index 54fd2b4a..fc33106c 100644
> > --- a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
> > @@ -4,4 +4,9 @@
> >
> >   require conf/machine/j7200-evm.conf
> >
> > +SYSFW_SOC =3D "j7200_sr2"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "hs"
> > +
> > +UBOOT_MACHINE_R5 =3D "j7200_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "j7200_evm_a72_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
> > deleted file mode 100644
> > index 070bf7aa..00000000
> > --- a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: J721e EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI J721e EVM (R5F core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "j721e"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "gp"
> > -
> > -UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf
> b/meta-ti-bsp/conf/machine/j721e-evm.conf
> > index 5e1f6dca..ca23e3e3 100644
> > --- a/meta-ti-bsp/conf/machine/j721e-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
> > @@ -15,4 +15,9 @@ KERNEL_DEVICETREE =3D " \
> >       ti/k3-j721e-sk.dtb \
> >   "
> >
> > +SYSFW_SOC =3D "j721e"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "gp"
> > +
> > +UBOOT_MACHINE_R5 =3D "j721e_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "j721e_evm_a72_config"
> > diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
> > deleted file mode 100644
> > index 7904c660..00000000
> > --- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: J721e HS EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI J721e HS EVM (R5F core=
)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "j721e_sr1_1"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs"
> > -
> > -UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
> b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
> > index 441ca169..3d4bedb6 100644
> > --- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
> > @@ -4,4 +4,5 @@
> >
> >   require conf/machine/j721e-evm.conf
> >
> > -UBOOT_MACHINE =3D "j721e_evm_a72_defconfig"
> > +SYSFW_SOC =3D "j721e_sr1_1"
> > +SYSFW_SUFFIX =3D "hs"
> > diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
> > deleted file mode 100644
> > index 508e96e5..00000000
> > --- a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: J721S2 EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI J721S2 EVM (R5F core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "j721s2"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "gp"
> > -
> > -UBOOT_MACHINE =3D "j721s2_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf
> b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> > index ecb1836f..63d86af0 100644
> > --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> > @@ -18,4 +18,9 @@ KERNEL_DEVICETREE =3D " \
> >       ti/k3-j721s2-common-proc-board.dtb \
> >   "
> >
> > +SYSFW_SOC =3D "j721s2"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "gp"
> > +
> > +UBOOT_MACHINE_R5 =3D "j721s2_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "j721s2_evm_a72_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
> > deleted file mode 100644
> > index 58cd92c4..00000000
> > --- a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: J721S2 HS EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (R5F cor=
e)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "j721s2"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs"
> > -
> > -UBOOT_MACHINE =3D "j721s2_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
> b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
> > index 4cf32a28..1129a189 100644
> > --- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
> > @@ -3,3 +3,5 @@
> >   #@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
> >
> >   require conf/machine/j721s2-evm.conf
> > +
> > +SYSFW_SUFFIX =3D "hs"
> > diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
> > deleted file mode 100644
> > index 04feebc6..00000000
> > --- a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: J784S4 EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI J784S4 EVM (R5F core)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "j784s4"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "gp"
> > -
> > -UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> > index 40a63651..a242ef8a 100644
> > --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> > @@ -18,4 +18,9 @@ KERNEL_DEVICETREE =3D " \
> >       ti/k3-j784s4-evm.dtb \
> >   "
> >
> > +SYSFW_SOC =3D "j784s4"
> > +SYSFW_CONFIG =3D "evm"
> > +SYSFW_SUFFIX =3D "gp"
> > +
> > +UBOOT_MACHINE_R5 =3D "j784s4_evm_r5_defconfig"
> >   UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
> > deleted file mode 100644
> > index 80a228a0..00000000
> > --- a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -#@TYPE: Machine
> > -#@NAME: J784S4 HS EVM (R5F)
> > -#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F cor=
e)
> > -
> > -require conf/machine/include/k3r5.inc
> > -
> > -SYSFW_SOC =3D "j784s4"
> > -SYSFW_CONFIG =3D "evm"
> > -SYSFW_SUFFIX =3D "hs"
> > -
> > -UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
> > diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
> b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
> > index 8fa1c1fd..42468088 100644
> > --- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
> > +++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
> > @@ -3,3 +3,5 @@
> >   #@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
> >
> >   require conf/machine/j784s4-evm.conf
> > +
> > +SYSFW_SUFFIX =3D "hs"
> > diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > deleted file mode 100644
> > index 936bce2f..00000000
> > --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -MAINMACHINE :=3D "${MACHINE}"
> > -
> > -DEPLOY_DIR_IMAGE:k3r5 =3D "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
> > -
> > -MACHINE:append =3D "-k3r5"
> > -TCLIBC =3D "baremetal"
> > -TI_TMPDIR_APPEND ?=3D "-k3r5"
> > -TMPDIR:append =3D "${TI_TMPDIR_APPEND}"
> > -
> > -SDKPKGSUFFIX =3D "k3r5-nativesdk"
> > diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > index 12292c88..0597d9bb 100644
> > --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > @@ -17,9 +17,6 @@ do_install() {
> >   }
> >
> >   do_deploy(){
> > -}
> > -
> > -do_deploy:k3r5() {
> >       install -d ${DEPLOYDIR}/ti-sysfw
> >       install -m 644 ${S}/ti-sysfw/ti-sci-firmware-*
> ${DEPLOYDIR}/ti-sysfw
> >       install -m 644 ${S}/ti-sysfw/ti-fs-firmware-* ${DEPLOYDIR}/ti-sys=
fw
> > diff --git a/meta-ti-bsp/recipes-bsp/u-boot/tiboot3-staging_2023.5.bb
> b/meta-ti-bsp/recipes-bsp/u-boot/tiboot3-staging_2023.5.bb
> > new file mode 100644
> > index 00000000..0f1929b5
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-bsp/u-boot/tiboot3-staging_2023.5.bb
> > @@ -0,0 +1,65 @@
> > +require u-boot-ti.inc
> > +
> > +include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS'=
)
> else ''}
> > +
> > +PR =3D "r0"
> > +BRANCH =3D "ti-u-boot-2023.04"
> > +SRCREV =3D "b0d717b732ee28e446baf94522b3491e590f7fbb"
> > +
> > +PROVIDES:remove =3D "virtual/bootloader"
> > +PROVIDES:remove =3D "u-boot"
> > +
> > +# Using gcc-cross-arm-native here would have been ideal
> > +# as the compiler version would match between R5 and
> > +# main ARM core builds. arm-oe-linux-gnueabi-
> > +DEPENDS +=3D "gcc-arm-none-eabi-native"
> > +
> > +EXTRA_OEMAKE +=3D "CROSS_COMPILE=3Darm-none-eabi- CC=3Darm-none-eabi-g=
cc"
> > +
> > +UBOOT_MACHINE =3D "${UBOOT_MACHINE_R5}"
> > +
> > +SPL_SUFFIX =3D "bin"
> > +SPL_BINARY =3D
> "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"
> > +SPL_SYMLINK =3D "tiboot3.${SPL_SUFFIX}"
> > +UBOOT_SUFFIX =3D "bin"
> > +UBOOT_BINARY =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
> > +UBOOT_IMAGE =3D "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFI=
X}"
> > +UBOOT_SYMLINK =3D "u-boot-r5spl-${MAINMACHINE}.${UBOOT_SUFFIX}"
> > +
> > +do_compile:append () {
> > +     if [ -n "${UBOOT_CONFIG}" ];
> > +     then
> > +             for config in ${UBOOT_MACHINE}; do
> > +                     i=3D$(expr $i + 1);
> > +                     for type in ${UBOOT_CONFIG}; do
> > +                             j=3D$(expr $j + 1);
> > +                             if [ $j -eq $i ];
> > +                             then
> > +                                     if ! [ -L
> ${B}/${config}/${UBOOT_BINARY} ] && ! [ -f ${B}/${config}/${UBOOT_BINARY}
> ]; then
> > +                                             ln -s
> ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${UBOOT_BINA=
RY}
> > +                                     fi
> > +                             fi
> > +                     done
> > +                     unset  j
> > +             done
> > +             unset  i
> > +     else
> > +             if ! [ -f ${B}/${UBOOT_BINARY} ]; then
> > +                     ln -s spl/u-boot-spl.${UBOOT_SUFFIX}
> ${B}/${UBOOT_BINARY}
> > +             fi
> > +     fi
> > +}
> > +
> > +do_deploy:append () {
> > +     for f in ${B}/tiboot3-*.bin; do
> > +             if [ -f "$f" ]; then
> > +                     install -m 644 $f ${DEPLOYDIR}/
> > +             fi
> > +     done
> > +
> > +     for f in ${B}/sysfw*.itb; do
> > +             if [ -f "$f" ]; then
> > +                     install -m 644 $f ${DEPLOYDIR}/
> > +             fi
> > +     done
> > +}
> > diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> > index 5bb20213..1ec5f9bf 100644
> > --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> > +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> > @@ -12,6 +12,4 @@ BRANCH =3D "v2023.04-ti-09.00.00.011"
> >   SRCREV =3D "4b8f8be8870f03d92a2b01d0d30ab912118adc82"
> >
> >   BRANCH:beagleplay =3D "v2023.04-ti-09.00.00.011-BeaglePlay"
> > -BRANCH:beagleplay-k3r5 =3D "v2023.04-ti-09.00.00.011-BeaglePlay"
> >   SRCREV:beagleplay =3D "10afea462ea1113701f6f0f8853fdff985aa275d"
> > -SRCREV:beagleplay-k3r5 =3D "10afea462ea1113701f6f0f8853fdff985aa275d"
> > diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > index 2f15c4fb..b0f88a5a 100644
> > --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > @@ -31,7 +31,6 @@ DEPENDS +=3D "python3-pyelftools-native
> python3-pyyaml-native python3-jsonschema-n
> >
> >   # SYSFW/TIFS Firmware
> >   DEPENDS:append:k3 =3D " ti-sci-fw"
> > -DEPENDS:append:k3r5 =3D " ti-sci-fw"
> >
> >   DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5f"
> >
> > @@ -79,7 +78,6 @@ SYSROOT_DIRS +=3D "/boot"
> >
> >   # SPL (Second Program Loader) to be loaded over UART
> >   SPL_UART_BINARY =3D "u-boot-spl.bin"
> > -SPL_UART_BINARY:k3r5 =3D ""
> >
> >   SPL_UART_IMAGE ?=3D "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
> >   SPL_UART_SYMLINK ?=3D "${SPL_UART_BINARY}-${MACHINE}"
> > @@ -108,30 +106,6 @@ UBOOT_HS_2ND_BINARY =3D "u-boot-spl_HS_2ND"
> >   UBOOT_HS_2ND_IMAGE =3D "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
> >   UBOOT_HS_2ND_SYMLINK =3D "u-boot-spl_HS_2ND-${MACHINE}"
> >
> > -do_compile:append:k3r5 () {
> > -     if [ -n "${UBOOT_CONFIG}" ];
> > -     then
> > -             for config in ${UBOOT_MACHINE}; do
> > -                     i=3D$(expr $i + 1);
> > -                     for type in ${UBOOT_CONFIG}; do
> > -                             j=3D$(expr $j + 1);
> > -                             if [ $j -eq $i ];
> > -                             then
> > -                                     if ! [ -L
> ${B}/${config}/${UBOOT_BINARY} ] && ! [ -f ${B}/${config}/${UBOOT_BINARY}
> ]; then
> > -                                             ln -s
> ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${UBOOT_BINA=
RY}
> > -                                     fi
> > -                             fi
> > -                     done
> > -                     unset  j
> > -             done
> > -             unset  i
> > -     else
> > -             if ! [ -f ${B}/${UBOOT_BINARY} ]; then
> > -                     ln -s spl/u-boot-spl.${UBOOT_SUFFIX}
> ${B}/${UBOOT_BINARY}
> > -             fi
> > -     fi
> > -}
> > -
> >   do_install:append () {
> >       if [ -n "${UBOOT_CONFIG}" ]
> >       then
> > @@ -204,20 +178,6 @@ do_install:append () {
> >       fi
> >   }
> >
> > -do_deploy:append:k3r5 () {
> > -     for f in ${B}/tiboot3-*.bin; do
> > -             if [ -f "$f" ]; then
> > -                     install -m 644 $f ${DEPLOYDIR}/
> > -             fi
> > -     done
> > -
> > -     for f in ${B}/sysfw*.itb; do
> > -             if [ -f "$f" ]; then
> > -                     install -m 644 $f ${DEPLOYDIR}/
> > -             fi
> > -     done
> > -}
> > -
> >   do_deploy:append () {
> >       if [ -n "${UBOOT_CONFIG}" ]
> >       then
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17353):
> https://lists.yoctoproject.org/g/meta-ti/message/17353
> Mute This Topic: https://lists.yoctoproject.org/mt/103283292/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-ti/leave/11369865/5052612/926574700=
/xyzzy
> [quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000006c10cc060cf3af51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0<span style=3D"color:rgb(0,0,0)">Andrew,<br><=
br>I believe=C2=A0this patchset can help fix some of the remaining=C2=A0iss=
ues mainly in the kirstone branch.<br>I will test it but maybe=C2=A0</span>=
only next year.</div><br>Jose<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Ryan Eatmon via <a href=3D"http://lists.yoctopro=
ject.org">lists.yoctoproject.org</a> &lt;reatmon=3D<a href=3D"mailto:ti.com=
@lists.yoctoproject.org">ti.com@lists.yoctoproject.org</a>&gt; escreveu no =
dia quarta, 20/12/2023 =C3=A0(s) 16:14:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><br>
<br>
On 12/20/2023 10:07 AM, Andrew Davis wrote:<br>
&gt; The R5 SPL bootloader is the only software we build using the R5 (arm3=
2)<br>
&gt; multiconfig environment. Using multiconfig pulls in a large number of<=
br>
&gt; build dependencies (see the -native environment in baremetal tmp dir)<=
br>
&gt; this increases build time and space.<br>
&gt; <br>
&gt; Using multiconfig for a deploy target also leads to several oddities i=
n<br>
&gt; the bitbake build system forcing use of a non-standard deploy director=
y<br>
&gt; and careful checks that no recipe built in both configuration deploy<b=
r>
&gt; the same files.<br>
&gt; <br>
&gt; While I believe we will get more use out of multiconfig for future<br>
&gt; devices, today let&#39;s simplify the K3 build infrastructure here by<=
br>
&gt; building R5 SPL like a normal firmware using a foreign targeting cross=
<br>
&gt; compiler. This is the technique meta-arm uses to build firmware (see<b=
r>
&gt; scp-firmware and trusted-firmware-m recipes). Add a new tiboot3 firmwa=
re<br>
&gt; recipe here.<br>
&gt; <br>
&gt; With that we can also drop all the related k3r5 multiconfig files and<=
br>
&gt; definitions. Do that here.<br>
<br>
On first glance, this looks good.=C2=A0 Let me do some test builds.<br>
<br>
<br>
&gt; Signed-off-by: Andrew Davis &lt;<a href=3D"mailto:afd@ti.com" target=
=3D"_blank">afd@ti.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/classes/ti-secdev.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 -<br>
&gt;=C2=A0 =C2=A0.../conf/machine/am62axx-evm-k3r5.conf=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 11 ----<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62axx-evm.conf=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0.../conf/machine/am62pxx-evm-k3r5.conf=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 12 ----<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62pxx-evm.conf=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf | 12 ----<br=
>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62xx-evm.conf=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0.../conf/machine/am62xx-lp-evm-k3r5.conf=C2=A0 =C2=A0 =C2=
=A0 | 11 ----<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=C2=A0 =C2=A0|=
=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0.../conf/machine/am62xxsip-evm-k3r5.conf=C2=A0 =C2=A0 =C2=
=A0 | 16 -----<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62xxsip-evm.conf=C2=A0 =C2=A0| =
10 +++<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf | 11 ----<br=
>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am64xx-evm.conf=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf | 11 ----<br=
>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am65xx-evm.conf=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0.../conf/machine/am65xx-hs-evm-k3r5.conf=C2=A0 =C2=A0 =C2=
=A0 | 11 ----<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am65xx-hs-evm.conf=C2=A0 =C2=A0|=
=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0.../conf/machine/beaglebone-ai64-k3r5.conf=C2=A0 =C2=A0 | =
17 -----<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/beaglebone-ai64.conf |=C2=A0 5 ++=
<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 14 ----<br=
>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/beagleplay.conf=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/include/k3.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/include/k3r5.inc=C2=A0 =C2=A0 =C2=
=A0| 27 --------<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf=C2=A0 | 11 --=
--<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j7200-evm.conf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0.../conf/machine/j7200-hs-evm-k3r5.conf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 11 ----<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j7200-hs-evm.conf=C2=A0 =C2=A0 |=
=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf=C2=A0 | 11 --=
--<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721e-evm.conf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0.../conf/machine/j721e-hs-evm-k3r5.conf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 11 ----<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721e-hs-evm.conf=C2=A0 =C2=A0 |=
=C2=A0 3 +-<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf | 11 ----<br=
>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721s2-evm.conf=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0.../conf/machine/j721s2-hs-evm-k3r5.conf=C2=A0 =C2=A0 =C2=
=A0 | 11 ----<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721s2-hs-evm.conf=C2=A0 =C2=A0|=
=C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf | 11 ----<br=
>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j784s4-evm.conf=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0.../conf/machine/j784s4-hs-evm-k3r5.conf=C2=A0 =C2=A0 =C2=
=A0 | 11 ----<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j784s4-hs-evm.conf=C2=A0 =C2=A0|=
=C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/conf/multiconfig/k3r5.conf=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 10 ---<br>
&gt;=C2=A0 =C2=A0.../recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_git.=
bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a>=C2=A0 =C2=A0 =
|=C2=A0 3 -<br>
&gt;=C2=A0 =C2=A0.../u-boot/<a href=3D"http://tiboot3-staging_2023.5.bb" re=
l=3D"noreferrer" target=3D"_blank">tiboot3-staging_2023.5.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 65 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../recipes-bsp/u-boot/<a href=3D"http://u-boot-bb.org_git=
.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-bb.org_git.bb</a>=C2=A0 =
=C2=A0|=C2=A0 2 -<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=C2=A0 | 40 --=
----------<br>
&gt;=C2=A0 =C2=A044 files changed, 152 insertions(+), 303 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3=
r5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am62pxx-evm-k3=
r5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r=
5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-=
k3r5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am62xxsip-evm-=
k3r5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r=
5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am65xx-evm-k3r=
5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am65xx-hs-evm-=
k3r5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/beaglebone-ai6=
4-k3r5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/beagleplay-k3r=
5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/include/k3r5.i=
nc<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j7200-evm-k3r5=
.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j7200-hs-evm-k=
3r5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j721e-evm-k3r5=
.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j721e-hs-evm-k=
3r5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r=
5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j721s2-hs-evm-=
k3r5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r=
5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm-=
k3r5.conf<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5.conf<=
br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/<a href=
=3D"http://tiboot3-staging_2023.5.bb" rel=3D"noreferrer" target=3D"_blank">=
tiboot3-staging_2023.5.bb</a><br>
&gt; <br>
&gt; diff --git a/meta-ti-bsp/classes/ti-secdev.bbclass b/meta-ti-bsp/class=
es/ti-secdev.bbclass<br>
&gt; index b3d70e5c..18d15269 100644<br>
&gt; --- a/meta-ti-bsp/classes/ti-secdev.bbclass<br>
&gt; +++ b/meta-ti-bsp/classes/ti-secdev.bbclass<br>
&gt; @@ -2,14 +2,11 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# K3 SECDEV scripts use OpenSSL<br>
&gt;=C2=A0 =C2=A0DEPENDS:append:k3 =3D &quot; openssl-native&quot;<br>
&gt; -DEPENDS:append:k3r5 =3D &quot; openssl-native&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Use package version of TI SECDEV for K3 if one is not pr=
ovided through the environment<br>
&gt;=C2=A0 =C2=A0DEPENDS:append:k3 =3D &quot;${@ &#39;&#39; if d.getVar(&#3=
9;TI_SECURE_DEV_PKG_K3&#39;) else &#39; ti-k3-secdev-native&#39; }&quot;<br=
>
&gt; -DEPENDS:append:k3r5 =3D &quot;${@ &#39;&#39; if d.getVar(&#39;TI_SECU=
RE_DEV_PKG_K3&#39;) else &#39; ti-k3-secdev-native&#39; }&quot;<br>
&gt;=C2=A0 =C2=A0TI_K3_SECDEV_INSTALL_DIR =3D &quot;${STAGING_DIR_NATIVE}${=
datadir}/ti/ti-k3-secdev&quot;<br>
&gt;=C2=A0 =C2=A0TI_SECURE_DEV_PKG:k3 =3D &quot;${@ d.getVar(&#39;TI_SECURE=
_DEV_PKG_K3&#39;) or d.getVar(&#39;TI_K3_SECDEV_INSTALL_DIR&#39;) }&quot;<b=
r>
&gt; -TI_SECURE_DEV_PKG:k3r5 =3D &quot;${@ d.getVar(&#39;TI_SECURE_DEV_PKG_=
K3&#39;) or d.getVar(&#39;TI_K3_SECDEV_INSTALL_DIR&#39;) }&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# For non-K3 we require the SECDEV tools be provided throu=
gh the environment with the following vars<br>
&gt;=C2=A0 =C2=A0TI_SECURE_DEV_PKG:ti33x =3D &quot;${TI_SECURE_DEV_PKG_CAT}=
/am3x&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-=
bsp/conf/machine/am62axx-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 2af3317e..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: AM62A HS-FS EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI AM62A EVM (R5F core)<=
br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;am62ax&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;am62ax_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/c=
onf/machine/am62axx-evm.conf<br>
&gt; index 22f61401..59884629 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf<br>
&gt; @@ -14,4 +14,9 @@ KERNEL_DEVICETREE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-am62a7-sk.dtb \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;am62ax&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;am62ax_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;am62ax_evm_a53_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-=
bsp/conf/machine/am62pxx-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 36915381..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,12 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: AM62PX EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI AM62Px EVM (R5F core)=
<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -require conf/machine/include/ti-extras.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;am62px&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;am62px_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/c=
onf/machine/am62pxx-evm.conf<br>
&gt; index d7c9f589..116d819b 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf<br>
&gt; @@ -15,4 +15,9 @@ KERNEL_DEVICETREE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-am62p5-sk.dtb \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;am62px&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;am62px_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;am62px_evm_a53_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/am62xx-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 548369ca..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,12 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: AM62XX EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)=
<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -require conf/machine/include/ti-extras.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;am62x&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;am62x_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/co=
nf/machine/am62xx-evm.conf<br>
&gt; index fadbc6f4..6f234811 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf<br>
&gt; @@ -14,4 +14,9 @@ KERNEL_DEVICETREE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-am625-sk.dtb \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;am62x&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;am62x_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;am62x_evm_a53_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-t=
i-bsp/conf/machine/am62xx-lp-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index aa9422cd..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: AM62XX LP GP EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EVM (R5F=
 core)<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;am62x&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;am62x_lpsk_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp=
/conf/machine/am62xx-lp-evm.conf<br>
&gt; index 229b74bc..e33b60e2 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf<br>
&gt; @@ -16,4 +16,9 @@ KERNEL_DEVICETREE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-am62-lp-sk.dtb \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;am62x&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;am62x_lpsk_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;am62x_lpsk_a53_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-t=
i-bsp/conf/machine/am62xxsip-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 0daff2b9..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,16 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: AM62XX SIP EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI AM62xx SIP EVM (R5F c=
ore)<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;am62x&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;am62x_evm_r5_defconfig&quot;<br>
&gt; -<br>
&gt; -# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments wh=
ich has to be build<br>
&gt; -# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-b=
oot-mergeconfig.inc<br>
&gt; -# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.<br>
&gt; -UBOOT_CONFIG_FRAGMENTS =3D &quot;am62xsip_sk_r5.config&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp=
/conf/machine/am62xxsip-evm.conf<br>
&gt; index b5dd18f1..2e077f75 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf<br>
&gt; @@ -13,4 +13,14 @@ KERNEL_DEVICETREE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-am625-sk.dtb \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;am62x&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;am62x_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;am62x_evm_a53_defconfig&quot;<br>
&gt; +<br>
&gt; +# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments wh=
ich has to be build<br>
&gt; +# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-b=
oot-mergeconfig.inc<br>
&gt; +# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.<br>
&gt; +UBOOT_CONFIG_FRAGMENTS_R5 =3D &quot;am62xsip_sk_r5.config&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/am64xx-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index e932928a..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: AM64xx EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI AM64xx EVM (R5F core)=
<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;am64x_sr2&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;am64x_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am64xx-evm.conf b/meta-ti-bsp/co=
nf/machine/am64xx-evm.conf<br>
&gt; index c6ba2a87..dc21c174 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/am64xx-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/am64xx-evm.conf<br>
&gt; @@ -4,4 +4,9 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0require conf/machine/include/am64xx.inc<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;am64x_sr2&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;am64x_evm_a53_defconfig&quot;<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;am64x_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/am65xx-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 8744ac3e..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: AM65xx EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI AM65xx EVM (R5F core)=
<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;am65x_sr2&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;am65x_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf b/meta-ti-bsp/co=
nf/machine/am65xx-evm.conf<br>
&gt; index f6eb6f0c..9b050b03 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/am65xx-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf<br>
&gt; @@ -4,6 +4,11 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0require conf/machine/include/am65xx.inc<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;am65x_sr2&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;am65x_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;am65x_evm_a53_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D &quot;prueth-fw-a=
m65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-t=
i-bsp/conf/machine/am65xx-hs-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 337c8413..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: AM65xx HS EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F co=
re)<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;am65x_sr2&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;hs&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;am65x_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp=
/conf/machine/am65xx-hs-evm.conf<br>
&gt; index f8221f31..4164ae53 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf<br>
&gt; @@ -4,4 +4,9 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0require conf/machine/include/am65xx.inc<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;am65x_sr2&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;hs&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;am65x_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;am65x_evm_a53_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta=
-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index b893f380..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,17 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: BeagleBone AI-64 (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (R5F co=
re)<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;j721e&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; -<br>
&gt; -SPL_BINARY =3D &quot;spl/u-boot-spl.${UBOOT_SUFFIX}&quot;<br>
&gt; -SPL_SYMLINK =3D &quot;u-boot-r5spl.${UBOOT_SUFFIX}&quot;<br>
&gt; -UBOOT_BINARY =3D &quot;tiboot3.${UBOOT_SUFFIX}&quot;<br>
&gt; -UBOOT_IMAGE =3D &quot;tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFF=
IX}&quot;<br>
&gt; -UBOOT_SYMLINK =3D &quot;tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}&quot;<=
br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;j721e_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-b=
sp/conf/machine/beaglebone-ai64.conf<br>
&gt; index e529f565..bad86a22 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf<br>
&gt; @@ -4,6 +4,11 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0require conf/machine/include/j721e.inc<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;j721e&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;j721e_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;j721e_evm_a72_config&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PREFERRED_PROVIDER_virtual/kernel =3D &quot;<a href=3D"htt=
p://linux-bb.org" rel=3D"noreferrer" target=3D"_blank">linux-bb.org</a>&quo=
t;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-b=
sp/conf/machine/beagleplay-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index c40615c9..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,14 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: BeaglePlay (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the BeaglePlay (R5F core)<br=
>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -PREFERRED_PROVIDER_virtual/bootloader =3D &quot;<a href=3D"http://u-b=
oot-bb.org" rel=3D"noreferrer" target=3D"_blank">u-boot-bb.org</a>&quot;<br=
>
&gt; -PREFERRED_PROVIDER_u-boot =3D &quot;<a href=3D"http://u-boot-bb.org" =
rel=3D"noreferrer" target=3D"_blank">u-boot-bb.org</a>&quot;<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;am62x&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;am62x_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/co=
nf/machine/beagleplay.conf<br>
&gt; index ac4a202a..312fc503 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/beagleplay.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/beagleplay.conf<br>
&gt; @@ -18,6 +18,11 @@ TFA_K3_SYSTEM_SUSPEND =3D &quot;1&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0OPTEEMACHINE =3D &quot;k3-am62x&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;am62x&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;am62x_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;am62x_evm_a53_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PREFERRED_PROVIDER_virtual/kernel =3D &quot;<a href=3D"htt=
p://linux-bb.org" rel=3D"noreferrer" target=3D"_blank">linux-bb.org</a>&quo=
t;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/con=
f/machine/include/k3.inc<br>
&gt; index 2415f0ba..84feee08 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/include/k3.inc<br>
&gt; +++ b/meta-ti-bsp/conf/machine/include/k3.inc<br>
&gt; @@ -5,8 +5,6 @@ SOC_FAMILY:append =3D &quot;:k3&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0require conf/machine/include/arm/arch-arm64.inc<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -BBMULTICONFIG +=3D &quot;k3r5&quot;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0# Increase this everytime you change something in the kern=
el<br>
&gt;=C2=A0 =C2=A0MACHINE_KERNEL_PR =3D &quot;r0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -62,7 +60,7 @@ MACHINE_FEATURES +=3D &quot;efi&quot;<br>
&gt;=C2=A0 =C2=A0WKS_FILE ?=3D &quot;${@bb.utils.contains(&quot;MACHINE_FEA=
TURES&quot;, &quot;efi&quot;, &quot;<a href=3D"http://sdimage-2part-efi.wks=
.in" rel=3D"noreferrer" target=3D"_blank">sdimage-2part-efi.wks.in</a>&quot=
;, &quot;sdimage-2part.wks&quot;, d)}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_image_wic[depends] +=3D &quot;virtual/bootloader:do_dep=
loy&quot;<br>
&gt; -do_image[mcdepends] +=3D &quot;mc::k3r5:virtual/bootloader:do_deploy&=
quot;<br>
&gt; +do_image[depends] +=3D &quot;tiboot3-staging:do_deploy&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SERIAL_CONSOLES =3D &quot;115200;ttyS0 115200;ttyS2&quot;<=
br>
&gt;=C2=A0 =C2=A0SERIAL_CONSOLES_CHECK =3D &quot;${SERIAL_CONSOLES}&quot;<b=
r>
&gt; diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/c=
onf/machine/include/k3r5.inc<br>
&gt; deleted file mode 100644<br>
&gt; index 63267a5e..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/include/k3r5.inc<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,27 +0,0 @@<br>
&gt; -# TI K3 Armv7 profile for Cortex-R5F cores<br>
&gt; -<br>
&gt; -require conf/machine/include/ti-soc.inc<br>
&gt; -SOC_FAMILY:append =3D &quot;:k3r5&quot;<br>
&gt; -<br>
&gt; -# The closest of existing tunes for Cortex-R5F<br>
&gt; -DEFAULTTUNE =3D &quot;armv7athf&quot;<br>
&gt; -require conf/machine/include/arm/armv7a/tune-cortexa8.inc<br>
&gt; -<br>
&gt; -# R5 runs early bootloader and loads SYSFW<br>
&gt; -# <a href=3D"https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/boa=
rd/ti/j721e_evm.rst" rel=3D"noreferrer" target=3D"_blank">https://git.ti.co=
m/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_evm.rst</a><br>
&gt; -# <a href=3D"https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/boa=
rd/ti/am62x_sk.rst" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com=
/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/am62x_sk.rst</a><br>
&gt; -# <a href=3D"https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/boa=
rd/ti/k3.rst" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/cgit/=
ti-u-boot/ti-u-boot/tree/doc/board/ti/k3.rst</a><br>
&gt; -PREFERRED_PROVIDER_virtual/kernel =3D &quot;linux-dummy&quot;<br>
&gt; -PREFERRED_PROVIDER_virtual/bootloader ?=3D &quot;u-boot-ti-staging&qu=
ot;<br>
&gt; -PREFERRED_PROVIDER_u-boot ?=3D &quot;u-boot-ti-staging&quot;<br>
&gt; -<br>
&gt; -SPL_SUFFIX =3D &quot;bin&quot;<br>
&gt; -SPL_BINARY =3D &quot;tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CON=
FIG}.${SPL_SUFFIX}&quot;<br>
&gt; -SPL_SYMLINK =3D &quot;tiboot3.${SPL_SUFFIX}&quot;<br>
&gt; -UBOOT_SUFFIX =3D &quot;bin&quot;<br>
&gt; -UBOOT_BINARY =3D &quot;u-boot-r5spl.${UBOOT_SUFFIX}&quot;<br>
&gt; -UBOOT_IMAGE =3D &quot;u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT=
_SUFFIX}&quot;<br>
&gt; -UBOOT_SYMLINK =3D &quot;u-boot-r5spl-${MAINMACHINE}.${UBOOT_SUFFIX}&q=
uot;<br>
&gt; -<br>
&gt; -PACKAGECONFIG:pn-u-boot-ti-staging =3D &quot;&quot;<br>
&gt; -PACKAGECONFIG:pn-u-boot-ti-mainline =3D &quot;&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf b/meta-ti-bs=
p/conf/machine/j7200-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 68061883..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: J7200 EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI J7200 EVM (R5F core)<=
br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;j7200&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;j7200_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/con=
f/machine/j7200-evm.conf<br>
&gt; index dff1da69..e733d15a 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/j7200-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/j7200-evm.conf<br>
&gt; @@ -10,4 +10,9 @@ KERNEL_DEVICETREE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-j7200-common-proc-board.dtb \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;j7200&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;j7200_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;j7200_evm_a72_config&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf b/meta-ti=
-bsp/conf/machine/j7200-hs-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 1922d5c8..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: J7200 HS EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM (R5F cor=
e)<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;j7200_sr2&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;hs&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;j7200_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf b/meta-ti-bsp/=
conf/machine/j7200-hs-evm.conf<br>
&gt; index 54fd2b4a..fc33106c 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf<br>
&gt; @@ -4,4 +4,9 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0require conf/machine/j7200-evm.conf<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;j7200_sr2&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;hs&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;j7200_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;j7200_evm_a72_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf b/meta-ti-bs=
p/conf/machine/j721e-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 070bf7aa..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: J721e EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI J721e EVM (R5F core)<=
br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;j721e&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;j721e_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/con=
f/machine/j721e-evm.conf<br>
&gt; index 5e1f6dca..ca23e3e3 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/j721e-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/j721e-evm.conf<br>
&gt; @@ -15,4 +15,9 @@ KERNEL_DEVICETREE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-j721e-sk.dtb \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;j721e&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;j721e_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;j721e_evm_a72_config&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti=
-bsp/conf/machine/j721e-hs-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 7904c660..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: J721e HS EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI J721e HS EVM (R5F cor=
e)<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;j721e_sr1_1&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;hs&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;j721e_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/=
conf/machine/j721e-hs-evm.conf<br>
&gt; index 441ca169..3d4bedb6 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf<br>
&gt; @@ -4,4 +4,5 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0require conf/machine/j721e-evm.conf<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -UBOOT_MACHINE =3D &quot;j721e_evm_a72_defconfig&quot;<br>
&gt; +SYSFW_SOC =3D &quot;j721e_sr1_1&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;hs&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/j721s2-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 508e96e5..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: J721S2 EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI J721S2 EVM (R5F core)=
<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;j721s2&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;j721s2_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/co=
nf/machine/j721s2-evm.conf<br>
&gt; index ecb1836f..63d86af0 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf<br>
&gt; @@ -18,4 +18,9 @@ KERNEL_DEVICETREE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-j721s2-common-proc-board.dtb \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;j721s2&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;j721s2_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;j721s2_evm_a72_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf b/meta-t=
i-bsp/conf/machine/j721s2-hs-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 58cd92c4..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: J721S2 HS EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (R5F co=
re)<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;j721s2&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;hs&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;j721s2_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp=
/conf/machine/j721s2-hs-evm.conf<br>
&gt; index 4cf32a28..1129a189 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf<br>
&gt; @@ -3,3 +3,5 @@<br>
&gt;=C2=A0 =C2=A0#@DESCRIPTION: Machine configuration for the TI J721S2 HS =
EVM<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0require conf/machine/j721s2-evm.conf<br>
&gt; +<br>
&gt; +SYSFW_SUFFIX =3D &quot;hs&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/j784s4-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 04feebc6..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: J784S4 EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI J784S4 EVM (R5F core)=
<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;j784s4&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;j784s4_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/co=
nf/machine/j784s4-evm.conf<br>
&gt; index 40a63651..a242ef8a 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf<br>
&gt; @@ -18,4 +18,9 @@ KERNEL_DEVICETREE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-j784s4-evm.dtb \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SYSFW_SOC =3D &quot;j784s4&quot;<br>
&gt; +SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; +SYSFW_SUFFIX =3D &quot;gp&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE_R5 =3D &quot;j784s4_evm_r5_defconfig&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;j784s4_evm_a72_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf b/meta-t=
i-bsp/conf/machine/j784s4-hs-evm-k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 80a228a0..00000000<br>
&gt; --- a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -#@TYPE: Machine<br>
&gt; -#@NAME: J784S4 HS EVM (R5F)<br>
&gt; -#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F co=
re)<br>
&gt; -<br>
&gt; -require conf/machine/include/k3r5.inc<br>
&gt; -<br>
&gt; -SYSFW_SOC =3D &quot;j784s4&quot;<br>
&gt; -SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; -SYSFW_SUFFIX =3D &quot;hs&quot;<br>
&gt; -<br>
&gt; -UBOOT_MACHINE =3D &quot;j784s4_evm_r5_defconfig&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp=
/conf/machine/j784s4-hs-evm.conf<br>
&gt; index 8fa1c1fd..42468088 100644<br>
&gt; --- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf<br>
&gt; +++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf<br>
&gt; @@ -3,3 +3,5 @@<br>
&gt;=C2=A0 =C2=A0#@DESCRIPTION: Machine configuration for the TI J784S4 HS =
EVM<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0require conf/machine/j784s4-evm.conf<br>
&gt; +<br>
&gt; +SYSFW_SUFFIX =3D &quot;hs&quot;<br>
&gt; diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf=
/multiconfig/k3r5.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 936bce2f..00000000<br>
&gt; --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,10 +0,0 @@<br>
&gt; -MAINMACHINE :=3D &quot;${MACHINE}&quot;<br>
&gt; -<br>
&gt; -DEPLOY_DIR_IMAGE:k3r5 =3D &quot;${TI_COMMON_DEPLOY}/images/${MAINMACH=
INE}&quot;<br>
&gt; -<br>
&gt; -MACHINE:append =3D &quot;-k3r5&quot;<br>
&gt; -TCLIBC =3D &quot;baremetal&quot;<br>
&gt; -TI_TMPDIR_APPEND ?=3D &quot;-k3r5&quot;<br>
&gt; -TMPDIR:append =3D &quot;${TI_TMPDIR_APPEND}&quot;<br>
&gt; -<br>
&gt; -SDKPKGSUFFIX =3D &quot;k3r5-nativesdk&quot;<br>
&gt; diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sc=
i-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a> b/me=
ta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_git.bb" rel=3D"=
noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a><br>
&gt; index 12292c88..0597d9bb 100644<br>
&gt; --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a><br>
&gt; +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a><br>
&gt; @@ -17,9 +17,6 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_deploy(){<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_deploy:k3r5() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${DEPLOYDIR}/ti-sysfw<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/ti-sysfw/ti-sci-firmware=
-* ${DEPLOYDIR}/ti-sysfw<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/ti-sysfw/ti-fs-firmware-=
* ${DEPLOYDIR}/ti-sysfw<br>
&gt; diff --git a/meta-ti-bsp/recipes-bsp/u-boot/<a href=3D"http://tiboot3-=
staging_2023.5.bb" rel=3D"noreferrer" target=3D"_blank">tiboot3-staging_202=
3.5.bb</a> b/meta-ti-bsp/recipes-bsp/u-boot/<a href=3D"http://tiboot3-stagi=
ng_2023.5.bb" rel=3D"noreferrer" target=3D"_blank">tiboot3-staging_2023.5.b=
b</a><br>
&gt; new file mode 100644<br>
&gt; index 00000000..0f1929b5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-ti-bsp/recipes-bsp/u-boot/<a href=3D"http://tiboot3-staging=
_2023.5.bb" rel=3D"noreferrer" target=3D"_blank">tiboot3-staging_2023.5.bb<=
/a><br>
&gt; @@ -0,0 +1,65 @@<br>
&gt; +require u-boot-ti.inc<br>
&gt; +<br>
&gt; +include ${@ &#39;recipes-bsp/u-boot/ti-extras.inc&#39; if d.getVar(&#=
39;TI_EXTRAS&#39;) else &#39;&#39;}<br>
&gt; +<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt; +BRANCH =3D &quot;ti-u-boot-2023.04&quot;<br>
&gt; +SRCREV =3D &quot;b0d717b732ee28e446baf94522b3491e590f7fbb&quot;<br>
&gt; +<br>
&gt; +PROVIDES:remove =3D &quot;virtual/bootloader&quot;<br>
&gt; +PROVIDES:remove =3D &quot;u-boot&quot;<br>
&gt; +<br>
&gt; +# Using gcc-cross-arm-native here would have been ideal<br>
&gt; +# as the compiler version would match between R5 and<br>
&gt; +# main ARM core builds. arm-oe-linux-gnueabi-<br>
&gt; +DEPENDS +=3D &quot;gcc-arm-none-eabi-native&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE +=3D &quot;CROSS_COMPILE=3Darm-none-eabi- CC=3Darm-none-=
eabi-gcc&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE =3D &quot;${UBOOT_MACHINE_R5}&quot;<br>
&gt; +<br>
&gt; +SPL_SUFFIX =3D &quot;bin&quot;<br>
&gt; +SPL_BINARY =3D &quot;tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CON=
FIG}.${SPL_SUFFIX}&quot;<br>
&gt; +SPL_SYMLINK =3D &quot;tiboot3.${SPL_SUFFIX}&quot;<br>
&gt; +UBOOT_SUFFIX =3D &quot;bin&quot;<br>
&gt; +UBOOT_BINARY =3D &quot;u-boot-r5spl.${UBOOT_SUFFIX}&quot;<br>
&gt; +UBOOT_IMAGE =3D &quot;u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT=
_SUFFIX}&quot;<br>
&gt; +UBOOT_SYMLINK =3D &quot;u-boot-r5spl-${MAINMACHINE}.${UBOOT_SUFFIX}&q=
uot;<br>
&gt; +<br>
&gt; +do_compile:append () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ -n &quot;${UBOOT_CONFIG}&quot; ];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for config in ${UBOOT=
_MACHINE}; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0i=3D$(expr $i + 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0for type in ${UBOOT_CONFIG}; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j=3D$(expr $j + 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $j -eq $i ];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ! [ -L ${=
B}/${config}/${UBOOT_BINARY} ] &amp;&amp; ! [ -f ${B}/${config}/${UBOOT_BIN=
ARY} ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/$=
{config}/${UBOOT_BINARY}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0unset=C2=A0 j<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset=C2=A0 i<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ! [ -f ${B}/${UBOO=
T_BINARY} ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_deploy:append () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for f in ${B}/tiboot3-*.bin; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f &quot;$f&quot=
; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0install -m 644 $f ${DEPLOYDIR}/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0done<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for f in ${B}/sysfw*.itb; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f &quot;$f&quot=
; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0install -m 644 $f ${DEPLOYDIR}/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0done<br>
&gt; +}<br>
&gt; diff --git a/meta-ti-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot-b=
b.org_git.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-bb.org_git.bb</a>=
 b/meta-ti-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot-bb.org_git.bb" r=
el=3D"noreferrer" target=3D"_blank">u-boot-bb.org_git.bb</a><br>
&gt; index 5bb20213..1ec5f9bf 100644<br>
&gt; --- a/meta-ti-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot-bb.org_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-bb.org_git.bb</a><br>
&gt; +++ b/meta-ti-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot-bb.org_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-bb.org_git.bb</a><br>
&gt; @@ -12,6 +12,4 @@ BRANCH =3D &quot;v2023.04-ti-09.00.00.011&quot;<br>
&gt;=C2=A0 =C2=A0SRCREV =3D &quot;4b8f8be8870f03d92a2b01d0d30ab912118adc82&=
quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0BRANCH:beagleplay =3D &quot;v2023.04-ti-09.00.00.011-Beagl=
ePlay&quot;<br>
&gt; -BRANCH:beagleplay-k3r5 =3D &quot;v2023.04-ti-09.00.00.011-BeaglePlay&=
quot;<br>
&gt;=C2=A0 =C2=A0SRCREV:beagleplay =3D &quot;10afea462ea1113701f6f0f8853fdf=
f985aa275d&quot;<br>
&gt; -SRCREV:beagleplay-k3r5 =3D &quot;10afea462ea1113701f6f0f8853fdff985aa=
275d&quot;<br>
&gt; diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bs=
p/recipes-bsp/u-boot/u-boot-ti.inc<br>
&gt; index 2f15c4fb..b0f88a5a 100644<br>
&gt; --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc<br>
&gt; +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc<br>
&gt; @@ -31,7 +31,6 @@ DEPENDS +=3D &quot;python3-pyelftools-native python3=
-pyyaml-native python3-jsonschema-n<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# SYSFW/TIFS Firmware<br>
&gt;=C2=A0 =C2=A0DEPENDS:append:k3 =3D &quot; ti-sci-fw&quot;<br>
&gt; -DEPENDS:append:k3r5 =3D &quot; ti-sci-fw&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0DM_FIRMWARE =3D &quot;ipc_echo_testb_mcu1_0_release_strip.=
xer5f&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -79,7 +78,6 @@ SYSROOT_DIRS +=3D &quot;/boot&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# SPL (Second Program Loader) to be loaded over UART<br>
&gt;=C2=A0 =C2=A0SPL_UART_BINARY =3D &quot;u-boot-spl.bin&quot;<br>
&gt; -SPL_UART_BINARY:k3r5 =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SPL_UART_IMAGE ?=3D &quot;${SPL_UART_BINARY}-${MACHINE}-${=
PV}-${PR}&quot;<br>
&gt;=C2=A0 =C2=A0SPL_UART_SYMLINK ?=3D &quot;${SPL_UART_BINARY}-${MACHINE}&=
quot;<br>
&gt; @@ -108,30 +106,6 @@ UBOOT_HS_2ND_BINARY =3D &quot;u-boot-spl_HS_2ND&q=
uot;<br>
&gt;=C2=A0 =C2=A0UBOOT_HS_2ND_IMAGE =3D &quot;u-boot-spl_HS_2ND-${MACHINE}-=
${PV}-${PR}&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_HS_2ND_SYMLINK =3D &quot;u-boot-spl_HS_2ND-${MACHINE=
}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -do_compile:append:k3r5 () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ -n &quot;${UBOOT_CONFIG}&quot; ];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for config in ${UBOOT=
_MACHINE}; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0i=3D$(expr $i + 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0for type in ${UBOOT_CONFIG}; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j=3D$(expr $j + 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $j -eq $i ];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ! [ -L ${=
B}/${config}/${UBOOT_BINARY} ] &amp;&amp; ! [ -f ${B}/${config}/${UBOOT_BIN=
ARY} ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/$=
{config}/${UBOOT_BINARY}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0done<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0unset=C2=A0 j<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset=C2=A0 i<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ! [ -f ${B}/${UBOO=
T_BINARY} ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${UBOOT_CONFIG}&quot; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
&gt; @@ -204,20 +178,6 @@ do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -do_deploy:append:k3r5 () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for f in ${B}/tiboot3-*.bin; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f &quot;$f&quot=
; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0install -m 644 $f ${DEPLOYDIR}/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for f in ${B}/sysfw*.itb; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f &quot;$f&quot=
; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0install -m 644 $f ${DEPLOYDIR}/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0do_deploy:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${UBOOT_CONFIG}&quot; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#17353): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17353" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/17353</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/103283292/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/103283292/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/leave/1136=
9865/5052612/926574700/xyzzy" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-ti/leave/11369865/5052612/926574700/xyzzy</a>=
 [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jos=
e@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000006c10cc060cf3af51--


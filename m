Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A36C6FD20
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:26:48 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web11.23446.1679426799539637484
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 12:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XZht5v4J;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id s23so11065497uae.5
        for <meta-ti@lists.yoctoproject.org>; Tue, 21 Mar 2023 12:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679426798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b1XujxEowUoCOOzyiYjoNAidOWKXsoXKIYu9XzUmqXw=;
        b=XZht5v4JaiNONSZ88iJ/GfNfSh9euaFMsCzaY0fOrXiYDcVGVe1cKZo+ymzjrvAJSz
         Q/nxAmT9ugYlsg1Bo7kwBDLVE2UKIY+5f4AqDL45BjQAf5B3X95kxnRvBOp42WBH1nwn
         LYiFPzC01o+Xkt7sgl55Po3BzqQ9onvhRANiuC6TSDChnWhrd5RAcADI1ysgbxBkL9ZM
         yljzrx8Z4CKER9BwDZQWQLkHoy77MVZb0Q5yl9hjj8e9P+RfAKxqjjqX80AyM5rnHov9
         2kivOSvAIwNzyKRflsnd0cigaTZ6eM7BQlxAMK22iiuVBgDJDAJmaj4cgG4+LZw1sWAh
         xC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679426798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1XujxEowUoCOOzyiYjoNAidOWKXsoXKIYu9XzUmqXw=;
        b=2pf6Vppuacr4LNva5Ei8QBVMU/rw2HVrLdlsKtK6n/TCFQ9JBfAub/0IPMZPV3A9iA
         hd0IIWKElBIhzfm2C9Pusag0fwdTM/ymNH34bv/woTL+VRbTLfQE2i4x+Cql2uWsA640
         Tm+95TGrlZ+ftN6fwcdbYZH8XYpAJkBDQnDLW9KYOgEawrA6jW+5dbup/wW2c4jmIZ48
         bWgt4sL0aJsRTLKBCeLB2eVfIzMDRJtJEEGLKHHJ/cqTH2lAYHDqZ5THZWo3Y7U7dY8v
         HEGEON3vi7FvLMJuzRyRj6BrPZLRhI1hguJGgg2wRCyrinUmGTNw7M9e9jBlspF7IwHm
         gutQ==
X-Gm-Message-State: AAQBX9cAv5vjpU+8iUElnykMtECuUI9XkeVwazA9lW9nP6x2SW3ATOHM
	1AhTtN0vFkjVd7GlwZRL8RGxtmCPKbZYUmwy2ng=
X-Google-Smtp-Source: AKy350aYPf4iK5Z2+4M2akIQ+6jTSfbfXV65xEdRPrBjLRgEdiEdKfswWik0GN4oLuM/Iy6831jnnwd7R+rMXzYWudI=
X-Received: by 2002:ab0:3d10:0:b0:68a:702a:2494 with SMTP id
 f16-20020ab03d10000000b0068a702a2494mr1214672uax.0.1679426798380; Tue, 21 Mar
 2023 12:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230321110742.26379-1-p-bhagat@ti.com>
In-Reply-To: <20230321110742.26379-1-p-bhagat@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 21 Mar 2023 19:26:27 +0000
Message-ID: <CANPvuRmOgTPzzwk-HOXXOQpXRM6sT=BgPpjVUe6EBNVyG=qA=g@mail.gmail.com>
Subject: Re: [meta-ti][dunfell/kirkstone][PATCH] Support building for AM65x
 SR2.0 & SR1.0 HS & GP with am65xx-evm machine
To: p-bhagat@ti.com
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, denis@denix.org, 
	reatmon@ti.com, c-shilwant@ti.com, g-gupta@ti.com, s-adivi@ti.com
Content-Type: multipart/alternative; boundary="000000000000be6c2105f76e05ab"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:26:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16224

--000000000000be6c2105f76e05ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This patch uses the old bitbake syntax so they won't work on kikstone.

Jose

Paresh Bhagat via lists.yoctoproject.org <p-bhagat=3D
ti.com@lists.yoctoproject.org> escreveu no dia ter=C3=A7a, 21/03/2023 =C3=
=A0(s) 11:08:

> From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
> - multiconfig, conf:
>     - Add new multiconfig file to build for K3R5F SR2 GP devices
>     - Update the am65xx-evm conf files to build both HS and GP for
>       AM65x SR2.0. SR1.0 and keep SR2.0 HS sysfw.itb as default.
>     - Remove am65xx-hs-evm conf files since am65xx-evm will build both
>       GP and HS.
> - optee: Sign optee for am65xx-evm to support HS builds
> - ATF: Sign ATF for am65xx-evm to support HS builds
> - ti-sci-fw: Add SYSFW_SUFFIX to SYSFW_BINARY name to differentiate
>   between GP and HS binaries.
>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  conf/machine/am65xx-evm-k3r5-gp.conf          | 13 +++++++
>  conf/machine/am65xx-evm-k3r5-hs-se.conf       | 13 +++++++
>  ...-k3r5.conf =3D> am65xx-evm-k3r5-sr2-gp.conf} |  4 +--
>  ...r2.conf =3D> am65xx-evm-k3r5-sr2-hs-se.conf} |  4 ++-
>  conf/machine/am65xx-hs-evm-k3r5-sr2.conf      | 11 ------
>  conf/machine/am65xx-hs-evm-k3r5.conf          | 18 ----------
>  conf/machine/am65xx-hs-evm.conf               | 11 ------
>  conf/machine/include/am65xx.inc               | 30 +++++++++++-----
>  conf/multiconfig/k3r5-sr2-gp.conf             |  3 ++
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 34 +++++++++----------
>  .../trusted-firmware-a_%.bbappend             |  2 +-
>  recipes-security/optee/optee-os_%.bbappend    |  2 +-
>  12 files changed, 74 insertions(+), 71 deletions(-)
>  create mode 100644 conf/machine/am65xx-evm-k3r5-gp.conf
>  create mode 100644 conf/machine/am65xx-evm-k3r5-hs-se.conf
>  rename conf/machine/{am65xx-evm-k3r5.conf =3D> am65xx-evm-k3r5-sr2-gp.co=
nf}
> (87%)
>  rename conf/machine/{am65xx-evm-k3r5-sr2.conf =3D>
> am65xx-evm-k3r5-sr2-hs-se.conf} (80%)
>  delete mode 100644 conf/machine/am65xx-hs-evm-k3r5-sr2.conf
>  delete mode 100644 conf/machine/am65xx-hs-evm-k3r5.conf
>  delete mode 100644 conf/machine/am65xx-hs-evm.conf
>  create mode 100644 conf/multiconfig/k3r5-sr2-gp.conf
>
> diff --git a/conf/machine/am65xx-evm-k3r5-gp.conf
> b/conf/machine/am65xx-evm-k3r5-gp.conf
> new file mode 100644
> index 00000000..c67699ac
> --- /dev/null
> +++ b/conf/machine/am65xx-evm-k3r5-gp.conf
> @@ -0,0 +1,13 @@
> +#@TYPE: Machine
> +#@NAME: AM65xx SR1.0 EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM65xx SR1.0 EVM (R5F
> core)
> +
> +# Booting SR1 requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/am65xx-evm-k3r5-sr2-gp.conf
> +SOC_FAMILY_append =3D ":k3r5"
> +
> +SYSFW_SUFFIX =3D "gp"
> +SYSFW_SOC =3D "am65x"
> +SYSFW_SYMLINK =3D ""
> +
> diff --git a/conf/machine/am65xx-evm-k3r5-hs-se.conf
> b/conf/machine/am65xx-evm-k3r5-hs-se.conf
> new file mode 100644
> index 00000000..6060de85
> --- /dev/null
> +++ b/conf/machine/am65xx-evm-k3r5-hs-se.conf
> @@ -0,0 +1,13 @@
> +#@TYPE: Machine
> +#@NAME: AM65xx SR1.0 EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM65xx SR1.0 EVM (R5F
> core)
> +
> +# Booting SR1 requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/am65xx-evm-k3r5-sr2-gp.conf
> +SOC_FAMILY_append =3D ":k3r5"
> +
> +SYSFW_SUFFIX =3D "hs"
> +SYSFW_SOC =3D "am65x"
> +SYSFW_SYMLINK =3D ""
> +
> diff --git a/conf/machine/am65xx-evm-k3r5.conf
> b/conf/machine/am65xx-evm-k3r5-sr2-gp.conf
> similarity index 87%
> rename from conf/machine/am65xx-evm-k3r5.conf
> rename to conf/machine/am65xx-evm-k3r5-sr2-gp.conf
> index a484e444..31ca807a 100644
> --- a/conf/machine/am65xx-evm-k3r5.conf
> +++ b/conf/machine/am65xx-evm-k3r5-sr2-gp.conf
> @@ -4,7 +4,7 @@
>
>  require conf/machine/include/k3r5.inc
>
> -SYSFW_SOC =3D "am65x"
> +SYSFW_SOC =3D "am65x_sr2"
>  SYSFW_CONFIG =3D "evm"
>  SYSFW_SUFFIX =3D "gp"
>  SYSFW_SYMLINK =3D ""
> @@ -15,4 +15,4 @@ UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
>  UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>  UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
>
> -UBOOT_MACHINE =3D "am65x_evm_r5_defconfig"
> +UBOOT_MACHINE =3D "am65x_hs_evm_r5_defconfig"
> diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf
> b/conf/machine/am65xx-evm-k3r5-sr2-hs-se.conf
> similarity index 80%
> rename from conf/machine/am65xx-evm-k3r5-sr2.conf
> rename to conf/machine/am65xx-evm-k3r5-sr2-hs-se.conf
> index c0b3cd51..cf127029 100644
> --- a/conf/machine/am65xx-evm-k3r5-sr2.conf
> +++ b/conf/machine/am65xx-evm-k3r5-sr2-hs-se.conf
> @@ -4,8 +4,10 @@
>
>  # Booting SR2 requires different SYSFW, the rest is handled at runtime
>
> -require conf/machine/am65xx-evm-k3r5.conf
> +require conf/machine/am65xx-evm-k3r5-sr2-gp.conf
>  SOC_FAMILY_append =3D ":k3r5-sr2"
>
> +SYSFW_SUFFIX =3D "hs"
>  SYSFW_SOC =3D "am65x_sr2"
>  SYSFW_SYMLINK =3D "sysfw.itb"
> +
> diff --git a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> deleted file mode 100644
> index ef1b6fbe..00000000
> --- a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM65xx SR2.0 HS EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI AM65xx SR2.0 HS EVM (R5F
> core)
> -
> -# Booting SR2 requires different SYSFW, the rest is handled at runtime
> -
> -require conf/machine/am65xx-hs-evm-k3r5.conf
> -SOC_FAMILY_append =3D ":k3r5-sr2"
> -
> -SYSFW_SOC =3D "am65x_sr2"
> -SYSFW_SYMLINK =3D "sysfw.itb"
> diff --git a/conf/machine/am65xx-hs-evm-k3r5.conf
> b/conf/machine/am65xx-hs-evm-k3r5.conf
> deleted file mode 100644
> index d9041c9d..00000000
> --- a/conf/machine/am65xx-hs-evm-k3r5.conf
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM65xx HS EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)
> -
> -require conf/machine/include/k3r5.inc
> -
> -SYSFW_SOC =3D "am65x"
> -SYSFW_CONFIG =3D "evm"
> -SYSFW_SUFFIX =3D "hs"
> -SYSFW_SYMLINK =3D ""
> -
> -SPL_BINARY =3D "spl/u-boot-spl.${UBOOT_SUFFIX}"
> -SPL_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
> -UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
> -UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> -UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> -
> -UBOOT_MACHINE =3D "am65x_hs_evm_r5_defconfig"
> diff --git a/conf/machine/am65xx-hs-evm.conf
> b/conf/machine/am65xx-hs-evm.conf
> deleted file mode 100644
> index 2c1256d0..00000000
> --- a/conf/machine/am65xx-hs-evm.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM65xx HS EVM
> -#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM
> -
> -require conf/machine/include/am65xx.inc
> -
> -UBOOT_MACHINE =3D "am65x_hs_evm_a53_defconfig"
> -
> -SPL_BINARY =3D "tispl.bin_HS"
> -UBOOT_BINARY =3D "u-boot.img_HS"
> -UBOOT_SYMLINK =3D "u-boot.img"
> diff --git a/conf/machine/include/am65xx.inc
> b/conf/machine/include/am65xx.inc
> index b70d212f..958cbc8a 100644
> --- a/conf/machine/include/am65xx.inc
> +++ b/conf/machine/include/am65xx.inc
> @@ -20,16 +20,28 @@ KERNEL_DEVICETREE =3D " \
>      ti/k3-am654-evm-ov5640.dtbo \
>  "
>
> -BBMULTICONFIG +=3D "k3r5-sr2"
> -
> -# Since J721e does not support multi-cert tiboot3.bin add standalone
> sysfw.itb
> +BBMULTICONFIG =3D "k3r5-sr2-hs-se"
>  IMAGE_BOOT_FILES +=3D "sysfw.itb"
> -
> -# Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
> -IMAGE_BOOT_FILES +=3D "sysfw-am65x-evm.itb"
> -
> -do_image_wic[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
> +do_image_wic[mcdepends] =3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] =3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
> +
> +BBMULTICONFIG +=3D "k3r5-hs-se"
> +IMAGE_BOOT_FILES +=3D "sysfw-am65x-hs-evm.itb"
> +do_image_wic[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> +
> +BBMULTICONFIG +=3D "k3r5-gp"
> +IMAGE_BOOT_FILES +=3D "sysfw-am65x-gp-evm.itb"
> +do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +
> +
> +BBMULTICONFIG +=3D "k3r5-sr2-gp"
> +IMAGE_BOOT_FILES +=3D "sysfw-am65x_sr2-gp-evm.itb"
> +do_image_wic[mcdepends] +=3D "mc::k3r5-sr2-gp:u-boot-ti-staging:do_deplo=
y"
> +do_image_tar[mcdepends] +=3D "mc::k3r5-sr2-gp:u-boot-ti-staging:do_deplo=
y"
> +do_image_wic[mcdepends] +=3D "mc::k3r5-sr2-gp:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] +=3D "mc::k3r5-sr2-gp:ti-sci-fw:do_deploy"
>
>  OPTEEMACHINE =3D "k3-am65x"
>  OPTEEOUTPUTMACHINE =3D "k3"
> diff --git a/conf/multiconfig/k3r5-sr2-gp.conf
> b/conf/multiconfig/k3r5-sr2-gp.conf
> new file mode 100644
> index 00000000..fae89bd3
> --- /dev/null
> +++ b/conf/multiconfig/k3r5-sr2-gp.conf
> @@ -0,0 +1,3 @@
> +require k3r5-sr2.conf
> +
> +MACHINE_append =3D "-gp"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 80c0b890..6503e964 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -2,10 +2,10 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  require recipes-ti/includes/ti-paths.inc
>
>  DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native
> virtual/bootloader"
> -DEPENDS_remove_am65xx-evm-k3r5 =3D " virtual/bootloader"
> -DEPENDS_remove_am65xx-evm-k3r5-sr2 =3D " virtual/bootloader"
> -DEPENDS_remove_am65xx-hs-evm-k3r5 =3D " virtual/bootloader"
> -DEPENDS_remove_am65xx-hs-evm-k3r5-sr2 =3D " virtual/bootloader"
> +DEPENDS_remove_am65xx-evm-k3r5-sr2-gp =3D " virtual/bootloader"
> +DEPENDS_remove_am65xx-evm-k3r5-sr2-hs-se =3D " virtual/bootloader"
> +DEPENDS_remove_am65xx-evm-k3r5-gp =3D " virtual/bootloader"
> +DEPENDS_remove_am65xx-evm-k3r5-hs-se =3D " virtual/bootloader"
>  DEPENDS_remove_j7-evm-k3r5 =3D " virtual/bootloader"
>  DEPENDS_remove_j7-hs-evm-k3r5 =3D " virtual/bootloader"
>  DEPENDS_remove_j7-hs-evm-k3r5-sr1-1 =3D " virtual/bootloader"
> @@ -54,23 +54,23 @@ SYSFW_TISCI =3D
> "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
>  SYSFW_TIBOOT3 =3D "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.=
bin"
>  SYSFW_TIBOOT3_SYMLINK ?=3D "tiboot3.bin"
>
> -SYSFW_BINARY =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> +SYSFW_BINARY =3D "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb=
"
>  SYSFW_VBINARY =3D
> "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>  SYSFW_IMAGE =3D "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>  SYSFW_SYMLINK ?=3D "sysfw.itb"
>
> -SYSFW_VBINARY_am65xx-evm-k3r5 =3D
> "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> -SYSFW_VBINARY_am65xx-evm-k3r5-sr2 =3D
> "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> -SYSFW_VBINARY_am65xx-hs-evm-k3r5 =3D
> "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> -SYSFW_VBINARY_am65xx-hs-evm-k3r5-sr2 =3D
> "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> +SYSFW_VBINARY_am65xx-evm-k3r5-sr2-gp =3D
> "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> +SYSFW_VBINARY_am65xx-evm-k3r5-sr2-hs-se =3D
> "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> +SYSFW_VBINARY_am65xx-evm-k3r5-gp =3D
> "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> +SYSFW_VBINARY_am65xx-evm-k3r5-hs-se =3D
> "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>  SYSFW_VBINARY_j7-evm-k3r5 =3D "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.=
itb"
>  SYSFW_VBINARY_j7-hs-evm-k3r5 =3D
> "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>  SYSFW_VBINARY_j7-hs-evm-k3r5-sr1-1 =3D
> "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>
> -SYSFW_IMAGE_am65xx-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> -SYSFW_IMAGE_am65xx-evm-k3r5-sr2 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.=
itb"
> -SYSFW_IMAGE_am65xx-hs-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.i=
tb"
> -SYSFW_IMAGE_am65xx-hs-evm-k3r5-sr2 =3D
> "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> +SYSFW_IMAGE_am65xx-evm-k3r5-sr2-gp =3D
> "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> +SYSFW_IMAGE_am65xx-evm-k3r5-sr2-hs-se =3D
> "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> +SYSFW_IMAGE_am65xx-evm-k3r5-gp =3D
> "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
> +SYSFW_IMAGE_am65xx-evm-k3r5-hs-se =3D
> "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>  SYSFW_IMAGE_j7-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>  SYSFW_IMAGE_j7-hs-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>  SYSFW_IMAGE_j7-hs-evm-k3r5-sr1-1 =3D
> "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> @@ -87,10 +87,10 @@ EXTRA_OEMAKE =3D "\
>      CONFIG=3D${SYSFW_CONFIG} SYSFW_DIR=3D"${S}/ti-sysfw" \
>      SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin" \
>  "
> -EXTRA_OEMAKE_remove_am65xx-evm-k3r5 =3D "
> SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> -EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2 =3D "
> SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> -EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5 =3D "
> SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> -EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5-sr2 =3D "
> SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> +EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2-gp =3D "
> SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> +EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2-hs-se =3D "
> SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> +EXTRA_OEMAKE_remove_am65xx-evm-k3r5-gp =3D "
> SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> +EXTRA_OEMAKE_remove_am65xx-evm-k3r5-hs-se =3D "
> SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  EXTRA_OEMAKE_remove_j7-evm-k3r5 =3D "
> SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  EXTRA_OEMAKE_remove_j7-hs-evm-k3r5 =3D "
> SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  EXTRA_OEMAKE_remove_j7-hs-evm-k3r5-sr1-1 =3D "
> SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 70406724..38c7022f 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -23,7 +23,7 @@ tfa_sign_k3hs() {
>         )
>  }
>
> -do_compile_append_am65xx-hs-evm() {
> +do_compile_append_am65xx-evm() {
>         tfa_sign_k3hs
>  }
>
> diff --git a/recipes-security/optee/optee-os_%.bbappend
> b/recipes-security/optee/optee-os_%.bbappend
> index ddfc76f1..807f1c0f 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -64,7 +64,7 @@ do_compile_append_dra7xx() {
>      optee_sign_legacyhs
>  }
>
> -do_compile_append_am65xx-hs-evm() {
> +do_compile_append_am65xx-evm() {
>      optee_sign_k3hs
>  }
>
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16217):
> https://lists.yoctoproject.org/g/meta-ti/message/16217
> Mute This Topic: https://lists.yoctoproject.org/mt/97752349/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000be6c2105f76e05ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br>This patch uses the old bitbake syntax so =
they won&#39;t=C2=A0work on kikstone.</div><br>Jose<br><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Paresh Bhagat via <a href=
=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;p-bhagat=
=3D<a href=3D"mailto:ti.com@lists.yoctoproject.org">ti.com@lists.yoctoproje=
ct.org</a>&gt; escreveu no dia ter=C3=A7a, 21/03/2023 =C3=A0(s) 11:08:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">From: Sai Sree Karth=
eek Adivi &lt;<a href=3D"mailto:s-adivi@ti.com" target=3D"_blank">s-adivi@t=
i.com</a>&gt;<br>
<br>
- multiconfig, conf:<br>
=C2=A0 =C2=A0 - Add new multiconfig file to build for K3R5F SR2 GP devices<=
br>
=C2=A0 =C2=A0 - Update the am65xx-evm conf files to build both HS and GP fo=
r<br>
=C2=A0 =C2=A0 =C2=A0 AM65x SR2.0. SR1.0 and keep SR2.0 HS sysfw.itb as defa=
ult.<br>
=C2=A0 =C2=A0 - Remove am65xx-hs-evm conf files since am65xx-evm will build=
 both<br>
=C2=A0 =C2=A0 =C2=A0 GP and HS.<br>
- optee: Sign optee for am65xx-evm to support HS builds<br>
- ATF: Sign ATF for am65xx-evm to support HS builds<br>
- ti-sci-fw: Add SYSFW_SUFFIX to SYSFW_BINARY name to differentiate<br>
=C2=A0 between GP and HS binaries.<br>
<br>
Signed-off-by: Sai Sree Kartheek Adivi &lt;<a href=3D"mailto:s-adivi@ti.com=
" target=3D"_blank">s-adivi@ti.com</a>&gt;<br>
---<br>
=C2=A0conf/machine/am65xx-evm-k3r5-gp.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 13 +++++++<br>
=C2=A0conf/machine/am65xx-evm-k3r5-hs-se.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
3 +++++++<br>
=C2=A0...-k3r5.conf =3D&gt; am65xx-evm-k3r5-sr2-gp.conf} |=C2=A0 4 +--<br>
=C2=A0...r2.conf =3D&gt; am65xx-evm-k3r5-sr2-hs-se.conf} |=C2=A0 4 ++-<br>
=C2=A0conf/machine/am65xx-hs-evm-k3r5-sr2.conf=C2=A0 =C2=A0 =C2=A0 | 11 ---=
---<br>
=C2=A0conf/machine/am65xx-hs-evm-k3r5.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 18 ----------<br>
=C2=A0conf/machine/am65xx-hs-evm.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 11 ------<br>
=C2=A0conf/machine/include/am65xx.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 30 +++++++++++-----<br>
=C2=A0conf/multiconfig/k3r5-sr2-gp.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 ++<br>
=C2=A0recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">ti-sci-fw_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 34 +++++++++----------<br>
=C2=A0.../trusted-firmware-a_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0recipes-security/optee/optee-os_%.bbappend=C2=A0 =C2=A0 |=C2=A0 2 +-<=
br>
=C2=A012 files changed, 74 insertions(+), 71 deletions(-)<br>
=C2=A0create mode 100644 conf/machine/am65xx-evm-k3r5-gp.conf<br>
=C2=A0create mode 100644 conf/machine/am65xx-evm-k3r5-hs-se.conf<br>
=C2=A0rename conf/machine/{am65xx-evm-k3r5.conf =3D&gt; am65xx-evm-k3r5-sr2=
-gp.conf} (87%)<br>
=C2=A0rename conf/machine/{am65xx-evm-k3r5-sr2.conf =3D&gt; am65xx-evm-k3r5=
-sr2-hs-se.conf} (80%)<br>
=C2=A0delete mode 100644 conf/machine/am65xx-hs-evm-k3r5-sr2.conf<br>
=C2=A0delete mode 100644 conf/machine/am65xx-hs-evm-k3r5.conf<br>
=C2=A0delete mode 100644 conf/machine/am65xx-hs-evm.conf<br>
=C2=A0create mode 100644 conf/multiconfig/k3r5-sr2-gp.conf<br>
<br>
diff --git a/conf/machine/am65xx-evm-k3r5-gp.conf b/conf/machine/am65xx-evm=
-k3r5-gp.conf<br>
new file mode 100644<br>
index 00000000..c67699ac<br>
--- /dev/null<br>
+++ b/conf/machine/am65xx-evm-k3r5-gp.conf<br>
@@ -0,0 +1,13 @@<br>
+#@TYPE: Machine<br>
+#@NAME: AM65xx SR1.0 EVM (R5F)<br>
+#@DESCRIPTION: Machine configuration for the TI AM65xx SR1.0 EVM (R5F core=
)<br>
+<br>
+# Booting SR1 requires different SYSFW, the rest is handled at runtime<br>
+<br>
+require conf/machine/am65xx-evm-k3r5-sr2-gp.conf<br>
+SOC_FAMILY_append =3D &quot;:k3r5&quot;<br>
+<br>
+SYSFW_SUFFIX =3D &quot;gp&quot;<br>
+SYSFW_SOC =3D &quot;am65x&quot;<br>
+SYSFW_SYMLINK =3D &quot;&quot;<br>
+<br>
diff --git a/conf/machine/am65xx-evm-k3r5-hs-se.conf b/conf/machine/am65xx-=
evm-k3r5-hs-se.conf<br>
new file mode 100644<br>
index 00000000..6060de85<br>
--- /dev/null<br>
+++ b/conf/machine/am65xx-evm-k3r5-hs-se.conf<br>
@@ -0,0 +1,13 @@<br>
+#@TYPE: Machine<br>
+#@NAME: AM65xx SR1.0 EVM (R5F)<br>
+#@DESCRIPTION: Machine configuration for the TI AM65xx SR1.0 EVM (R5F core=
)<br>
+<br>
+# Booting SR1 requires different SYSFW, the rest is handled at runtime<br>
+<br>
+require conf/machine/am65xx-evm-k3r5-sr2-gp.conf<br>
+SOC_FAMILY_append =3D &quot;:k3r5&quot;<br>
+<br>
+SYSFW_SUFFIX =3D &quot;hs&quot;<br>
+SYSFW_SOC =3D &quot;am65x&quot;<br>
+SYSFW_SYMLINK =3D &quot;&quot;<br>
+<br>
diff --git a/conf/machine/am65xx-evm-k3r5.conf b/conf/machine/am65xx-evm-k3=
r5-sr2-gp.conf<br>
similarity index 87%<br>
rename from conf/machine/am65xx-evm-k3r5.conf<br>
rename to conf/machine/am65xx-evm-k3r5-sr2-gp.conf<br>
index a484e444..31ca807a 100644<br>
--- a/conf/machine/am65xx-evm-k3r5.conf<br>
+++ b/conf/machine/am65xx-evm-k3r5-sr2-gp.conf<br>
@@ -4,7 +4,7 @@<br>
<br>
=C2=A0require conf/machine/include/k3r5.inc<br>
<br>
-SYSFW_SOC =3D &quot;am65x&quot;<br>
+SYSFW_SOC =3D &quot;am65x_sr2&quot;<br>
=C2=A0SYSFW_CONFIG =3D &quot;evm&quot;<br>
=C2=A0SYSFW_SUFFIX =3D &quot;gp&quot;<br>
=C2=A0SYSFW_SYMLINK =3D &quot;&quot;<br>
@@ -15,4 +15,4 @@ UBOOT_BINARY =3D &quot;tiboot3.${UBOOT_SUFFIX}&quot;<br>
=C2=A0UBOOT_IMAGE =3D &quot;tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFF=
IX}&quot;<br>
=C2=A0UBOOT_SYMLINK =3D &quot;tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}&quot;<=
br>
<br>
-UBOOT_MACHINE =3D &quot;am65x_evm_r5_defconfig&quot;<br>
+UBOOT_MACHINE =3D &quot;am65x_hs_evm_r5_defconfig&quot;<br>
diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf b/conf/machine/am65xx-ev=
m-k3r5-sr2-hs-se.conf<br>
similarity index 80%<br>
rename from conf/machine/am65xx-evm-k3r5-sr2.conf<br>
rename to conf/machine/am65xx-evm-k3r5-sr2-hs-se.conf<br>
index c0b3cd51..cf127029 100644<br>
--- a/conf/machine/am65xx-evm-k3r5-sr2.conf<br>
+++ b/conf/machine/am65xx-evm-k3r5-sr2-hs-se.conf<br>
@@ -4,8 +4,10 @@<br>
<br>
=C2=A0# Booting SR2 requires different SYSFW, the rest is handled at runtim=
e<br>
<br>
-require conf/machine/am65xx-evm-k3r5.conf<br>
+require conf/machine/am65xx-evm-k3r5-sr2-gp.conf<br>
=C2=A0SOC_FAMILY_append =3D &quot;:k3r5-sr2&quot;<br>
<br>
+SYSFW_SUFFIX =3D &quot;hs&quot;<br>
=C2=A0SYSFW_SOC =3D &quot;am65x_sr2&quot;<br>
=C2=A0SYSFW_SYMLINK =3D &quot;sysfw.itb&quot;<br>
+<br>
diff --git a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf b/conf/machine/am65xx=
-hs-evm-k3r5-sr2.conf<br>
deleted file mode 100644<br>
index ef1b6fbe..00000000<br>
--- a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf<br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
-#@TYPE: Machine<br>
-#@NAME: AM65xx SR2.0 HS EVM (R5F)<br>
-#@DESCRIPTION: Machine configuration for the TI AM65xx SR2.0 HS EVM (R5F c=
ore)<br>
-<br>
-# Booting SR2 requires different SYSFW, the rest is handled at runtime<br>
-<br>
-require conf/machine/am65xx-hs-evm-k3r5.conf<br>
-SOC_FAMILY_append =3D &quot;:k3r5-sr2&quot;<br>
-<br>
-SYSFW_SOC =3D &quot;am65x_sr2&quot;<br>
-SYSFW_SYMLINK =3D &quot;sysfw.itb&quot;<br>
diff --git a/conf/machine/am65xx-hs-evm-k3r5.conf b/conf/machine/am65xx-hs-=
evm-k3r5.conf<br>
deleted file mode 100644<br>
index d9041c9d..00000000<br>
--- a/conf/machine/am65xx-hs-evm-k3r5.conf<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-#@TYPE: Machine<br>
-#@NAME: AM65xx HS EVM (R5F)<br>
-#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)<b=
r>
-<br>
-require conf/machine/include/k3r5.inc<br>
-<br>
-SYSFW_SOC =3D &quot;am65x&quot;<br>
-SYSFW_CONFIG =3D &quot;evm&quot;<br>
-SYSFW_SUFFIX =3D &quot;hs&quot;<br>
-SYSFW_SYMLINK =3D &quot;&quot;<br>
-<br>
-SPL_BINARY =3D &quot;spl/u-boot-spl.${UBOOT_SUFFIX}&quot;<br>
-SPL_SYMLINK =3D &quot;u-boot-r5spl.${UBOOT_SUFFIX}&quot;<br>
-UBOOT_BINARY =3D &quot;tiboot3.${UBOOT_SUFFIX}&quot;<br>
-UBOOT_IMAGE =3D &quot;tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}&q=
uot;<br>
-UBOOT_SYMLINK =3D &quot;tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}&quot;<br>
-<br>
-UBOOT_MACHINE =3D &quot;am65x_hs_evm_r5_defconfig&quot;<br>
diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.c=
onf<br>
deleted file mode 100644<br>
index 2c1256d0..00000000<br>
--- a/conf/machine/am65xx-hs-evm.conf<br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
-#@TYPE: Machine<br>
-#@NAME: AM65xx HS EVM<br>
-#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM<br>
-<br>
-require conf/machine/include/am65xx.inc<br>
-<br>
-UBOOT_MACHINE =3D &quot;am65x_hs_evm_a53_defconfig&quot;<br>
-<br>
-SPL_BINARY =3D &quot;tispl.bin_HS&quot;<br>
-UBOOT_BINARY =3D &quot;u-boot.img_HS&quot;<br>
-UBOOT_SYMLINK =3D &quot;u-boot.img&quot;<br>
diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.=
inc<br>
index b70d212f..958cbc8a 100644<br>
--- a/conf/machine/include/am65xx.inc<br>
+++ b/conf/machine/include/am65xx.inc<br>
@@ -20,16 +20,28 @@ KERNEL_DEVICETREE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0ti/k3-am654-evm-ov5640.dtbo \<br>
=C2=A0&quot;<br>
<br>
-BBMULTICONFIG +=3D &quot;k3r5-sr2&quot;<br>
-<br>
-# Since J721e does not support multi-cert tiboot3.bin add standalone sysfw=
.itb<br>
+BBMULTICONFIG =3D &quot;k3r5-sr2-hs-se&quot;<br>
=C2=A0IMAGE_BOOT_FILES +=3D &quot;sysfw.itb&quot;<br>
-<br>
-# Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0<b=
r>
-IMAGE_BOOT_FILES +=3D &quot;sysfw-am65x-evm.itb&quot;<br>
-<br>
-do_image_wic[mcdepends] +=3D &quot;mc::k3r5-sr2:ti-sci-fw:do_deploy&quot;<=
br>
-do_image_tar[mcdepends] +=3D &quot;mc::k3r5-sr2:ti-sci-fw:do_deploy&quot;<=
br>
+do_image_wic[mcdepends] =3D &quot;mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy&q=
uot;<br>
+do_image_tar[mcdepends] =3D &quot;mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy&q=
uot;<br>
+<br>
+BBMULTICONFIG +=3D &quot;k3r5-hs-se&quot;<br>
+IMAGE_BOOT_FILES +=3D &quot;sysfw-am65x-hs-evm.itb&quot;<br>
+do_image_wic[mcdepends] +=3D &quot;mc::k3r5-hs-se:ti-sci-fw:do_deploy&quot=
;<br>
+do_image_tar[mcdepends] +=3D &quot;mc::k3r5-hs-se:ti-sci-fw:do_deploy&quot=
;<br>
+<br>
+BBMULTICONFIG +=3D &quot;k3r5-gp&quot;<br>
+IMAGE_BOOT_FILES +=3D &quot;sysfw-am65x-gp-evm.itb&quot;<br>
+do_image_wic[mcdepends] +=3D &quot;mc::k3r5-gp:ti-sci-fw:do_deploy&quot;<b=
r>
+do_image_tar[mcdepends] +=3D &quot;mc::k3r5-gp:ti-sci-fw:do_deploy&quot;<b=
r>
+<br>
+<br>
+BBMULTICONFIG +=3D &quot;k3r5-sr2-gp&quot;<br>
+IMAGE_BOOT_FILES +=3D &quot;sysfw-am65x_sr2-gp-evm.itb&quot;<br>
+do_image_wic[mcdepends] +=3D &quot;mc::k3r5-sr2-gp:u-boot-ti-staging:do_de=
ploy&quot;<br>
+do_image_tar[mcdepends] +=3D &quot;mc::k3r5-sr2-gp:u-boot-ti-staging:do_de=
ploy&quot;<br>
+do_image_wic[mcdepends] +=3D &quot;mc::k3r5-sr2-gp:ti-sci-fw:do_deploy&quo=
t;<br>
+do_image_tar[mcdepends] +=3D &quot;mc::k3r5-sr2-gp:ti-sci-fw:do_deploy&quo=
t;<br>
<br>
=C2=A0OPTEEMACHINE =3D &quot;k3-am65x&quot;<br>
=C2=A0OPTEEOUTPUTMACHINE =3D &quot;k3&quot;<br>
diff --git a/conf/multiconfig/k3r5-sr2-gp.conf b/conf/multiconfig/k3r5-sr2-=
gp.conf<br>
new file mode 100644<br>
index 00000000..fae89bd3<br>
--- /dev/null<br>
+++ b/conf/multiconfig/k3r5-sr2-gp.conf<br>
@@ -0,0 +1,3 @@<br>
+require k3r5-sr2.conf<br>
+<br>
+MACHINE_append =3D &quot;-gp&quot;<br>
diff --git a/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a> b/recipes-bsp/ti-sci=
-fw/<a href=3D"http://ti-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blank=
">ti-sci-fw_git.bb</a><br>
index 80c0b890..6503e964 100644<br>
--- a/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">ti-sci-fw_git.bb</a><br>
+++ b/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">ti-sci-fw_git.bb</a><br>
@@ -2,10 +2,10 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc<br>
=C2=A0require recipes-ti/includes/ti-paths.inc<br>
<br>
=C2=A0DEPENDS =3D &quot;openssl-native u-boot-mkimage-native dtc-native vir=
tual/bootloader&quot;<br>
-DEPENDS_remove_am65xx-evm-k3r5 =3D &quot; virtual/bootloader&quot;<br>
-DEPENDS_remove_am65xx-evm-k3r5-sr2 =3D &quot; virtual/bootloader&quot;<br>
-DEPENDS_remove_am65xx-hs-evm-k3r5 =3D &quot; virtual/bootloader&quot;<br>
-DEPENDS_remove_am65xx-hs-evm-k3r5-sr2 =3D &quot; virtual/bootloader&quot;<=
br>
+DEPENDS_remove_am65xx-evm-k3r5-sr2-gp =3D &quot; virtual/bootloader&quot;<=
br>
+DEPENDS_remove_am65xx-evm-k3r5-sr2-hs-se =3D &quot; virtual/bootloader&quo=
t;<br>
+DEPENDS_remove_am65xx-evm-k3r5-gp =3D &quot; virtual/bootloader&quot;<br>
+DEPENDS_remove_am65xx-evm-k3r5-hs-se =3D &quot; virtual/bootloader&quot;<b=
r>
=C2=A0DEPENDS_remove_j7-evm-k3r5 =3D &quot; virtual/bootloader&quot;<br>
=C2=A0DEPENDS_remove_j7-hs-evm-k3r5 =3D &quot; virtual/bootloader&quot;<br>
=C2=A0DEPENDS_remove_j7-hs-evm-k3r5-sr1-1 =3D &quot; virtual/bootloader&quo=
t;<br>
@@ -54,23 +54,23 @@ SYSFW_TISCI =3D &quot;${S}/ti-sysfw/ti-${SYSFW_PREFIX}-=
firmware-${SYSFW_SOC}-*.bin&quot;<br>
=C2=A0SYSFW_TIBOOT3 =3D &quot;tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_=
CONFIG}.bin&quot;<br>
=C2=A0SYSFW_TIBOOT3_SYMLINK ?=3D &quot;tiboot3.bin&quot;<br>
<br>
-SYSFW_BINARY =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb&quot;<br>
+SYSFW_BINARY =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.=
itb&quot;<br>
=C2=A0SYSFW_VBINARY =3D &quot;sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SY=
SFW_CONFIG}.itb&quot;<br>
=C2=A0SYSFW_IMAGE =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONF=
IG}.itb&quot;<br>
=C2=A0SYSFW_SYMLINK ?=3D &quot;sysfw.itb&quot;<br>
<br>
-SYSFW_VBINARY_am65xx-evm-k3r5 =3D &quot;sysfw-${PV}-${SYSFW_SOC}-${SYSFW_C=
ONFIG}.itb&quot;<br>
-SYSFW_VBINARY_am65xx-evm-k3r5-sr2 =3D &quot;sysfw-${PV}-${SYSFW_SOC}-${SYS=
FW_CONFIG}.itb&quot;<br>
-SYSFW_VBINARY_am65xx-hs-evm-k3r5 =3D &quot;sysfw-${PV}-${SYSFW_SOC}-${SYSF=
W_CONFIG}.itb&quot;<br>
-SYSFW_VBINARY_am65xx-hs-evm-k3r5-sr2 =3D &quot;sysfw-${PV}-${SYSFW_SOC}-${=
SYSFW_CONFIG}.itb&quot;<br>
+SYSFW_VBINARY_am65xx-evm-k3r5-sr2-gp =3D &quot;sysfw-${PV}-${SYSFW_SOC}-${=
SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb&quot;<br>
+SYSFW_VBINARY_am65xx-evm-k3r5-sr2-hs-se =3D &quot;sysfw-${PV}-${SYSFW_SOC}=
-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb&quot;<br>
+SYSFW_VBINARY_am65xx-evm-k3r5-gp =3D &quot;sysfw-${PV}-${SYSFW_SOC}-${SYSF=
W_SUFFIX}-${SYSFW_CONFIG}.itb&quot;<br>
+SYSFW_VBINARY_am65xx-evm-k3r5-hs-se =3D &quot;sysfw-${PV}-${SYSFW_SOC}-${S=
YSFW_SUFFIX}-${SYSFW_CONFIG}.itb&quot;<br>
=C2=A0SYSFW_VBINARY_j7-evm-k3r5 =3D &quot;sysfw-${PV}-${SYSFW_SOC}-${SYSFW_=
CONFIG}.itb&quot;<br>
=C2=A0SYSFW_VBINARY_j7-hs-evm-k3r5 =3D &quot;sysfw-${PV}-${SYSFW_SOC}-${SYS=
FW_CONFIG}.itb&quot;<br>
=C2=A0SYSFW_VBINARY_j7-hs-evm-k3r5-sr1-1 =3D &quot;sysfw-${PV}-${SYSFW_SOC}=
-${SYSFW_CONFIG}.itb&quot;<br>
<br>
-SYSFW_IMAGE_am65xx-evm-k3r5 =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.i=
tb&quot;<br>
-SYSFW_IMAGE_am65xx-evm-k3r5-sr2 =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_CONFI=
G}.itb&quot;<br>
-SYSFW_IMAGE_am65xx-hs-evm-k3r5 =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_CONFIG=
}.itb&quot;<br>
-SYSFW_IMAGE_am65xx-hs-evm-k3r5-sr2 =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_CO=
NFIG}.itb&quot;<br>
+SYSFW_IMAGE_am65xx-evm-k3r5-sr2-gp =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_SU=
FFIX}-${SYSFW_CONFIG}.itb&quot;<br>
+SYSFW_IMAGE_am65xx-evm-k3r5-sr2-hs-se =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW=
_SUFFIX}-${SYSFW_CONFIG}.itb&quot;<br>
+SYSFW_IMAGE_am65xx-evm-k3r5-gp =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX=
}-${SYSFW_CONFIG}.itb&quot;<br>
+SYSFW_IMAGE_am65xx-evm-k3r5-hs-se =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_SUF=
FIX}-${SYSFW_CONFIG}.itb&quot;<br>
=C2=A0SYSFW_IMAGE_j7-evm-k3r5 =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.=
itb&quot;<br>
=C2=A0SYSFW_IMAGE_j7-hs-evm-k3r5 =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW_CONFI=
G}.itb&quot;<br>
=C2=A0SYSFW_IMAGE_j7-hs-evm-k3r5-sr1-1 =3D &quot;sysfw-${SYSFW_SOC}-${SYSFW=
_CONFIG}.itb&quot;<br>
@@ -87,10 +87,10 @@ EXTRA_OEMAKE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0CONFIG=3D${SYSFW_CONFIG} SYSFW_DIR=3D&quot;${S}/ti-sysf=
w&quot; \<br>
=C2=A0 =C2=A0 =C2=A0SBL=3D&quot;${STAGING_DIR_HOST}/boot/u-boot-spl.bin&quo=
t; \<br>
=C2=A0&quot;<br>
-EXTRA_OEMAKE_remove_am65xx-evm-k3r5 =3D &quot; SBL=3D&quot;${STAGING_DIR_H=
OST}/boot/u-boot-spl.bin&quot;&quot;<br>
-EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2 =3D &quot; SBL=3D&quot;${STAGING_D=
IR_HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
-EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5 =3D &quot; SBL=3D&quot;${STAGING_DI=
R_HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
-EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5-sr2 =3D &quot; SBL=3D&quot;${STAGIN=
G_DIR_HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
+EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2-gp =3D &quot; SBL=3D&quot;${STAGIN=
G_DIR_HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
+EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2-hs-se =3D &quot; SBL=3D&quot;${STA=
GING_DIR_HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
+EXTRA_OEMAKE_remove_am65xx-evm-k3r5-gp =3D &quot; SBL=3D&quot;${STAGING_DI=
R_HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
+EXTRA_OEMAKE_remove_am65xx-evm-k3r5-hs-se =3D &quot; SBL=3D&quot;${STAGING=
_DIR_HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
=C2=A0EXTRA_OEMAKE_remove_j7-evm-k3r5 =3D &quot; SBL=3D&quot;${STAGING_DIR_=
HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
=C2=A0EXTRA_OEMAKE_remove_j7-hs-evm-k3r5 =3D &quot; SBL=3D&quot;${STAGING_D=
IR_HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
=C2=A0EXTRA_OEMAKE_remove_j7-hs-evm-k3r5-sr1-1 =3D &quot; SBL=3D&quot;${STA=
GING_DIR_HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b=
/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend<br>
index 70406724..38c7022f 100644<br>
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend<br>
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend<br>
@@ -23,7 +23,7 @@ tfa_sign_k3hs() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
=C2=A0}<br>
<br>
-do_compile_append_am65xx-hs-evm() {<br>
+do_compile_append_am65xx-evm() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tfa_sign_k3hs<br>
=C2=A0}<br>
<br>
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/=
optee/optee-os_%.bbappend<br>
index ddfc76f1..807f1c0f 100644<br>
--- a/recipes-security/optee/optee-os_%.bbappend<br>
+++ b/recipes-security/optee/optee-os_%.bbappend<br>
@@ -64,7 +64,7 @@ do_compile_append_dra7xx() {<br>
=C2=A0 =C2=A0 =C2=A0optee_sign_legacyhs<br>
=C2=A0}<br>
<br>
-do_compile_append_am65xx-hs-evm() {<br>
+do_compile_append_am65xx-evm() {<br>
=C2=A0 =C2=A0 =C2=A0optee_sign_k3hs<br>
=C2=A0}<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#16217): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/16217" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/16217</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97752349/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/97752349/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">qua=
resma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000be6c2105f76e05ab--


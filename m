Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0953CC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 17:12:38 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web11.51184.1674666749682774742
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 09:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=jz+MkIMn;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197]) by mx-outbound46-171.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 25 Jan 2023 17:12:27 +0000
Received: by mail-lj1-f197.google.com with SMTP id i65-20020a2e2244000000b0028bcd49eb6aso3448095lji.13
        for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 09:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J2N2TvhvPM+qSWx7N/T4igM6dq3gFmZj5Y+O3LBXwOs=;
        b=jz+MkIMnxt71tQN9T//id/KLK85ealjtWVrSHz6Xe9X8MppQ50e2x2oMtiOhI0eXis
         a41UZEcf0OtOZ6nER4wr+GplgmM7kUGLmdSruRWNeJ2Gnbrip3OI4b2xe/BDQR7HaDih
         +t7Q1mLh6PcqP6eVDDBzm+p9YMLrfrdh0c3cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2N2TvhvPM+qSWx7N/T4igM6dq3gFmZj5Y+O3LBXwOs=;
        b=RzM3ET3vp0exJaOA+/aouwcl8AmRJvZwo7hU72YL/7BcxriHVuOK53IpqL6mHldkDZ
         sreX+9oRWj2mUCmEOxQzq2gquLZtnkc2ubOjY/UXHdr3w5W35ENF38Rhf8BXimFQ7cEa
         8+j3nbSvVEECflp5IMexJopqt8NbMFaSL9L0FvN1s3DwHog9WRYzyh/HzVsJK2MBC588
         5Hrg4C6SpdVKpLnKVT7QNLd78cfJvj+NETszpHLj5krKDVDZmhyUz37PAnBugwxDjaGu
         AtQkRAfkg/A58qCNemAyMpSvsieMw8eLDRanJzjureNsgwFwt00ZdfBBP95mJR3zp1dp
         eZeQ==
X-Gm-Message-State: AFqh2krRuDd8fFjJ0wtiSZec06BVCi0RWNmJPeFmkDpJOunlIVOwJTrN
	5AZspcs4ZSQBKkKpDGgCr6RL2TXY378qdlomoM1bUlzTy8dyxtcx9/qgPJUM7inzGCqpNvS3QaG
	gJ9ufSurOtCXFI/C169A7qH09coEOIV+2Isg8dlAj2JfU+S9iPEeHJozPO+SAyWmXffV2sdBTOJ
	8bFMw=
X-Received: by 2002:ac2:5e8f:0:b0:4ce:4e29:24a5 with SMTP id b15-20020ac25e8f000000b004ce4e2924a5mr2589261lfq.646.1674666744685;
        Wed, 25 Jan 2023 09:12:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9UXt5rE6GwY6Bbt0vZkY3fFrwiELK9qk8dyx6l19VEngCyp558FTeYUXD4m+vNcDR6Vf6jChp8+b7qSiAA9A=
X-Received: by 2002:ac2:5e8f:0:b0:4ce:4e29:24a5 with SMTP id
 b15-20020ac25e8f000000b004ce4e2924a5mr2589252lfq.646.1674666744291; Wed, 25
 Jan 2023 09:12:24 -0800 (PST)
MIME-Version: 1.0
References: <20230125133754.692-1-sinthu.raja@ti.com> <435688f1-4bb0-34b2-e1c5-fcd2e5654faf@ti.com>
In-Reply-To: <435688f1-4bb0-34b2-e1c5-fcd2e5654faf@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Wed, 25 Jan 2023 22:42:11 +0530
Message-ID: <CAEd-yTSvfhO7wznfA6fYjjhmiAYn0t-Uwbnp-1zuTbMyreQPAQ@mail.gmail.com>
Subject: Re: [meta-ti][master/dunfell][RFC PATCH] conf: machine: j721s2-evm:
 Add support for J721S2 HS-FS
To: Andrew Davis <afd@ti.com>, "Goswami, Piyali" <piyali_g@ti.com>
Cc: reatmon@ti.com, denys@ti.com, detheridge@ti.com, 
	meta-ti@lists.yoctoproject.org, Sinthu Raja <sinthu.raja@ti.com>, 
	Aniket Limaye <a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-BESS-ID: 1674666746-311947-5389-1861-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.208.197
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245703 [from 
	cloudscan22-78.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 17:12:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15653

+Goswami, Piyali

On Wed, Jan 25, 2023 at 9:44 PM Andrew Davis <afd@ti.com> wrote:
>
> On 1/25/23 7:37 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> > From: Sinthu Raja <sinthu.raja@ti.com>
> >
> > Add the basic J721S2 HS-FS configuration.
> >      - Add configurations to support both HS-FS and GP.
> >      - Add ti-sci-firmware overrides.
> >
> > Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> > Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > ---
> >   conf/machine/j721s2-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
> >   conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
> >   conf/machine/j721s2-evm.conf                | 12 ++++++++++++
> >   conf/multiconfig/k3r5-sr1-hs-fs.conf        |  3 +++
> >   conf/multiconfig/k3r5-sr1.conf              |  3 +++
> >   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
> >   6 files changed, 55 insertions(+), 1 deletion(-)
> >   create mode 100644 conf/machine/j721s2-evm-k3r5-gp.conf
> >   create mode 100644 conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
> >   create mode 100644 conf/multiconfig/k3r5-sr1-hs-fs.conf
> >   create mode 100644 conf/multiconfig/k3r5-sr1.conf
> >
> > diff --git a/conf/machine/j721s2-evm-k3r5-gp.conf b/conf/machine/j721s2-evm-k3r5-gp.conf
> > new file mode 100644
> > index 00000000..06456ef7
> > --- /dev/null
> > +++ b/conf/machine/j721s2-evm-k3r5-gp.conf
> > @@ -0,0 +1,20 @@
> > +#@TYPE: Machine
> > +#@NAME: J721S2 GP EVM (R5F)
> > +#@DESCRIPTION: Machine configuration for the TI J721S2 GP EVM (R5F core)
> > +
> > +# Booting GP requires different SYSFW, the rest is handled at runtime
> > +
> > +require conf/machine/include/k3r5.inc
> > +SOC_FAMILY_append = ":k3r5-gp"
> > +
> > +SYSFW_SOC = "j721s2"
> > +SYSFW_CONFIG = "evm"
> > +SYSFW_SUFFIX = "gp"
> > +SYSFW_TIBOOT3_SYMLINK = "tiboot3.bin"
> > +
> > +UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
> > +
> > +SPL_BINARY = ""
> > +UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
> > +UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> > +UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
> > diff --git a/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf b/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
> > new file mode 100644
> > index 00000000..786338a9
> > --- /dev/null
> > +++ b/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
> > @@ -0,0 +1,15 @@
> > +#@TYPE: Machine
> > +#@NAME: J721S2 HS-FS EVM (R5F)
> > +#@DESCRIPTION: Machine configuration for the TI J721S2 HS-FS EVM (R5F core)
> > +
> > +# Booting HS-FS requires different SYSFW, the rest is handled at runtime
> > +
> > +require conf/machine/include/k3r5.inc
> > +SOC_FAMILY_append = ":k3r5-sr1-hs-fs"
> > +
> > +SYSFW_SOC = "j721s2"
> > +SYSFW_CONFIG = "evm"
> > +SYSFW_SUFFIX = "hs-fs"
> > +SYSFW_TIBOOT3_SYMLINK = ""
> > +
> > +UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
> > diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> > index 1ed693c5..bf1c82a1 100644
> > --- a/conf/machine/j721s2-evm.conf
> > +++ b/conf/machine/j721s2-evm.conf
> > @@ -25,3 +25,15 @@ UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
> >
> >   do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> >   do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> > +
> > +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
>
> This comment and the one below are not right, SoC name, version, and HS types
> are all wrong.
My Bad! Will update this.
>
> > +BBMULTICONFIG = "k3r5-sr1-hs-fs"
> > +IMAGE_BOOT_FILES += " tiboot3-j721s2-hs-fs-evm.bin"
> > +do_image_wic[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> > +do_image_tar[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> > +
> > +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
> > +BBMULTICONFIG += "k3r5-gp"
> > +IMAGE_BOOT_FILES += " tiboot3-j721s2-gp-evm.bin"
> > +do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> > +do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> > diff --git a/conf/multiconfig/k3r5-sr1-hs-fs.conf b/conf/multiconfig/k3r5-sr1-hs-fs.conf
> > new file mode 100644
> > index 00000000..2fa28c95
> > --- /dev/null
> > +++ b/conf/multiconfig/k3r5-sr1-hs-fs.conf
> > @@ -0,0 +1,3 @@
> > +require k3r5-sr1.conf
>
> Why "-sr1", do you expect an SR2 anytime soon?
>
When discussed with Piyali got to know that there may be another
revision. So to avoid naming conventions in the future, we added SR1.

> Andrew
>
> > +
> > +MACHINE_append = "-hs-fs"
> > diff --git a/conf/multiconfig/k3r5-sr1.conf b/conf/multiconfig/k3r5-sr1.conf
> > new file mode 100644
> > index 00000000..2b87de8a
> > --- /dev/null
> > +++ b/conf/multiconfig/k3r5-sr1.conf
> > @@ -0,0 +1,3 @@
> > +require k3r5.conf
> > +
> > +MACHINE_append = "-sr1"
> > diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > index 0fb3a832..39e5907f 100644
> > --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > @@ -33,7 +33,8 @@ SYSFW_PREFIX_j7-hs-evm-k3r5 = "fs"
> >   SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "fs"
> >   SYSFW_PREFIX_j7200-evm-k3r5 = "fs"
> >   SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
> > -SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
> > +SYSFW_PREFIX_j721s2-evm-k3r5-gp = "fs"
> > +SYSFW_PREFIX_j721s2-evm-k3r5-sr1-hs-fs = "fs"
> >   SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
> >   SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
> >   SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#15651): https://lists.yoctoproject.org/g/meta-ti/message/15651
> > Mute This Topic: https://lists.yoctoproject.org/mt/96519981/3619733
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
With Regards
Sinthu Raja


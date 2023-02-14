Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C82C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 17:35:07 +0000 (UTC)
Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web10.48.1676396102212524480
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 09:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=cLfG0IBl;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200]) by mx-outbound14-54.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 14 Feb 2023 17:34:57 +0000
Received: by mail-lj1-f200.google.com with SMTP id x44-20020a2ea9ac000000b0028fd85f2e0aso4127680ljq.22
        for <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 09:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SJBXb3A1u+yPJA62J0hklJNkDH8azUUgzlmDXk+1DC8=;
        b=cLfG0IBl/NfbzpSsIkXbWJbE1LFqF8jEoF02yAnE83HN0kq/immpSXSb2buVJw/Oad
         KRPA1HA1CBTycSB2vD5dVsMfpdFIbnZ9i3V7Y2xRMjaH6OvfmFIv2jOtyn03sMINkFDb
         +/Jl+nn5vx0F4qyH+A8efbi83kN8ZIG8P8nbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJBXb3A1u+yPJA62J0hklJNkDH8azUUgzlmDXk+1DC8=;
        b=WFUDb2Fb6+ptxQLcL1CUOMKoLdWRaCLg9MolnJ3z0Cx2qcKO3dkrc0p4iSh60S9B9C
         gyhiUw8oc3Xxhhxw1f0Y28/s1WF27VvkZ5l16wT4maV3U7r0Kukiq5oScN6A3QgX/rh+
         0k+fGi0ZlQgmpXZ7iYr/6Y/e0Xdhz3cTYTwQO4mZb4Pj4Qx4VZeZvUI9vVhbx8JZUbEi
         GVZOGtK8O7lCEFwEPuvZ2Eqk16LigfLlDoS3sks6dwWsWDJ1g38qmBg2AXXNlqW5TXEn
         rXkibfkuK4y2NtJwjGq0TyWlDfG+lR7GV+wZ31dIR7TH33Q+bZd+/e3TBjFfymKsZnA0
         0vdw==
X-Gm-Message-State: AO0yUKXDTh1ETSsLtdu7H6+zZq+K+F571uFQdFZT/rA2bkySMqIxPxmG
	JxHKUNRmf/KFkyCnLbcRGbbAusu9Gprm+WEHoWOYEOp4pGOLn2BRGjSaRbDZQH3YuQ2CcLicTd5
	xg/cmFaqJDmJ3KEj9JCiygfab5YdklFsGbyw3qL/S5cDjFUnWEJiMeZwcbYZr8yumAp5FLS7TNu
	KEe+E=
X-Received: by 2002:a19:6a0f:0:b0:4db:3ab7:79ca with SMTP id u15-20020a196a0f000000b004db3ab779camr461202lfu.8.1676396097271;
        Tue, 14 Feb 2023 09:34:57 -0800 (PST)
X-Google-Smtp-Source: AK7set93vwvVHqBqrR5JuWuyQdr/Nfx4btdIIf5O0AMSqArsANbGnz40YsUVzgeWpQZqnL6k4q6DzlRw5hh9Tgsp3eg=
X-Received: by 2002:a19:6a0f:0:b0:4db:3ab7:79ca with SMTP id
 u15-20020a196a0f000000b004db3ab779camr461186lfu.8.1676396096637; Tue, 14 Feb
 2023 09:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20230214105642.16320-1-sinthu.raja@ti.com> <fd8350b7-ef60-f17b-283e-99e1901d8d04@ti.com>
In-Reply-To: <fd8350b7-ef60-f17b-283e-99e1901d8d04@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Tue, 14 Feb 2023 23:04:45 +0530
Message-ID: <CAEd-yTRUuZmK40UBRLrDfz+r72BsZcVj+W667r=EJ5cqfhg72Q@mail.gmail.com>
Subject: Re: [meta-ti][dunfell][PATCH V4] conf: machine: j721s2-evm: Add
 support for J721S2 HS-FS
To: Ryan Eatmon <reatmon@ti.com>
Cc: denys@ti.com, detheridge@ti.com, meta-ti@lists.yoctoproject.org, 
	Sinthu Raja <sinthu.raja@ti.com>, Aniket Limaye <a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-BESS-ID: 1676396097-303638-28074-9327-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.208.200
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246148 [from 
	cloudscan11-173.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 17:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15841

On Tue, Feb 14, 2023 at 8:50 PM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
> Initial builds for both j721s2-evm and j721s2-hs-evm look good.  Thank
> you for being patient and getting this working.
>
Thank you for your timely help.
>
> On 2/14/2023 4:56, Sinthu Raja wrote:
> > From: Sinthu Raja <sinthu.raja@ti.com>
> >
> > Add the basic J721S2 HS-FS configuration.
> >      - Add configurations to support both HS-FS and GP keeping GP
> >        as default.
> >      - Add ti-sci-firmware overrides for HS-FS.
> >      - Remove evm conf file inclusion in hs-evm conf.
> >      - Add j721s2 hs-evm specific config to hs-evm conf.
> >
> > Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> > Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > ---
> >
> > Change in V4:
> > ============
> > - Remove evm conf file inclusion in hs-evm conf.
> > - Add j721s2 hs-evm specific config to hs-evm conf.
> >
> > Change in V3:
> > ============
> > Fix build issue.
> >
> > Changes in V2:
> > =============
> > Address review comment:
> > - Keep GP as the default.
> >
> > V1: https://lists.yoctoproject.org/g/meta-ti/message/15771
> > V2: https://lists.yoctoproject.org/g/meta-ti/message/15793
> > V3: https://lists.yoctoproject.org/g/meta-ti/message/15818
> >
> >   conf/machine/j721s2-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
> >   conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
> >   conf/machine/j721s2-evm.conf                | 12 ++++++++++--
> >   conf/machine/j721s2-hs-evm.conf             | 18 +++++++++++++++++-
> >   conf/multiconfig/k3r5-sr1-hs-fs.conf        |  3 +++
> >   conf/multiconfig/k3r5-sr1.conf              |  3 +++
> >   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
> >   7 files changed, 70 insertions(+), 4 deletions(-)
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
> > index 7c120dcc..7d2597b5 100644
> > --- a/conf/machine/j721s2-evm.conf
> > +++ b/conf/machine/j721s2-evm.conf
> > @@ -40,5 +40,13 @@ KERNEL_DEVICETREE = " \
> >
> >   UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
> >
> > -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> > -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> > +# Default tiboot3.bin on J721S2 is for GP
> > +BBMULTICONFIG = "k3r5-gp"
> > +do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
> > +do_image_tar[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
> > +
> > +# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
> > +BBMULTICONFIG += "k3r5-sr1-hs-fs"
> > +IMAGE_BOOT_FILES += " tiboot3-j721s2-hs-fs-evm.bin"
> > +do_image_wic[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> > +do_image_tar[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> > diff --git a/conf/machine/j721s2-hs-evm.conf b/conf/machine/j721s2-hs-evm.conf
> > index 3d737f44..2895787b 100644
> > --- a/conf/machine/j721s2-hs-evm.conf
> > +++ b/conf/machine/j721s2-hs-evm.conf
> > @@ -2,10 +2,26 @@
> >   #@NAME: J721S2 HS EVM
> >   #@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
> >
> > -require conf/machine/j721s2-evm.conf
> > +require conf/machine/include/j7.inc
> > +
> > +MACHINE_FEATURES += "gpu"
> > +
> > +SERIAL_CONSOLES = "115200;ttyS2"
> > +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> > +TFA_K3_USART = "0x8"
> > +OPTEEMACHINE = "k3-j784s4"
> > +OPTEE_K3_USART = "0x8"
> > +
> > +KERNEL_DEVICETREE = " \
> > +    ti/k3-j721s2-common-proc-board.dtb \
> > +    ti/k3-j721s2-gesi-exp-board.dtbo \
> > +"
> >
> >   UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
> >
> > +do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> > +do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> > +
> >   SPL_BINARY = "tispl.bin_HS"
> >   UBOOT_BINARY = "u-boot.img_HS"
> >   UBOOT_SYMLINK = "u-boot.img"
> > diff --git a/conf/multiconfig/k3r5-sr1-hs-fs.conf b/conf/multiconfig/k3r5-sr1-hs-fs.conf
> > new file mode 100644
> > index 00000000..2fa28c95
> > --- /dev/null
> > +++ b/conf/multiconfig/k3r5-sr1-hs-fs.conf
> > @@ -0,0 +1,3 @@
> > +require k3r5-sr1.conf
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
> > index 7896c366..cb197954 100644
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
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS



-- 
With Regards
Sinthu Raja


Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C1BC636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 06:46:06 +0000 (UTC)
Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web11.9059.1676270760348189016
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 12 Feb 2023 22:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=meHHL3Gl;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71]) by mx-outbound17-223.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 13 Feb 2023 06:45:56 +0000
Received: by mail-lf1-f71.google.com with SMTP id k1-20020a05651210c100b004cae66ea2bfso5016466lfg.0
        for <meta-ti@lists.yoctoproject.org>; Sun, 12 Feb 2023 22:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SAE5sOb2i1arkt0fF7/NxTkxygbvMD44O1vYDNgmf9w=;
        b=meHHL3GlJiDjl/ah9EpOj7jj2Bv6zuCWHSy+jhOkvbP+Mh4wlRtjUel7W/GjpeM36a
         UuwmnWrueKeK9iYSTl98onAujhRfFi68YA/c2tOcL9jr13/Fe3b+/fWItNE+DmnEb1MA
         qTVQ2HkJIdwvqQSREYf6e/afnuwfh9DXmsu8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAE5sOb2i1arkt0fF7/NxTkxygbvMD44O1vYDNgmf9w=;
        b=WlHn5fyMdeqLM1/VHTeOrIt5iqa6bvyjt3z/ZSclsJsO4LG3kiO5xaiccjUiH0cY+9
         hvWj3kKvdU0cfG8Mtti+z2SoxWGWDSa3xnSYirAjsy52+FNj0sU4QAA0Pi+sW38p54AC
         3GMYircSO8fC2xe3lhEIC7j4NPBF2KVIwly2yJ9E2TqmdBX8hkxrbREm9f6KNrrpI23m
         m0xl5fbc9B1mH0mOKNA8hRD/ujUCkHY8RIcW4pkpQ5YTw3eLrl+dpSaKwx+iV9pgOhdx
         Tk9eAZdtpCl2M5nzby91ss0hxffyhP30PedGiS+WcsqrzhcRL507gMaXG3CAxLWaWu2W
         T0NQ==
X-Gm-Message-State: AO0yUKVplRQqH0Qwe65kM1n3Via7vvqzBnCt4R5bWjzwpp1HXNyFoNYT
	Z1zHGEBht4fzdJSVuXt5LddmcV5tvMupuybvXBSpiNBasVEwswyvW5YFHoiYxaolNrHnzc/oGMc
	awmh8zV//f7lW9tuWizoqQlUTT3W2lo/c2pA2qoNrhMw1L/82qGhveDG3q2m7Re8eUu6XQuivtz
	yNhaI=
X-Received: by 2002:ac2:5594:0:b0:4cb:f3c7:7a52 with SMTP id v20-20020ac25594000000b004cbf3c77a52mr4034421lfg.193.1676270756076;
        Sun, 12 Feb 2023 22:45:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/YHGBs4czTnFP2mfJkbAa1jJ8xTfc3UI8yB3Ih7triLTmqBOQnuKsENIHnU6QaZreNDS8lWLE7JS2NOUroqeU=
X-Received: by 2002:ac2:5594:0:b0:4cb:f3c7:7a52 with SMTP id
 v20-20020ac25594000000b004cbf3c77a52mr4034413lfg.193.1676270755505; Sun, 12
 Feb 2023 22:45:55 -0800 (PST)
MIME-Version: 1.0
References: <20230210152641.14513-1-sinthu.raja@ti.com> <976cd56a-968b-dcc5-a50f-873b32d4239f@ti.com>
In-Reply-To: <976cd56a-968b-dcc5-a50f-873b32d4239f@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Mon, 13 Feb 2023 12:15:43 +0530
Message-ID: <CAEd-yTTtmcX7+OLg8dFRCtWKfaOLj=o3OX0QON3qG-XkgtLaTw@mail.gmail.com>
Subject: Re: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2-evm: Add
 support for J721S2 HS-FS
To: Ryan Eatmon <reatmon@ti.com>
Cc: denys@ti.com, detheridge@ti.com, meta-ti@lists.yoctoproject.org, 
	Sinthu Raja <sinthu.raja@ti.com>, Aniket Limaye <a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-BESS-ID: 1676270756-304575-5379-104241-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.167.71
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246113 [from 
	cloudscan22-180.eu-central-1b.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Feb 2023 06:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15817

On Sat, Feb 11, 2023 at 1:53 AM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 2/10/2023 9:26, Sinthu Raja wrote:
> > From: Sinthu Raja <sinthu.raja@ti.com>
> >
> > Add the basic J721S2 HS-FS configuration.
> >      - Add configurations to support both HS-FS and GP and keep GP
> >        as the default.
> >      - Add ti-sci-firmware overrides for HS-FS.
> >
> > Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> > Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>
> This patch does not even build.  Both j721s2-evm and j721s2-hs-evm are
> broken.
>

> What the reasoning for trying to get this into dunfell given that the
> transition to kirkstone is right around the corner and the plan is to
> redo all of HS stuff for all platforms at that time?
>
Ryan,
AM68 SK and J721S2 EVM use the same MACHINE name which is j721s2-evm.
This patch should be there in dunfell to support the AM68 SK HS-FS
which is critical for APL release.
I am sending the fixed version of this patch which I have tested locally.

Regards
Sinthu Raja.
> > ---
> >
> > Changes in V2:
> > =============
> > Address review comment:
> > - Keep GP as the default.
> >
> > V1: https://lists.yoctoproject.org/g/meta-ti/message/15771
> >
> >   conf/machine/j721s2-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
> >   conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
> >   conf/machine/j721s2-evm.conf                | 12 ++++++++++--
> >   conf/multiconfig/k3r5-sr1-hs-fs.conf        |  3 +++
> >   conf/multiconfig/k3r5-sr1.conf              |  3 +++
> >   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
> >   6 files changed, 53 insertions(+), 3 deletions(-)
> >   create mode 100644 conf/machine/j721s2-evm-k3r5-gp.conf
> >   create mode 100644 conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
> >   create mode 100644 conf/multiconfig/k3r5-sr1-hs-fs.conf
> >   create mode 100644 conf/multiconfig/k3r5-sr1.conf
> >
> > diff --git a/conf/machine/j721s2-evm-k3r5-gp.conf b/conf/machine/j721s2-evm-k3r5-gp.conf
> > new file mode 100644
> > index 00000000..51362b85
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
> > +SYSFW_TIBOOT3_SYMLINK = ""
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


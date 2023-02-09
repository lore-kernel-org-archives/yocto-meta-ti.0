Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61756C636D6
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 18:15:39 +0000 (UTC)
Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web10.24249.1675966529887032071
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 10:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=VhzH44tq;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71]) by mx-outbound40-184.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 09 Feb 2023 18:15:26 +0000
Received: by mail-lf1-f71.google.com with SMTP id d2-20020a0565123d0200b004d1b23f2047so1209974lfv.20
        for <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 10:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bASIYSlNwvPC41ZSwsdVvlZIX/3tVLcyCaXgPFJrb2A=;
        b=VhzH44tqtTN/w3b+uNDEPAyPo5iFnVIRA8tIzarguiRsDweUVMuYtHbBWGeM8OQEl5
         TLNvU3D35/xgQjqXazecFuyoChmKQoM2d0Nsw9reZ5ojeGhRR+ObNcDFvKCD69SYeN3E
         SzjDMEoDnIUdRwBMuRfnolYI+W/inO7fX6RgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bASIYSlNwvPC41ZSwsdVvlZIX/3tVLcyCaXgPFJrb2A=;
        b=Fq7GwF3gBolpuepIAM/l/1PDvu56YgicTP04ahdVt1rTyGG8q/0prP770r0I7xcfxi
         yTSpk+xZWABbOsZWOHDNiynZuS9Yi2u/bvYclYrZsQQd1D0sH2r+2trHu/WN4MWaF/DZ
         LQgaarHt/8w9pbQMt4NryMG29mz6bq49kGXLY2s5NUBc+ihB6+cUn/fpPuYYZvaMx384
         rlINqKMW2kbBmmRzjlJlJl3Rc6ccYt+69Fh5XX74Qnwi3FoByFEydbUjXxQEjf+ZgT2M
         Xbbb9/js/dqejGPRywzY4e+qTcRas8VVVw4v4EWEYySH9rxcfvr1WKxrSvvhrYB04EES
         I6Lw==
X-Gm-Message-State: AO0yUKXLTRmmB7gUoIlfgCJ0H/fotAFNPBlUtof2U3UlHq2QAAoenr9Y
	v5VMBzefh7pgNTHHsb0Ia72Jkg0zc864oG7oj9hnFjDO9FcBcCRg4xxqHEWDk3TaphFjtCVt1ot
	gfdQWY3Ukm9vtmq7XEWQgOqxn+tbRYEOVZA1ti+snexNNjrz+hjpH/kI9z0kmYVcijv0w7ds3Xi
	9CGcY=
X-Received: by 2002:a2e:9d08:0:b0:28e:8dfb:a6a1 with SMTP id t8-20020a2e9d08000000b0028e8dfba6a1mr2311274lji.3.1675966525043;
        Thu, 09 Feb 2023 10:15:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+yTCuSdgnDonpqToyUiYPE4ORrP4WqPfmuzybWb+WE2/HXrEgc9uaqpIL/UkrUCAFvICOO4UQhkgRlUClMHyE=
X-Received: by 2002:a2e:9d08:0:b0:28e:8dfb:a6a1 with SMTP id
 t8-20020a2e9d08000000b0028e8dfba6a1mr2311261lji.3.1675966524735; Thu, 09 Feb
 2023 10:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20230209151933.4735-1-sinthu.raja@ti.com> <2fdd8e8f-421f-380f-157a-fc6b0f66a1cc@ti.com>
In-Reply-To: <2fdd8e8f-421f-380f-157a-fc6b0f66a1cc@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Thu, 9 Feb 2023 23:45:13 +0530
Message-ID: <CAEd-yTSDSDB9y1vueN-Exm-hoVrJHdRZwcdn98LazdFBWABTgA@mail.gmail.com>
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: j721s2-evm: Add support
 for J721S2 HS-FS
To: Andrew Davis <afd@ti.com>
Cc: reatmon@ti.com, denys@ti.com, detheridge@ti.com, 
	meta-ti@lists.yoctoproject.org, Sinthu Raja <sinthu.raja@ti.com>, 
	Aniket Limaye <a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-BESS-ID: 1675966525-310424-5380-22365-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.167.71
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246032 [from 
	cloudscan9-186.eu-central-1a.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 18:15:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15775

On Thu, Feb 9, 2023 at 11:23 PM Andrew Davis <afd@ti.com> wrote:
>
> On 2/9/23 9:19 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> > From: Sinthu Raja <sinthu.raja@ti.com>
> >
> > Add the basic J721S2 HS-FS configuration.
> >      - Add configurations to support both HS-FS and GP.
> >      - Add ti-sci-firmware overrides for HS-FS.
>
> I see HS-FS was made the default here. I'm all for this change, but for
> Dunfell we are already established with GP as the default in j721s2-evm.conf.
> Documentation, test farm, and SDK deployment all expect it. Unless there
> was some alignment for dropping "GP as default" for J721s2 that I'm not aware
> of we will need to keep GP default for now.
>
Andrew,
The intention is to keep GP as default,  I will update and repost it.

Regards
Sinthu Raja

> I'd suggest making a new j721s2-hs-fs-evm.conf, or leaving the default GP
> and having HS-FS be the selectable option in this file.
>
> For Kirkstone, we should go HS-FS by default and also add HS-SE as
> an option to this one conf (j721s2-evm.conf) along with GP. That way we
> can also remove j721s2-hs-evm.conf and have one config for all types.
>
> See AM64x for an example of 3 types in one when you make this change
> on kirkstone/master branches.
>
> Andrew
>
> >
> > Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> > Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > ---
> >
> > Hi,
> > This patch is validated locally by Aniket.
> >
> > RFC Link: https://lists.yoctoproject.org/g/meta-ti/message/15651
> >
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
> > index 7c120dcc..9cec9631 100644
> > --- a/conf/machine/j721s2-evm.conf
> > +++ b/conf/machine/j721s2-evm.conf
> > @@ -42,3 +42,15 @@ UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
> >
> >   do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> >   do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> > +
> > +# Default tiboot3.bin on J721S2 is for SR1.0 HS-FS
> > +BBMULTICONFIG = "k3r5-sr1-hs-fs"
> > +IMAGE_BOOT_FILES += " tiboot3-j721s2-hs-fs-evm.bin"
> > +do_image_wic[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> > +do_image_tar[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> > +
> > +# Since default tiboot3.bin on J721S2 is for SR1.0 HS-FS, add a version for GP
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
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#15771): https://lists.yoctoproject.org/g/meta-ti/message/15771
> > Mute This Topic: https://lists.yoctoproject.org/mt/96854989/3619733
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
With Regards
Sinthu Raja


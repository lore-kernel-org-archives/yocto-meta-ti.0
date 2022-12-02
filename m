Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1991C4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 18:58:13 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.84531.1670007485496161336
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 10:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qUW7TnQW;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-14263779059so6579486fac.1
        for <meta-ti@lists.yoctoproject.org>; Fri, 02 Dec 2022 10:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R38gms8VHnIz/M/o4r6YfpZNNBS2tYBgLkimY2nBkDE=;
        b=qUW7TnQWi3YhXxWMYgW3di/NDjsZt5XBtb6YIHi1ywwi9AeMs9Ko2ZBbl2RFuOxXet
         s721s0s2FtqRfNwZBZgDjNbw62T/dxsm57QfhvlkMwf3NoJN40P8rl0cJp3K/fUW2JNS
         /lnXCMPQ/pEMUzVKnU/X01uIWZBcWgwzbnDSypX1IL4Hmld+iqqZHHl0/b+WYcXGVpSe
         ijEtpLs1rKaV9DbRbIZHIkuAqbLUrf2wFObsRjnLoekOdf7z1DLGvFaAp5oPZXxzSOg9
         D4os+tO2zATdAUljg2KT00yGrXRRJVyWObsPc6apHeSjEjopwTI0zFtlYqmkPf1ytkaw
         VPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R38gms8VHnIz/M/o4r6YfpZNNBS2tYBgLkimY2nBkDE=;
        b=c4dEQSAt+01OwgOWP854y9xxEWel3IeiU39HWcOBDslRpp+Lq4Tw0DO94MoGLIB/yW
         IxfHfEd29q2RlTvsw1ZceVOkykaRGWUCp+lztSwfljNfxnxIb5/JmswZAU3nogFtsmlK
         y7W7ga6WSVGFq6aiCHYqTeUbSCGbzVet5NvEGpCqgOI0HQPHiDoOBVCWNeu/J2yGQgRv
         HaSf2UC2F8rYRqNVbAlPadXamtYKbXtvNO3w5deUgBDC26BY5V4PWjLyzCjwPjVfDjOZ
         e9/RQlRHHVPb6X/Fo94yQFThVjBl/39FRNQrWhJRZBWDoEA61IM4izI2A8hrBT4n3ffr
         Vopg==
X-Gm-Message-State: ANoB5pnqWgZln/CBuLitKdqNMudflP5u9y2/8H8p48yQzrI3bYh8iqk1
	GxVB6kJskTsK5RCCpbuxrcwDOUvV+rhRMuQw9dI=
X-Google-Smtp-Source: AA0mqf6BQGDaqFpqI+0MU2GsqL4ep/DO++pDsrPtgW8ktKu/leI9RoHmo/Av+ZcvDGK4ee8LVpTHYynS93FnXK8cYMc=
X-Received: by 2002:a05:6871:4199:b0:142:d126:dc55 with SMTP id
 lc25-20020a056871419900b00142d126dc55mr30393483oab.262.1670007484560; Fri, 02
 Dec 2022 10:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20221201064805.2094474-1-raj.khem@gmail.com> <20221201143643.GT22689@denix.org>
 <CAMKF1sq=gYbvmiNYZyCf6oYDO4B0zELWF0F-hgBhVgW9KwXjZA@mail.gmail.com> <d95ec770-88d8-c27d-008c-7cfd6b706ed2@ti.com>
In-Reply-To: <d95ec770-88d8-c27d-008c-7cfd6b706ed2@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Dec 2022 10:57:38 -0800
Message-ID: <CAMKF1sqAJXscBK=bYq_2ML3jNo-ZEtXOX=5LeguEP9P9sAor6w@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] linux-ti: Drop unneeded update_data calls
To: Ryan Eatmon <reatmon@ti.com>
Cc: denis@denix.org, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Dec 2022 18:58:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15390

Ryan

Thanks for applying the fixes. I am seeing another issue

2022-12-02T17:26:17.8104311Z ERROR:
linux-ti-staging-5.10.145+gitAUTOINC+8b51d20b6e-0b do_patch: Fuzz
detected:
2022-12-02T17:26:17.8105197Z
2022-12-02T17:26:17.8106282Z Applying patch
init_disassemble_info-signature-changes-causes-compile-failures.patch
2022-12-02T17:26:17.8107676Z patching file tools/perf/util/annotate.c
2022-12-02T17:26:17.8108593Z Hunk #1 succeeded at 1685 with fuzz 2.
2022-12-02T17:26:17.8109470Z Hunk #2 succeeded at 1739 with fuzz 2.
2022-12-02T17:26:17.8109999Z
2022-12-02T17:26:17.8110016Z
2022-12-02T17:26:17.8110542Z The context lines in the patches can be
updated with devtool:
2022-12-02T17:26:17.8111180Z
2022-12-02T17:26:17.8117818Z     devtool modify linux-ti-staging
2022-12-02T17:26:17.8118351Z     devtool finish --force-patch-refresh
linux-ti-staging <layer_path>
2022-12-02T17:26:17.8118625Z
2022-12-02T17:26:17.8118872Z Don't forget to review changes done by devtool!
2022-12-02T17:26:17.8119097Z
2022-12-02T17:26:17.8126616Z ERROR:
linux-ti-staging-5.10.145+gitAUTOINC+8b51d20b6e-0b do_patch: QA Issue:
Patch log indicates that patches do not apply cleanly. [patch-fuzz]


Do you have a patch for this too ?

On Thu, Dec 1, 2022 at 12:48 PM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
> On 12/1/2022 11:40, Khem Raj wrote:
> > On Thu, Dec 1, 2022 at 6:36 AM Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >> NAK
> >>
> >> cmem is being removed:
> >> https://patchwork.yoctoproject.org/project/ti/patch/20221104224653.1223044-51-denis@denix.org/
> >>
> >> ti-unpack is being patched already:
> >> https://patchwork.yoctoproject.org/project/ti/patch/20221125230020.5316-1-reatmon@ti.com/
> >>
> >> It's just getting longer to get the patches merged due to other breakages
> >> in master...
> >
> > Can we expedite these two fixes or atleast my cosmetic change ? this
> > will fix CI breakages for distros
> > living on master.
>
> Just updated master-wip -> master.  So your issue should be fixed now.
>
>
> >>
> >> --
> >> Denys
> >>
> >>
> >> On Wed, Nov 30, 2022 at 10:48:05PM -0800, Khem Raj wrote:
> >>>   datastore works dynamically we don't need the update_data calls
> >>>   anymore, so far they were no-ops, now bitbake has recently dropped this
> >>>   API and hence compile fails with core/master
> >>>
> >>>   Fixes
> >>>    *** 0052:        bb.data.update_data(localdata)
> >>>       0053:
> >>>       0054:        cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
> >>>       0055:
> >>>       0056:    d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
> >>> Exception: AttributeError: module 'bb.data' has no attribute 'update_data'
> >>>
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ---
> >>>   meta-ti-bsp/recipes-kernel/linux/cmem.inc        | 2 --
> >>>   meta-ti-extras/recipes-ti/includes/ti-unpack.inc | 1 -
> >>>   2 files changed, 3 deletions(-)
> >>>
> >>> diff --git a/meta-ti-bsp/recipes-kernel/linux/cmem.inc b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
> >>> index fd913f6c..f560932c 100644
> >>> --- a/meta-ti-bsp/recipes-kernel/linux/cmem.inc
> >>> +++ b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
> >>> @@ -49,7 +49,6 @@ python do_unpack() {
> >>>           # Create copy of data for additional override
> >>>           localdata = bb.data.createCopy(d)
> >>>           localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
> >>> -        bb.data.update_data(localdata)
> >>>
> >>>           cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
> >>>
> >>> @@ -67,7 +66,6 @@ python do_setup_cmem() {
> >>>               # Create copy of data for additional override
> >>>               localdata = bb.data.createCopy(d)
> >>>               localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
> >>> -            bb.data.update_data(localdata)
> >>>
> >>>               # Get source directory and dtsi filename
> >>>               src_dir  = localdata.getVar('WORKDIR')
> >>> diff --git a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> >>> index 46bfb957..13068843 100644
> >>> --- a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> >>> +++ b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> >>> @@ -24,7 +24,6 @@ python ti_bin_do_unpack() {
> >>>           bb.fatal("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
> >>>
> >>>       localdata = bb.data.createCopy(d)
> >>> -    bb.data.update_data(localdata)
> >>>
> >>>       binfile  = localdata.getVar('BINFILE')
> >>>       binfile  = bb.data.expand(binfile, localdata)
> >>> --
> >>> 2.38.1
> >>>
> >>>
> >>>
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#15383): https://lists.yoctoproject.org/g/meta-ti/message/15383
> >>> Mute This Topic: https://lists.yoctoproject.org/mt/95376959/6551054
> >>> Group Owner: meta-ti+owner@lists.yoctoproject.org
> >>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E66C47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 17:40:45 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.51050.1669916437373705170
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 09:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SRt368mT;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id a7-20020a056830008700b0066c82848060so1416974oto.4
        for <meta-ti@lists.yoctoproject.org>; Thu, 01 Dec 2022 09:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NlNvMdtodtNYDfQaE6rEOAQOlVtbvXKuiHPLcUwcjQI=;
        b=SRt368mTTGQ6s9a+B4gF3eeLviX8+zGltK6tgDvAvi+VGXWn6IqqhtgEZOTZj+QlqO
         fVTo4lc1wSHagb+ZPuh9YbYlNHBVLcpuu/G70a4iTLflzICjBE+5H3JTwcq+HOV1cANM
         1zuMICqvnEAB0RfeB1C3DKHfplKRVy8iUTDeHVzfLcqZ5A0go+WOwgiaHxYdTh4HhmXK
         UKpaEXgd16EkE+BaT0Hhu9BJOAIK4elM5abYFVN71PUDctBesPZBhHue/S7X1jRYoKy5
         RmfudGgSMYtA0YFWjLoybw1yj8L1k8TZeMTjNtn58V2Tz0hZwLDn1el5mRY30vbB1Ldp
         2Lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NlNvMdtodtNYDfQaE6rEOAQOlVtbvXKuiHPLcUwcjQI=;
        b=ou1RZBnIk4hRP7aoJIY+AluOmVqUK//ipUtO/97CSJJy6tbkaISsz0LSFYyyo0XOvW
         OToZDscnGy+zaCBK0XF4mgvci7aVk694sSEiRcBM46RwcZkzwMkFqFN6J3aH8xJZyCc7
         pPy/a799821aLygJ8CYde4WUee6DEtcWLUIs4zmt4C7/ONlzy2Izu85L+sdnYF+aISoM
         y7Cr2qVj0eKeKqOK6p91uou+F04E/Wfxg+Pw5cH1UEvd/rHqnOiO7O22YmuS+H0dkv56
         c+OPjEqqjmH0+KFPZoD69FPr6LPhcVPeoR9Kj+G4+zsPn0fE0hHqjUSRwy+TAsRXhQM9
         p4HQ==
X-Gm-Message-State: ANoB5pnvcIpk/is7Bz1zFuf8M/AH7T3qm4XzZXTByHLDJgHrmnP8kNHf
	ma2lFNqJwgR1qH6kWtqw8ZfjXfPnGPKFzevNjSVF0JWu
X-Google-Smtp-Source: AA0mqf6N0aw6xGtYFQGFCq//V5P/gSdxABxaa1NXzpz8vcPKz3yJbfYI0v0v/TGp323FlUHH9TYunuD6GYpQnBF+qdA=
X-Received: by 2002:a9d:6486:0:b0:66d:ca7a:8b1a with SMTP id
 g6-20020a9d6486000000b0066dca7a8b1amr24707027otl.55.1669916436413; Thu, 01
 Dec 2022 09:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20221201064805.2094474-1-raj.khem@gmail.com> <20221201143643.GT22689@denix.org>
In-Reply-To: <20221201143643.GT22689@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2022 09:40:10 -0800
Message-ID: <CAMKF1sq=gYbvmiNYZyCf6oYDO4B0zELWF0F-hgBhVgW9KwXjZA@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] linux-ti: Drop unneeded update_data calls
To: denis@denix.org
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Dec 2022 17:40:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15383

On Thu, Dec 1, 2022 at 6:36 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> NAK
>
> cmem is being removed:
> https://patchwork.yoctoproject.org/project/ti/patch/20221104224653.1223044-51-denis@denix.org/
>
> ti-unpack is being patched already:
> https://patchwork.yoctoproject.org/project/ti/patch/20221125230020.5316-1-reatmon@ti.com/
>
> It's just getting longer to get the patches merged due to other breakages
> in master...

Can we expedite these two fixes or atleast my cosmetic change ? this
will fix CI breakages for distros
living on master.

>
> --
> Denys
>
>
> On Wed, Nov 30, 2022 at 10:48:05PM -0800, Khem Raj wrote:
> >  datastore works dynamically we don't need the update_data calls
> >  anymore, so far they were no-ops, now bitbake has recently dropped this
> >  API and hence compile fails with core/master
> >
> >  Fixes
> >   *** 0052:        bb.data.update_data(localdata)
> >      0053:
> >      0054:        cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
> >      0055:
> >      0056:    d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
> > Exception: AttributeError: module 'bb.data' has no attribute 'update_data'
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-ti-bsp/recipes-kernel/linux/cmem.inc        | 2 --
> >  meta-ti-extras/recipes-ti/includes/ti-unpack.inc | 1 -
> >  2 files changed, 3 deletions(-)
> >
> > diff --git a/meta-ti-bsp/recipes-kernel/linux/cmem.inc b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
> > index fd913f6c..f560932c 100644
> > --- a/meta-ti-bsp/recipes-kernel/linux/cmem.inc
> > +++ b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
> > @@ -49,7 +49,6 @@ python do_unpack() {
> >          # Create copy of data for additional override
> >          localdata = bb.data.createCopy(d)
> >          localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
> > -        bb.data.update_data(localdata)
> >
> >          cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
> >
> > @@ -67,7 +66,6 @@ python do_setup_cmem() {
> >              # Create copy of data for additional override
> >              localdata = bb.data.createCopy(d)
> >              localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
> > -            bb.data.update_data(localdata)
> >
> >              # Get source directory and dtsi filename
> >              src_dir  = localdata.getVar('WORKDIR')
> > diff --git a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> > index 46bfb957..13068843 100644
> > --- a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> > +++ b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> > @@ -24,7 +24,6 @@ python ti_bin_do_unpack() {
> >          bb.fatal("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
> >
> >      localdata = bb.data.createCopy(d)
> > -    bb.data.update_data(localdata)
> >
> >      binfile  = localdata.getVar('BINFILE')
> >      binfile  = bb.data.expand(binfile, localdata)
> > --
> > 2.38.1
> >


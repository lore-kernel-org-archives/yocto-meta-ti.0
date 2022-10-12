Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C4EC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 15:08:07 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web12.369.1665587279365312779
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 08:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZDWZzoJ3;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id x188so10428500oig.5
        for <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 08:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+18HsBrCy15c9Xlm0N/YJWeRoObJ034YW3psShvXZYU=;
        b=ZDWZzoJ3/VfCSo9D2/NjDRRSninUlMeqGRbrzthM7aUa227ZM+JxteAzwNqqOVqKep
         sj5yi6dtt5AsYJm5VKAP/GPVaRQAFtmJSH14y0VCSJ7FZPqe6tKgTnJvmptULJ3CuWVR
         xflssRWoxGK57x2uCnfsHWfiutk5Nl2HR0uTvEA6zsd4w0JfKkUvgbPGVT661iu6HQId
         /Cp0xQf8jTplYu/u0bcD4Vpt3hpd9xPf3SwXVzK7ffD1Bgw4dmWzHO1RGEP++iNofimb
         dq83EypPA962Z49I+TJDd3tr1UUlfLgi6rdHXWWlXLsoc4n8/pwcv7cBOTHGmNFMNON2
         HBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+18HsBrCy15c9Xlm0N/YJWeRoObJ034YW3psShvXZYU=;
        b=Dm2XwZ4zTS2yvv4DcH61E6KdqNUNJDF75M8e9up1gLPWvDVfNzKbUrF5B24SP+UaUX
         LAtcHgE70ctyOpu6cPoetdB3i6wgyYA7dFLnpo+PgaM3DyJ7HeHgHPSbQgyzu47+iVIv
         1x6kKsy4ubT+cR6kkaoIUu389rMttemCGx4swLhBsamH/WFUgybuTdl78zSOCXSycbnG
         gcJVm7ODskTcUWau6Elc9quod6RO5T9f1DElgkNV02VeUZeW9MZEruU13ftNpA7jLBaL
         BkMD1mCKk87TkFj/qFGCO3MaWnOOzEPswmZd5AkLOVU3JlC1EXN2o9K80XRkw5pHngZh
         49SQ==
X-Gm-Message-State: ACrzQf1UW2pydr0Qfd7MDief2VwlunyAubsavj97Z5HdoU5yimZMCQiS
	c3/b+riQFmhrTTaiXV+CfC65FhNS0HuUaeBFuZM=
X-Google-Smtp-Source: AMsMyM4rlGhGqouuz90gZ69lq4tlMv+Pf9vcIhdZErWNpZGZkzvmqlHHrGQFjnnlMEZuMx0dFyrvMXHj5p/+HmLw5Zw=
X-Received: by 2002:a05:6808:1910:b0:354:c2b:67e4 with SMTP id
 bf16-20020a056808191000b003540c2b67e4mr2359288oib.55.1665587278547; Wed, 12
 Oct 2022 08:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221005153114.265420-1-raj.khem@gmail.com> <c8c49492-b9a3-726a-2b34-26cccfe389dd@ti.com>
In-Reply-To: <c8c49492-b9a3-726a-2b34-26cccfe389dd@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2022 08:07:32 -0700
Message-ID: <CAMKF1soSzy_X2=5zAyJhhnLi1b60_Y1U21oDHK-uuDaoXKr1Yw@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH v2 1/2] layers: Bump layer compatibility to langdale
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 15:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15157

On Wed, Oct 12, 2022 at 7:56 AM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 10/5/2022 10:31 AM, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Replace kirkstone instead of adding just langdale
> >
> >   meta-ti-bsp/conf/layer.conf    | 2 +-
> >   meta-ti-extras/conf/layer.conf | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> > index e3542f50..76c1af2f 100644
> > --- a/meta-ti-bsp/conf/layer.conf
> > +++ b/meta-ti-bsp/conf/layer.conf
> > @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
> >   BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
> >   BBFILE_PRIORITY_meta-ti-bsp = "6"
> >
> > -LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone"
> > +LAYERSERIES_COMPAT_meta-ti-bsp = "langdale"
>
> Since we are trying to keep master and kirkstone aligned as long we can,
> we cannot accept the patch on master that removes kirkstone.  Your
> previous patch was better in that regard.

OK take the v1 thats fine.

>
>
> >   LICENSE_PATH += "${LAYERDIR}/licenses"
> >
> > diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
> > index 1fb77e2a..96d5e315 100644
> > --- a/meta-ti-extras/conf/layer.conf
> > +++ b/meta-ti-extras/conf/layer.conf
> > @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
> >   BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
> >   BBFILE_PRIORITY_meta-ti-extras = "6"
> >
> > -LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone"
> > +LAYERSERIES_COMPAT_meta-ti-extras = "langdale"
> >
> >   LICENSE_PATH += "${LAYERDIR}/licenses"
> >
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#15111): https://lists.yoctoproject.org/g/meta-ti/message/15111
> > Mute This Topic: https://lists.yoctoproject.org/mt/94137980/6551054
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS


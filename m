Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B78C77B7C
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 22:37:44 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.6754.1750631861673726052
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 15:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FaGzxDRh;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c7a52e97so2744680b3a.3
        for <meta-ti@lists.yoctoproject.org>; Sun, 22 Jun 2025 15:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750631861; x=1751236661; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZF31mVT28NGuC014afRRVjztDx4bKbqrfUljigi9/YE=;
        b=FaGzxDRhSPc9YkvwzRfFm6ASS6bSnMazQM1WdCg6Qo4jKqaeZNU/EeGGPSrievzzXY
         I+EllLTm/f9c02zxel5x1Z/YluV1/QsQ3IRQ0zINeNyAtrCzAB7XND0444s7DSshVn11
         IZG4RswzHNnXgkh1lvEpoC+VDnXlaRHCm+zu8EVkv7aqEmZZCG5bHtmeaXjgjVQYGbBN
         7Ceanq4SMQeX1/p2zUrVyIy5ZxDRs0UP17GQs/75aKXgQ2qQwvEs76gtjrE5fm2c5/E8
         vPK+x1qPvJJsDymM02Htsogh3Ekba5127uF9zAKAjvYq1UzayK8AVas441dEpvawk8k/
         MLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750631861; x=1751236661;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF31mVT28NGuC014afRRVjztDx4bKbqrfUljigi9/YE=;
        b=bNO4PT7p7IMxbQ54hvrP6iD0iijusPRWSG7KS303bHvPno/VyHFZqv36LetZg4Hb5L
         JWB6SXadkoL/Jgg4pgUmRZOXTKPtIxF0TRnbvOpFrB3Uc68hOYQU+UPEpdPk3aCYK6qa
         qPJ9wpwk6EsXWDnJuf3KBIlbodbpNvdQouydjgBCixxYRvO5+oN47l0QPTLWBbozyM/s
         TxvxvVfTCtqTqYu+xUXRY+8rRClkI/nBGDZ2wn2iFN59m1mp7cvlSHThZVZvWq6/4z8H
         E7McZUOxvd/3r01IuivD1bhbV1R6ubrEjJ7TcIEgMVlghXfzHBRfa14BdHF7vLm27iks
         fJIQ==
X-Gm-Message-State: AOJu0Yzb+aPsj/f1BaXXTpczz2HEkH/aeJeuZL+hY3WZqFv7jUMUPIEH
	LQI/W5bw9w/hYiDejd4QD+dGGZPgvmNjZh3P5qxvii+gyC6MgI2R3u5t
X-Gm-Gg: ASbGncsh7vZ3CdZSHKLAtJZdhz1nkwpgl+VhBV8vyv6GFf91ZEtWAmFuKTYOHbVorm8
	h4OEnGZD4kiEreL5ZIuZOi8UOEBQoZqKwRH2K3fjRoEWszP6YlDkvf/fs11T1jJuLlLlJbUiZrZ
	TqlB6w4x2XdlhV54C9/CmUmluqkQXR7ZlrJ+Y93zTkMOGefXgSNibrQMlMhQi6jBhRcm87khNxO
	8G9jalXinuLYfWJRGLN7aOTUdr08VfXMxm5T3G+NEGZO+XW7hIfeHVnUm6i6QQEpQmZ9zjZE22u
	q5+lJlJ2LNhTlqtM4kIKa/kg36QSZUX0UFRy8H7+OvAJ6+aTU2xonZ+epl+6
X-Google-Smtp-Source: AGHT+IHSHPo3tBZy/vLPAH2HAhD4L7qgI7Wr5UsGoQsjrl7rMWH9rlqWoIBzsurha9C2XxX/x/347w==
X-Received: by 2002:a05:6a21:b82:b0:21f:39c9:2122 with SMTP id adf61e73a8af0-22026e6036fmr16172011637.2.1750631860982;
        Sun, 22 Jun 2025 15:37:40 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119e820sm6313287a12.23.2025.06.22.15.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 15:37:40 -0700 (PDT)
Date: Sun, 22 Jun 2025 19:37:37 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [meta-ti] [master][PATCH] meta-ti: layer.conf: add compatibility
 with the new whinlatter release
Message-ID: <20250622223737.vfasir2kwychfdis@hiagonb>
References: <20250622170731.11233-1-hiagofranco@gmail.com>
 <184B7922D7011456.5850@lists.yoctoproject.org>
 <8e688370-e889-4a49-9a15-1c24b6aa1335@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e688370-e889-4a49-9a15-1c24b6aa1335@ti.com>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 22 Jun 2025 22:37:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18667

On Sun, Jun 22, 2025 at 04:03:01PM -0500, Ryan Eatmon wrote:
> 
> My bad.  I didn't see that you updated all three layers!  I need to read
> closer.  I'll take a look at this patch right away and get it on master to
> free up those builds.

Thanks Ryan!

Best Regards,
Hiago

> 
> 
> On 6/22/2025 4:01 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> > 
> > Thank you for the patch.� There is a third layer in meta-ti that is
> > missing from this patch.� I'll send a more comprehensive version.
> > 
> > 
> > On 6/22/2025 12:07 PM, Hiago De Franco via lists.yoctoproject.org wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > 
> > > Update all layers with the new Yocto release, fixing the current build
> > > error:
> > > 
> > > ERROR: Layer meta-ti-bsp is not compatible with the core layer which
> > > only supports these series: whinlatter (layer is compatible with styhead
> > > walnascar)
> > > 
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > � meta-beagle/conf/layer.conf��� | 2 +-
> > > � meta-ti-bsp/conf/layer.conf��� | 2 +-
> > > � meta-ti-extras/conf/layer.conf | 2 +-
> > > � 3 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
> > > index b5d3eaaa770c..d036bb08b36a 100644
> > > --- a/meta-beagle/conf/layer.conf
> > > +++ b/meta-beagle/conf/layer.conf
> > > @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-beagle"
> > > � BBFILE_PATTERN_meta-beagle := "^${LAYERDIR}/"
> > > � BBFILE_PRIORITY_meta-beagle = "6"
> > > -LAYERSERIES_COMPAT_meta-beagle = "styhead walnascar"
> > > +LAYERSERIES_COMPAT_meta-beagle = "walnascar whinlatter"
> > > � LAYERDEPENDS_meta-beagle = " \
> > > ����� meta-ti-bsp \
> > > diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> > > index 6d2b0a9a14b0..481daf2cc997 100644
> > > --- a/meta-ti-bsp/conf/layer.conf
> > > +++ b/meta-ti-bsp/conf/layer.conf
> > > @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
> > > � BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
> > > � BBFILE_PRIORITY_meta-ti-bsp = "6"
> > > -LAYERSERIES_COMPAT_meta-ti-bsp = "styhead walnascar"
> > > +LAYERSERIES_COMPAT_meta-ti-bsp = "walnascar whinlatter"
> > > � LICENSE_PATH += "${LAYERDIR}/licenses"
> > > diff --git a/meta-ti-extras/conf/layer.conf
> > > b/meta-ti-extras/conf/layer.conf
> > > index bd13967322fc..d340c414fc60 100644
> > > --- a/meta-ti-extras/conf/layer.conf
> > > +++ b/meta-ti-extras/conf/layer.conf
> > > @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
> > > � BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
> > > � BBFILE_PRIORITY_meta-ti-extras = "6"
> > > -LAYERSERIES_COMPAT_meta-ti-extras = "styhead walnascar"
> > > +LAYERSERIES_COMPAT_meta-ti-extras = "walnascar whinlatter"
> > > � LICENSE_PATH += "${LAYERDIR}/licenses"
> > > 
> > > 
> > > 
> > > 
> > > 
> > 
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#18665): https://lists.yoctoproject.org/g/meta-ti/message/18665
> > Mute This Topic: https://lists.yoctoproject.org/mt/113774522/6551054
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> -- 
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS


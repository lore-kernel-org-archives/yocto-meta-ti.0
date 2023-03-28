Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97C4C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 18:59:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.5365.1680029984584836746
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Mar 2023 11:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20210112.gappssmtp.com header.s=20210112 header.b=yQFSk94Z;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.128.52, mailfrom: troth@openavr.org)
Received: by mail-wm1-f52.google.com with SMTP id q7-20020a05600c46c700b003ef6e809574so4896728wmo.4
        for <meta-ti@lists.yoctoproject.org>; Tue, 28 Mar 2023 11:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20210112.gappssmtp.com; s=20210112; t=1680029983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpkFq8dY7bQVRooW76XgyJyZ4A31/tV8ZaNr0HwxmGo=;
        b=yQFSk94Zrnzz2FSry5F6xmvlDsVqm36n4yAGmp6nUbXJCw1uGaKBCy3MG89BtYPmqj
         lWd6yl9g3/TDuJ9Ia4AdIaixI5MfYV3Zspr9fjP8Q3ojVoN+BmuLJ8XEUAtCt8xN717e
         p7If5/3JGQaDauYLHtlQZVQIFCowCT7SEMlWiW2qBizHlcn9NJmINyricBRGN+4rDKSg
         FGT1iJOwsLJ3Oru77O0gKtP7baSwMN9DzfCVGOvZUNWvMAO3zbVL2qa1+4mB3cVkmK7P
         U49V7vosucMTAI4Z9opT2EqKdO1vuC8FiWiFC1ddz5CNx1hwDk/ihqXdxLeba3Ys81qW
         ladA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680029983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpkFq8dY7bQVRooW76XgyJyZ4A31/tV8ZaNr0HwxmGo=;
        b=UJJBXOpWDMcPx5Avi4YDG4tM4irsJE0htx0kVjLYzuc9G1R9v+mxGdzSNrnsyhITb9
         Ifiz9hNTw1Q4rLPvQJ4zbQYny4BhNGglzIKOwIEen4BSHzCZWLQVwbZRAfynNhq9wosE
         hdaPfRycBhp1XM2vZUyfKMYltcMxyEdwRDx1LAXnWepM3Yhinctir7/PpXYo6LYEfW4A
         jKVJdifdh6/0HA/R1kOW1BFU6tNRlx98qc8trybOP71N9Br5F+r0VJzhIZhqWcBGSft1
         eoZmO/HrgDO53N0mBTCfPBnlOvAsAI7SJyIbIOdcoet52aptD3b8GskK9AuUdog/k/Sy
         ZcHA==
X-Gm-Message-State: AO0yUKVmdh14lDsX/xebORkaZ4FX+Hl3rLofNf0KlN7JRV6PHTjTyIHO
	jb4xw1nJjFVq8ne06zOOVvFtQ+zd/QU6MME6DmYynw==
X-Google-Smtp-Source: AK7set/Pk9KkA3axE+PkBFKIPwjYshNA/z1gn2yyt6fhjt3bNo4+Fc1qvr4vsb8hbmqqt1aaKE1OpxOlKQcLu2nQL1o=
X-Received: by 2002:a05:600c:218d:b0:3ed:241a:bd2d with SMTP id
 e13-20020a05600c218d00b003ed241abd2dmr3901459wme.6.1680029982638; Tue, 28 Mar
 2023 11:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230327170809.2115712-1-theodore_roth@trimble.com> <20230328152532.GT18050@denix.org>
In-Reply-To: <20230328152532.GT18050@denix.org>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Tue, 28 Mar 2023 12:59:31 -0600
Message-ID: <CAFMvBt2nEG5vbwU4rWBkccP4rsS1HgQQtHmzbWowHWXt7U5Tww@mail.gmail.com>
Subject: Re: [RFC][meta-ti][master][PATCH] meta-ti-bsp: Update mesa bbappend
 files for mesa-23
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, 
	"Theodore A . Roth" <theodore_roth@trimble.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Mar 2023 18:59:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16250

On Tue, Mar 28, 2023 at 9:26=E2=80=AFAM Denys Dmytriyenko <denis@denix.org>=
 wrote:
>
> Thanks for the patch!
>
> Has version 23 been tested with the PowerVR patches for HW acceleration?

We have not tested PowerVR stuff  as our product is headless.
Our builds are currently broken since we are tracking master for all
of the meta layer git repositories we use.

My intention for the patch was to bring the breakage to the attention
of meta-ti since master has
been broken for more than a week with no comments on the mailing list
(hence the RFC tag).

Now that the discussion has been started, I'm more than happy to help
out where I can to get this resolved.

Ted Roth

>
>
> On Mon, Mar 27, 2023 at 11:08:09AM -0600, Theodore A. Roth wrote:
> > From: "Theodore A. Roth" <troth@openavr.org>
> >
> > The mesa recipes in oe-core have been updated to mesa-23 causing the
> > following build error:
> >
> >     $ bitbake core-image-minimal
> >     Loading cache: 100% |                                              =
 | ETA:  --:--:--
> >     Loaded 0 entries from dependency cache.
> >     Parsing recipes: 100% |############################################=
#| Time: 0:00:20
> >     Parsing of 2816 .bb files complete (0 cached, 2816 parsed). 4472 ta=
rgets, 484 skipped, 0 masked, 0 errors.
> >     ERROR: No recipes in default available for:
> >       /build/../oe/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22=
.%.bbappend
> >       /build/../oe/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.=
bbappend
> >
> >     Summary: There was 1 ERROR message, returning a non-zero exit code.
> >
> > Signed-off-by: Theodore A. Roth <troth@openavr.org>
> > Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> > ---
> >  .../mesa/{mesa-gl_22.%.bbappend =3D> mesa-gl_23.%.bbappend}         | =
0
> >  .../mesa/{mesa_22.%.bbappend =3D> mesa_23.%.bbappend}               | =
0
> >  2 files changed, 0 insertions(+), 0 deletions(-)
> >  rename meta-ti-bsp/recipes-graphics/mesa/{mesa-gl_22.%.bbappend =3D> m=
esa-gl_23.%.bbappend} (100%)
> >  rename meta-ti-bsp/recipes-graphics/mesa/{mesa_22.%.bbappend =3D> mesa=
_23.%.bbappend} (100%)
> >
> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/=
meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
> > similarity index 100%
> > rename from meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
> > rename to meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/met=
a-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
> > similarity index 100%
> > rename from meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> > rename to meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
> > --
> > 2.34.1


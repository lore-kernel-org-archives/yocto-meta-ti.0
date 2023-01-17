Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B615EC6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 22:09:21 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.612.1673993359226619862
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 14:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jo0dK0v3;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id g25so3613436uaw.8
        for <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 14:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6C3iE2I1+kKfCBOnR1yj7MvA2lJZ3jNUh5iBx7G5KSE=;
        b=jo0dK0v38dd6szKUz36EC/Iy2V0ARpyFnrfb2X6icpT3eYFSJ6zqrPENfQO5NRd7f7
         Cpj8+6eWDovz5LT5qkst8MdXqS+DeWxRgR84aNUmBdiltEJJkR32AnstlbdxMdxupNt2
         LbCN6aRRK1wFnE8ESexsAdQrZXlZP481560Vzh5+/wsHC4SysvckemLInv5/cWokXvXt
         lXwhoxzmzJMjetTF2UNuIDyyF3w+ybPJXHr7HodoqH9xdl7Ny+pLz4tyJqSRqx/BdbA7
         k+m4TcMMKkBUIFERE8uGYosdvIlieRNm706ePmYUmhuxhOgvdblCLeDlpTEkivpnc2L9
         qaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6C3iE2I1+kKfCBOnR1yj7MvA2lJZ3jNUh5iBx7G5KSE=;
        b=J5l7xk/Nn7ZB12CVNL5Uu28v57LWkmf5/2r6FMeYA2XtXK/G/A2MLaymqtJeF494ax
         YpoEu49FxXqE/9omybKJ9wfWkKGfVtvA119UUnxpvnPiZU1gGGCkW61KrbNhRjoDb0Y1
         8bBUREmP6O5O6RYxx/t5JQWRUkgHQDssxqEiBK7SAtAJWIbS2ISyLHgw1P8fjbhEpaOP
         50iwt37isYyUwfcottfKvrakl7aBA2TMCgE8hs26bq93n7967j9C95JnPDTl2HpMEzht
         1lWK89guJZSzU6I+fdb+SeJJUJWZ3VL1Q/3kdtjXUNOJN16u2byt8YOGyODJrN3mQnh2
         LKwA==
X-Gm-Message-State: AFqh2kqhAwjqm8kmHzV1m/RW74bfUxhkky3jNFWXUFEvzX9jSuF9clAI
	seOsbTM+oYrDtaVy0k4A2CvlMjtOnji6DvVYcSE=
X-Google-Smtp-Source: AMrXdXsF9NDTqtU36jqHWa2/kVWY0VFCbqy+FENXPqjQqxw3R+NkwowErv91XsZ3lMFcULV7wkPl6aZWQ+6WHocPkbw=
X-Received: by 2002:ab0:3155:0:b0:419:25c5:30dc with SMTP id
 e21-20020ab03155000000b0041925c530dcmr562819uam.26.1673993358254; Tue, 17 Jan
 2023 14:09:18 -0800 (PST)
MIME-Version: 1.0
References: <20230116121626.885219-1-jose.quaresma@foundries.io> <4604d911-0dc1-9c3d-e182-95cd79ace9a7@ti.com>
In-Reply-To: <4604d911-0dc1-9c3d-e182-95cd79ace9a7@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 17 Jan 2023 22:09:07 +0000
Message-ID: <CANPvuRm_FOQdzG4fdMfwY_Y-Dw+XjGcxMp7XerZcXyhZcZ8F0w@mail.gmail.com>
Subject: Re: [meta-ti][PATCH 1/3] ti-k3-secdev: move from meta-ti-extras to meta-ti-bsp
To: Andrew Davis <afd@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Ricardo Salveti <ricardo@foundries.io>, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000079aa4405f27cf3d4"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 22:09:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15582

--00000000000079aa4405f27cf3d4
Content-Type: text/plain; charset="UTF-8"

Gently ping.

A segunda, 16/01/2023, 16:48, Andrew Davis <afd@ti.com> escreveu:

> On 1/16/23 6:16 AM, Jose Quaresma wrote:
> > The meta-ti-bsp layer is still broken for K3 HS platforms.
> >
> > The patch [1] makes the check-layer happy again as it does not
> > fail any more during bitbake parsing but it will be difficult
> > for the end user to discover this dependency on meta-ti-extras.
> > On the other side, meta-ti-extras depends on meta-ti-bsp so
> > this is a circular dependency.
> >
> > Currently the layer is broken for am62xx-evm/am64xx-evm machines:
> >
> > | ERROR: Nothing PROVIDES 'ti-k3-secdev-native' (but
> mc:k3r5:/srv/oe/build/conf/../../layers/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/
> ti-sci-fw_git.bb DEPENDS on or otherwise requires it). Close matches:
> > |  libtspi-dev-native
> > |  makedevs-native
> >
> > [1] - 8e43835c ti-sci-fw: make dependency on meta-ti-extras soft
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
>
> Acked-by: Andrew Davis <afd@ti.com>
>
> >   .../recipes-ti/secdev/ti-k3-secdev_git.bb                       | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >   rename {meta-ti-extras => meta-ti-bsp}/recipes-ti/secdev/
> ti-k3-secdev_git.bb (96%)
> >
> > diff --git a/meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
> b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> > similarity index 96%
> > rename from meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
> > rename to meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> > index 3763c339..fd3bd120 100644
> > --- a/meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
> > +++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> > @@ -4,7 +4,7 @@ SECTION = "devel"
> >   LICENSE = "BSD-3-Clause"
> >   LIC_FILES_CHKSUM =
> "file://manifest/k3-secdev-0.2-manifest.html;md5=f632a78870cc64550078d7b3cbac0892"
> >
> > -require recipes-ti/includes/ti-paths.inc
> > +include recipes-ti/includes/ti-paths.inc
> >
> >   # Native host tool only
> >   COMPATIBLE_MACHINE = "null"
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#15567):
> https://lists.yoctoproject.org/g/meta-ti/message/15567
> > Mute This Topic: https://lists.yoctoproject.org/mt/96304962/3619733
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000079aa4405f27cf3d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Gently ping.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">A segunda, 16/01/2023, 16:48, Andrew Davis &l=
t;<a href=3D"mailto:afd@ti.com" target=3D"_blank" rel=3D"noreferrer">afd@ti=
.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 1/16/23 6=
:16 AM, Jose Quaresma wrote:<br>
&gt; The meta-ti-bsp layer is still broken for K3 HS platforms.<br>
&gt; <br>
&gt; The patch [1] makes the check-layer happy again as it does not<br>
&gt; fail any more during bitbake parsing but it will be difficult<br>
&gt; for the end user to discover this dependency on meta-ti-extras.<br>
&gt; On the other side, meta-ti-extras depends on meta-ti-bsp so<br>
&gt; this is a circular dependency.<br>
&gt; <br>
&gt; Currently the layer is broken for am62xx-evm/am64xx-evm machines:<br>
&gt; <br>
&gt; | ERROR: Nothing PROVIDES &#39;ti-k3-secdev-native&#39; (but mc:k3r5:/=
srv/oe/build/conf/../../layers/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a=
 href=3D"http://ti-sci-fw_git.bb" rel=3D"noreferrer noreferrer noreferrer" =
target=3D"_blank">ti-sci-fw_git.bb</a> DEPENDS on or otherwise requires it)=
. Close matches:<br>
&gt; |=C2=A0 libtspi-dev-native<br>
&gt; |=C2=A0 makedevs-native<br>
&gt; <br>
&gt; [1] - 8e43835c ti-sci-fw: make dependency on meta-ti-extras soft<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" rel=3D"noreferrer noreferrer" target=3D"_blank">jose.quaresma@foun=
dries.io</a>&gt;<br>
&gt; ---<br>
<br>
Acked-by: Andrew Davis &lt;<a href=3D"mailto:afd@ti.com" rel=3D"noreferrer =
noreferrer" target=3D"_blank">afd@ti.com</a>&gt;<br>
<br>
&gt;=C2=A0 =C2=A0.../recipes-ti/secdev/<a href=3D"http://ti-k3-secdev_git.b=
b" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ti-k3-secdev_=
git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0rename {meta-ti-extras =3D&gt; meta-ti-bsp}/recipes-ti/sec=
dev/<a href=3D"http://ti-k3-secdev_git.bb" rel=3D"noreferrer noreferrer nor=
eferrer" target=3D"_blank">ti-k3-secdev_git.bb</a> (96%)<br>
&gt; <br>
&gt; diff --git a/meta-ti-extras/recipes-ti/secdev/<a href=3D"http://ti-k3-=
secdev_git.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">t=
i-k3-secdev_git.bb</a> b/meta-ti-bsp/recipes-ti/secdev/<a href=3D"http://ti=
-k3-secdev_git.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">ti-k3-secdev_git.bb</a><br>
&gt; similarity index 96%<br>
&gt; rename from meta-ti-extras/recipes-ti/secdev/<a href=3D"http://ti-k3-s=
ecdev_git.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ti=
-k3-secdev_git.bb</a><br>
&gt; rename to meta-ti-bsp/recipes-ti/secdev/<a href=3D"http://ti-k3-secdev=
_git.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ti-k3-s=
ecdev_git.bb</a><br>
&gt; index 3763c339..fd3bd120 100644<br>
&gt; --- a/meta-ti-extras/recipes-ti/secdev/<a href=3D"http://ti-k3-secdev_=
git.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ti-k3-se=
cdev_git.bb</a><br>
&gt; +++ b/meta-ti-bsp/recipes-ti/secdev/<a href=3D"http://ti-k3-secdev_git=
.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ti-k3-secde=
v_git.bb</a><br>
&gt; @@ -4,7 +4,7 @@ SECTION =3D &quot;devel&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://manifest/k3-secdev-0.2-m=
anifest.html;md5=3Df632a78870cc64550078d7b3cbac0892&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -require recipes-ti/includes/ti-paths.inc<br>
&gt; +include recipes-ti/includes/ti-paths.inc<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Native host tool only<br>
&gt;=C2=A0 =C2=A0COMPATIBLE_MACHINE =3D &quot;null&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#15567): <a href=3D"https://lists.yoctoproject.org/=
g/meta-ti/message/15567" rel=3D"noreferrer noreferrer noreferrer" target=3D=
"_blank">https://lists.yoctoproject.org/g/meta-ti/message/15567</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96304962=
/3619733" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https:=
//lists.yoctoproject.org/mt/96304962/3619733</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">meta-ti+owner@lists.yoctop=
roject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://lists.=
yoctoproject.org/g/meta-ti/unsub</a> [<a href=3D"mailto:afd@ti.com" rel=3D"=
noreferrer noreferrer" target=3D"_blank">afd@ti.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div>

--00000000000079aa4405f27cf3d4--


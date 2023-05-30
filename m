Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFDAC7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 20:20:48 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.4646.1685478044962138767
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 13:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LYHPyg/U;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2af2451b3f1so53897651fa.2
        for <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 13:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685478043; x=1688070043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uG29aAbkjH10pX7NSK3RPCULFqFUNakqvtPTlI9oq4k=;
        b=LYHPyg/UDcfUaGZqh0xFmNezSa5M3+HLmwKpVP7CqrFhuFyLF+JP50bTJGsbg6ODgn
         lKU9TVfoZOWetMJIfImFOZma8YtwFCKdZNvg1tSU8+R2NN+c7h26/RCJ2BmG8fx9biji
         R2ITw/oD7ff0s3kz6sA/wZvpfR64YNmDBuisLJecpsZURNIpLlVrwYe4CAYiDN0FDeei
         7bSwukjxEnmnoyPUOBckzYlaLOo2pvQYd5uWKDHgJmcTfI1FAKDzzFw6mj8nyW8FcAcQ
         FmmxVoJVTpf1IKf6unOf+d59nuAC63+HWlmuT+08t5JM7vauuFBZVlWf1cmjy28TbjV5
         CS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685478043; x=1688070043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uG29aAbkjH10pX7NSK3RPCULFqFUNakqvtPTlI9oq4k=;
        b=DLqKIXEYAIzYceOHXGF7qGtCe/c1kdoQVG+ub1QJjrvx+gTBrvy9ixs2CEAz01Ghny
         tcczhhhdWMX2BE+ZZ1VgFMSXIXOlXph6G3B3Xk7lMxDcnvnYZ75hCkHAqQOyn81rAWmA
         c+iWWcK6HqGDmIGjdq5in8vMvYTGBg5erM6lqtV+aCD897s7jurQfMfqGKmPsWV9RRO0
         ULpTxJWlqoqYFyH7r5CKT0/0SByJy0hej6nPnzx4fxMXR+kJeWjwR321S3jdNZc4C8DW
         GKSl1eZLpsMplQj4n1BD+kR8IaVfOQsr0TzxRX53sVBaYN0iLyPBvwDx1FlOJmwIPCRo
         ML1w==
X-Gm-Message-State: AC+VfDxrngUBjvRaEIKn1wtY+LEqO/YIzcihzehfLMNOVvmCdeiv4K9M
	DsvJAObCBDF7Mpdl1lSsv7CQOz92I4PliR3meEI=
X-Google-Smtp-Source: ACHHUZ4HA41API7aWphZjn40kQF+UowF/pmIf0D9FinWXjBN23Eqyk0u0JOFzXSalBj3zevBp+UZR9z+nLMgY3xfnGA=
X-Received: by 2002:a2e:9650:0:b0:2ad:9c26:3638 with SMTP id
 z16-20020a2e9650000000b002ad9c263638mr1537308ljh.52.1685478042792; Tue, 30
 May 2023 13:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <17635F3EC543510A.6918@lists.yoctoproject.org> <20230530191708.GI9226@denix.org>
In-Reply-To: <20230530191708.GI9226@denix.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 30 May 2023 22:20:32 +0200
Message-ID: <CALatG=7VEXBBBq2_B8zQU5WG35tYfB4kDeykspC7CBE3NWc1=Q@mail.gmail.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH 1/2] u-boot-ti: do_compile
 depends on the value of UBOOT_LOCALVERSION
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Content-Type: multipart/alternative; boundary="0000000000000476b605fceef007"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 20:20:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16637

--0000000000000476b605fceef007
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Denys/Ryan:

If we go with this fix, a similar fix for kernel recipe is also needed. Has
somebody done that?

the best,
thank you

Denys Dmytriyenko <denis@denix.org> =E6=96=BC 2023=E5=B9=B45=E6=9C=8830=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:17=E5=AF=AB=E9=81=93=EF=BC=9A

> Scratch these - Richard suggested a different fix.
>
>
> On Sun, May 28, 2023 at 05:36:41PM +0000, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@konsulko.com>
> >
> > Explicitly mark do_compile as depending on the value of
> UBOOT_LOCALVERSION
> > variable. Similar patch was submitted to OE-Core for upstream version o=
f
> > u-boot recipe:
> >
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230528171515.8=
32179-1-denis@denix.org/
> >
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> >  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > index 135f443b..4e645e4f 100644
> > --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > @@ -1,6 +1,7 @@
> >  # UBOOT_LOCALVERSION can be set to add a tag to the end of the
> >  # U-boot version string.  such as the commit id
> >  UBOOT_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> True).replace('AUTOINC+','')[:10]}"
> > +do_compile[vardepvalue] =3D "${UBOOT_LOCALVERSION}"
> >
> >  UBOOT_SUFFIX ?=3D "img"
> >  SPL_BINARY ?=3D "MLO"
> > --
> > 2.25.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16635):
> https://lists.yoctoproject.org/g/meta-ti/message/16635
> Mute This Topic: https://lists.yoctoproject.org/mt/99185909/1463641
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-ti/leave/12342633/1463641/171969788=
4/xyzzy
> [liu.ming50@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000476b605fceef007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Denys/Ryan:<div><br></div><div>If we go with this fix,=
 a similar fix for kernel recipe is also needed. Has somebody done that?</d=
iv><div><br></div><div>the best,</div><div>thank you</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Denys Dmytriyenko=
 &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; =E6=96=BC 2=
023=E5=B9=B45=E6=9C=8830=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:17=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Scratch these - Richard suggested a different fix.<br>
<br>
<br>
On Sun, May 28, 2023 at 05:36:41PM +0000, Denys Dmytriyenko wrote:<br>
&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.com" targ=
et=3D"_blank">denys@konsulko.com</a>&gt;<br>
&gt; <br>
&gt; Explicitly mark do_compile as depending on the value of UBOOT_LOCALVER=
SION<br>
&gt; variable. Similar patch was submitted to OE-Core for upstream version =
of<br>
&gt; u-boot recipe:<br>
&gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/20=
230528171515.832179-1-denis@denix.org/" rel=3D"noreferrer" target=3D"_blank=
">https://patchwork.yoctoproject.org/project/oe-core/patch/20230528171515.8=
32179-1-denis@denix.org/</a><br>
&gt; <br>
&gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.=
com" target=3D"_blank">denys@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bs=
p/recipes-bsp/u-boot/u-boot-ti.inc<br>
&gt; index 135f443b..4e645e4f 100644<br>
&gt; --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc<br>
&gt; +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc<br>
&gt; @@ -1,6 +1,7 @@<br>
&gt;=C2=A0 # UBOOT_LOCALVERSION can be set to add a tag to the end of the<b=
r>
&gt;=C2=A0 # U-boot version string.=C2=A0 such as the commit id<br>
&gt;=C2=A0 UBOOT_LOCALVERSION =3D &quot;-g${@d.getVar(&#39;SRCPV&#39;, True=
).replace(&#39;AUTOINC+&#39;,&#39;&#39;)[:10]}&quot;<br>
&gt; +do_compile[vardepvalue] =3D &quot;${UBOOT_LOCALVERSION}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 UBOOT_SUFFIX ?=3D &quot;img&quot;<br>
&gt;=C2=A0 SPL_BINARY ?=3D &quot;MLO&quot;<br>
&gt; -- <br>
&gt; 2.25.1<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#16635): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/16635" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/16635</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99185909/1463=
641" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/99185909/1463641</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/leave/1234=
2633/1463641/1719697884/xyzzy" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.yoctoproject.org/g/meta-ti/leave/12342633/1463641/1719697884/xyzzy</=
a> [<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000476b605fceef007--


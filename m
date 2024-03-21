Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C268CD11C2
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 14:29:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.9024.1711031347507785848
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Mar 2024 07:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=dOT/sb3J;
 spf=pass (domain: criticallink.com, ip: 209.85.167.50, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-513dd2d2415so1088803e87.3
        for <meta-ti@lists.yoctoproject.org>; Thu, 21 Mar 2024 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1711031345; x=1711636145; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2cWUaa0dKkDKtQ0glBmQSHDqfsMFlNZxNRZMjpXYf7g=;
        b=dOT/sb3J5/s0tLl7mspaYN52z/hSAWRHc0rAOodQ62VPhE+8wkXNwj3wW/for0U1Gl
         ska43BsMCMni2duBTCXcKbi/Mrh90QSKZzlfNaHen6iHpW6jDmFlakXBcZ6nN+x21Dxy
         YD/ZoiikLAJZao+GRwqYY0K4+G7TAeMNsU9Tg730xEylZ9blUNAAqAX5IIwPi4XM2aSh
         0IVKSdOYKx+boOk7NDzhmd5ZBuvJX0dme0RUlYl4KLjoCkku67c3lPRUomqZa8Iu1LAf
         2sSFT1B3PjS7vjL0ISCtnDrLz0B9LeZxazgk4imCenRAJpYaDasanC3QKolhh5n7kEXl
         fdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711031345; x=1711636145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cWUaa0dKkDKtQ0glBmQSHDqfsMFlNZxNRZMjpXYf7g=;
        b=Cld+iW07sH7kj/MaXWCOjbR+3WvyjU9pLU50NzjWwT6ryibLPX7skAeEIl+YX4/8XM
         9kXyc10Mxs3+vU1O+x4TI4Sz/0P/gYdNv9QMypPvhwfXwULu4oDG1Gdm4F2GvC4Vjz1y
         i7+i3PUtfbuttd9+qdRtZXuEIGULgwY36BLtC39aE5Ll2dQpBb1xYTp86qRiKp/BH96h
         fPLBEYqjFdQ3ecyvogrJxGom9yEyp5Boc/GRO9UrkWJCGw5DXDXeB2x9OJQXHerOjMl5
         iWXrfVP0UiyfoNJdfPpt9U2Cow6zURLx2I1hFSIAhWmM4DBBgyBMTW5pKB2KEg34ykQf
         sgjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW43VTL61QfBjsdwKUqNfEV4bJufamqhuDP+2cHQvKG5PUlW8RLya74qeykLJX7LxmLDgqxA9pFjTdnQK2f44lgCnMsO/Mh6EhJe8frMI=
X-Gm-Message-State: AOJu0YwQwCZufycXeaXTKhwNL2/UcG9SJXzBdWXVzeZxWjtfHH3xvSwU
	nXBne1opygx87ezT67AcsrV3c6Dnb/KBMLDJ86Uq9QlOLuKxjnE9+fYnyuyFw3q6fId3M11cqXn
	wth+EddrTIkCyLKnktudRo15vMwrIdvUkMCLY
X-Google-Smtp-Source: AGHT+IFr7vEs7Egk8WyXPmm6/GqK5bFFdULlxO3y5m6vKEMiYWgZHjJH8oG34zYTKyRgKqubQrahgc4mHsUBKlQQkW0=
X-Received: by 2002:a19:5e11:0:b0:513:c97c:d5f with SMTP id
 s17-20020a195e11000000b00513c97c0d5fmr1649958lfb.12.1711031345403; Thu, 21
 Mar 2024 07:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240320200539.24116-1-reatmon@ti.com> <55c50dc9-1b6f-4d55-a2d5-713ed10a2219@ti.com>
 <1cbc062e-4c18-4a75-9983-e2a568aae94d@ti.com>
In-Reply-To: <1cbc062e-4c18-4a75-9983-e2a568aae94d@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 21 Mar 2024 10:28:54 -0400
Message-ID: <CADL8D3ZHNOe5T3QxaeTaGzxsXHvOUjYQkixyfetf00hoq7aZPw@mail.gmail.com>
Subject: Re: [meta-ti][scarthgap][PATCH] README: update with scarthgap
 specific info
To: reatmon@ti.com
Cc: Chirag Shilwant <c-shilwant@ti.com>, meta-ti@lists.yoctoproject.org, 
	Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri <praneeth@ti.com>
Content-Type: multipart/alternative; boundary="0000000000008af5ef06142c8714"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Mar 2024 14:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17546

--0000000000008af5ef06142c8714
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

s/scratchgap/scarthgap/

But regardless neither repo has the properly named branch either.  Though
meta-qt6 does :)

On Thu, Mar 21, 2024 at 9:43=E2=80=AFAM Ryan Eatmon via lists.yoctoproject.=
org
<reatmon=3Dti.com@lists.yoctoproject.org> wrote:

>
>
> On 3/20/2024 11:29 PM, Chirag Shilwant wrote:
> >
> > On 21/03/24 01:35, Ryan Eatmon via lists.yoctoproject.org wrote:
> >> All READMEs were still mentioning master, update that. Signed-off-by:
> >> Ryan Eatmon <reatmon@ ti. com> --- meta-ti-bsp/README | 4 ++--
> >> meta-ti-extras/README | 6 +++--- 2 files changed, 5 insertions(+), 5
> >> deletions(-) diff --git a/meta-ti-bsp/README
> >> ZjQcmQRYFpfptBannerStart
> >> This message was sent from outside of Texas Instruments.
> >> Do not click links or open attachments unless you recognize the source
> >> of this email and know the content is safe.
> >> ZjQcmQRYFpfptBannerEnd
> >> All READMEs were still mentioning master, update that.
> >>
> >> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >> ---
> >>   meta-ti-bsp/README    | 4 ++--
> >>   meta-ti-extras/README | 6 +++---
> >>   2 files changed, 5 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README
> >> index c5780531..70c40d4e 100644
> >> --- a/meta-ti-bsp/README
> >> +++ b/meta-ti-bsp/README
> >> @@ -8,11 +8,11 @@ This layer depends on:
> >>   URI: git://git.openembedded.org/openembedded-core
> >>   layers: meta
> >> -branch: master
> >> +branch: scarthgap
> >>   URI: git://git.yoctoproject.org/meta-arm
> >>   layers: meta-arm
> >> -branch: master
> >> +branch: scarthgap
> >
> >
> > meta-arm:scratchgap is yet to be created -
> > https://git.yoctoproject.org/meta-arm/log/?h=3Dscratchgap
> > Maybe they are waiting for April to start :) -
> > https://wiki.yoctoproject.org/wiki/Releases
>
> Yes.  I'm just staging the commits so we can roll them out when ready
> and so other folks don't feel the need to send patches that are already
> in the queue.
>
>
> >
> >>   The base BSP part of meta-ti should work with different
> >> OpenEmbedded/Yocto
> >> diff --git a/meta-ti-extras/README b/meta-ti-extras/README
> >> index 1b38921a..c6c058e0 100644
> >> --- a/meta-ti-extras/README
> >> +++ b/meta-ti-extras/README
> >> @@ -8,14 +8,14 @@ This layer depends on:
> >>   URI: git://git.openembedded.org/openembedded-core
> >>   layers: meta
> >> -branch: master
> >> +branch: scarthgap
> >>   URI: git://git.yoctoproject.org/meta-arm
> >>   layers: meta-arm
> >> -branch: master
> >> +branch: scarthgap
> >>   URI: git://git.yoctoproject.org/meta-ti
> >> -branch: master
> >> +branch: scarthgap
> >>   revision: HEAD
> >>   layers: meta-ti-bsp
> >> --
> >> 2.17.1
> >>
> >>
> >>
> >>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17545):
> https://lists.yoctoproject.org/g/meta-ti/message/17545
> Mute This Topic: https://lists.yoctoproject.org/mt/105052436/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

<https://www.linkedin.com/company/critical-link-llc>
<https://twitter.com/Critical_Link>

--0000000000008af5ef06142c8714
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>s/scratchgap/scarthgap/</div><div><br></div><div>But =
regardless neither repo has the properly named branch either.=C2=A0 Though =
meta-qt6 does :)<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Mar 21, 2024 at 9:43=E2=80=AFAM Ryan Eatm=
on via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a>=
 &lt;reatmon=3D<a href=3D"mailto:ti.com@lists.yoctoproject.org">ti.com@list=
s.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
<br>
On 3/20/2024 11:29 PM, Chirag Shilwant wrote:<br>
&gt; <br>
&gt; On 21/03/24 01:35, Ryan Eatmon via <a href=3D"http://lists.yoctoprojec=
t.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrot=
e:<br>
&gt;&gt; All READMEs were still mentioning master, update that. Signed-off-=
by: <br>
&gt;&gt; Ryan Eatmon &lt;reatmon@=E2=80=8Ati.=E2=80=8Acom&gt; --- meta-ti-b=
sp/README | 4 ++-- <br>
&gt;&gt; meta-ti-extras/README | 6 +++--- 2 files changed, 5 insertions(+),=
 5 <br>
&gt;&gt; deletions(-) diff --git a/meta-ti-bsp/README<br>
&gt;&gt; ZjQcmQRYFpfptBannerStart<br>
&gt;&gt; This message was sent from outside of Texas Instruments.<br>
&gt;&gt; Do not click links or open attachments unless you recognize the so=
urce <br>
&gt;&gt; of this email and know the content is safe.<br>
&gt;&gt; ZjQcmQRYFpfptBannerEnd<br>
&gt;&gt; All READMEs were still mentioning master, update that.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" t=
arget=3D"_blank">reatmon@ti.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 meta-ti-bsp/README=C2=A0=C2=A0=C2=A0 | 4 ++--<br>
&gt;&gt; =C2=A0 meta-ti-extras/README | 6 +++---<br>
&gt;&gt; =C2=A0 2 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README<br>
&gt;&gt; index c5780531..70c40d4e 100644<br>
&gt;&gt; --- a/meta-ti-bsp/README<br>
&gt;&gt; +++ b/meta-ti-bsp/README<br>
&gt;&gt; @@ -8,11 +8,11 @@ This layer depends on:<br>
&gt;&gt; =C2=A0 URI: git://<a href=3D"http://git.openembedded.org/openembed=
ded-core" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openemb=
edded-core</a><br>
&gt;&gt; =C2=A0 layers: meta<br>
&gt;&gt; -branch: master<br>
&gt;&gt; +branch: scarthgap<br>
&gt;&gt; =C2=A0 URI: git://<a href=3D"http://git.yoctoproject.org/meta-arm"=
 rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-arm</a><br>
&gt;&gt; =C2=A0 layers: meta-arm<br>
&gt;&gt; -branch: master<br>
&gt;&gt; +branch: scarthgap<br>
&gt; <br>
&gt; <br>
&gt; meta-arm:scratchgap is yet to be created - <br>
&gt; <a href=3D"https://git.yoctoproject.org/meta-arm/log/?h=3Dscratchgap" =
rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-arm/=
log/?h=3Dscratchgap</a><br>
&gt; Maybe they are waiting for April to start :) - <br>
&gt; <a href=3D"https://wiki.yoctoproject.org/wiki/Releases" rel=3D"norefer=
rer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Releases</a><br>
<br>
Yes.=C2=A0 I&#39;m just staging the commits so we can roll them out when re=
ady <br>
and so other folks don&#39;t feel the need to send patches that are already=
 <br>
in the queue.<br>
<br>
<br>
&gt; <br>
&gt;&gt; =C2=A0 The base BSP part of meta-ti should work with different <br=
>
&gt;&gt; OpenEmbedded/Yocto<br>
&gt;&gt; diff --git a/meta-ti-extras/README b/meta-ti-extras/README<br>
&gt;&gt; index 1b38921a..c6c058e0 100644<br>
&gt;&gt; --- a/meta-ti-extras/README<br>
&gt;&gt; +++ b/meta-ti-extras/README<br>
&gt;&gt; @@ -8,14 +8,14 @@ This layer depends on:<br>
&gt;&gt; =C2=A0 URI: git://<a href=3D"http://git.openembedded.org/openembed=
ded-core" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openemb=
edded-core</a><br>
&gt;&gt; =C2=A0 layers: meta<br>
&gt;&gt; -branch: master<br>
&gt;&gt; +branch: scarthgap<br>
&gt;&gt; =C2=A0 URI: git://<a href=3D"http://git.yoctoproject.org/meta-arm"=
 rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-arm</a><br>
&gt;&gt; =C2=A0 layers: meta-arm<br>
&gt;&gt; -branch: master<br>
&gt;&gt; +branch: scarthgap<br>
&gt;&gt; =C2=A0 URI: git://<a href=3D"http://git.yoctoproject.org/meta-ti" =
rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-ti</a><br>
&gt;&gt; -branch: master<br>
&gt;&gt; +branch: scarthgap<br>
&gt;&gt; =C2=A0 revision: HEAD<br>
&gt;&gt; =C2=A0 layers: meta-ti-bsp<br>
&gt;&gt; -- <br>
&gt;&gt; 2.17.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#17545): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17545" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/17545</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105052436/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105052436/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_blank">j=
cormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div><font color=3D"#000000">Voice:=C2=A0=C2=A0<a value=
=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><div><font color=
=3D"#000000"><br></font></div><div><font color=3D"#000000"><img src=3D"http=
s://ci3.googleusercontent.com/mail-sig/AIorK4xml75fJPKYF7M9X5Dux4IrbtzZk0RB=
6jf8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br></font></div></div></div><=
div><div><font color=3D"#1155cc"><br></font></div><div><a href=3D"http://ww=
w.criticallink.com/" target=3D"_blank"><font color=3D"#1155cc">http://www.C=
riticalLink.com</font></a><br></div><div>6712 Brooklawn Parkway,=C2=A0Syrac=
use, NY 13211=C2=A0</div></div></div><div><div><br></div><div><font color=
=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://www.linkedin.com/co=
mpany/critical-link-llc" target=3D"_blank"><img src=3D"https://docs.google.=
com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D=
0B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ"></a>=C2=A0=C2=A0<a hre=
f=3D"https://twitter.com/Critical_Link" target=3D"_blank"><img alt=3D"" src=
=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1y=
WERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ=
"></a></font></font></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div>

--0000000000008af5ef06142c8714--


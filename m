Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED93C54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 17:57:57 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web10.845.1675101467276607898
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 09:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WMJS5dot;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id j1so2494517uan.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 09:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V6L1lvBsr6G3B5e1ifu8OQ0jpbLRB2B2bmxCFRW2OMo=;
        b=WMJS5dotwlNo+bBx4bsXHYTsY633xxSo59i9/o1IKS47eTlWZzAbWL0Xz7W2SozvG1
         2GQaGej+uOVHeSMkOth+U2NqLIZ5ZDGQfbGk1sAzLRqCAiuIN5h/ff6GjrFNfS/pSGSW
         /zhRBbZFoaqK05R8ToQVEPFSUPVB3ldB4Y88fKH2afDvl3wGLfBXYR+uFWVfF29WVKqe
         JAbf+1Kr40mR33RZwI0eaSHBESwkOQKss8dx1P8B1RkAOKeGe//anAMtiBJowVQTCuQv
         UjFPS4bhucmxsIv6IRdW7Px4YjhM6yU5mzz/7KZExZhiE8LyX7TLzFMWAi4KXVgI5PKW
         c2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6L1lvBsr6G3B5e1ifu8OQ0jpbLRB2B2bmxCFRW2OMo=;
        b=GwUzQ5pupux0mE/CUJMj/w4wqLAgkuPpcT88Tn2UGcnR4RexSfFCH7XtdLOzNHzUUq
         cQEXvY9L2eUBUeW/96u/LLC+3PCx6mlcwoZPuL/qCwICz2xSQDyCbtiZrw17A9BqN6pF
         P16vLd/qK29JFCCLncKBE4Z51E3XMqVhTh9TuoFyMbyqJdlxjX8KadxXSvn/h8WX0tki
         OzM0+YPQvITZX+1HpvGk3BrrfKEtBROFWL9A8zHM+5IcpeeBkxClR2/G6sLg6BkGxVDX
         rBR8zwRbvbhO+XcZIeA7ldBbP+mebk6dRx4sFhxE0TVoGNpCIp0m6k6tLxUd/XISY7uE
         2bvQ==
X-Gm-Message-State: AO0yUKUpzmmNlkp5XE79yDJGTP+dQv3b+Ta7i3nL0PWCjdaHYSHzYq/f
	Z+yt3IvWWujymPzLzlOxzaQbpoSfAa6ldGPTIPY=
X-Google-Smtp-Source: AK7set+QzHEzo89Ft8sm2cEJfg89IVqUvcXWhdOI2LvvusEeMjxyqf8p2scGFs19bY2lq4iiAujxATbn4IYE/jowBw0=
X-Received: by 2002:ab0:4905:0:b0:655:7634:8e78 with SMTP id
 z5-20020ab04905000000b0065576348e78mr2815736uac.1.1675101466214; Mon, 30 Jan
 2023 09:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20230130152000.705123-1-jose.quaresma@foundries.io>
 <74d5bfd6-556b-6194-ca78-771d86509e5f@ti.com> <20230130171811.GJ22689@denix.org>
In-Reply-To: <20230130171811.GJ22689@denix.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 30 Jan 2023 17:57:35 +0000
Message-ID: <CANPvuR=x6wZ7x1kPndVuWtSTgy12+wUyw4zpzZ7SgP-OPms4Qg@mail.gmail.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH] bsp: multiconfig: k3r5: allow
 customization by donwstream layers
To: Denys Dmytriyenko <denis@denix.org>
Cc: reatmon@ti.com, meta-ti@lists.yoctoproject.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000db48f805f37ef3d9"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 17:57:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15703

--000000000000db48f805f37ef3d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko <denis@denix.org> escreveu no dia segunda, 30/01/2023
=C3=A0(s) 17:18:

> On Mon, Jan 30, 2023 at 11:02:25AM -0600, Ryan Eatmon via
> lists.yoctoproject.org wrote:
> >
> >
> > On 1/30/2023 9:20, Jose Quaresma wrote:
> > >This patch adds the possibility to change some bitbake variable
> > >that cannot be changed anywhere else, one of then is the TMPDIR.
> > >
> > >Using the same TMPDIR it is very sensitive and prone to several errors
> > >when used in more complex situations.
> > >This configuration forces that all native packages have to be the same
> between all
> > >machines and this requirement is very easy to break.
> > >Suppose you use a macinhe override somewhere on a native recipe
>
> Even w/o multiconfig, this will break for multi-machine builds. Native
> packages are for the build host and have no knowledge about the target.
> You should probably look into cross packages instead of native ones for
> this use case.
>
> Altering native packages between different targets will cause them to
> rebuild, which they shouldn't. Moreover, it will mess up your sstate
> and lead to weird issues down the road when trying to re-use your
> sstate mirror/cache.
>

Is that the issue of rebuilding some native packages that I am trying to
avoid.
But it is very hard to fix this in OE-core and everything else layers what
happens.

For your information I have some other issues with multiconfig and native
packages
that have the source files provided on the layer. this two recipes don't
work with the
rm_work bbclass because the in one of the machines
texinfo-dummy-native gettext-minimal-native

Another issue is that sometimes one of the machines uses
the SOURCE_DATE_EPOCH_FALLBACK
and the other uses  SOURCE_DATE_EPOCH and this also triggers a rebuild of
one of the machines.

Recently a new issue with the rm_work and the spdx
comes in https://lists.openembedded.org/g/openembedded-core/message/174276
where I have the steps to reproduce.

All of these issues can be solved easily with TMDIR for each machine,
but because I understand it can be invasive I submit this patch that
doesn't change anything
in meta-ti but can add the possibility to use a different TMPDIR for each
machine.

A different TMPDIR for each machine is also referenced in the official
documentation
"Minimally, each configuration file must define the machine and the
temporary directory BitBake uses for the build. Suggested practice dictates
that you do not overlap the temporary directories used during the builds."
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manu=
al-intro.html#executing-a-multiple-configuration-build


>
> > >and this requirement is no longer met.
> > >Many of these anomalies can be verified with the use of the rm_work an=
d
> > >create-spdx bitbake classes.
> > >
> > >A previous attempt [1] had already been made but was refused
> > >but this way it can be done without side effects for other users.
> > >
> > >[1] https://lists.yoctoproject.org/g/meta-ti/message/14767
> >
> >
> > So the difference between this patch and the previous one, is that
> > you are now included a file that is not there normally so that you
> > can put the contents of the previous patch in the new include file
> > to get around the issue in the archiver.
>

The archiver issue is fixed but it will be very easy to break again.
Myself recently broke it again so I added a test to help there
https://git.yoctoproject.org/poky/commit/?id=3Db5baa7dc8bd1c0d2d78c532d97a4=
4120346b5edd



> >
> > I'm not saying I'm opposed to this approach (yet), I'm just trying
> > to understand the entire story.
> >
> > Did you find anything in looking at fixing the archiver to better
> > support the multi-config issue?
>

The issue now is different and is related with spdx and rm_work
https://lists.openembedded.org/g/openembedded-core/message/174276

With this patch I can set a new TMPDIR folder for each machine and
can build successfully.


> >
> >
> >
> > >Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > >---
> > >  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > >diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > >index deb07210..b69c5d6d 100644
> > >--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > >+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > >@@ -3,3 +3,5 @@ MAINMACHINE :=3D "${MACHINE}"
> > >  DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/images/${MAINMACHINE}"
> > >  MACHINE:append =3D "-k3r5"
> > >+
> > >+include conf/multiconfig/k3r5.inc
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15702):
> https://lists.yoctoproject.org/g/meta-ti/message/15702
> Mute This Topic: https://lists.yoctoproject.org/mt/96629864/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000db48f805f37ef3d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mail=
to:denis@denix.org">denis@denix.org</a>&gt; escreveu no dia segunda, 30/01/=
2023 =C3=A0(s) 17:18:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, Jan 30, 2023 at 11:02:25AM -0600, Ryan Eatmon via <a href=3D"=
http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.y=
octoproject.org</a> wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 1/30/2023 9:20, Jose Quaresma wrote:<br>
&gt; &gt;This patch adds the possibility to change some bitbake variable<br=
>
&gt; &gt;that cannot be changed anywhere else, one of then is the TMPDIR.<b=
r>
&gt; &gt;<br>
&gt; &gt;Using the same TMPDIR it is very sensitive and prone to several er=
rors<br>
&gt; &gt;when used in more complex situations.<br>
&gt; &gt;This configuration forces that all native packages have to be the =
same between all<br>
&gt; &gt;machines and this requirement is very easy to break.<br>
&gt; &gt;Suppose you use a macinhe override somewhere on a native recipe<br=
>
<br>
Even w/o multiconfig, this will break for multi-machine builds. Native <br>
packages are for the build host and have no knowledge about the target. <br=
>
You should probably look into cross packages instead of native ones for <br=
>
this use case.<br>
<br>
Altering native packages between different targets will cause them to <br>
rebuild, which they shouldn&#39;t. Moreover, it will mess up your sstate <b=
r>
and lead to weird issues down the road when trying to re-use your <br>
sstate mirror/cache.<br></blockquote><div><br>Is that the issue of rebuildi=
ng=C2=A0some native packages=C2=A0that I am trying to avoid.</div><div>But =
it is very hard to fix this in OE-core and everything=C2=A0else layers what=
 happens.<br><br>For your information I have some other issues with multico=
nfig and native packages</div><div>that have the source files provided on t=
he layer. this two recipes don&#39;t work with the=C2=A0</div><div>rm_work =
bbclass because the in one of the machines=C2=A0<br>texinfo-dummy-native ge=
ttext-minimal-native=C2=A0<br><br>Another issue=C2=A0is that sometimes=C2=
=A0one of the machines uses the=C2=A0SOURCE_DATE_EPOCH_FALLBACK</div><div>a=
nd the other uses=C2=A0=C2=A0SOURCE_DATE_EPOCH and this also triggers a reb=
uild of one of the machines.<br><br>Recently a new issue with the rm_work a=
nd the spdx<br>comes in <a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/174276">https://lists.openembedded.org/g/openembedded-co=
re/message/174276</a></div><div>where I have the steps to reproduce.<br><br=
>All of these issues can be solved easily=C2=A0with TMDIR for each machine,=
</div><div>but because I understand it can be invasive I submit this patch =
that doesn&#39;t=C2=A0change anything</div><div>in meta-ti but can add the =
possibility to use a different=C2=A0TMPDIR for each machine.<br><br></div><=
div>A different TMPDIR for each machine is also referenced in the official =
documentation</div><div>&quot;Minimally, each configuration file must defin=
e the machine and the temporary directory BitBake uses for the build. Sugge=
sted practice dictates that you do not overlap the temporary directories us=
ed during the builds.&quot;<br><a href=3D"https://docs.yoctoproject.org/bit=
bake/bitbake-user-manual/bitbake-user-manual-intro.html#executing-a-multipl=
e-configuration-build">https://docs.yoctoproject.org/bitbake/bitbake-user-m=
anual/bitbake-user-manual-intro.html#executing-a-multiple-configuration-bui=
ld</a></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
<br>
&gt; &gt;and this requirement is no longer met.<br>
&gt; &gt;Many of these anomalies can be verified with the use of the rm_wor=
k and<br>
&gt; &gt;create-spdx bitbake classes.<br>
&gt; &gt;<br>
&gt; &gt;A previous attempt [1] had already been made but was refused<br>
&gt; &gt;but this way it can be done without side effects for other users.<=
br>
&gt; &gt;<br>
&gt; &gt;[1] <a href=3D"https://lists.yoctoproject.org/g/meta-ti/message/14=
767" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/=
meta-ti/message/14767</a><br>
&gt; <br>
&gt; <br>
&gt; So the difference between this patch and the previous one, is that<br>
&gt; you are now included a file that is not there normally so that you<br>
&gt; can put the contents of the previous patch in the new include file<br>
&gt; to get around the issue in the archiver.<br></blockquote><div><br>The =
archiver issue is fixed but it will be very easy=C2=A0to break again.<br>My=
self recently broke it again so I added a test to help there<br><a href=3D"=
https://git.yoctoproject.org/poky/commit/?id=3Db5baa7dc8bd1c0d2d78c532d97a4=
4120346b5edd">https://git.yoctoproject.org/poky/commit/?id=3Db5baa7dc8bd1c0=
d2d78c532d97a44120346b5edd</a><br><br>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt; <br>
&gt; I&#39;m not saying I&#39;m opposed to this approach (yet), I&#39;m jus=
t trying<br>
&gt; to understand the entire story.<br>
&gt; <br>
&gt; Did you find anything in looking at fixing the archiver to better<br>
&gt; support the multi-config issue?<br></blockquote><div><br>The issue now=
 is different and is related with spdx and rm_work<br><a href=3D"https://li=
sts.openembedded.org/g/openembedded-core/message/174276">https://lists.open=
embedded.org/g/openembedded-core/message/174276</a><br><br>With this patch =
I can set a new TMPDIR folder for each machine and</div><div>can build succ=
essfully.<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt;Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@f=
oundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; &gt;---<br>
&gt; &gt;=C2=A0 meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt;diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/=
conf/multiconfig/k3r5.conf<br>
&gt; &gt;index deb07210..b69c5d6d 100644<br>
&gt; &gt;--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; &gt;+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; &gt;@@ -3,3 +3,5 @@ MAINMACHINE :=3D &quot;${MACHINE}&quot;<br>
&gt; &gt;=C2=A0 DEPLOY_DIR_IMAGE =3D &quot;${DEPLOY_DIR}/images/${MAINMACHI=
NE}&quot;<br>
&gt; &gt;=C2=A0 MACHINE:append =3D &quot;-k3r5&quot;<br>
&gt; &gt;+<br>
&gt; &gt;+include conf/multiconfig/k3r5.inc<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15702): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/15702" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/15702</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96629864/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/96629864/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">qua=
resma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000db48f805f37ef3d9--


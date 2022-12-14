Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E230EC4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 10:04:33 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.99556.1671012268273313879
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 02:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y6enbsG/;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id 124so17358226vsv.4
        for <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 02:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3zCwI4JPvRk8SrEX2/VPNSlU+A/S5muhvDyklstjO7Q=;
        b=Y6enbsG/zrKN1uipXyMxJx8JUW3VXbR67tD+JJ6kAbYcapWfQz0bZw9CRLzLssStus
         DGcF7MIVyAJRGMdPb2+d0PukHrs5b/0MDQPKIF729SLgZlJXr8Y9Jfc4lZfNygUbPzGT
         Bvty74IeMH84TgMq9lkC7k4S+6pa2WhJ4hf1/oi9mr6f1N+l//HQOzbjKrc/X2Ziwxte
         bm2BhEAhVcSOe6i5Vv/UejSb7WqYkMvAtmUSYhbFaeYmC1zwAb7HImzJAm3fRS/dq2sR
         uUiRmJAncgqDhq5uk29Li3Fs4BGOVhnvA1DEt3wUz1mD5ZpvsTw8b6eJ6kulHiyun1Uc
         vAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zCwI4JPvRk8SrEX2/VPNSlU+A/S5muhvDyklstjO7Q=;
        b=7yVHRNhCcxZnsUmUPG6WGnig4QBx8fBtd8Bv6+FbMAlVSQBzLvauwEfob8VcUgajhU
         HQVYC565kDGO41g8ZPAeXWpaOsD53lGaDok/sOVWU5/EdWzcjIcdTePxCBPDLzklBP7K
         ENGdvMQz5aHSoxdwmRJU9HfYdluFfLf1W2bY0n3vKF4/ksZkAP/cxt589rd+6GgXOc2t
         R9SpxU78Y6lX13xSMpU5tJjsyDMDOm4BxkOhOmZ3nSd/j/Yfj1qDkIl6lH11fHGgLZcd
         r3q8vInkgyEro7DFIdEX947SYQDvF4iD+dwzov+5EbjdK9x35ujUpZAple6V0nRdKGRs
         XBcQ==
X-Gm-Message-State: ANoB5plBt5qNyJ5tYbCwsOBM9tH6neBVBxOnIyyCLZTvep7quhewCTDT
	Wm7uYEQT6mauONAEz7C1GHI7bYDZocGvly1Zhno=
X-Google-Smtp-Source: AA0mqf6+0Bp8xmOockSpl/rAQ1I+ht6F72IF6AIU03sgez7VDhgfYCQzm6nDPu5ECzkk76E9gPDKia25lZCaIPF/aK8=
X-Received: by 2002:a67:fac2:0:b0:3ac:33a7:c136 with SMTP id
 g2-20020a67fac2000000b003ac33a7c136mr44150469vsq.58.1671012267357; Wed, 14
 Dec 2022 02:04:27 -0800 (PST)
MIME-Version: 1.0
References: <1728C9EC4C3A35F2.13174@lists.yoctoproject.org>
 <20221207222351.GB22689@denix.org> <1047cedf-f3ab-b519-63a9-081e8d371480@ti.com>
 <CAELJN2kY3gjcamCXPC=7n7ss961KH3OJkRFEXc9Ai0bEVeiX+w@mail.gmail.com>
 <fa914b1d-0108-4311-ea6e-10314c856954@ti.com> <CANPvuRngHTO=tFTbWn0dFq-CwjS0z0nQWy+830_WjgZ1ZrMEuQ@mail.gmail.com>
 <20221214000011.GO22689@denix.org>
In-Reply-To: <20221214000011.GO22689@denix.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 14 Dec 2022 10:04:06 +0000
Message-ID: <CANPvuRmUHcySraR_1Z+L4V0-Kbf37DFq7R=dy4JC2r+2zdLmWQ@mail.gmail.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH] ti-sci-fw: make dependency on
 meta-ti-extras soft
To: Denys Dmytriyenko <denis@denix.org>
Cc: reatmon@ti.com, =?UTF-8?B?RGFuaWVsIETDrWF6?= <mrchapp@gmail.com>, 
	meta-ti@lists.yoctoproject.org, Ricardo Salveti <ricardo@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000009c7a4b05efc6dc9a"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 10:04:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15475

--0000000000009c7a4b05efc6dc9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko <denis@denix.org> escreveu no dia quarta, 14/12/2022 =C3=
=A0(s)
00:00:

> Everything you said was already mentioned in the commit log below:
>
> > As ti-paths.inc is only needed to define TI_K3_SECDEV_INSTALL_DIR
> > for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and building
> > for K3 HS platforms. Since ti-k3-secdev resides in meta-ti-extras,
> > the soft dependency will still work fine and give a build error
> > "Nothing PROVIDES 'ti-k3-secdev-native'" when it is needed.
>

 So the layer is still broken for K3 HS platforms!

This patch makes the check-layer happy again as it does not fail any more
during bitbake parsing
but it will be difficult for the end user to discover this dependency.

And this is a circular dependency because meta-ti-extras depend on
meta-ti-bsp
and for this corner case with K3 HS platforms machines meta-ti-bsp depends
on meta-ti-extras.

Jose


> --
> Denys
>
>
> On Mon, Dec 12, 2022 at 12:19:41PM +0000, Jose Quaresma wrote:
> > Hi,
> >
> > This is not enough to fix the issue, the layer is still broken
> > because ti-k3-secdev is needed as well and it is on meta-ti-extras.
> > I tested this patch in kirkstone but maybe master is affected too.
> >
> > builder@ac8b892cdf40:/lmp/build-am64xx-evm$ grep ti-k3-secdev
> >
> /lmp/build-am64xx-evm/conf/../../layers/meta-ti/meta-ti-bsp/recipes-bsp/t=
i-sci-fw/
> > ti-sci-fw_git.bb
> > DEPENDS:append =3D "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else '
> > ti-k3-secdev-native' }"
> >
> >
> > Without the meta-ti-extras layer bitbake fails with:
> >
> > ERROR: Nothing PROVIDES 'ti-k3-secdev-native' (but
> >
> mc:k3r5-sr2-hs-fs:/lmp/build-am64xx-evm/conf/../../layers/meta-ti/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/
> > ti-sci-fw_git.bb DEPENDS on or otherwise requires it). Close matches:
> >   libtspi-dev-native
> >   makedevs-native
> > ERROR: Required build target 'ti-sci-fw' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['ti-sci-fw',
> > 'ti-k3-secdev-native']
> >
> >
> > Jose
> >
> > Ryan Eatmon via lists.yoctoproject.org <reatmon=3D
> > ti.com@lists.yoctoproject.org> escreveu no dia quarta, 7/12/2022 =C3=A0=
(s)
> 22:42:
> >
> > >
> > > The test builds for this are running right now.  I would expect that =
I
> > > can merge it over to kirkstone tomorrow morning sometime.
> > >
> > >
> > > On 12/7/2022 4:39 PM, Daniel D=C3=ADaz wrote:
> > > > Hello!
> > > >
> > > > On Wed, Dec 7, 2022 at 4:34 PM Ryan Eatmon via
> lists.yoctoproject.org
> > > > <reatmon=3Dti.com@lists.yoctoproject.org> wrote:
> > > >> I literally merged this out to master about 30mins ago.
> > > >
> > > > We can this be expected to land on Kirkstone?
> > > >
> > > > Thanks and greetings!
> > > >
> > > > Daniel D=C3=ADaz
> > > > yosoy@danieldiaz.org
> > > >
> > > >
> > > >
> > > >> On 12/7/2022 4:23 PM, Denys Dmytriyenko wrote:
> > > >>> Ping?
> > > >>>
> > > >>>
> > > >>> On Fri, Nov 18, 2022 at 09:07:49PM +0000, Denys Dmytriyenko wrote=
:
> > > >>>> From: Denys Dmytriyenko <denys@konsulko.com>
> > > >>>>
> > > >>>> Replace "require" with "include" to load ti-paths.inc and not
> break
> > > >>>> parsing when meta-ti-extras is not in the BBLAYERS list.
> > > >>>>
> > > >>>> As ti-paths.inc is only needed to define TI_K3_SECDEV_INSTALL_DI=
R
> > > >>>> for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and buildi=
ng
> > > >>>> for K3 HS platforms. Since ti-k3-secdev resides in meta-ti-extra=
s,
> > > >>>> the soft dependency will still work fine and give a build error
> > > >>>> "Nothing PROVIDES 'ti-k3-secdev-native'" when it is needed.
> > > >>>>
> > > >>>> Also, since TI_K3_SECDEV_INSTALL_DIR can now be undefined, use
> > > >>>> d.getVar() to access it ensuring it doesn't break the condition.
> > > >>>>
> > > >>>> Reported-by: Daniel D=C3=ADaz <mrchapp@gmail.com>
> > > >>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > > >>>> ---
> > > >>>>    meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
> > > >>>>    1 file changed, 2 insertions(+), 2 deletions(-)
> > > >>>>
> > > >>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > > b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > > >>>> index e89a6855..c99cd660 100644
> > > >>>> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > > >>>> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > > >>>> @@ -1,5 +1,5 @@
> > > >>>>    require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > > >>>> -require recipes-ti/includes/ti-paths.inc
> > > >>>> +include recipes-ti/includes/ti-paths.inc
> > > >>>>
> > > >>>>    DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native
> > > virtual/bootloader"
> > > >>>>    DEPENDS:remove:am65xx-evm-k3r5 =3D "virtual/bootloader"
> > > >>>> @@ -20,7 +20,7 @@ COMPATIBLE_MACHINE:aarch64 =3D "null"
> > > >>>>
> > > >>>>    PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > >>>>
> > > >>>> -TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or
> > > '${TI_K3_SECDEV_INSTALL_DIR}' }"
> > > >>>> +TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or
> > > d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> > > >>>>    export TI_SECURE_DEV_PKG
> > > >>>>
> > > >>>>    SYSFW_SOC ?=3D "unknown"
> > > >>>> --
> > > >>>> 2.25.1
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009c7a4b05efc6dc9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mail=
to:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt; escreveu no d=
ia quarta, 14/12/2022 =C3=A0(s) 00:00:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Everything you said was already mentioned in the com=
mit log below:<br>
<br>
&gt; As ti-paths.inc is only needed to define TI_K3_SECDEV_INSTALL_DIR<br>
&gt; for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and building<br>
&gt; for K3 HS platforms. Since ti-k3-secdev resides in meta-ti-extras,<br>
&gt; the soft dependency will still work fine and give a build error<br>
&gt; &quot;Nothing PROVIDES &#39;ti-k3-secdev-native&#39;&quot; when it is =
needed.<br></blockquote><div><br></div><div>=C2=A0So the layer is still bro=
ken for K3 HS platforms!<br></div><br>This patch makes the=C2=A0check-layer=
 happy again as it does not fail any more during bitbake parsing<br>but it =
will be difficult for the end user to discover this dependency.<br><br>And =
this is a circular=C2=A0dependency=C2=A0because meta-ti-extras depend on me=
ta-ti-bsp<br>and for this corner case with K3 HS platforms machines meta-ti=
-bsp depends on meta-ti-extras.<br><br>Jose<br><br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
-- <br>
Denys<br>
<br>
<br>
On Mon, Dec 12, 2022 at 12:19:41PM +0000, Jose Quaresma wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; This is not enough to fix the issue, the layer is still broken<br>
&gt; because ti-k3-secdev is needed as well and it is on meta-ti-extras.<br=
>
&gt; I tested this patch in kirkstone but maybe master is affected too.<br>
&gt; <br>
&gt; builder@ac8b892cdf40:/lmp/build-am64xx-evm$ grep ti-k3-secdev<br>
&gt; /lmp/build-am64xx-evm/conf/../../layers/meta-ti/meta-ti-bsp/recipes-bs=
p/ti-sci-fw/<br>
&gt; <a href=3D"http://ti-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">ti-sci-fw_git.bb</a><br>
&gt; DEPENDS:append =3D &quot;${@ &#39;&#39; if d.getVar(&#39;TI_SECURE_DEV=
_PKG_K3&#39;) else &#39;<br>
&gt; ti-k3-secdev-native&#39; }&quot;<br>
&gt; <br>
&gt; <br>
&gt; Without the meta-ti-extras layer bitbake fails with:<br>
&gt; <br>
&gt; ERROR: Nothing PROVIDES &#39;ti-k3-secdev-native&#39; (but<br>
&gt; mc:k3r5-sr2-hs-fs:/lmp/build-am64xx-evm/conf/../../layers/meta-ti/meta=
-ti-bsp/recipes-bsp/ti-sci-fw/<br>
&gt; <a href=3D"http://ti-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">ti-sci-fw_git.bb</a> DEPENDS on or otherwise requires it). Close matches=
:<br>
&gt;=C2=A0 =C2=A0libtspi-dev-native<br>
&gt;=C2=A0 =C2=A0makedevs-native<br>
&gt; ERROR: Required build target &#39;ti-sci-fw&#39; has no buildable prov=
iders.<br>
&gt; Missing or unbuildable dependency chain was: [&#39;ti-sci-fw&#39;,<br>
&gt; &#39;ti-k3-secdev-native&#39;]<br>
&gt; <br>
&gt; <br>
&gt; Jose<br>
&gt; <br>
&gt; Ryan Eatmon via <a href=3D"http://lists.yoctoproject.org" rel=3D"noref=
errer" target=3D"_blank">lists.yoctoproject.org</a> &lt;reatmon=3D<br>
&gt; <a href=3D"mailto:ti.com@lists.yoctoproject.org" target=3D"_blank">ti.=
com@lists.yoctoproject.org</a>&gt; escreveu no dia quarta, 7/12/2022 =C3=A0=
(s) 22:42:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; The test builds for this are running right now.=C2=A0 I would exp=
ect that I<br>
&gt; &gt; can merge it over to kirkstone tomorrow morning sometime.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On 12/7/2022 4:39 PM, Daniel D=C3=ADaz wrote:<br>
&gt; &gt; &gt; Hello!<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Dec 7, 2022 at 4:34 PM Ryan Eatmon via <a href=3D"ht=
tp://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoc=
toproject.org</a><br>
&gt; &gt; &gt; &lt;reatmon=3D<a href=3D"mailto:ti.com@lists.yoctoproject.or=
g" target=3D"_blank">ti.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt; I literally merged this out to master about 30mins ago.<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We can this be expected to land on Kirkstone?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks and greetings!<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Daniel D=C3=ADaz<br>
&gt; &gt; &gt; <a href=3D"mailto:yosoy@danieldiaz.org" target=3D"_blank">yo=
soy@danieldiaz.org</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; On 12/7/2022 4:23 PM, Denys Dmytriyenko wrote:<br>
&gt; &gt; &gt;&gt;&gt; Ping?<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; On Fri, Nov 18, 2022 at 09:07:49PM +0000, Denys Dmyt=
riyenko wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:de=
nys@konsulko.com" target=3D"_blank">denys@konsulko.com</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; Replace &quot;require&quot; with &quot;include&q=
uot; to load ti-paths.inc and not break<br>
&gt; &gt; &gt;&gt;&gt;&gt; parsing when meta-ti-extras is not in the BBLAYE=
RS list.<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; As ti-paths.inc is only needed to define TI_K3_S=
ECDEV_INSTALL_DIR<br>
&gt; &gt; &gt;&gt;&gt;&gt; for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is no=
t set and building<br>
&gt; &gt; &gt;&gt;&gt;&gt; for K3 HS platforms. Since ti-k3-secdev resides =
in meta-ti-extras,<br>
&gt; &gt; &gt;&gt;&gt;&gt; the soft dependency will still work fine and giv=
e a build error<br>
&gt; &gt; &gt;&gt;&gt;&gt; &quot;Nothing PROVIDES &#39;ti-k3-secdev-native&=
#39;&quot; when it is needed.<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; Also, since TI_K3_SECDEV_INSTALL_DIR can now be =
undefined, use<br>
&gt; &gt; &gt;&gt;&gt;&gt; d.getVar() to access it ensuring it doesn&#39;t =
break the condition.<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; Reported-by: Daniel D=C3=ADaz &lt;<a href=3D"mai=
lto:mrchapp@gmail.com" target=3D"_blank">mrchapp@gmail.com</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"=
mailto:denys@konsulko.com" target=3D"_blank">denys@konsulko.com</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; ---<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 meta-ti-bsp/recipes-bsp/ti-sci-fw/<=
a href=3D"http://ti-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-=
sci-fw_git.bb</a> | 4 ++--<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 2 insertions(+), 2 =
deletions(-)<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/<=
a href=3D"http://ti-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-=
sci-fw_git.bb</a><br>
&gt; &gt; b/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a><br>
&gt; &gt; &gt;&gt;&gt;&gt; index e89a6855..c99cd660 100644<br>
&gt; &gt; &gt;&gt;&gt;&gt; --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=
=3D"http://ti-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw=
_git.bb</a><br>
&gt; &gt; &gt;&gt;&gt;&gt; +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=
=3D"http://ti-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw=
_git.bb</a><br>
&gt; &gt; &gt;&gt;&gt;&gt; @@ -1,5 +1,5 @@<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 require recipes-bsp/ti-linux-fw/ti-=
linux-fw.inc<br>
&gt; &gt; &gt;&gt;&gt;&gt; -require recipes-ti/includes/ti-paths.inc<br>
&gt; &gt; &gt;&gt;&gt;&gt; +include recipes-ti/includes/ti-paths.inc<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 DEPENDS =3D &quot;openssl-native u-=
boot-mkimage-native dtc-native<br>
&gt; &gt; virtual/bootloader&quot;<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 DEPENDS:remove:am65xx-evm-k3r5 =3D =
&quot;virtual/bootloader&quot;<br>
&gt; &gt; &gt;&gt;&gt;&gt; @@ -20,7 +20,7 @@ COMPATIBLE_MACHINE:aarch64 =3D=
 &quot;null&quot;<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 PACKAGE_ARCH =3D &quot;${MACHINE_AR=
CH}&quot;<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; -TI_SECURE_DEV_PKG =3D &quot;${@ d.getVar(&#39;T=
I_SECURE_DEV_PKG_K3&#39;) or<br>
&gt; &gt; &#39;${TI_K3_SECDEV_INSTALL_DIR}&#39; }&quot;<br>
&gt; &gt; &gt;&gt;&gt;&gt; +TI_SECURE_DEV_PKG =3D &quot;${@ d.getVar(&#39;T=
I_SECURE_DEV_PKG_K3&#39;) or<br>
&gt; &gt; d.getVar(&#39;TI_K3_SECDEV_INSTALL_DIR&#39;) }&quot;<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 export TI_SECURE_DEV_PKG<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 SYSFW_SOC ?=3D &quot;unknown&quot;<=
br>
&gt; &gt; &gt;&gt;&gt;&gt; --<br>
&gt; &gt; &gt;&gt;&gt;&gt; 2.25.1<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>

--0000000000009c7a4b05efc6dc9a--


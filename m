Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287F6C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 12:20:00 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web11.41599.1670847593017095908
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 04:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c7AMQkpP;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id h26so11000565vsr.5
        for <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 04:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B3PhDZoqN2iQbeATEGwun1z170DeJu3DRA3IEP77Z9I=;
        b=c7AMQkpPsRt38acnBVa+gcN393uDNYou6IFNOaiFnijdPi7v2YlFWWlqWYwBDGGsTb
         vDnzcaqJzP2KoaYFqcDehyu/7f0I6RvksmUQg7dcCTW9mIFxt8YJuOZZ+PjZDcUz2awf
         aSPWwTfe39Z5uba9lh3++WCGhnYdWn6zZ4G9jq2iurnV8qkFvXpwnMgwD9X6RpxnIkYN
         wkx/Ykkzek4O5sycZrWe8y34W11Bnrk+hSQbtK3Ypo8lQbcdi7Q5nNOHEn5+b7BPgMhc
         QPUUAFtpO/gi60ATtbDkHjtoL59O3ipbSCYq0dFLptGRLjeVYkpujfqDiRXWMohkm1GI
         WBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3PhDZoqN2iQbeATEGwun1z170DeJu3DRA3IEP77Z9I=;
        b=mhI/LZEKsb+9Sv9IDbDb1hEziRs5jy8+FQ6XDi8Aqm3y3hIRaG7esS+/+NECU0XEPP
         mmNc+vnQeYS8QTu8j0gPER0gpd+NCM8ztW728qYDGzRidzVM4AFvBDrmmzZhJsv4rf4l
         MCeTheScRKW140FkUXlmLFRLYaBFPI6m46h5MMv2mC2/mewu+3o7TbQTnMVuApB2Vmfs
         NiHu/5v2bzv3D1WoYzaP8dQs1kV7L4dM4k0IsR1KwxlZDghRzWCcuPW/mzfe+IORW9zB
         EdocmhE16WwxI+cOIxcwFRXYhl5hzWoKyoT+Vjn8M2wFDfCdNqcI1PPxkVpNlhUSoU44
         XbIw==
X-Gm-Message-State: ANoB5plXvjHsS8nUxGg0ev037W9mSrNK3fOMyaaSXzfGD8BNMJce5AbK
	wwVFIud/DC7cNwLxAhVZjXnkNF8I+lRA7Dhqmw4=
X-Google-Smtp-Source: AA0mqf6UHVdmpSU/XexWvqcYMy/gE5v5mm+wUhBxLNxehfiJODEPuyWy2Apqd51+uxAscXYqNC5mU3jJyTVI062WUtg=
X-Received: by 2002:a05:6102:755:b0:3b3:7d59:3f53 with SMTP id
 v21-20020a056102075500b003b37d593f53mr187363vsg.41.1670847591997; Mon, 12 Dec
 2022 04:19:51 -0800 (PST)
MIME-Version: 1.0
References: <1728C9EC4C3A35F2.13174@lists.yoctoproject.org>
 <20221207222351.GB22689@denix.org> <1047cedf-f3ab-b519-63a9-081e8d371480@ti.com>
 <CAELJN2kY3gjcamCXPC=7n7ss961KH3OJkRFEXc9Ai0bEVeiX+w@mail.gmail.com> <fa914b1d-0108-4311-ea6e-10314c856954@ti.com>
In-Reply-To: <fa914b1d-0108-4311-ea6e-10314c856954@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 12 Dec 2022 12:19:41 +0000
Message-ID: <CANPvuRngHTO=tFTbWn0dFq-CwjS0z0nQWy+830_WjgZ1ZrMEuQ@mail.gmail.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH] ti-sci-fw: make dependency on
 meta-ti-extras soft
To: reatmon@ti.com
Cc: =?UTF-8?B?RGFuaWVsIETDrWF6?= <mrchapp@gmail.com>, 
	Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org, 
	Ricardo Salveti <ricardo@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000031e30505efa0856a"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 12:20:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15450

--00000000000031e30505efa0856a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This is not enough to fix the issue, the layer is still broken
because ti-k3-secdev is needed as well and it is on meta-ti-extras.
I tested this patch in kirkstone but maybe master is affected too.

builder@ac8b892cdf40:/lmp/build-am64xx-evm$ grep ti-k3-secdev
/lmp/build-am64xx-evm/conf/../../layers/meta-ti/meta-ti-bsp/recipes-bsp/ti-=
sci-fw/
ti-sci-fw_git.bb
DEPENDS:append =3D "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else '
ti-k3-secdev-native' }"


Without the meta-ti-extras layer bitbake fails with:

ERROR: Nothing PROVIDES 'ti-k3-secdev-native' (but
mc:k3r5-sr2-hs-fs:/lmp/build-am64xx-evm/conf/../../layers/meta-ti/meta-ti-b=
sp/recipes-bsp/ti-sci-fw/
ti-sci-fw_git.bb DEPENDS on or otherwise requires it). Close matches:
  libtspi-dev-native
  makedevs-native
ERROR: Required build target 'ti-sci-fw' has no buildable providers.
Missing or unbuildable dependency chain was: ['ti-sci-fw',
'ti-k3-secdev-native']


Jose

Ryan Eatmon via lists.yoctoproject.org <reatmon=3D
ti.com@lists.yoctoproject.org> escreveu no dia quarta, 7/12/2022 =C3=A0(s) =
22:42:

>
> The test builds for this are running right now.  I would expect that I
> can merge it over to kirkstone tomorrow morning sometime.
>
>
> On 12/7/2022 4:39 PM, Daniel D=C3=ADaz wrote:
> > Hello!
> >
> > On Wed, Dec 7, 2022 at 4:34 PM Ryan Eatmon via lists.yoctoproject.org
> > <reatmon=3Dti.com@lists.yoctoproject.org> wrote:
> >> I literally merged this out to master about 30mins ago.
> >
> > We can this be expected to land on Kirkstone?
> >
> > Thanks and greetings!
> >
> > Daniel D=C3=ADaz
> > yosoy@danieldiaz.org
> >
> >
> >
> >> On 12/7/2022 4:23 PM, Denys Dmytriyenko wrote:
> >>> Ping?
> >>>
> >>>
> >>> On Fri, Nov 18, 2022 at 09:07:49PM +0000, Denys Dmytriyenko wrote:
> >>>> From: Denys Dmytriyenko <denys@konsulko.com>
> >>>>
> >>>> Replace "require" with "include" to load ti-paths.inc and not break
> >>>> parsing when meta-ti-extras is not in the BBLAYERS list.
> >>>>
> >>>> As ti-paths.inc is only needed to define TI_K3_SECDEV_INSTALL_DIR
> >>>> for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and building
> >>>> for K3 HS platforms. Since ti-k3-secdev resides in meta-ti-extras,
> >>>> the soft dependency will still work fine and give a build error
> >>>> "Nothing PROVIDES 'ti-k3-secdev-native'" when it is needed.
> >>>>
> >>>> Also, since TI_K3_SECDEV_INSTALL_DIR can now be undefined, use
> >>>> d.getVar() to access it ensuring it doesn't break the condition.
> >>>>
> >>>> Reported-by: Daniel D=C3=ADaz <mrchapp@gmail.com>
> >>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >>>> ---
> >>>>    meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
> >>>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >>>> index e89a6855..c99cd660 100644
> >>>> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >>>> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >>>> @@ -1,5 +1,5 @@
> >>>>    require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>>> -require recipes-ti/includes/ti-paths.inc
> >>>> +include recipes-ti/includes/ti-paths.inc
> >>>>
> >>>>    DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native
> virtual/bootloader"
> >>>>    DEPENDS:remove:am65xx-evm-k3r5 =3D "virtual/bootloader"
> >>>> @@ -20,7 +20,7 @@ COMPATIBLE_MACHINE:aarch64 =3D "null"
> >>>>
> >>>>    PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>>
> >>>> -TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or
> '${TI_K3_SECDEV_INSTALL_DIR}' }"
> >>>> +TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or
> d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> >>>>    export TI_SECURE_DEV_PKG
> >>>>
> >>>>    SYSFW_SOC ?=3D "unknown"
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>>
> >>>>
> >>>>
> >>
> >> --
> >> Ryan Eatmon                reatmon@ti.com
> >> -----------------------------------------
> >> Texas Instruments, Inc.  -  LCPD  -  MGTS
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
> View/Reply Online (#15432):
> https://lists.yoctoproject.org/g/meta-ti/message/15432
> Mute This Topic: https://lists.yoctoproject.org/mt/95121729/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000031e30505efa0856a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<br><br>This is not enough=C2=A0to fix the issue,=
 the layer is still broken because=C2=A0ti-k3-secdev is needed as well and =
it is on=C2=A0meta-ti-extras.<br>I tested this patch in kirkstone but maybe=
 master is affected too.<br><br>builder@ac8b892cdf40:/lmp/build-am64xx-evm$=
 grep ti-k3-secdev /lmp/build-am64xx-evm/conf/../../layers/meta-ti/meta-ti-=
bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_git.bb">ti-sci-fw_git=
.bb</a><br>DEPENDS:append =3D &quot;${@ &#39;&#39; if d.getVar(&#39;TI_SECU=
RE_DEV_PKG_K3&#39;) else &#39; ti-k3-secdev-native&#39; }&quot;<br><br><br>=
Without the meta-ti-extras layer bitbake fails with:<br><br><div>ERROR: Not=
hing PROVIDES &#39;ti-k3-secdev-native&#39; (but mc:k3r5-sr2-hs-fs:/lmp/bui=
ld-am64xx-evm/conf/../../layers/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/<=
a href=3D"http://ti-sci-fw_git.bb">ti-sci-fw_git.bb</a> DEPENDS on or other=
wise requires it). Close matches:<br>=C2=A0 libtspi-dev-native<br>=C2=A0 ma=
kedevs-native<br>ERROR: Required build target &#39;ti-sci-fw&#39; has no bu=
ildable providers.<br>Missing or unbuildable dependency chain was: [&#39;ti=
-sci-fw&#39;, &#39;ti-k3-secdev-native&#39;]<br><br><br>Jose</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ryan Eatm=
on via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a>=
 &lt;reatmon=3D<a href=3D"mailto:ti.com@lists.yoctoproject.org">ti.com@list=
s.yoctoproject.org</a>&gt; escreveu no dia quarta, 7/12/2022 =C3=A0(s) 22:4=
2:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
The test builds for this are running right now.=C2=A0 I would expect that I=
 <br>
can merge it over to kirkstone tomorrow morning sometime.<br>
<br>
<br>
On 12/7/2022 4:39 PM, Daniel D=C3=ADaz wrote:<br>
&gt; Hello!<br>
&gt; <br>
&gt; On Wed, Dec 7, 2022 at 4:34 PM Ryan Eatmon via <a href=3D"http://lists=
.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.=
org</a><br>
&gt; &lt;reatmon=3D<a href=3D"mailto:ti.com@lists.yoctoproject.org" target=
=3D"_blank">ti.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;&gt; I literally merged this out to master about 30mins ago.<br>
&gt; <br>
&gt; We can this be expected to land on Kirkstone?<br>
&gt; <br>
&gt; Thanks and greetings!<br>
&gt; <br>
&gt; Daniel D=C3=ADaz<br>
&gt; <a href=3D"mailto:yosoy@danieldiaz.org" target=3D"_blank">yosoy@daniel=
diaz.org</a><br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;&gt; On 12/7/2022 4:23 PM, Denys Dmytriyenko wrote:<br>
&gt;&gt;&gt; Ping?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Fri, Nov 18, 2022 at 09:07:49PM +0000, Denys Dmytriyenko wr=
ote:<br>
&gt;&gt;&gt;&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsul=
ko.com" target=3D"_blank">denys@konsulko.com</a>&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Replace &quot;require&quot; with &quot;include&quot; to lo=
ad ti-paths.inc and not break<br>
&gt;&gt;&gt;&gt; parsing when meta-ti-extras is not in the BBLAYERS list.<b=
r>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; As ti-paths.inc is only needed to define TI_K3_SECDEV_INST=
ALL_DIR<br>
&gt;&gt;&gt;&gt; for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and =
building<br>
&gt;&gt;&gt;&gt; for K3 HS platforms. Since ti-k3-secdev resides in meta-ti=
-extras,<br>
&gt;&gt;&gt;&gt; the soft dependency will still work fine and give a build =
error<br>
&gt;&gt;&gt;&gt; &quot;Nothing PROVIDES &#39;ti-k3-secdev-native&#39;&quot;=
 when it is needed.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Also, since TI_K3_SECDEV_INSTALL_DIR can now be undefined,=
 use<br>
&gt;&gt;&gt;&gt; d.getVar() to access it ensuring it doesn&#39;t break the =
condition.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Reported-by: Daniel D=C3=ADaz &lt;<a href=3D"mailto:mrchap=
p@gmail.com" target=3D"_blank">mrchapp@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:den=
ys@konsulko.com" target=3D"_blank">denys@konsulko.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"=
http://ti-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git=
.bb</a> | 4 ++--<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 2 insertions(+), 2 deletions(=
-)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"=
http://ti-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git=
.bb</a> b/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_git=
.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a><br>
&gt;&gt;&gt;&gt; index e89a6855..c99cd660 100644<br>
&gt;&gt;&gt;&gt; --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://=
ti-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a>=
<br>
&gt;&gt;&gt;&gt; +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://=
ti-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a>=
<br>
&gt;&gt;&gt;&gt; @@ -1,5 +1,5 @@<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 require recipes-bsp/ti-linux-fw/ti-linux-fw.i=
nc<br>
&gt;&gt;&gt;&gt; -require recipes-ti/includes/ti-paths.inc<br>
&gt;&gt;&gt;&gt; +include recipes-ti/includes/ti-paths.inc<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 DEPENDS =3D &quot;openssl-native u-boot-mkima=
ge-native dtc-native virtual/bootloader&quot;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 DEPENDS:remove:am65xx-evm-k3r5 =3D &quot;virt=
ual/bootloader&quot;<br>
&gt;&gt;&gt;&gt; @@ -20,7 +20,7 @@ COMPATIBLE_MACHINE:aarch64 =3D &quot;nul=
l&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<=
br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; -TI_SECURE_DEV_PKG =3D &quot;${@ d.getVar(&#39;TI_SECURE_D=
EV_PKG_K3&#39;) or &#39;${TI_K3_SECDEV_INSTALL_DIR}&#39; }&quot;<br>
&gt;&gt;&gt;&gt; +TI_SECURE_DEV_PKG =3D &quot;${@ d.getVar(&#39;TI_SECURE_D=
EV_PKG_K3&#39;) or d.getVar(&#39;TI_K3_SECDEV_INSTALL_DIR&#39;) }&quot;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 export TI_SECURE_DEV_PKG<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 SYSFW_SOC ?=3D &quot;unknown&quot;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; 2.25.1<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 <a href=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
&gt;&gt; -----------------------------------------<br>
&gt;&gt; Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
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
View/Reply Online (#15432): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/15432" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/15432</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/95121729/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/95121729/5052612</a><br>
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
 Quaresma</div></div></div>

--00000000000031e30505efa0856a--


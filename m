Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8098AC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 09:46:13 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web10.3001.1676367971215247710
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 01:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IEF28NDx;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id z15so5286133vsj.12
        for <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 01:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1676367970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8qmuZ0/9x7YYIe+h5u5dadYFQ5ll715RusvR2eJmPa8=;
        b=IEF28NDx754QPgVBXL+XhyDgftKsm4X5m3vlt8tp6nK7w+beLT+8KnMaTiihwcsL9d
         H7X5xPVqmCFuA4uUHj49Qt19mIdEc5W9DVc54FAiWX2hvihATtXAynLUj+LPBcw+uKv3
         rm+XmjDrpRjNQuMuV6EzXoAGptS844EKFaT+Ho9bGunes19CP9OwddjrhUGIwExwkHF3
         bBFvyUWHSUws0DTlHvN5i8CrmNr35WYEkvmJuSO2KKOliMJ0iM27MtEChm6tATl2ed9J
         X8st27k/iAA2QotzRFD+68gBRwnOZF2ipzpNMhciCXntteEc2auri7JF1Qfeq+KubJON
         YX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676367970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qmuZ0/9x7YYIe+h5u5dadYFQ5ll715RusvR2eJmPa8=;
        b=gJi3Ebnai1Bw1CzdOjn+71C4l5wIpCgwh3aD9OuxiwrsH6tpUsO9g+MeDPF1RQDEKe
         EcqTrRO6cI+kRFg9+vz5ocU4b5H9Kig+agaN1eWwRgVv37uWFHQwLXgSR7X6nHrD2OKc
         ryN/s6IeAQuPvy0tfUsUo8N6OFS8t6UNRFzil4rBmtn5Op/Mb+ufnfc86JNnj2kDToTa
         cQY3lo1LrSOZclubE+qslm93F/9OKvwYAun7QJFAYmQQbi/lcoknhf+NrjVJdqYASese
         fnJeFWnQ4IcmaxrNygQrYxueB8uEEuFrR9uEMowKKtP4pVS9XGgiMilyRLDqXWPqrWEn
         3eYQ==
X-Gm-Message-State: AO0yUKVmvEfCBMpaAmCIIrI3GfUxTxQgSLTXEcj5YM8XyhSfkMPcy0od
	u2hiqJS7AUoarqFvTJZR9g5RVmWsUJmJ+10ioNM=
X-Google-Smtp-Source: AK7set8FZQWVW8kAb/Bu8D/eZgZ7znZmtFPCYoQm6ZYOmTVPgTG0hWhYXQfnF+AQyF8u28Bw8ybW7Y7NtWMXCERCErs=
X-Received: by 2002:a67:e183:0:b0:412:2cfa:6d29 with SMTP id
 e3-20020a67e183000000b004122cfa6d29mr289846vsl.87.1676367970182; Tue, 14 Feb
 2023 01:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20230207234239.30720-1-afd@ti.com> <20230210210203.GC22689@denix.org>
 <75bfdf24-ad9c-f778-0eb0-ea119c8c6917@ti.com> <20230210215002.GF22689@denix.org>
In-Reply-To: <20230210215002.GF22689@denix.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 14 Feb 2023 09:45:59 +0000
Message-ID: <CANPvuRmV3=O_k=w9y3kU6Zdz9babjxpEuObaYmCGqbS7xpd+Ew@mail.gmail.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/8] ti-rtos-firmware: Use
 ti-k3-secdev if TI_SECURE_DEV_PKG_K3 not defined
To: Denys Dmytriyenko <denis@denix.org>
Cc: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>, 
	meta-ti@lists.yoctoproject.org, Ricardo Salveti <ricardo@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000602ba505f4a5d5b5"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 09:46:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15832

--000000000000602ba505f4a5d5b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko <denis@denix.org> escreveu no dia sexta, 10/02/2023 =C3=
=A0(s)
21:50:

> On Fri, Feb 10, 2023 at 03:13:15PM -0600, Andrew Davis wrote:
> > On 2/10/23 3:02 PM, Denys Dmytriyenko wrote:
> > >On Tue, Feb 07, 2023 at 05:42:32PM -0600, Andrew Davis via
> lists.yoctoproject.org wrote:
> > >>Use ti-k3-secdev native package to provide secure-binary-image.sh
> script
> > >>when it is not passed on as an environment variable. This fixes and
> issue
> > >
> > >Fixes *an* issue
> > >
> >
> > ACK
> >
> > >
> > >>with AM64xx which is always HS but should not require TI_SECURE_DEV_P=
KG
> > >>when building for HS-FS platforms.
> > >
> > >And GP?
> > >
> >
> > AM64 is HS-FS only :)
>
> Don't we also have GP variant of AM64 covered in the configs?
>
>
> > But yes, this fixes GP building too. Will add to the message.
> >
> > >
> > >>
> > >>Signed-off-by: Andrew Davis <afd@ti.com>
> > >>---
> > >>  meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 9 ++++----=
-
> > >>  1 file changed, 4 insertions(+), 5 deletions(-)
> > >>
> > >>diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > >>index 9a6da088..6c59b8ab 100644
> > >>--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > >>+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > >>@@ -31,9 +31,11 @@ CLEANBROKEN =3D "1"
> > >>  PR =3D "${INC_PR}.0"
> > >>  # Secure Build
> > >>+include recipes-ti/includes/ti-paths.inc
> > >
> > >Set TI_K3_SECDEV_INSTALL_DIR here instead of including ti-paths.inc?
> > >
> >
> > Sure, and if we really do not like this include I can drop it everywher=
e
> > in the next spin.
>
> Would be nice, thank you!
>

Even with the include we need to set the default for the
TI_K3_SECDEV_INSTALL_DIR
for the cases when the meta-ti-extras layer is not used.

+# set a default value for TI_K3_SECDEV_INSTALL_DIR
+export TI_K3_SECDEV_INSTALL_DIR =3D
"${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
include recipes-ti/includes/ti-paths.inc

+1 for removing the include everywhere and replacing the variables they set
with something unix FHS.

Jose


>
> > >>  DEPENDS +=3D "openssl-native"
> > >>-
> > >>-TI_SECURE_DEV_PKG ?=3D ""
> > >>+DEPENDS:append =3D "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else =
'
> ti-k3-secdev-native' }"
> > >
> > >Should probably use DEPENDS +=3D here instead of a generic :append
> override.
> > >As :append and :remove are almost impossible to fight/override
> downstream,
> > >it is recommended to use +=3D whenever possible, like in this case...
> > >
> >
> > I'm never really sure which is right, the docs all seem to say to use
> > :append/:remove when possible, but I can see it being a pain to overrid=
e
> later..
>
> Hmm, can you point to such instances? That needs to get fixed...
>
> In general, using :append/:remove is justifiable when used with another
> override, like VAR:append:k3 and such. Because you shouldn't mix +=3D and
> an override.
>
> The biggest obvious and documented difference between +=3D and :append is
> that
> the first adds a whitespace and the other does not. BTW, there's .=3D tha=
t
> behaves like +=3D but does not add a whitespace:
>
> https://docs.yoctoproject.org/bitbake/2.2/bitbake-user-manual/bitbake-use=
r-manual-metadata.html#appending-and-prepending-with-spaces
>
> https://docs.yoctoproject.org/bitbake/2.2/bitbake-user-manual/bitbake-use=
r-manual-metadata.html#appending-and-prepending-without-spaces
>
> But the issue comes from the fact that :append and :remove are just
> special
> cases of regular overrides and get collected and processed at the very en=
d
> of
> the parsing process (unlike +=3D and .=3D which are processed on the spot=
).
> There's no implied order of the overrides, unfortunately...
>
>
> > >>+TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or
> d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> > >>+export TI_SECURE_DEV_PKG
> > >>  RTOS_ETH_FW_DIR =3D "${S}/ti-eth/${PLAT_SFX}"
> > >>  RTOS_DM_FW_DIR =3D "${S}/ti-dm/${PLAT_SFX}"
> > >>@@ -49,7 +51,6 @@ DM_FIRMWARE =3D
> "ipc_echo_testb_mcu1_0_release_strip.xer5f"
> > >>  # J721e HS support
> > >>  do_install:prepend:j721e-hs-evm() {
> > >>-        export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
> > >>          ( cd ${RTOS_DM_FW_DIR}; \
> > >>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> > >>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh
> ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> > >>@@ -80,7 +81,6 @@ do_install:prepend:j721e-hs-evm() {
> > >>  # J7200 HS support
> > >>  do_install:prepend:j7200-hs-evm() {
> > >>-        export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
> > >>          ( cd ${RTOS_DM_FW_DIR}; \
> > >>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> > >>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh
> ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> > >>@@ -101,7 +101,6 @@ do_install:prepend:j7200-hs-evm() {
> > >>  # J721s2 HS support
> > >>  do_install:prepend:j721s2-hs-evm() {
> > >>-        export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
> > >>          ( cd ${RTOS_DM_FW_DIR}; \
> > >>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> > >>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh
> ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> > >>--
> > >>2.39.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15809):
> https://lists.yoctoproject.org/g/meta-ti/message/15809
> Mute This Topic: https://lists.yoctoproject.org/mt/96819771/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-ti/leave/11369865/5052612/926574700=
/xyzzy
> [quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000602ba505f4a5d5b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mail=
to:denis@denix.org">denis@denix.org</a>&gt; escreveu no dia sexta, 10/02/20=
23 =C3=A0(s) 21:50:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Fri, Feb 10, 2023 at 03:13:15PM -0600, Andrew Davis wrote:<br>
&gt; On 2/10/23 3:02 PM, Denys Dmytriyenko wrote:<br>
&gt; &gt;On Tue, Feb 07, 2023 at 05:42:32PM -0600, Andrew Davis via <a href=
=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.yoctoproject.org</a> wrote:<br>
&gt; &gt;&gt;Use ti-k3-secdev native package to provide secure-binary-image=
.sh script<br>
&gt; &gt;&gt;when it is not passed on as an environment variable. This fixe=
s and issue<br>
&gt; &gt;<br>
&gt; &gt;Fixes *an* issue<br>
&gt; &gt;<br>
&gt; <br>
&gt; ACK<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;&gt;with AM64xx which is always HS but should not require TI_SECUR=
E_DEV_PKG<br>
&gt; &gt;&gt;when building for HS-FS platforms.<br>
&gt; &gt;<br>
&gt; &gt;And GP?<br>
&gt; &gt;<br>
&gt; <br>
&gt; AM64 is HS-FS only :)<br>
<br>
Don&#39;t we also have GP variant of AM64 covered in the configs?<br>
<br>
<br>
&gt; But yes, this fixes GP building too. Will add to the message.<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;Signed-off-by: Andrew Davis &lt;<a href=3D"mailto:afd@ti.com" =
target=3D"_blank">afd@ti.com</a>&gt;<br>
&gt; &gt;&gt;---<br>
&gt; &gt;&gt;=C2=A0 meta-ti-bsp/recipes-ti/ti-rtos-bin/<a href=3D"http://ti=
-rtos-firmware.bb" rel=3D"noreferrer" target=3D"_blank">ti-rtos-firmware.bb=
</a> | 9 ++++-----<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 4 insertions(+), 5 deletions(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/<a href=3D"htt=
p://ti-rtos-firmware.bb" rel=3D"noreferrer" target=3D"_blank">ti-rtos-firmw=
are.bb</a> b/meta-ti-bsp/recipes-ti/ti-rtos-bin/<a href=3D"http://ti-rtos-f=
irmware.bb" rel=3D"noreferrer" target=3D"_blank">ti-rtos-firmware.bb</a><br=
>
&gt; &gt;&gt;index 9a6da088..6c59b8ab 100644<br>
&gt; &gt;&gt;--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/<a href=3D"http://ti-=
rtos-firmware.bb" rel=3D"noreferrer" target=3D"_blank">ti-rtos-firmware.bb<=
/a><br>
&gt; &gt;&gt;+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/<a href=3D"http://ti-=
rtos-firmware.bb" rel=3D"noreferrer" target=3D"_blank">ti-rtos-firmware.bb<=
/a><br>
&gt; &gt;&gt;@@ -31,9 +31,11 @@ CLEANBROKEN =3D &quot;1&quot;<br>
&gt; &gt;&gt;=C2=A0 PR =3D &quot;${INC_PR}.0&quot;<br>
&gt; &gt;&gt;=C2=A0 # Secure Build<br>
&gt; &gt;&gt;+include recipes-ti/includes/ti-paths.inc<br>
&gt; &gt;<br>
&gt; &gt;Set TI_K3_SECDEV_INSTALL_DIR here instead of including ti-paths.in=
c?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Sure, and if we really do not like this include I can drop it everywhe=
re<br>
&gt; in the next spin.<br>
<br>
Would be nice, thank you!<br></blockquote><div><br>Even with the include we=
 need to set the default for the TI_K3_SECDEV_INSTALL_DIR</div><div>for the=
 cases when the meta-ti-extras layer is not used.</div><div><br></div><div>=
+# set a default value for TI_K3_SECDEV_INSTALL_DIR<br>+export TI_K3_SECDEV=
_INSTALL_DIR =3D &quot;${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev&quot=
;<br>include recipes-ti/includes/ti-paths.inc<br><br>+1 for removing the in=
clude everywhere and replacing the variables they set with something unix F=
HS.<br><br>Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<br>
&gt; &gt;&gt;=C2=A0 DEPENDS +=3D &quot;openssl-native&quot;<br>
&gt; &gt;&gt;-<br>
&gt; &gt;&gt;-TI_SECURE_DEV_PKG ?=3D &quot;&quot;<br>
&gt; &gt;&gt;+DEPENDS:append =3D &quot;${@ &#39;&#39; if d.getVar(&#39;TI_S=
ECURE_DEV_PKG_K3&#39;) else &#39; ti-k3-secdev-native&#39; }&quot;<br>
&gt; &gt;<br>
&gt; &gt;Should probably use DEPENDS +=3D here instead of a generic :append=
 override.<br>
&gt; &gt;As :append and :remove are almost impossible to fight/override dow=
nstream,<br>
&gt; &gt;it is recommended to use +=3D whenever possible, like in this case=
...<br>
&gt; &gt;<br>
&gt; <br>
&gt; I&#39;m never really sure which is right, the docs all seem to say to =
use<br>
&gt; :append/:remove when possible, but I can see it being a pain to overri=
de later..<br>
<br>
Hmm, can you point to such instances? That needs to get fixed...<br>
<br>
In general, using :append/:remove is justifiable when used with another <br=
>
override, like VAR:append:k3 and such. Because you shouldn&#39;t mix +=3D a=
nd <br>
an override.<br>
<br>
The biggest obvious and documented difference between +=3D and :append is t=
hat <br>
the first adds a whitespace and the other does not. BTW, there&#39;s .=3D t=
hat <br>
behaves like +=3D but does not add a whitespace:<br>
<a href=3D"https://docs.yoctoproject.org/bitbake/2.2/bitbake-user-manual/bi=
tbake-user-manual-metadata.html#appending-and-prepending-with-spaces" rel=
=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/bitbake/2.2=
/bitbake-user-manual/bitbake-user-manual-metadata.html#appending-and-prepen=
ding-with-spaces</a><br>
<a href=3D"https://docs.yoctoproject.org/bitbake/2.2/bitbake-user-manual/bi=
tbake-user-manual-metadata.html#appending-and-prepending-without-spaces" re=
l=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/bitbake/2.=
2/bitbake-user-manual/bitbake-user-manual-metadata.html#appending-and-prepe=
nding-without-spaces</a><br>
<br>
But the issue comes from the fact that :append and :remove are just special=
 <br>
cases of regular overrides and get collected and processed at the very end =
of <br>
the parsing process (unlike +=3D and .=3D which are processed on the spot).=
 <br>
There&#39;s no implied order of the overrides, unfortunately...<br>
<br>
<br>
&gt; &gt;&gt;+TI_SECURE_DEV_PKG =3D &quot;${@ d.getVar(&#39;TI_SECURE_DEV_P=
KG_K3&#39;) or d.getVar(&#39;TI_K3_SECDEV_INSTALL_DIR&#39;) }&quot;<br>
&gt; &gt;&gt;+export TI_SECURE_DEV_PKG<br>
&gt; &gt;&gt;=C2=A0 RTOS_ETH_FW_DIR =3D &quot;${S}/ti-eth/${PLAT_SFX}&quot;=
<br>
&gt; &gt;&gt;=C2=A0 RTOS_DM_FW_DIR =3D &quot;${S}/ti-dm/${PLAT_SFX}&quot;<b=
r>
&gt; &gt;&gt;@@ -49,7 +51,6 @@ DM_FIRMWARE =3D &quot;ipc_echo_testb_mcu1_0_=
release_strip.xer5f&quot;<br>
&gt; &gt;&gt;=C2=A0 # J721e HS support<br>
&gt; &gt;&gt;=C2=A0 do_install:prepend:j721e-hs-evm() {<br>
&gt; &gt;&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 export TI_SECURE_DEV_PKG=3D${TI_S=
ECURE_DEV_PKG}<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ( cd ${RTOS_DM_FW_DIR}; \<b=
r>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigne=
d ${DM_FIRMWARE}; \<br>
&gt; &gt;&gt;@@ -80,7 +81,6 @@ do_install:prepend:j721e-hs-evm() {<br>
&gt; &gt;&gt;=C2=A0 # J7200 HS support<br>
&gt; &gt;&gt;=C2=A0 do_install:prepend:j7200-hs-evm() {<br>
&gt; &gt;&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 export TI_SECURE_DEV_PKG=3D${TI_S=
ECURE_DEV_PKG}<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ( cd ${RTOS_DM_FW_DIR}; \<b=
r>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigne=
d ${DM_FIRMWARE}; \<br>
&gt; &gt;&gt;@@ -101,7 +101,6 @@ do_install:prepend:j7200-hs-evm() {<br>
&gt; &gt;&gt;=C2=A0 # J721s2 HS support<br>
&gt; &gt;&gt;=C2=A0 do_install:prepend:j721s2-hs-evm() {<br>
&gt; &gt;&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 export TI_SECURE_DEV_PKG=3D${TI_S=
ECURE_DEV_PKG}<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ( cd ${RTOS_DM_FW_DIR}; \<b=
r>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigne=
d ${DM_FIRMWARE}; \<br>
&gt; &gt;&gt;-- <br>
&gt; &gt;&gt;2.39.1<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15809): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/15809" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/15809</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96819771/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/96819771/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/leave/1136=
9865/5052612/926574700/xyzzy" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-ti/leave/11369865/5052612/926574700/xyzzy</a>=
 [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jos=
e@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000602ba505f4a5d5b5--


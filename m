Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A829AC636D6
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 08:24:32 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web11.7713.1675153470308725031
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 31 Jan 2023 00:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WGadPiYw;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id 3so15253297vsq.7
        for <meta-ti@lists.yoctoproject.org>; Tue, 31 Jan 2023 00:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oRxs0LV0m7GwtCVmnnHm5uqMyMWI4goJnruSOe5lWxI=;
        b=WGadPiYwmEoBcemu9JigsUUY8GSZSc55eKKu7h6FEedt7yY3Of0DanZq6Le0A2qe0F
         wk1pLg1aa628ozThK6xf8lCK/7TkKIkooouzFjQvaTxe7p/Y0bb0TQMbORRm8NRxKObO
         59mqC9SGkSqfVmxS51R+epu+zhO2qk0bNI1GwyW+c1S0bx9SOfPlCMmPbYSdA9iUK/ci
         N5SX0OSVFapXvH/mogFA5UKXtno92rLfKV7+9wHTW4Y0Xjd6ElhuVEAqsKoRh1AYwhhh
         3RVwj3AxodLBFftNQ/ZPrJobgULP7Xks3Q8QfHucNcDi2syfnPO0M2IBofudIruHlm84
         +w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRxs0LV0m7GwtCVmnnHm5uqMyMWI4goJnruSOe5lWxI=;
        b=pc3cTzawQYBw0C4a/kortfDSNT8DIbT1KAvxyyQi7QkKqyi+ScFukE6OHBBgx5K5/M
         cT5hrO69uWnvnho4POGsq4zYiy08D6V49tngCpcrdyCFBmb5C7OoOWutcFOi8PU2wQvq
         3BSIkCBOfSL9WDgADch2SNaiYRmt5E3XYhijsQcTAevOWTE6mpCkddLnTmKiGshArsBA
         sVZDermPWZB07wbNSDi4gMVeT8J4B/1Pkn5eE1Wtdd7gfueR7ZKq2JM48mxB8MTRiLjB
         FOrqvccPYomCgl/4slfL4diMW3OVAF8d0OkuSKM8Wh0SHWVJ5oCwKqiUbauJRGRyuOi0
         zCRA==
X-Gm-Message-State: AO0yUKWgxeLP+PMPsUJZ8LihV2FzCV9vXTaZlpi/LYkSX2bW0DASogxS
	BHHT2NvByhEfUiIOeGmcakMMcEkX/ujHUvtYFqs=
X-Google-Smtp-Source: AK7set8r6WwVl2uvazIIk3wLWdn2YFE/QHFb+sIm+319I+iW/g1KigQb7N78qWhM//fN2nH4l26DmFuK3nszPR9P68Y=
X-Received: by 2002:a05:6102:310f:b0:3eb:37f3:295a with SMTP id
 e15-20020a056102310f00b003eb37f3295amr2883553vsh.87.1675153469309; Tue, 31
 Jan 2023 00:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20230125181100.297826-1-jose.quaresma@foundries.io> <82da30ed-442a-cd59-6a84-f6a3f78fc789@ti.com>
In-Reply-To: <82da30ed-442a-cd59-6a84-f6a3f78fc789@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 31 Jan 2023 08:24:18 +0000
Message-ID: <CANPvuR=4aCa5717sx7SxfKNkwHCKyQBZ7Uvy6=T0Nd3uM36Big@mail.gmail.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-umlibs: handling
 the firmware installation with usrmerge
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000007b876905f38b0f49"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 31 Jan 2023 08:24:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15713

--0000000000007b876905f38b0f49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ryan Eatmon <reatmon@ti.com> escreveu no dia segunda, 30/01/2023 =C3=A0(s) =
20:34:

>
> This conflicts with some other graphics changes that we are making for
> kirkstone/master.  Mainly changing the version of the img-rogue-umlibs
> recipe.  Given that I'm not certain if the patch will still be
> applicable to the new version I'm not going to apply this patch at this
> time.  Once we have the new graphics changes rolled out, we can take a
> look if the issue still exists (likely it will) and we can look at a new
> patch at that time.
>

Sure, this can be carried on a bbappend.
I can rebase and submit it again if needed after the upgrade.

Thanks,

Jose


>
>
> On 1/25/2023 12:11, Jose Quaresma wrote:
> > The ti-img-rogue-umlibs package is not obeying usrmerge distro feature.
> /lib should be relocated to /usr. [usrmerge]
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >   ...kefile-handle-firmware-with-usrmerge.patch | 33 ++++++++++++++++++=
+
> >   .../ti-img-rogue-umlibs_1.15.6133109.bb       | 11 +++++--
> >   2 files changed, 41 insertions(+), 3 deletions(-)
> >   create mode 100644
> meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-ha=
ndle-firmware-with-usrmerge.patch
> >
> > diff --git
> a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-=
handle-firmware-with-usrmerge.patch
> b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-=
handle-firmware-with-usrmerge.patch
> > new file mode 100644
> > index 00000000..ca06f88a
> > --- /dev/null
> > +++
> b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-=
handle-firmware-with-usrmerge.patch
> > @@ -0,0 +1,33 @@
> > +From 3a696a3eb2c23da1d4abcda3d3e3b6aca65a9f9b Mon Sep 17 00:00:00 2001
> > +From: Jose Quaresma <jose.quaresma@foundries.io>
> > +Date: Tue, 24 Jan 2023 12:39:30 +0000
> > +Subject: [PATCH] Makefile: handle firmware with usrmerge
> > +
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > +---
> > + Makefile | 5 +++--
> > + 1 file changed, 3 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 48f9b9c..04b4154 100755
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -1,4 +1,5 @@
> > + DESTDIR ?=3D ${DISCIMAGE}
> > ++FWDIR ?=3D lib
> > + TARGET_PRODUCT ?=3D j721e_linux
> > + BUILD ?=3D release
> > + WINDOW_SYSTEM ?=3D nulldrmws
> > +@@ -13,7 +14,7 @@ all:
> > + install:
> > +     mkdir -p ${DESTDIR}/${etcdir}
> > +     mkdir -p ${DESTDIR}/${usrdir}
> > +-    mkdir -p ${DESTDIR}/${fwdir}
> > ++    mkdir -p ${DESTDIR}/${FWDIR}
> > +     cp -ar ${SRCDIR}/${etcdir}/* ${DESTDIR}/${etcdir}
> > +     cp -ar ${SRCDIR}/${usrdir}/* ${DESTDIR}/${usrdir}
> > +-    cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${fwdir}
> > ++    cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${FWDIR}
> > +--
> > +2.34.1
> > +
> > diff --git a/meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.15.6133109.bb
> b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.b=
b
> > index a665c614..cb3f0056 100644
> > --- a/meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.15.6133109.bb
> > +++ b/meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.15.6133109.bb
> > @@ -10,11 +10,15 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
> >   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >   COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
> >
> > -PR =3D "r2"
> > +PR =3D "r3"
> >
> >   BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
> >
> > -SRC_URI =3D "git://
> git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttps;branch=
=3D${BRANCH}
> <http://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttps;=
branch=3D$%7BBRANCH%7D>
> "
> > +SRC_URI =3D " \
> > +     git://
> git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttps;branch=
=3D${BRANCH}
> <http://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttps;=
branch=3D$%7BBRANCH%7D>
> \
> > +     file://0001-Makefile-handle-firmware-with-usrmerge.patch \
> > +"
> > +
> >   SRCREV =3D "5977e82b96028f783d39c7219f016c1faf8dc5f5"
> >
> >   TARGET_PRODUCT:j721e =3D "j721e_linux"
> > @@ -52,7 +56,8 @@ RRECOMMENDS:${PN} +=3D "ti-img-rogue-driver"
> >   S =3D "${WORKDIR}/git"
> >
> >   do_install () {
> > -    oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TARGET_PRODUC=
T}
> BUILD=3D${PVR_BUILD} WINDOW_SYSTEM=3D${PVR_WS}
> > +    oe_runmake install DESTDIR=3D${D} FWDIR=3D${nonarch_base_libdir} \
> > +     TARGET_PRODUCT=3D${TARGET_PRODUCT} BUILD=3D${PVR_BUILD}
> WINDOW_SYSTEM=3D${PVR_WS}
> >       chown -R root:root ${D}
> >   }
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#15654):
> https://lists.yoctoproject.org/g/meta-ti/message/15654
> > Mute This Topic: https://lists.yoctoproject.org/mt/96526423/6551054
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> reatmon@ti.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007b876905f38b0f49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Ryan Eatmon &lt;<a href=3D"mailto:rea=
tmon@ti.com">reatmon@ti.com</a>&gt; escreveu no dia segunda, 30/01/2023 =C3=
=A0(s) 20:34:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
This conflicts with some other graphics changes that we are making for <br>
kirkstone/master.=C2=A0 Mainly changing the version of the img-rogue-umlibs=
 <br>
recipe.=C2=A0 Given that I&#39;m not certain if the patch will still be <br=
>
applicable to the new version I&#39;m not going to apply this patch at this=
 <br>
time.=C2=A0 Once we have the new graphics changes rolled out, we can take a=
 <br>
look if the issue still exists (likely it will) and we can look at a new <b=
r>
patch at that time.<br></blockquote><div><br>Sure, this can be carried on a=
 bbappend.</div><div>I can rebase and submit it again=C2=A0if needed after =
the upgrade.</div><div><br></div><div>Thanks,</div><div><br></div><div>Jose=
<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
On 1/25/2023 12:11, Jose Quaresma wrote:<br>
&gt; The ti-img-rogue-umlibs package is not obeying usrmerge distro feature=
. /lib should be relocated to /usr. [usrmerge]<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...kefile-handle-firmware-with-usrmerge.patch | 33 +++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://ti-img-rogue-umlibs_1.15.6133109.bb"=
 rel=3D"noreferrer" target=3D"_blank">ti-img-rogue-umlibs_1.15.6133109.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++--<br>
&gt;=C2=A0 =C2=A02 files changed, 41 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti=
-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch<br>
&gt; <br>
&gt; diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/=
0001-Makefile-handle-firmware-with-usrmerge.patch b/meta-ti-bsp/recipes-gra=
phics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmer=
ge.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000..ca06f88a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Ma=
kefile-handle-firmware-with-usrmerge.patch<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +From 3a696a3eb2c23da1d4abcda3d3e3b6aca65a9f9b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io"=
 target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; +Date: Tue, 24 Jan 2023 12:39:30 +0000<br>
&gt; +Subject: [PATCH] Makefile: handle firmware with usrmerge<br>
&gt; +<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; +---<br>
&gt; + Makefile | 5 +++--<br>
&gt; + 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Makefile b/Makefile<br>
&gt; +index 48f9b9c..04b4154 100755<br>
&gt; +--- a/Makefile<br>
&gt; ++++ b/Makefile<br>
&gt; +@@ -1,4 +1,5 @@<br>
&gt; + DESTDIR ?=3D ${DISCIMAGE}<br>
&gt; ++FWDIR ?=3D lib<br>
&gt; + TARGET_PRODUCT ?=3D j721e_linux<br>
&gt; + BUILD ?=3D release<br>
&gt; + WINDOW_SYSTEM ?=3D nulldrmws<br>
&gt; +@@ -13,7 +14,7 @@ all:<br>
&gt; + install:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mkdir -p ${DESTDIR}/${etcdir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mkdir -p ${DESTDIR}/${usrdir}<br>
&gt; +-=C2=A0 =C2=A0 mkdir -p ${DESTDIR}/${fwdir}<br>
&gt; ++=C2=A0 =C2=A0 mkdir -p ${DESTDIR}/${FWDIR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp -ar ${SRCDIR}/${etcdir}/* ${DESTDIR}/${etcdir}=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp -ar ${SRCDIR}/${usrdir}/* ${DESTDIR}/${usrdir}=
<br>
&gt; +-=C2=A0 =C2=A0 cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${fwdir}<br>
&gt; ++=C2=A0 =C2=A0 cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${FWDIR}<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti=
-img-rogue-umlibs_1.15.6133109.bb" rel=3D"noreferrer" target=3D"_blank">ti-=
img-rogue-umlibs_1.15.6133109.bb</a> b/meta-ti-bsp/recipes-graphics/libgles=
/<a href=3D"http://ti-img-rogue-umlibs_1.15.6133109.bb" rel=3D"noreferrer" =
target=3D"_blank">ti-img-rogue-umlibs_1.15.6133109.bb</a><br>
&gt; index a665c614..cb3f0056 100644<br>
&gt; --- a/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-img-ro=
gue-umlibs_1.15.6133109.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-rog=
ue-umlibs_1.15.6133109.bb</a><br>
&gt; +++ b/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-img-ro=
gue-umlibs_1.15.6133109.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-rog=
ue-umlibs_1.15.6133109.bb</a><br>
&gt; @@ -10,11 +10,15 @@ REQUIRED_MACHINE_FEATURES =3D &quot;gpu&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;=C2=A0 =C2=A0COMPATIBLE_MACHINE =3D &quot;j721e|j721s2|j784s4|am62xx&qu=
ot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -PR =3D &quot;r2&quot;<br>
&gt; +PR =3D &quot;r3&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0BRANCH =3D &quot;linuxws/dunfell/k5.10/${PV}_unified_fw_pa=
gesize&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com/git/graphics/ti-=
img-rogue-umlibs.git;protocol=3Dhttps;branch=3D$%7BBRANCH%7D" rel=3D"norefe=
rrer" target=3D"_blank">git.ti.com/git/graphics/ti-img-rogue-umlibs.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}</a>&quot;<br>
&gt; +SRC_URI =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.ti.com/git/graphics/t=
i-img-rogue-umlibs.git;protocol=3Dhttps;branch=3D$%7BBRANCH%7D" rel=3D"nore=
ferrer" target=3D"_blank">git.ti.com/git/graphics/ti-img-rogue-umlibs.git;p=
rotocol=3Dhttps;branch=3D${BRANCH}</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0file://0001-Makefile-handle-firmware-with-usrmerg=
e.patch \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0SRCREV =3D &quot;5977e82b96028f783d39c7219f016c1faf8dc5f5&=
quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0TARGET_PRODUCT:j721e =3D &quot;j721e_linux&quot;<br>
&gt; @@ -52,7 +56,8 @@ RRECOMMENDS:${PN} +=3D &quot;ti-img-rogue-driver&quo=
t;<br>
&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_install () {<br>
&gt; -=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TA=
RGET_PRODUCT} BUILD=3D${PVR_BUILD} WINDOW_SYSTEM=3D${PVR_WS}<br>
&gt; +=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} FWDIR=3D${nonarch_bas=
e_libdir} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TARGET_PRODUCT=3D${TARGET_PRODUCT} BUILD=3D${PVR_=
BUILD} WINDOW_SYSTEM=3D${PVR_WS}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chown -R root:root ${D}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#15654): <a href=3D"https://lists.yoctoproject.org/=
g/meta-ti/message/15654" rel=3D"noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/meta-ti/message/15654</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96526423=
/6551054" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/96526423/6551054</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org"=
 target=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/met=
a-ti/unsub</a> [<a href=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon=
@ti.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000007b876905f38b0f49--


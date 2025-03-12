Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F21C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 23:11:44 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.2189.1741821097098745022
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 16:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HF/DRMNz;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f8ae3ed8adso246075b6e.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 12 Mar 2025 16:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741821096; x=1742425896; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=srZ68WHHQGRZoLgiQvMiFQiCE57wGMvS6B2jO8jkaLI=;
        b=HF/DRMNzESwcG/2ACM8WVBHEYYgPncuA/hKcxGQzgemHujk5mv/jGtGCkNIW9ZOOey
         cjSP4/K9bGkbmDhL0eUv6yVLYPvm24h1EcoWuuHuqG2MmLwTt7dORC9YcWZTvFhTqB16
         GNWUlCNGSxuG4lplfL+GBbBdrFSz5nEeu82NKRxHsggMueMr4zAGaSeo9FZbAAdXy/A0
         n3Xb/ZYKqBFnPs21of+/r8gr+yMMi1Vwv1Jv1gxJ/dxhwKDOdWG5ESwlPKHQBlNw42QK
         7wuvMOHPK8m4uJS96BIQEJOk3ukNnsXzjIOB3qUUcs98QkznO/4iV7JCQirEcW5tJSbB
         SY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741821096; x=1742425896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srZ68WHHQGRZoLgiQvMiFQiCE57wGMvS6B2jO8jkaLI=;
        b=eyiba+Ke1F3WzMjZDhJJCBFYw88S/IWoWjbm9zqWTddDDnf9Dj8CV3UVxX4lrck4xv
         90BjnRzL23bAzVK7LIvfSI7EVFbJcQHCU7wnJCak067na/mV+YfvcE5VYKSkPJBXdyfT
         Mp705FLG2y9XSJ8RpgH1wkx90ta7NFtlvmNM9F+MBcovLvG548JLV3EfsnI5JMbNJWJA
         6SiGTtwll8oYLN4eerkQB2abBbX7HjYNcF7HxgM7OWS85LD1zLcHC8ZPnTsVQPl+iaqS
         haKVf+ROvgexe/8Jmvn/bMvhUx6LtBBM0hdZQyCGurUdq1eLSLJCe2XbWkFJX7+QVNEo
         TQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLnV/GPQZKNDGZdhpwlKxn6hir6FGD5w3y2loVr2MnXY0jjo6n+HdA8j6ZfKTib7pxg2uAX3kV@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwN3iGV/BnMXyblkQ+bHquXmYEld85qtoJGJQXkz/+wbZwnBc7O
	bqnlpu8eVQcAfSGzndo+NSEtRNZ5NF3wqdNpq5EFIyc8zBGyZjewAg2GhcJ2tYElyyUmCU8HWUv
	xv//ijxfaqa+lKwmA/1TKbkCfx9o=
X-Gm-Gg: ASbGncsKLW42fbPX2B3UaBiuFw8opye7xfXSu60Oanhgh/ptz+kD/caOms02G56FrM1
	SbZXCfXAYbfQCZIQQTsrM0UBvvBJCz56wla90ZN+EapplrtmpzywJqjrQhkNlIjv+HwFBFvQ1Qh
	ZBorfDlq16dvP3H4Rxos1OcCrqewEV3p8iZYtr2gLdltbriDytlrzLUSVXFP4=
X-Google-Smtp-Source: AGHT+IGer61tlVR4zTD0mQ8XKHjCjFK6/3WFXkp5mMDXpTZSAFXzHcx80PKIB3LjXptWed5+03dPvG3lwSpZdMDruYk=
X-Received: by 2002:a05:6808:1b0e:b0:3f6:7df9:d9a1 with SMTP id
 5614622812f47-3fa2c1ac8d1mr6229351b6e.26.1741821096160; Wed, 12 Mar 2025
 16:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250312213803.1160562-1-rs@ti.com> <CAMKF1sprtyknfht+5XmL4Ee76kybV4mqr0Ewg+Sz1RLXDqYgTg@mail.gmail.com>
 <D8EN4BI2CBBK.R545KF51QKM0@ti.com>
In-Reply-To: <D8EN4BI2CBBK.R545KF51QKM0@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Mar 2025 16:11:25 -0700
X-Gm-Features: AQ5f1JoWwyhkwdS2EEr3AEmc34g01BEZ4gLndhxgmEYu00IQNMsMcr4IT1UGbx8
Message-ID: <CAMKF1sqbMnWwLVDOXczhU_uV_OPf36_NR-j7No-jjhRHroQq+A@mail.gmail.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH] ti-img-rogue-umlibs: ship
 module blacklist
To: Randolph Sapp <rs@ti.com>
Cc: denis@denix.org, reatmon@ti.com, meta-ti@lists.yoctoproject.org, 
	detheridge@ti.com
Content-Type: multipart/alternative; boundary="000000000000b2f31e06302d5349"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Mar 2025 23:11:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18377

--000000000000b2f31e06302d5349
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 3:28=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:

> On Wed Mar 12, 2025 at 4:43 PM CDT, Khem Raj wrote:
> > On Wed, Mar 12, 2025 at 2:38=E2=80=AFPM Randolph Sapp via
> > lists.yoctoproject.org <rs=3Dti.com@lists.yoctoproject.org> wrote:
> >>
> >> From: Randolph Sapp <rs@ti.com>
> >>
> >> Well, this is the evil vendor driver. Time to start acting like it.
> >> Blacklist the upstream powervr module if this driver is present.
> >>
> >> This patch also does away with the bin_package components. It was cool
> >> and found some interesting bugs, but we might as well start leveraging
> >> that Makefile more now that we're starting to get some more common
> >> files between devices.
> >>
> >> Signed-off-by: Randolph Sapp <rs@ti.com>
> >> ---
> >>  .../ti-img-rogue-umlibs_24.2.6643903.bb       | 23 ++++++++++++------=
-
> >>  1 file changed, 15 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/
> ti-img-rogue-umlibs_24.2.6643903.bb
> b/meta-ti-bsp/recipes-graphics/powervr-umlibs/
> ti-img-rogue-umlibs_24.2.6643903.bb
> >> index b8153711..565e92eb 100644
> >> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/
> ti-img-rogue-umlibs_24.2.6643903.bb
> >> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/
> ti-img-rogue-umlibs_24.2.6643903.bb
> >> @@ -3,19 +3,15 @@ HOMEPAGE =3D "
> http://git.ti.com/graphics/ti-img-rogue-umlibs"
> >>  LICENSE =3D "TI-TFL"
> >>  LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e76f"
> >>
> >> -inherit bin_package
> >> -
> >> -INHIBIT_DEFAULT_DEPS =3D ""
> >> -
> >>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>  COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j72=
2s"
> >>
> >> -PR =3D "r3"
> >> +PR =3D "r4"
> >>
> >>  BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
> >>  SRC_URI =3D "git://
> git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttps;branch=
=3D${BRANCH}
> <http://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttps;=
branch=3D$%7BBRANCH%7D>
> "
> >> -SRCREV =3D "d578666fc6ecd09f7d6c3431747f1d93d128fe28"
> >> -S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUIL=
D}"
> >> +SRCREV =3D "1ed9ee185cd876200e6747192854015b8e94a7b0"
> >> +S =3D "${WORKDIR}/git"
> >>
> >>  TARGET_PRODUCT:j721e =3D "j721e_linux"
> >>  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> >> @@ -54,7 +50,12 @@ def get_file_list(package_list_var, d):
> >>                      file_list.append(f"{prefix}{package_file}")
> >>      return " ".join(file_list)
> >>
> >> -do_install:append() {
> >> +EXTRA_OEMAKE +=3D 'BUILD=3D${PVR_BUILD} TARGET_PRODUCT=3D${TARGET_PRO=
DUCT}
> WINDOW_SYSTEM=3D${PVR_WS}'
> >> +
> >> +do_configure[noexec] =3D "1"
> >> +do_compile[noexec] =3D "1"
> >> +do_install() {
> >> +    oe_runmake 'DESTDIR=3D${D}' install
> >>      if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false',
> 'true', d)}; then
> >>          for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
> >>              rm -rf ${file}
> >> @@ -78,6 +79,9 @@ do_install:append() {
> >>
> >>      # clean up any empty directories
> >>      find "${D}" -empty -type d -delete
> >> +
> >> +    # fix permissions
> >> +    chown -R root:root "${D}"


> >
> > Why is this needed ?
> >
>
> When you're copying over groups of file the permissions normally end up
> mangled.
> You could install each dirctory manually before the copy to ensure proper
> permissions, or you could just chown them after the fact.
>
> The rust package in oe-core does the same thing.


If install utility is used you can control the permissions but in bulk this
might be fine


>
> >>  }
> >>
> >>  GLES_PACKAGES =3D "libgles1-rogue libgles2-rogue libgles3-rogue"
> >> @@ -141,6 +145,9 @@ INSANE_SKIP:${PN}-tools =3D "ldflags"
> >>  FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
> >>  INSANE_SKIP:${PN}-firmware +=3D "arch"
> >>
> >> +# common libraries
> >> +FILES:${PN} =3D "${libdir}"
> >> +
> >>  RRECOMMENDS:${PN} +=3D " \
> >>      ${PN}-tools \
> >>  "
> >> --
> >> 2.48.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#18374):
> https://lists.yoctoproject.org/g/meta-ti/message/18374
> >> Mute This Topic: https://lists.yoctoproject.org/mt/111668777/1997914
> >> Group Owner: meta-ti+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
>

--000000000000b2f31e06302d5349
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 12, 2025 at 3:28=E2=80=AFPM Randolph Sapp =
&lt;<a href=3D"mailto:rs@ti.com">rs@ti.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Wed Mar 12, 2025 at 4:43 PM CDT, Khem Raj wrote:<=
br>
&gt; On Wed, Mar 12, 2025 at 2:38=E2=80=AFPM Randolph Sapp via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a> &lt;rs=3D<a href=3D"mailto:ti.com@lists=
.yoctoproject.org" target=3D"_blank">ti.com@lists.yoctoproject.org</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_bl=
ank">rs@ti.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Well, this is the evil vendor driver. Time to start acting like it=
.<br>
&gt;&gt; Blacklist the upstream powervr module if this driver is present.<b=
r>
&gt;&gt;<br>
&gt;&gt; This patch also does away with the bin_package components. It was =
cool<br>
&gt;&gt; and found some interesting bugs, but we might as well start levera=
ging<br>
&gt;&gt; that Makefile more now that we&#39;re starting to get some more co=
mmon<br>
&gt;&gt; files between devices.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" targ=
et=3D"_blank">rs@ti.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../<a href=3D"http://ti-img-rogue-umlibs_24.2.6643903.bb" r=
el=3D"noreferrer" target=3D"_blank">ti-img-rogue-umlibs_24.2.6643903.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 ++++++++++++-------<br>
&gt;&gt;=C2=A0 1 file changed, 15 insertions(+), 8 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/<a href=
=3D"http://ti-img-rogue-umlibs_24.2.6643903.bb" rel=3D"noreferrer" target=
=3D"_blank">ti-img-rogue-umlibs_24.2.6643903.bb</a> b/meta-ti-bsp/recipes-g=
raphics/powervr-umlibs/<a href=3D"http://ti-img-rogue-umlibs_24.2.6643903.b=
b" rel=3D"noreferrer" target=3D"_blank">ti-img-rogue-umlibs_24.2.6643903.bb=
</a><br>
&gt;&gt; index b8153711..565e92eb 100644<br>
&gt;&gt; --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/<a href=3D"http:=
//ti-img-rogue-umlibs_24.2.6643903.bb" rel=3D"noreferrer" target=3D"_blank"=
>ti-img-rogue-umlibs_24.2.6643903.bb</a><br>
&gt;&gt; +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/<a href=3D"http:=
//ti-img-rogue-umlibs_24.2.6643903.bb" rel=3D"noreferrer" target=3D"_blank"=
>ti-img-rogue-umlibs_24.2.6643903.bb</a><br>
&gt;&gt; @@ -3,19 +3,15 @@ HOMEPAGE =3D &quot;<a href=3D"http://git.ti.com/=
graphics/ti-img-rogue-umlibs" rel=3D"noreferrer" target=3D"_blank">http://g=
it.ti.com/graphics/ti-img-rogue-umlibs</a>&quot;<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;TI-TFL&quot;<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://${WORKDIR}/git/LICENSE;md5=
=3D7232b98c1c58f99e3baa03de5207e76f&quot;<br>
&gt;&gt;<br>
&gt;&gt; -inherit bin_package<br>
&gt;&gt; -<br>
&gt;&gt; -INHIBIT_DEFAULT_DEPS =3D &quot;&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;&gt;=C2=A0 COMPATIBLE_MACHINE =3D &quot;j721e|j721s2|j784s4|j742s2|am62=
xx|am62pxx|j722s&quot;<br>
&gt;&gt;<br>
&gt;&gt; -PR =3D &quot;r3&quot;<br>
&gt;&gt; +PR =3D &quot;r4&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 BRANCH =3D &quot;linuxws/scarthgap/k6.12/${PV}&quot;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com/git/gra=
phics/ti-img-rogue-umlibs.git;protocol=3Dhttps;branch=3D$%7BBRANCH%7D" rel=
=3D"noreferrer" target=3D"_blank">git.ti.com/git/graphics/ti-img-rogue-umli=
bs.git;protocol=3Dhttps;branch=3D${BRANCH}</a>&quot;<br>
&gt;&gt; -SRCREV =3D &quot;d578666fc6ecd09f7d6c3431747f1d93d128fe28&quot;<b=
r>
&gt;&gt; -S =3D &quot;${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/$=
{PVR_BUILD}&quot;<br>
&gt;&gt; +SRCREV =3D &quot;1ed9ee185cd876200e6747192854015b8e94a7b0&quot;<b=
r>
&gt;&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 TARGET_PRODUCT:j721e =3D &quot;j721e_linux&quot;<br>
&gt;&gt;=C2=A0 TARGET_PRODUCT:j721s2 =3D &quot;j721s2_linux&quot;<br>
&gt;&gt; @@ -54,7 +50,12 @@ def get_file_list(package_list_var, d):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 file_list.append(f&quot;{prefix}{package_file}&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return &quot; &quot;.join(file_list)<br>
&gt;&gt;<br>
&gt;&gt; -do_install:append() {<br>
&gt;&gt; +EXTRA_OEMAKE +=3D &#39;BUILD=3D${PVR_BUILD} TARGET_PRODUCT=3D${TA=
RGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}&#39;<br>
&gt;&gt; +<br>
&gt;&gt; +do_configure[noexec] =3D &quot;1&quot;<br>
&gt;&gt; +do_compile[noexec] =3D &quot;1&quot;<br>
&gt;&gt; +do_install() {<br>
&gt;&gt; +=C2=A0 =C2=A0 oe_runmake &#39;DESTDIR=3D${D}&#39; install<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39=
;, &#39;opengl&#39;, &#39;false&#39;, &#39;true&#39;, d)}; then<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for file in ${@get_file_list(&#3=
9;GLES_PACKAGES&#39;,=C2=A0 d)}; do<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${file}<br>
&gt;&gt; @@ -78,6 +79,9 @@ do_install:append() {<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 # clean up any empty directories<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 find &quot;${D}&quot; -empty -type d -delete<b=
r>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 # fix permissions<br>
&gt;&gt; +=C2=A0 =C2=A0 chown -R root:root &quot;${D}&quot;</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex" dir=3D"auto"><br>
&gt;<br>
&gt; Why is this needed ?<br>
&gt;<br>
<br>
When you&#39;re copying over groups of file the permissions normally end up=
 mangled.<br>
You could install each dirctory manually before the copy to ensure proper<b=
r>
permissions, or you could just chown them after the fact.<br>
<br>
The rust package in oe-core does the same thing.</blockquote><div dir=3D"au=
to"><br></div><div dir=3D"auto">If install utility is used you can control =
the permissions but in bulk this might be fine</div><div dir=3D"auto"><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 GLES_PACKAGES =3D &quot;libgles1-rogue libgles2-rogue libgle=
s3-rogue&quot;<br>
&gt;&gt; @@ -141,6 +145,9 @@ INSANE_SKIP:${PN}-tools =3D &quot;ldflags&quot=
;<br>
&gt;&gt;=C2=A0 FILES:${PN}-firmware =3D &quot;${base_libdir}/firmware/*&quo=
t;<br>
&gt;&gt;=C2=A0 INSANE_SKIP:${PN}-firmware +=3D &quot;arch&quot;<br>
&gt;&gt;<br>
&gt;&gt; +# common libraries<br>
&gt;&gt; +FILES:${PN} =3D &quot;${libdir}&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 RRECOMMENDS:${PN} +=3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ${PN}-tools \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.48.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#18374): <a href=3D"https://lists.yoctoproject.=
org/g/meta-ti/message/18374" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.yoctoproject.org/g/meta-ti/message/18374</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/1116=
68777/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/mt/111668777/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.=
org" target=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/u=
nsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g=
/meta-ti/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
<br>
</blockquote></div></div>

--000000000000b2f31e06302d5349--


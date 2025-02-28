Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABDEC282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 18:41:05 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.1755.1740768055766634776
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Feb 2025 10:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=fajyrsdz;
 spf=pass (domain: criticallink.com, ip: 209.85.167.50, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-547bcef2f96so2546784e87.1
        for <meta-ti@lists.yoctoproject.org>; Fri, 28 Feb 2025 10:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1740768054; x=1741372854; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PUMHI6Wpol5qgv734u2i7QGMMPhVxx+Rc84FdXQoR0s=;
        b=fajyrsdz4bMaaq34A/ZNWvV3tZ+guUwrXzTFEBdEA194/aW9oABx8qTX4TF03TmSwm
         qXyquSTMf0OVD1+09pqL9OIj09OqLX3vNeH7LvpIf41YYtMq4jdni1+FQ0E8c/M/12YC
         +8ZfrygIn+7uRqbfyWvbvTtV9HlqsXGabEo4XoqoAbhdIBsWjOVVd+YCSERPydpgQSkQ
         LTFNNGYiNYxDDIzbhBr1VyS44BsC/3L/bJrCeLeqy0Yy3F+L5ffQFsi94LAeSia6f73y
         7cCKvFwjhiR92bdU0j0Aa+wd3QxjEuBcY75PjhMs58wKv3qnkapS+qB9O4If9b283a7q
         mU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740768054; x=1741372854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUMHI6Wpol5qgv734u2i7QGMMPhVxx+Rc84FdXQoR0s=;
        b=ui5l8sMEZkT/kt9g7GOsCrZj3W7lylQdl3fKqkxypaCW8HePrYDtQrra2PTlv+qXOK
         0W8eE4gTY35YNIlVtqiAslhRODpHs3uP5OAOzJdaEtBtiUqZEROgl/K/tIuH+yIvrGoR
         T1jGyN+Ote/M3TGXWrsoC5Y1s+zbEeIaYs7k0tQdKQeXr1rK/8qoIOCFf+s8/KOnY28F
         aPg95wcCJOZ1tpTkBC1ABzeDuPrOkPQ0ESxhM1wBzIlkaRHc6fesFtsO8foifGLOWrtI
         Z8ECEcyOpMaR51l2dnH09UhgWHrwOK7CkfVQkFbX9/klnntWCGE5Bmnmm1aBTwHHrFoA
         7n5g==
X-Forwarded-Encrypted: i=1; AJvYcCXXX/pR6YEOu00hev8MqKlfNmhCeacoVXrf1FIAzUmO/hDNtwLvL8VNX1Dy8C6KxDTBqWo1hKiJ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwvUwkUySTZfHuEwR4kg0+Dl8ZO0Ru6VOoWU9o0Oks+yjK9pFq+
	bo83/IIVH871h3L2HLMWBJzYEeL0xFG/5B5xqStHEDyJqolh3T9sElc3v3Ap0DDj1n/mRiwOyRP
	otB5ApTCR8oVkVTLOLiV3i+H0kx/P8K79AHVy
X-Gm-Gg: ASbGncuerOgZMYJ7CiUDAfgWRpmQro/UPqzNk9CWGz7SC7f5UZ9JNt2UI/7nmCW2WPI
	cCy4Og8Zb5wI09W3400ue+FM9Iy2cK3Xl1civ4aHI9mzcjddg/w/lq/Wl0koeefMur49yE9hFW2
	J6K2+5
X-Google-Smtp-Source: AGHT+IFao6eNXmRLlVpubkGfQBoXqu3aIcxxH8eXt7RLkBT6nmyp18J5VrUtMSf+hQ5uJhyQ/4TY+3ycJ71Pn7Lf5Ek=
X-Received: by 2002:a05:6512:3f0e:b0:545:62c:4b13 with SMTP id
 2adb3069b0e04-5494c351544mr1575082e87.40.1740768053766; Fri, 28 Feb 2025
 10:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20250228-uboot-cleanup-v1-1-3f7d3f2a4ee2@ti.com>
 <CADL8D3bcRNpg2TqsgMzW9nvUBp+FTfxzbNgOer9+4J6GGzmSuQ@mail.gmail.com> <20250228183445.d2zrg27xlrb6zjgu@bryanbrattlof.com>
In-Reply-To: <20250228183445.d2zrg27xlrb6zjgu@bryanbrattlof.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Fri, 28 Feb 2025 13:40:41 -0500
X-Gm-Features: AQ5f1JriMyVQm_RyZF5l4KIMgBtgafd9oO5wo83cqqXNQDpxMgA_ndof5BI5ESs
Message-ID: <CADL8D3Yhzzp3VSvPaA49=f54fcBzbihaXEFM-6eP7jv_djwFWw@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH master/scarthgap] conf: machine: k3: disable all
 fit signing for uboot
To: Bryan Brattlof <bb@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>, 
	Meta-TI <meta-ti@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000007b4904062f3825df"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Feb 2025 18:41:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18344

--0000000000007b4904062f3825df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks for the clarification.

On Fri, Feb 28, 2025, 1:34=E2=80=AFPM Bryan Brattlof <bb@ti.com> wrote:

> On February 28, 2025 thus sayeth Jon Cormier:
> > On Fri, Feb 28, 2025 at 1:12=E2=80=AFPM Bryan Brattlof via
> > lists.yoctoproject.org <bb=3Dti.com@lists.yoctoproject.org> wrote:
> > >
> > > All K3 SoCs utilize the binman packaging tools in U-Boot to package
> > > and sign the different boot firmware components needed to boot the
> > > various security variants of K3 platform. Disable UBOOT_SIGN_ENABLE
> > > to simplify the build
> > Are you trying to say that because binman does the signing, the
> > UBOOT_SIGN_ENABLE isn't needed?  Or does removing UBOOT_SIGN_ENABLE
> > disable the binman signing?
>
> Hey! yep because binman is signing these binaries during the
> do_compile() step we do not need the UBOOT_SIGN_ENABLE here
>
> ~Bryan
>
> > >
> > > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > > ---
> > >  meta-ti-bsp/conf/machine/include/k3.inc | 4 ----
> > >  1 file changed, 4 deletions(-)
> > >
> > > diff --git a/meta-ti-bsp/conf/machine/include/k3.inc
> b/meta-ti-bsp/conf/machine/include/k3.inc
> > > index dd3cbecab3d51..b98b45802bc76 100644
> > > --- a/meta-ti-bsp/conf/machine/include/k3.inc
> > > +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> > > @@ -25,10 +25,6 @@ SPL_BINARY =3D "tispl.bin"
> > >  SPL_BINARYNAME =3D "tispl.bin"
> > >  UBOOT_SUFFIX =3D "img"
> > >
> > > -UBOOT_SIGN_ENABLE =3D "1"
> > > -UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
> > > -UBOOT_SIGN_KEYNAME ?=3D "custMpk"
> > > -UBOOT_SIGN_KEYDIR ?=3D "${TI_SECURE_DEV_PKG}/keys"
> > >  FIT_HASH_ALG ?=3D "sha512"
> > >  FIT_SIGN_ALG ?=3D "rsa4096"
> > >
> > >
> > > ---
> > > base-commit: c3d050c2c9db34e250b4b61e90a67bacbfa45066
> > > change-id: 20250228-uboot-cleanup-35cb26c61905
> > >
> > > Best regards,
> > > --
> > > Bryan Brattlof <bb@ti.com>
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#18341):
> https://lists.yoctoproject.org/g/meta-ti/message/18341
> > > Mute This Topic: https://lists.yoctoproject.org/mt/111439202/7902621
> > > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> jcormier@criticallink.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > Jonathan Cormier
> > Senior Software Engineer
> >
> > Voice:  315.425.4045 x222
> >
> > http://www.CriticalLink.com
> > 6712 Brooklawn Parkway, Syracuse, NY 13211
> >
>

--0000000000007b4904062f3825df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, thanks for the clarification.=C2=A0</div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Feb 28, 2025, 1:34=E2=80=AFPM Bryan Brattlof &lt;<a href=3D"mai=
lto:bb@ti.com">bb@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On February 28, 2025 thus sayeth Jon Cormier:<br>
&gt; On Fri, Feb 28, 2025 at 1:12=E2=80=AFPM Bryan Brattlof via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer noreferrer=
" target=3D"_blank">lists.yoctoproject.org</a> &lt;bb=3D<a href=3D"mailto:t=
i.com@lists.yoctoproject.org" target=3D"_blank" rel=3D"noreferrer">ti.com@l=
ists.yoctoproject.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; All K3 SoCs utilize the binman packaging tools in U-Boot to packa=
ge<br>
&gt; &gt; and sign the different boot firmware components needed to boot th=
e<br>
&gt; &gt; various security variants of K3 platform. Disable UBOOT_SIGN_ENAB=
LE<br>
&gt; &gt; to simplify the build<br>
&gt; Are you trying to say that because binman does the signing, the<br>
&gt; UBOOT_SIGN_ENABLE isn&#39;t needed?=C2=A0 Or does removing UBOOT_SIGN_=
ENABLE<br>
&gt; disable the binman signing?<br>
<br>
Hey! yep because binman is signing these binaries during the <br>
do_compile() step we do not need the UBOOT_SIGN_ENABLE here<br>
<br>
~Bryan<br>
<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Bryan Brattlof &lt;<a href=3D"mailto:bb@ti.com" ta=
rget=3D"_blank" rel=3D"noreferrer">bb@ti.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-ti-bsp/conf/machine/include/k3.inc | 4 ----<br>
&gt; &gt;=C2=A0 1 file changed, 4 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bs=
p/conf/machine/include/k3.inc<br>
&gt; &gt; index dd3cbecab3d51..b98b45802bc76 100644<br>
&gt; &gt; --- a/meta-ti-bsp/conf/machine/include/k3.inc<br>
&gt; &gt; +++ b/meta-ti-bsp/conf/machine/include/k3.inc<br>
&gt; &gt; @@ -25,10 +25,6 @@ SPL_BINARY =3D &quot;tispl.bin&quot;<br>
&gt; &gt;=C2=A0 SPL_BINARYNAME =3D &quot;tispl.bin&quot;<br>
&gt; &gt;=C2=A0 UBOOT_SUFFIX =3D &quot;img&quot;<br>
&gt; &gt;<br>
&gt; &gt; -UBOOT_SIGN_ENABLE =3D &quot;1&quot;<br>
&gt; &gt; -UBOOT_MKIMAGE_DTCOPTS =3D &quot;-I dts -O dtb&quot;<br>
&gt; &gt; -UBOOT_SIGN_KEYNAME ?=3D &quot;custMpk&quot;<br>
&gt; &gt; -UBOOT_SIGN_KEYDIR ?=3D &quot;${TI_SECURE_DEV_PKG}/keys&quot;<br>
&gt; &gt;=C2=A0 FIT_HASH_ALG ?=3D &quot;sha512&quot;<br>
&gt; &gt;=C2=A0 FIT_SIGN_ALG ?=3D &quot;rsa4096&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt; base-commit: c3d050c2c9db34e250b4b61e90a67bacbfa45066<br>
&gt; &gt; change-id: 20250228-uboot-cleanup-35cb26c61905<br>
&gt; &gt;<br>
&gt; &gt; Best regards,<br>
&gt; &gt; --<br>
&gt; &gt; Bryan Brattlof &lt;<a href=3D"mailto:bb@ti.com" target=3D"_blank"=
 rel=3D"noreferrer">bb@ti.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#18341): <a href=3D"https://lists.yoctoproject=
.org/g/meta-ti/message/18341" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-ti/message/18341</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111=
439202/7902621" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lis=
ts.yoctoproject.org/mt/111439202/7902621</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject=
.org" target=3D"_blank" rel=3D"noreferrer">meta-ti+owner@lists.yoctoproject=
.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/meta-ti/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com=
" target=3D"_blank" rel=3D"noreferrer">jcormier@criticallink.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Jonathan Cormier<br>
&gt; Senior Software Engineer<br>
&gt; <br>
&gt; Voice:=C2=A0 315.425.4045 x222<br>
&gt; <br>
&gt; <a href=3D"http://www.CriticalLink.com" rel=3D"noreferrer noreferrer" =
target=3D"_blank">http://www.CriticalLink.com</a><br>
&gt; 6712 Brooklawn Parkway, Syracuse, NY 13211<br>
&gt; <br>
</blockquote></div>

--0000000000007b4904062f3825df--


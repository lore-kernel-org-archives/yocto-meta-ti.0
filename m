Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3281C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 09:29:33 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web11.99146.1671010164500438483
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 01:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XYp624V1;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id a66so8738601vsa.6
        for <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 01:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+1BJHaWkxnu0YKrbM1xXEyTJNa/CDdoWEFXgWiBPAOk=;
        b=XYp624V1ed5uWOGIrLpKkjxgaxk/DR2ASSVG/nvEblxDWHxjLrN3wIBhOAUe8YPnbt
         PShiYYCRPph83tEkYL40rsF9Ep8TWFQVdeH/ZWlg6LEuzsXCSxG1xaEJFjXzrI3YOiXg
         Z1OCbvyARtrclEE4tqfSRzuvPNbZNZI5J/IwCeQwNwNcaH4R1+xk8KPq8KOfeo9isdeM
         VtakBeQvqUzR2QZns+20Fr7ZIDqDNQkne6Vpi3SsUA678bBfHtG3Tdhf/cJ5Lucf74z/
         rIZA3SoPNrkakndDj1TNrx3+w1N9mfLgan96mK+FIugbDNLZCDbDFxBs25BY1cFsXRrv
         8gYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1BJHaWkxnu0YKrbM1xXEyTJNa/CDdoWEFXgWiBPAOk=;
        b=y281yWxU6bAhtYxgnAy4gaVsQyYRVDWfbp8v8oWZU5PGaV4Ip1WgjnE3l+d0ug5dXU
         Wfy+50fkQJUBzfxUh/oQdpMUg9qRI48lEC8St3GTmBr7o7l0Oxfvk/pq03NrTnsiDX2E
         plcfMhddCO6fnGPifzim1ZQ3QJ/wtfEQpyieqNMI/1Or0aUIqip24PpevIc46mXpq3lV
         7mxwPJgcxyntW4vmjstSb9Wbnocgz2dTnVmVN/Z6qKtvV/gUr4Vu9h0BLTaRQ5TUv2c8
         fT+RAGV0ZOV09URm1LnAe/G8eLPMj4XC509wUrfrtrs8fBIMJc/eb7mvwfCZojh4krED
         wpTg==
X-Gm-Message-State: ANoB5pkjJXnndghcmeJ/UnObzeSUoGoGL+LTfBuve2JR+9eu+jk5+N/f
	9XlNAEV/Sa5ho9kPYIs2ezkJjkhZPcVP0X5RKR0=
X-Google-Smtp-Source: AA0mqf6delx/Y5njgfBJNr9kDLSxzmDopo/8MbNey/zfwqAUyOMQ5H3KAc2OMaxXzhPPtkvdL0kIq92x4D3iJe7WVww=
X-Received: by 2002:a67:fc18:0:b0:3b1:542b:186c with SMTP id
 o24-20020a67fc18000000b003b1542b186cmr10013737vsq.33.1671010163335; Wed, 14
 Dec 2022 01:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20221213183818.206660-1-jose.quaresma@foundries.io> <20d8ecea-39f8-d965-7a1b-d0e085031095@ti.com>
In-Reply-To: <20d8ecea-39f8-d965-7a1b-d0e085031095@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 14 Dec 2022 09:29:02 +0000
Message-ID: <CANPvuRmLpQNKh+97K_hRGCxO3Xsb6toZ7BCt0+0EbOYHrVSh7A@mail.gmail.com>
Subject: Re: [meta-ti][dunfell][PATCH 1/2] Revert "conf: machine: k3: Add
 fitImage to the default kernel image types"
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000033a86305efc65f9a"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 09:29:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15473

--00000000000033a86305efc65f9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ryan Eatmon <reatmon@ti.com> escreveu no dia ter=C3=A7a, 13/12/2022 =C3=A0(=
s) 20:03:

>
>
> On 12/13/2022 12:38, Jose Quaresma wrote:
> > This reverts commit e6deeba806d2145fa16b0b5f444f2985e63e6366.
> >
> > Currently building with am62xx-evm/am64xx-evm machine fails with:
> >
> > | make[1]: *** No rule to make target 'fitImage'.  Stop.
> > | make: ***
> [/build/tmp/work-shared/am62xx-evm/kernel-source/Makefile:185: __sub-make=
]
> Error 2
> > | ERROR: oe_runmake failed
>
> This is a little surprising as we build dunfell every night without
> issue.  Are you using the linux-ti-staging kernel in your build?
>

I am building only with the bsp layer and with the default configuration.

Build Configuration:
BB_VERSION           =3D "1.46.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "aarch64-poky-linux"
MACHINE              =3D "am62xx-evm"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "3.1.21"
TUNE_FEATURES        =3D "aarch64"
TARGET_FPU           =3D ""
meta-arm
meta-arm-toolchain   =3D "dunfell:08c44df351ae1913f41de8388981b03e21235f09"
meta-ti              =3D "dunfell:00f616fad364ba3ceffc35097ecd0c8d247ad52e"
meta-oe
meta-python          =3D "dunfell:7203130ed8b58c0df75cb72222ac2bcf546bce44"
meta
meta-poky            =3D "dunfell:3155eb565fb1758ba426ab7f5ea710004ccbeb58"

The layer meta-oe/meta-python is a dependency of the meta-arm for
python3-cryptography native:

ERROR: Nothing PROVIDES 'python3-cryptography-native' (but
/build/../work/meta-arm/meta-arm/recipes-security/optee/optee-os_git.bb
DEPENDS on or otherwise requires it). Close matches:

The default kernel is the linux-ti-staging:

ERROR: Task
(/build/../work/meta-ti/recipes-kernel/linux/linux-ti-staging_5.10.bb:do_co=
mpile)
failed with exit code '1'


>
>
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >   conf/machine/include/k3.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> > index 349f4fda..ef4f107f 100644
> > --- a/conf/machine/include/k3.inc
> > +++ b/conf/machine/include/k3.inc
> > @@ -15,7 +15,7 @@ PREFERRED_PROVIDER_virtual/bootloader =3D
> "u-boot-ti-staging"
> >   PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
> >
> >   KERNEL_IMAGETYPE =3D "Image"
> > -KERNEL_IMAGETYPES =3D "Image fitImage"
> > +KERNEL_IMAGETYPES =3D "Image"
> >
> >   UBOOT_ARCH =3D "arm"
> >   UBOOT_ENTRYPOINT =3D "0x80008000"
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#15465):
> https://lists.yoctoproject.org/g/meta-ti/message/15465
> > Mute This Topic: https://lists.yoctoproject.org/mt/95650880/6551054
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

--00000000000033a86305efc65f9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Ryan Eatmon &lt;<a href=3D"mailto:rea=
tmon@ti.com">reatmon@ti.com</a>&gt; escreveu no dia ter=C3=A7a, 13/12/2022 =
=C3=A0(s) 20:03:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
<br>
On 12/13/2022 12:38, Jose Quaresma wrote:<br>
&gt; This reverts commit e6deeba806d2145fa16b0b5f444f2985e63e6366.<br>
&gt; <br>
&gt; Currently building with am62xx-evm/am64xx-evm machine fails with:<br>
&gt; <br>
&gt; | make[1]: *** No rule to make target &#39;fitImage&#39;.=C2=A0 Stop.<=
br>
&gt; | make: *** [/build/tmp/work-shared/am62xx-evm/kernel-source/Makefile:=
185: __sub-make] Error 2<br>
&gt; | ERROR: oe_runmake failed<br>
<br>
This is a little surprising as we build dunfell every night without <br>
issue.=C2=A0 Are you using the linux-ti-staging kernel in your build?<br></=
blockquote><div><br></div><div>I am building only with the bsp layer and wi=
th the default configuration.</div><div><br></div><div>Build Configuration:=
<br>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.46.0&quot;<br=
>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&=
quot;<br>NATIVELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D &quot;universal&quot;<br>T=
ARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64-poky-linux&q=
uot;<br>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;a=
m62xx-evm&quot;<br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;poky&quot;<br>DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D &quot;3.1.2=
1&quot;<br>TUNE_FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;aarch64&quot;=
<br>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>meta-=
arm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>meta-arm-toolchain =C2=A0=
 =3D &quot;dunfell:08c44df351ae1913f41de8388981b03e21235f09&quot;<br>meta-t=
i =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;dunfell:00f616f=
ad364ba3ceffc35097ecd0c8d247ad52e&quot;<br>meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br>meta-python =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;dunfell:7203130ed8b58c0df75cb72222ac2bcf546bce44&quot;<br>meta =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>meta-poky =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;dunfell:3155eb565fb1758ba42=
6ab7f5ea710004ccbeb58&quot;<br><br>The layer meta-oe/meta-python is a depen=
dency=C2=A0of the meta-arm for python3-cryptography native:</div><div><br>E=
RROR: Nothing PROVIDES &#39;python3-cryptography-native&#39; (but /build/..=
/work/meta-arm/meta-arm/recipes-security/optee/<a href=3D"http://optee-os_g=
it.bb">optee-os_git.bb</a> DEPENDS on or otherwise requires it). Close matc=
hes:</div><div><br>The default kernel is the linux-ti-staging:</div><div>=
=C2=A0</div><div>ERROR: Task (/build/../work/meta-ti/recipes-kernel/linux/l=
inux-ti-staging_5.10.bb:do_compile) failed with exit code &#39;1&#39;<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0conf/machine/include/k3.inc | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc=
<br>
&gt; index 349f4fda..ef4f107f 100644<br>
&gt; --- a/conf/machine/include/k3.inc<br>
&gt; +++ b/conf/machine/include/k3.inc<br>
&gt; @@ -15,7 +15,7 @@ PREFERRED_PROVIDER_virtual/bootloader =3D &quot;u-bo=
ot-ti-staging&quot;<br>
&gt;=C2=A0 =C2=A0PREFERRED_PROVIDER_u-boot =3D &quot;u-boot-ti-staging&quot=
;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0KERNEL_IMAGETYPE =3D &quot;Image&quot;<br>
&gt; -KERNEL_IMAGETYPES =3D &quot;Image fitImage&quot;<br>
&gt; +KERNEL_IMAGETYPES =3D &quot;Image&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0UBOOT_ARCH =3D &quot;arm&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_ENTRYPOINT =3D &quot;0x80008000&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#15465): <a href=3D"https://lists.yoctoproject.org/=
g/meta-ti/message/15465" rel=3D"noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/meta-ti/message/15465</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/95650880=
/6551054" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/95650880/6551054</a><br>
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

--00000000000033a86305efc65f9a--


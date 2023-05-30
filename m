Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A831C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 18:13:48 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.1497.1685470424356224028
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 11:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ILeeBzeI;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f505aace48so2501996e87.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685470422; x=1688062422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2js8ydHljCnMpbFynBd0UeppEhNgNuZgZna+nbyOjbQ=;
        b=ILeeBzeIKGxKI0XxyOgjtUozKlDcSFntkw3vPqGEOnGtuscy+5dX8E1iUHXgci8oMV
         ud595HY3JCPinVFs4qfp8/ORnqLn0oDWXOd+zIpM/G6KRkS31Qy0I8NuWgHT73G6RK3x
         4JVBn4bNSWUzwiZGi6hSxPFTTHQRZW3vdySiO/zoyfrhGfD4sGOxppY4r/mtzkin8XJ9
         IePCIRUOaumipCl0gp4XOt5ZuBGVYRZ4vQLefYuPdaqidizM6SzRiLLBt/l3dEZF2JDw
         bn8llPSu16wDFcvp9HObv29nzZaWuQV2m9JY5Gi2KsfF3LRc87/tbw+BnJV6j5MOFbwq
         MxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685470422; x=1688062422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2js8ydHljCnMpbFynBd0UeppEhNgNuZgZna+nbyOjbQ=;
        b=Sis8heSYYYw7/s5jfW2yOmFuY72tCup/UKAGVd3gmlfCR17nZRdyBhn+WxxFQj7X4u
         H8QDzt5yqAavbEkERpTBxIcnoD6pdTirTX/uQUAPb2/a0Q8L1koh9sJWolxHwjFMq3xh
         EBiY8mwOkHPM33UaEY6btJpE4YLx+PtgxH2R1JIxujA6o+eozt2wp+dK1QQPDqVUYtHc
         1gas/bCZtQj/8RLrwcwS9tRfBwXZvwXTgg2iHlzoUFWVji1TrFaY21I8DyXJIInBA3RH
         E7jMPaX3BnAj/zo70uwdsl0YNm0mv8UqGRBz+Jbu3IU1V7R0k8XWZY/Hq8/q11JUy6jX
         5erg==
X-Gm-Message-State: AC+VfDzeZhMiT/XJrKspA5kIMI5NW3g0i7oVi8mli1D8bg2el7VaouKb
	U4lxTJJuaPQOOr62J2AkGR7AkapelL31LfIVPd8=
X-Google-Smtp-Source: ACHHUZ6oYB4oOe8cCb74IFRHFGRdY9E7srbsNOJSCFe+N201TZDD67gShhWmQQuxFT41ZrAE8/li4iMB0OkG/hwPzYA=
X-Received: by 2002:a2e:82ce:0:b0:2af:17cf:2157 with SMTP id
 n14-20020a2e82ce000000b002af17cf2157mr1353269ljh.32.1685470422204; Tue, 30
 May 2023 11:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230530180926.265920-1-liu.ming50@gmail.com> <5aa81aac-3f6e-38de-890e-eadf8779d96b@ti.com>
In-Reply-To: <5aa81aac-3f6e-38de-890e-eadf8779d96b@ti.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 30 May 2023 20:13:31 +0200
Message-ID: <CALatG=7w+Tw3a=10yVReZfHDEg_2bRgxVFOM=9xM6g7LzYAT0g@mail.gmail.com>
Subject: Re: [meta-ti] [meta-ti-bsp] [PATCH] ti-localversion.bbclass:
 introduce bbclass
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org, max.krummenacher@toradex.com, 
	francesco.dolcini@toradex.com
Content-Type: multipart/alternative; boundary="000000000000cb83fa05fced2980"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 18:13:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16631

--000000000000cb83fa05fced2980
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ryan:

Thanks for the quick reply.

Arha, I did not see that MR, just subscribed this mail list today.

Yes exactly, UBOOT_LOCALVERSION has the same problem, it's also handled in
this patch.

the best,
thank you

Ryan Eatmon <reatmon@ti.com> =E6=96=BC 2023=E5=B9=B45=E6=9C=8830=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:11=E5=AF=AB=E9=81=93=EF=BC=9A

>
>
> On 5/30/2023 1:09 PM, Ming Liu wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > An error was observed as follows:
> > ERROR: ExpansionError during parsing
> .../meta-ti/meta-ti-bsp/recipes-kernel/linux/
> linux-ti-staging-systest_5.10.bb
> > Traceback (most recent call last):
> >    File "Var <KERNEL_LOCALVERSION>", line 1, in <module>
> >    File ".../openembedded-core/bitbake/lib/bb/fetch2/__init__.py", line
> 788, in get_srcrev(d=3D<bb.data_smart.DataSmart object at 0x7fe9da2f0c70>=
,
> method_name=3D'sortable_revision'):
> >           if not scms:
> >      >        raise FetchError("SRCREV was used yet no valid SCM was
> found in SRC_URI")
> >
> > with the latest bitbake on commit: 893f3b116b6
> > [ fetch2/npm: evaluate PATH before patching HOME ]
> >
> > the root cause is the variable SRCPV could not be expanded during
> > recipe parsing stage due to some uri variables in bitbake being unset.
> >
> > Insteadly, it has to be expanded in recipe finializing stage, let's
> > introduce a RecipeParsed event handler to set it.
> >
> > We need set UBOOT_LOCALVERSION in this handler as well, because that
> > has the same problem.
> >
> > Meanwhile, I have sent a patch to OE:
> >
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230530170949.1=
2045-1-liu.ming50@gmail.com/
> >
> > to make KERNEL_LOCALVERSION to be a standard OE variable, just like how
> > UBOOT_LOCALVERSION being handled in OE.
>
> Sadly, UBOOT_LOCALVERSION has the same error.  It's just random which
> one presents itself as the parser error.  We already have a patch from
> Denys that addresses this, I'm looking at it now.
>
>
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >   meta-ti-bsp/classes/ti-localversion.bbclass       | 15 ++++++++++++++=
+
> >   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc      |  8 +++-----
> >   .../recipes-kernel/linux/setup-defconfig.inc      |  4 +---
> >   3 files changed, 19 insertions(+), 8 deletions(-)
> >   create mode 100644 meta-ti-bsp/classes/ti-localversion.bbclass
> >
> > diff --git a/meta-ti-bsp/classes/ti-localversion.bbclass
> b/meta-ti-bsp/classes/ti-localversion.bbclass
> > new file mode 100644
> > index 00000000..6e7246af
> > --- /dev/null
> > +++ b/meta-ti-bsp/classes/ti-localversion.bbclass
> > @@ -0,0 +1,15 @@
> > +# Helper class to append a string to the name of the local version of
> kernel/uboot images.
> > +
> > +# Take 'KERNEL', 'UBOOT', set 'KERNEL_LOCALVERSION' and
> 'UBOOT_LOCALVERSION' accordingly
> > +LOCALVERSION_VAR ??=3D "KERNEL"
> > +
> > +python localversion_handler () {
> > +    import bb.event
> > +
> > +    if isinstance(e, bb.event.RecipeParsed):
> > +        srcpv =3D bb.fetch2.get_srcrev(e.data)
> > +        e.data.setVar('%s_LOCALVERSION' %
> e.data.getVar('LOCALVERSION_VAR'), "-g%s" %
> srcpv.replace('AUTOINC+','')[:10])
> > +}
> > +
> > +addhandler localversion_handler
> > +localversion_handler[eventmask] =3D "bb.event.RecipeParsed"
> > diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > index 8e236dfe..2f461ad4 100644
> > --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > @@ -1,7 +1,3 @@
> > -# UBOOT_LOCALVERSION can be set to add a tag to the end of the
> > -# U-boot version string.  such as the commit id
> > -UBOOT_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> True).replace('AUTOINC+','')[:10]}"
> > -
> >   UBOOT_SUFFIX ?=3D "img"
> >   SPL_BINARY ?=3D "MLO"
> >
> > @@ -61,7 +57,9 @@ PKG:${PN}-dbg =3D "u-boot-dbg"
> >   S =3D "${WORKDIR}/git"
> >
> >   # Support for secure devices - detailed info is in doc/README.ti-secu=
re
> > -inherit ti-secdev
> > +inherit ti-secdev ti-localversion
> > +
> > +LOCALVERSION_VAR =3D "UBOOT"
> >
> >   SYSROOT_DIRS +=3D "/boot"
> >
> > diff --git a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
> b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
> > index df7d9ac8..2db2bb84 100644
> > --- a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
> > +++ b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
> > @@ -1,6 +1,4 @@
> > -# KERNEL_LOCALVERSION can be set to add a tag to the end of the
> > -# kernel version string.  such as the commit id
> > -KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> True).replace('AUTOINC+','')[:10]}"
> > +inherit ti-localversion
> >
> >   # Check the defconfig file and see if it points to an in kernel
> >   # defconfig that should be used, or if it is a complete config file
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#16628):
> https://lists.yoctoproject.org/g/meta-ti/message/16628
> > Mute This Topic: https://lists.yoctoproject.org/mt/99225679/6551054
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

--000000000000cb83fa05fced2980
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Ryan:<div><br></div><div>Thanks for the quick reply.</=
div><div><br></div><div>Arha, I did not see that MR, just subscribed this m=
ail list today.</div><div><br></div><div>Yes exactly, UBOOT_LOCALVERSION ha=
s the same problem, it&#39;s also handled in this patch.</div><div><br></di=
v><div>the best,</div><div>thank you</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Ryan Eatmon &lt;<a href=3D"mailto=
:reatmon@ti.com">reatmon@ti.com</a>&gt; =E6=96=BC 2023=E5=B9=B45=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:11=E5=AF=AB=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 5/30/2023 1:09 PM, Ming Liu wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; <br>
&gt; An error was observed as follows:<br>
&gt; ERROR: ExpansionError during parsing .../meta-ti/meta-ti-bsp/recipes-k=
ernel/linux/<a href=3D"http://linux-ti-staging-systest_5.10.bb" rel=3D"nore=
ferrer" target=3D"_blank">linux-ti-staging-systest_5.10.bb</a><br>
&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0 File &quot;Var &lt;KERNEL_LOCALVERSION&gt;&quot;, line 1,=
 in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 File &quot;.../openembedded-core/bitbake/lib/bb/fetch2/__=
init__.py&quot;, line 788, in get_srcrev(d=3D&lt;bb.data_smart.DataSmart ob=
ject at 0x7fe9da2f0c70&gt;, method_name=3D&#39;sortable_revision&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not scms:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise FetchError(&=
quot;SRCREV was used yet no valid SCM was found in SRC_URI&quot;)<br>
&gt; <br>
&gt; with the latest bitbake on commit: 893f3b116b6<br>
&gt; [ fetch2/npm: evaluate PATH before patching HOME ]<br>
&gt; <br>
&gt; the root cause is the variable SRCPV could not be expanded during<br>
&gt; recipe parsing stage due to some uri variables in bitbake being unset.=
<br>
&gt; <br>
&gt; Insteadly, it has to be expanded in recipe finializing stage, let&#39;=
s<br>
&gt; introduce a RecipeParsed event handler to set it.<br>
&gt; <br>
&gt; We need set UBOOT_LOCALVERSION in this handler as well, because that<b=
r>
&gt; has the same problem.<br>
&gt; <br>
&gt; Meanwhile, I have sent a patch to OE:<br>
&gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/20=
230530170949.12045-1-liu.ming50@gmail.com/" rel=3D"noreferrer" target=3D"_b=
lank">https://patchwork.yoctoproject.org/project/oe-core/patch/202305301709=
49.12045-1-liu.ming50@gmail.com/</a><br>
&gt; <br>
&gt; to make KERNEL_LOCALVERSION to be a standard OE variable, just like ho=
w<br>
&gt; UBOOT_LOCALVERSION being handled in OE.<br>
<br>
Sadly, UBOOT_LOCALVERSION has the same error.=C2=A0 It&#39;s just random wh=
ich <br>
one presents itself as the parser error.=C2=A0 We already have a patch from=
 <br>
Denys that addresses this, I&#39;m looking at it now.<br>
<br>
<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/classes/ti-localversion.bbclass=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 15 +++++++++++++++<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 8 +++-----<br>
&gt;=C2=A0 =C2=A0.../recipes-kernel/linux/setup-defconfig.inc=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 +---<br>
&gt;=C2=A0 =C2=A03 files changed, 19 insertions(+), 8 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-ti-bsp/classes/ti-localversion.bbc=
lass<br>
&gt; <br>
&gt; diff --git a/meta-ti-bsp/classes/ti-localversion.bbclass b/meta-ti-bsp=
/classes/ti-localversion.bbclass<br>
&gt; new file mode 100644<br>
&gt; index 00000000..6e7246af<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-ti-bsp/classes/ti-localversion.bbclass<br>
&gt; @@ -0,0 +1,15 @@<br>
&gt; +# Helper class to append a string to the name of the local version of=
 kernel/uboot images.<br>
&gt; +<br>
&gt; +# Take &#39;KERNEL&#39;, &#39;UBOOT&#39;, set &#39;KERNEL_LOCALVERSIO=
N&#39; and &#39;UBOOT_LOCALVERSION&#39; accordingly<br>
&gt; +LOCALVERSION_VAR ??=3D &quot;KERNEL&quot;<br>
&gt; +<br>
&gt; +python localversion_handler () {<br>
&gt; +=C2=A0 =C2=A0 import bb.event<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if isinstance(e, bb.event.RecipeParsed):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcpv =3D bb.fetch2.get_srcrev(e.data)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 e.data.setVar(&#39;%s_LOCALVERSION&#39; %=
 e.data.getVar(&#39;LOCALVERSION_VAR&#39;), &quot;-g%s&quot; % srcpv.replac=
e(&#39;AUTOINC+&#39;,&#39;&#39;)[:10])<br>
&gt; +}<br>
&gt; +<br>
&gt; +addhandler localversion_handler<br>
&gt; +localversion_handler[eventmask] =3D &quot;bb.event.RecipeParsed&quot;=
<br>
&gt; diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bs=
p/recipes-bsp/u-boot/u-boot-ti.inc<br>
&gt; index 8e236dfe..2f461ad4 100644<br>
&gt; --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc<br>
&gt; +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc<br>
&gt; @@ -1,7 +1,3 @@<br>
&gt; -# UBOOT_LOCALVERSION can be set to add a tag to the end of the<br>
&gt; -# U-boot version string.=C2=A0 such as the commit id<br>
&gt; -UBOOT_LOCALVERSION =3D &quot;-g${@d.getVar(&#39;SRCPV&#39;, True).rep=
lace(&#39;AUTOINC+&#39;,&#39;&#39;)[:10]}&quot;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0UBOOT_SUFFIX ?=3D &quot;img&quot;<br>
&gt;=C2=A0 =C2=A0SPL_BINARY ?=3D &quot;MLO&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -61,7 +57,9 @@ PKG:${PN}-dbg =3D &quot;u-boot-dbg&quot;<br>
&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Support for secure devices - detailed info is in doc/REA=
DME.ti-secure<br>
&gt; -inherit ti-secdev<br>
&gt; +inherit ti-secdev ti-localversion<br>
&gt; +<br>
&gt; +LOCALVERSION_VAR =3D &quot;UBOOT&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SYSROOT_DIRS +=3D &quot;/boot&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc b/me=
ta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc<br>
&gt; index df7d9ac8..2db2bb84 100644<br>
&gt; --- a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc<br>
&gt; +++ b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc<br>
&gt; @@ -1,6 +1,4 @@<br>
&gt; -# KERNEL_LOCALVERSION can be set to add a tag to the end of the<br>
&gt; -# kernel version string.=C2=A0 such as the commit id<br>
&gt; -KERNEL_LOCALVERSION =3D &quot;-g${@d.getVar(&#39;SRCPV&#39;, True).re=
place(&#39;AUTOINC+&#39;,&#39;&#39;)[:10]}&quot;<br>
&gt; +inherit ti-localversion<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Check the defconfig file and see if it points to an in k=
ernel<br>
&gt;=C2=A0 =C2=A0# defconfig that should be used, or if it is a complete co=
nfig file<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#16628): <a href=3D"https://lists.yoctoproject.org/=
g/meta-ti/message/16628" rel=3D"noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/meta-ti/message/16628</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99225679=
/6551054" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/99225679/6551054</a><br>
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
</blockquote></div>

--000000000000cb83fa05fced2980--


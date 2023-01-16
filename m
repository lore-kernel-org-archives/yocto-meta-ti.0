Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EABC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 17:41:59 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web11.173953.1673890911359626222
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 09:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=daNsg4Jc;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id q21so5386925vka.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 16 Jan 2023 09:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j/ZXOmkj36sRNLqatNse5rIXnsm7SctZ+El9LoscxKM=;
        b=daNsg4Jc70DrRbp0XsxERw0aO0Uyagtgain8br+XFu75Pa7BmbV50xMs3uccW3hIZJ
         YhMuMVD5byx5qo48Gcs7dHdB0lOGKddrsHDlo8xWf0HyHVWdRzN+slvbUbDjELc9XRP5
         W7jW8rbkOCKOjXwpBzWILXEHiKh7+8Vtr4yFAe2VhJ1pLLqDaExABpFTehBEA1Om2EN1
         455G2sEme+yDO6PUV8BxF79oABbSLCOnDbcHiT7mP7Ml3bfK4A0rVRS3nFOyH7KaBswV
         nyyuW69EA5agKV/5QwRuPvTlItVjN54uMiMKyDCiTy8+d+V84hpH62LlYcUNQyc2y9BE
         3W/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/ZXOmkj36sRNLqatNse5rIXnsm7SctZ+El9LoscxKM=;
        b=Tf8tbP5F18vEReTUKBmcq15znqfJl7Xe857si8KKugjqUEytdv/5jiTLlCOxvF/XX3
         CVrwoy0uW2aHb4hxmPBf05DUaUuqEXVr5cqns1zLAbXG6eoCcGSUDYMoY/Y5avg3Ykfi
         YPf7WfgkpqRCxyaCWV4zf3ca62RHkAT57ezdkB9VFUFanpkP8jFmAmj5p14tavAYyTNn
         3ddjHfW9Vf3ZocB5U2/6Xsn44TA6rtxF5p9YEDYeymt7mEPrvLZs4gnC3aZFo0gdhSAb
         PizSYDgX55qzCFnUrD7kaQasaUlXF1VKI12qgJow+S05iK5BRY5Np/eScwEbr3ipVvcY
         7ENA==
X-Gm-Message-State: AFqh2krlGCri2JAiAw+QcGTlXBi7nJVm22cgFjxEHyZU2x8Lmh03MbHR
	zOaselk0MrviavN2vjwr5dnUcHfs7RpYgvcr0iI=
X-Google-Smtp-Source: AMrXdXs7efuET98Nj7JdQJHkzdemHyuuIRluq3tcHv9VYXyQrffj8ritlp45fSckmtrjjjo3C07NXDtHH6AAXP5Eq58=
X-Received: by 2002:ac5:cb6b:0:b0:3d5:df54:af0e with SMTP id
 l11-20020ac5cb6b000000b003d5df54af0emr31689vkn.5.1673890910313; Mon, 16 Jan
 2023 09:41:50 -0800 (PST)
MIME-Version: 1.0
References: <20230116121626.885219-1-jose.quaresma@foundries.io>
 <20230116121626.885219-2-jose.quaresma@foundries.io> <4ca62111-f173-ea41-7b9c-e6dc9182f69f@ti.com>
In-Reply-To: <4ca62111-f173-ea41-7b9c-e6dc9182f69f@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 16 Jan 2023 17:41:39 +0000
Message-ID: <CANPvuRns2KOQpYqO6jJGABz1joC3ebZW2w=dv1kCOiekTRmObA@mail.gmail.com>
Subject: Re: [meta-ti][PATCH 2/3] ti-k3-secdev: sets TI_K3_SECDEV_INSTALL_DIR_RECIPE
 default value
To: Andrew Davis <afd@ti.com>
Cc: meta-ti@lists.yoctoproject.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000001a22ea05f265190c"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Jan 2023 17:41:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15572

--0000000000001a22ea05f265190c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks for your comment.

Andrew Davis <afd@ti.com> escreveu no dia segunda, 16/01/2023 =C3=A0(s) 17:=
08:

> On 1/16/23 6:16 AM, Jose Quaresma wrote:
> > The TI_K3_SECDEV_INSTALL_DIR_RECIPE is defined on the meta-ti-extras
> layer
> > so when the layer is not used the variable is undefined.
> > For such cases we can use default value that is the same defined
> > on the recipes-ti/includes/ti-paths.inc
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >   meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> > index fd3bd120..6a28add7 100644
> > --- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> > +++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> > @@ -4,6 +4,8 @@ SECTION =3D "devel"
> >   LICENSE =3D "BSD-3-Clause"
> >   LIC_FILES_CHKSUM =3D
> "file://manifest/k3-secdev-0.2-manifest.html;md5=3Df632a78870cc64550078d7=
b3cbac0892"
> >
> > +# set a default value for TI_K3_SECDEV_INSTALL_DIR_RECIPE
> > +export TI_K3_SECDEV_INSTALL_DIR_RECIPE =3D "${datadir}/ti/ti-k3-secdev=
"
> >   include recipes-ti/includes/ti-paths.inc
> >
>
> Using ti-paths.inc was not really right to begin with, I only did that as
> I was in a time
> crunch, should be just removed (all of the file actually, but we can fix
> that later). Like
> other -native tool recipes, the output should end up in a standard place
> that can be accessed
> by recipes that depend on it. If -native packages could set env vars that
> would be nice, but
> without that, lets just assume location and drop the include on
> ti-paths.inc.
>

I think this can be done in a follow up patch, in this series I am trying
to make it simple
changing only the strictly required to remove the dependencies of
meta-ti-extras.


>
> For ti-k3-secdev_git.bb I'm thinking something like:
>
>
> --- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> +++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> @@ -4,8 +4,6 @@ SECTION =3D "devel"
>   LICENSE =3D "BSD-3-Clause"
>   LIC_FILES_CHKSUM =3D
> "file://manifest/k3-secdev-0.2-manifest.html;md5=3Df632a78870cc64550078d7=
b3cbac0892"
>
> -require recipes-ti/includes/ti-paths.inc
> -
>   # Native host tool only
>   COMPATIBLE_MACHINE =3D "null"
>   COMPATIBLE_MACHINE:class-native =3D "(.*)"
> @@ -23,11 +21,11 @@ S =3D "${WORKDIR}/git"
>
>   do_install() {
>       CP_ARGS=3D"-Prf --preserve=3Dmode,links,timestamps
> --no-preserve=3Downership"
> -    install -d ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}
> -    cp ${CP_ARGS} ${S}/* ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}
> +    install -d ${D}${datadir}/ti/ti-k3-secdev
> +    cp ${CP_ARGS} ${S}/* ${D}${datadir}/ti/ti-k3-secdev
>   }
>
> -FILES:${PN} +=3D "${TI_K3_SECDEV_INSTALL_DIR_RECIPE}"
> +FILES:${PN} +=3D "${D}${datadir}/ti/ti-k3-secdev"
>

I agree with this approach and if any additional change is needed it can be
done on the distro layer with a bbappend
or something else.

Jose


>
>   INSANE_SKIP:${PN} =3D "arch ldflags file-rdeps"
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001a22ea05f265190c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Andrew,</div><br>Thanks for your comment.<div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Andrew Dav=
is &lt;<a href=3D"mailto:afd@ti.com">afd@ti.com</a>&gt; escreveu no dia seg=
unda, 16/01/2023 =C3=A0(s) 17:08:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 1/16/23 6:16 AM, Jose Quaresma wrote:<br>
&gt; The TI_K3_SECDEV_INSTALL_DIR_RECIPE is defined on the meta-ti-extras l=
ayer<br>
&gt; so when the layer is not used the variable is undefined.<br>
&gt; For such cases we can use default value that is the same defined<br>
&gt; on the recipes-ti/includes/ti-paths.inc<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-ti-bsp/recipes-ti/secdev/<a href=3D"http://ti-k3-secd=
ev_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-k3-secdev_git.bb</a> | 2=
 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-ti-bsp/recipes-ti/secdev/<a href=3D"http://ti-k3-sec=
dev_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-k3-secdev_git.bb</a> b/=
meta-ti-bsp/recipes-ti/secdev/<a href=3D"http://ti-k3-secdev_git.bb" rel=3D=
"noreferrer" target=3D"_blank">ti-k3-secdev_git.bb</a><br>
&gt; index fd3bd120..6a28add7 100644<br>
&gt; --- a/meta-ti-bsp/recipes-ti/secdev/<a href=3D"http://ti-k3-secdev_git=
.bb" rel=3D"noreferrer" target=3D"_blank">ti-k3-secdev_git.bb</a><br>
&gt; +++ b/meta-ti-bsp/recipes-ti/secdev/<a href=3D"http://ti-k3-secdev_git=
.bb" rel=3D"noreferrer" target=3D"_blank">ti-k3-secdev_git.bb</a><br>
&gt; @@ -4,6 +4,8 @@ SECTION =3D &quot;devel&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://manifest/k3-secdev-0.2-m=
anifest.html;md5=3Df632a78870cc64550078d7b3cbac0892&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +# set a default value for TI_K3_SECDEV_INSTALL_DIR_RECIPE<br>
&gt; +export TI_K3_SECDEV_INSTALL_DIR_RECIPE =3D &quot;${datadir}/ti/ti-k3-=
secdev&quot;<br>
&gt;=C2=A0 =C2=A0include recipes-ti/includes/ti-paths.inc<br>
&gt;=C2=A0 =C2=A0<br>
<br>
Using ti-paths.inc was not really right to begin with, I only did that as I=
 was in a time<br>
crunch, should be just removed (all of the file actually, but we can fix th=
at later). Like<br>
other -native tool recipes, the output should end up in a standard place th=
at can be accessed<br>
by recipes that depend on it. If -native packages could set env vars that w=
ould be nice, but<br>
without that, lets just assume location and drop the include on ti-paths.in=
c.<br></blockquote><div><br>I think this can be done in a follow up=C2=A0pa=
tch, in this series I am trying to make it simple</div><div>changing=C2=A0o=
nly the strictly required to remove the dependencies=C2=A0of meta-ti-extras=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
For <a href=3D"http://ti-k3-secdev_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ti-k3-secdev_git.bb</a> I&#39;m thinking something like:<br>
<br>
<br>
--- a/meta-ti-bsp/recipes-ti/secdev/<a href=3D"http://ti-k3-secdev_git.bb" =
rel=3D"noreferrer" target=3D"_blank">ti-k3-secdev_git.bb</a><br>
+++ b/meta-ti-bsp/recipes-ti/secdev/<a href=3D"http://ti-k3-secdev_git.bb" =
rel=3D"noreferrer" target=3D"_blank">ti-k3-secdev_git.bb</a><br>
@@ -4,8 +4,6 @@ SECTION =3D &quot;devel&quot;<br>
=C2=A0 LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://manifest/k3-secdev-0.2-manifest.ht=
ml;md5=3Df632a78870cc64550078d7b3cbac0892&quot;<br>
<br>
-require recipes-ti/includes/ti-paths.inc<br>
-<br>
=C2=A0 # Native host tool only<br>
=C2=A0 COMPATIBLE_MACHINE =3D &quot;null&quot;<br>
=C2=A0 COMPATIBLE_MACHINE:class-native =3D &quot;(.*)&quot;<br>
@@ -23,11 +21,11 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0 do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 CP_ARGS=3D&quot;-Prf --preserve=3Dmode,links,timestamp=
s --no-preserve=3Downership&quot;<br>
-=C2=A0 =C2=A0 install -d ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}<br>
-=C2=A0 =C2=A0 cp ${CP_ARGS} ${S}/* ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}<=
br>
+=C2=A0 =C2=A0 install -d ${D}${datadir}/ti/ti-k3-secdev<br>
+=C2=A0 =C2=A0 cp ${CP_ARGS} ${S}/* ${D}${datadir}/ti/ti-k3-secdev<br>
=C2=A0 }<br>
<br>
-FILES:${PN} +=3D &quot;${TI_K3_SECDEV_INSTALL_DIR_RECIPE}&quot;<br>
+FILES:${PN} +=3D &quot;${D}${datadir}/ti/ti-k3-secdev&quot;<br></blockquot=
e><div><br>I agree=C2=A0with this approach=C2=A0and if any additional chang=
e is needed it can be done on the distro layer with a bbappend</div><div>or=
 something else.<br><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
=C2=A0 INSANE_SKIP:${PN} =3D &quot;arch ldflags file-rdeps&quot;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div></div>

--0000000000001a22ea05f265190c--


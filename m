Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550D8EB64DA
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 16:02:55 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.477.1688745769577610372
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 09:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=K8jYA1JR;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6b5ef64bca6so1885721a34.3
        for <meta-ti@lists.yoctoproject.org>; Fri, 07 Jul 2023 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688745768; x=1691337768;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/oO9HDnqIVO+4OIjVf5j+yMzkYMJ7NndoEAWMMLf/g=;
        b=K8jYA1JRuEje+8xYMwEtJkHjB3YkBXDGlCV1EYNIE1WTTGUZbtv3hTBv7u3DOi0orc
         UcXmF3s4uOFBN1SjQCOb7yUXyJm+uq8fcBTtNodOo7ifHMnZdvtJTsWGsn3F94sTLd2g
         vDHSIo6ggGNZDDQ4DUfxAT6YagxgXrg3bGzKq7ADv58rF0hn4kQVKR5Keq11c/r76Tsd
         FKh7dSSc+03coh17BiUXNbSqowlv+7QZwzNbGUVQwfyo/XNqLm9bp031fRmUm7xxKrjd
         PGVC/X6qZ5UBuYls2Dir6gFah76HUYmS9H8tc2gxx2vqCb0sFRbiDFVIgugvEV2ARDir
         fMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688745768; x=1691337768;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/oO9HDnqIVO+4OIjVf5j+yMzkYMJ7NndoEAWMMLf/g=;
        b=eakkBeQlfStmIRKjAvN+uEBI+XUuFpdL/kU9DP54mndok4pybCGETKpjnrBGQEa15W
         d54w+dQObDX8hiTmV/6Ef/sXxxpUb4cZDiqQSuv7yXPsmRL0J856UvmS6BjsRDumx5I5
         pR3DG7wTGQQLcjo6+CbQdwrKZXTYHZpGP0/iHg3YlkhrOHJS49tFvzGkUvP5myjZBCWg
         0gUF/PehCAnoO9CCk8c5oyoO0rAASLLRdz2sQMTfy4HgJGC0pCvPu9ClN6MC/f8E/f9/
         wmTfWpmQsKNJk6B/UQ+IX98Osuh7dST6HlXzL9gaDZLGUJuEnNvpJOqxyWPcntRYA2AO
         myMg==
X-Gm-Message-State: ABy/qLYuINmjRxuCpuKgtzEJ3885xF1Uciqk8vQvwRdY/Gb9N48K/hZx
	i/GivBi3fC7hSITOzwUTF647MvqvpMrlM3SW5u+isg0O
X-Google-Smtp-Source: APBJJlFh3HKmpNdCuYaXMNos9m2FRGz7iEY4VlyokfikAaD2zQlYj0F9IKDaRuKRfQE5e2t4sJKDuZBQZL/MqYQEpRA=
X-Received: by 2002:a05:6358:280b:b0:134:d559:259a with SMTP id
 k11-20020a056358280b00b00134d559259amr4649930rwb.17.1688745768279; Fri, 07
 Jul 2023 09:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230706193122.1891075-1-denis@denix.org> <CANPvuRkq3qONAsF6ar3ngGd4KEJ_uZ+8u8ZvuDKCQZKmnh3Ljw@mail.gmail.com>
In-Reply-To: <CANPvuRkq3qONAsF6ar3ngGd4KEJ_uZ+8u8ZvuDKCQZKmnh3Ljw@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 7 Jul 2023 17:02:37 +0100
Message-ID: <CANPvuR=bbiHkBG9BgrOkBj=oUvatC4vpJNDO79y4k5OYR8q3ww@mail.gmail.com>
Subject: Fwd: [meta-ti] [master/kirkstone][PATCH] conf: switch k3r5
 multiconfig to baremetal
To: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a2640705ffe7c37c"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Jul 2023 16:02:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16830

--000000000000a2640705ffe7c37c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Foreword to the mailing list.

---------- Forwarded message ---------
De: Jose Quaresma <quaresma.jose@gmail.com>
Date: sexta, 7/07/2023 =C3=A0(s) 10:51
Subject: Re: [meta-ti] [master/kirkstone][PATCH] conf: switch k3r5
multiconfig to baremetal
To: Denys Dmytriyenko <denis@denix.org>


Hi Denys,

Thanks for doing that, I will do some tests with this on kirstone.

Denys Dmytriyenko <denis@denix.org> escreveu no dia quinta, 6/07/2023 =C3=
=A0(s)
20:31:

> From: Denys Dmytriyenko <denys@konsulko.com>
>
> There are couple of k3r5 components that need to be built for the target
> and they are self-contained and don't use glibc. Moreover, when building
> a cross-compile toolchain for k3r5, there's no need to build glibc and
> all its dependencies. While build-time speed up is nice, the main benefit
> comes when packaging a nativesdk toolchain for distribution, reducing the
> number of packages and the resulting size of the toolchain installer.
>
> To avoid potential namespace conflict in package feeds between nativesdk
> binary packages of Linux glibc and k3r5 baremetal toolchains, adjust the
> package suffix accordingly.
>
> This also requires a rather impactful change in the deployment structure,
> which affects CIs and user experience. By default different TCLIBC builds
> (e.g. glibc and baremetal in this case) are built in separate TMPDIRs to
> avoid conflicts, especially on the nativesdk side. Also the default confi=
g
> has DEPLOY_DIR residing under corresponding TMPDIR. Of course, this can b=
e
> changed by local.conf or <distro>.conf, which meta-ti-bsp has no control
> over. Unlike multiconfig-image-packager example that can access deployed
> artifacts across multiconfigs to package in an image, we use wic and its
> IMAGE_BOOT_FILES list to package a final image. Unfortunately, wic cannot
> access deployed artifacts across multiconfigs in separate TMPDIRs, as it
> uses DEPLOY_DIR_IMAGE to collect the artifacts. To overcome this, we need
> to set up a "common" deploy directory for images and sdks produced by
> multiconfigs, which is located outside of TMPDIRs, set by TI_COMMON_DEPLO=
Y
> variable that can be changed or adjusted by distros as needed.
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-ti-bsp/conf/layer.conf            | 4 ++++
>  meta-ti-bsp/conf/multiconfig/k3r5.conf | 4 +++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index bb286c2b..db6f9de9 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -23,3 +23,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>  "
>
>  HOSTTOOLS_NONFATAL +=3D "truncate xxd comm"
> +
> +TI_COMMON_DEPLOY ?=3D "${TOPDIR}/deploy-ti"
> +DEPLOY_DIR_IMAGE:ti-soc =3D "${TI_COMMON_DEPLOY}/images/${MACHINE}"
> +SDK_DEPLOY:ti-soc =3D "${TI_COMMON_DEPLOY}/sdk"
> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> index deb07210..04b9a746 100644
> --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> @@ -1,5 +1,7 @@
>  MAINMACHINE :=3D "${MACHINE}"
>
> -DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/images/${MAINMACHINE}"
> +DEPLOY_DIR_IMAGE:k3r5 =3D "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
>

What is the reason to use a machine override here as this conf is already
used only on k3r5 machines?


>
>  MACHINE:append =3D "-k3r5"
> +TCLIBC =3D "baremetal"
> +SDKPKGSUFFIX =3D "k3r5-nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16821):
> https://lists.yoctoproject.org/g/meta-ti/message/16821
> Mute This Topic: https://lists.yoctoproject.org/mt/99992786/5052612
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


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a2640705ffe7c37c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Foreword to the mailing list.<br><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message --=
-------<br>De: <strong class=3D"gmail_sendername" dir=3D"auto">Jose Quaresm=
a</strong> <span dir=3D"auto">&lt;<a href=3D"mailto:quaresma.jose@gmail.com=
">quaresma.jose@gmail.com</a>&gt;</span><br>Date: sexta, 7/07/2023 =C3=A0(s=
) 10:51<br>Subject: Re: [meta-ti] [master/kirkstone][PATCH] conf: switch k3=
r5 multiconfig to baremetal<br>To: Denys Dmytriyenko &lt;<a href=3D"mailto:=
denis@denix.org">denis@denix.org</a>&gt;<br></div><br><br><div dir=3D"ltr">=
<div>Hi Denys,<br><br>Thanks=C2=A0for doing that, I will do some tests with=
 this on kirstone.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" =
target=3D"_blank">denis@denix.org</a>&gt; escreveu no dia quinta, 6/07/2023=
 =C3=A0(s) 20:31:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.com" target=
=3D"_blank">denys@konsulko.com</a>&gt;<br>
<br>
There are couple of k3r5 components that need to be built for the target<br=
>
and they are self-contained and don&#39;t use glibc. Moreover, when buildin=
g<br>
a cross-compile toolchain for k3r5, there&#39;s no need to build glibc and<=
br>
all its dependencies. While build-time speed up is nice, the main benefit<b=
r>
comes when packaging a nativesdk toolchain for distribution, reducing the<b=
r>
number of packages and the resulting size of the toolchain installer.<br>
<br>
To avoid potential namespace conflict in package feeds between nativesdk<br=
>
binary packages of Linux glibc and k3r5 baremetal toolchains, adjust the<br=
>
package suffix accordingly.<br>
<br>
This also requires a rather impactful change in the deployment structure,<b=
r>
which affects CIs and user experience. By default different TCLIBC builds<b=
r>
(e.g. glibc and baremetal in this case) are built in separate TMPDIRs to<br=
>
avoid conflicts, especially on the nativesdk side. Also the default config<=
br>
has DEPLOY_DIR residing under corresponding TMPDIR. Of course, this can be<=
br>
changed by local.conf or &lt;distro&gt;.conf, which meta-ti-bsp has no cont=
rol<br>
over. Unlike multiconfig-image-packager example that can access deployed<br=
>
artifacts across multiconfigs to package in an image, we use wic and its<br=
>
IMAGE_BOOT_FILES list to package a final image. Unfortunately, wic cannot<b=
r>
access deployed artifacts across multiconfigs in separate TMPDIRs, as it<br=
>
uses DEPLOY_DIR_IMAGE to collect the artifacts. To overcome this, we need<b=
r>
to set up a &quot;common&quot; deploy directory for images and sdks produce=
d by<br>
multiconfigs, which is located outside of TMPDIRs, set by TI_COMMON_DEPLOY<=
br>
variable that can be changed or adjusted by distros as needed.<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.com" =
target=3D"_blank">denys@konsulko.com</a>&gt;<br>
---<br>
=C2=A0meta-ti-bsp/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 4 ++++<br>
=C2=A0meta-ti-bsp/conf/multiconfig/k3r5.conf | 4 +++-<br>
=C2=A02 files changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf<br>
index bb286c2b..db6f9de9 100644<br>
--- a/meta-ti-bsp/conf/layer.conf<br>
+++ b/meta-ti-bsp/conf/layer.conf<br>
@@ -23,3 +23,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0HOSTTOOLS_NONFATAL +=3D &quot;truncate xxd comm&quot;<br>
+<br>
+TI_COMMON_DEPLOY ?=3D &quot;${TOPDIR}/deploy-ti&quot;<br>
+DEPLOY_DIR_IMAGE:ti-soc =3D &quot;${TI_COMMON_DEPLOY}/images/${MACHINE}&qu=
ot;<br>
+SDK_DEPLOY:ti-soc =3D &quot;${TI_COMMON_DEPLOY}/sdk&quot;<br>
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/mult=
iconfig/k3r5.conf<br>
index deb07210..04b9a746 100644<br>
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
@@ -1,5 +1,7 @@<br>
=C2=A0MAINMACHINE :=3D &quot;${MACHINE}&quot;<br>
<br>
-DEPLOY_DIR_IMAGE =3D &quot;${DEPLOY_DIR}/images/${MAINMACHINE}&quot;<br>
+DEPLOY_DIR_IMAGE:k3r5 =3D &quot;${TI_COMMON_DEPLOY}/images/${MAINMACHINE}&=
quot;<br></blockquote><div><br></div><div>What is the reason to use a machi=
ne override here as this conf is already used only on k3r5 machines?</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0MACHINE:append =3D &quot;-k3r5&quot;<br>
+TCLIBC =3D &quot;baremetal&quot;<br>
+SDKPKGSUFFIX =3D &quot;k3r5-nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#16821): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/16821" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/16821</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99992786/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/99992786/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/leave/1136=
9865/5052612/926574700/xyzzy" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-ti/leave/11369865/5052612/926574700/xyzzy</a>=
 [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jos=
e@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
</div><br clear=3D"all"><div><br></div><span class=3D"gmail_signature_prefi=
x">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quare=
sma</div></div></div></div>

--000000000000a2640705ffe7c37c--


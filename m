Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B087CC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 13:20:39 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.36369.1699881637471197402
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 05:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HRBHVEHj;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-45d9d28142fso1889626137.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 13 Nov 2023 05:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699881636; x=1700486436; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs78ZifIkNmLqNs9WVH2kTDa6mgeoXu2OANsEqseUIA=;
        b=HRBHVEHjs/K+1sFZxFC8yfcvG2kg3So9D+7clh0uY65TrYnf03mu5536GTPxSS4+I7
         tbd4/dyB09YUgHnRRQBGfm9XhJylovJlc1Ael8LHxUiNEJXPTkmP6S8thD9oPXGRZrHf
         IaSu6o1E2tMxt7p+IR5ET6HVNjEzrNsb0MwVqIBv2ZP6HGtEzLzxN6gx/hSc86y6hJno
         1O0IJj3mQcWG3MBUSPxX8qWGtFzLPs/NkAuk1RqGLCDqaqzm4tVgBh8yzdvNz7r8cyQ6
         UN3zr2r8FbpqL0ZqDjJRPB0t7z9a3M/W5kSQzwmFuYmDKOICD0oLqO4TP2TEFUcAbb4i
         kBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699881636; x=1700486436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bs78ZifIkNmLqNs9WVH2kTDa6mgeoXu2OANsEqseUIA=;
        b=BKq47Ig1Fk/VJhQeVkJ8AMSyvKAlavT3ncjRLjzz/RQEsDGcIrKrrgzi7YYJJLxlrf
         sjsGGBdK518gHWmBdjcaVgpFZh/qHunFB4Rz3CxqKi4imnTMTqypM7U7ILKMRmcEDUC5
         qCCGQELqAszNi5Y49kU8i+YbDNX/ZF1NTS1j09Bap0MhIINC8icFm5DLt1RVKYhd39l9
         TQLtTuN7jBAmExB1yUoq/3nJB7nK698G0Nm7LQDDYFY5kBURNOO5jrqC2AyQFvemMgKR
         gF3qC+JHxZBavahjOE/kx6kxPDz0bldUqgfOotaDImXKysQ3I7RoTjN/fVH4bGbuSKiD
         5hbw==
X-Gm-Message-State: AOJu0Yysk9htWt3yoF2beXBQS0SiUN8lautTeggK21HAs7KSdDBQG3TZ
	KkEE/JIeuM1mYlQm/Dp0mynhGrFvmt67VzFX9wo=
X-Google-Smtp-Source: AGHT+IHuakKdXHzuRUry4nzIaEQ2LINHo7/4Tjy0C9ahpAxMoY9Ro+hFHftM9t2dCww+vW2BEFfo+k67c3M9jI7chZQ=
X-Received: by 2002:a67:e0d7:0:b0:460:f6a3:901b with SMTP id
 m23-20020a67e0d7000000b00460f6a3901bmr5022752vsl.35.1699881636453; Mon, 13
 Nov 2023 05:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20231112190743.1496752-1-denis@denix.org>
In-Reply-To: <20231112190743.1496752-1-denis@denix.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 13 Nov 2023 13:20:25 +0000
Message-ID: <CANPvuRmdh8EteVzjJto1BgLYdiO1HGdUxihvsDrEYgv3YykOJg@mail.gmail.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH] k3r5: ensure separate TMPDIR
 used for this multiconfig
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000019e38c060a088967"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Nov 2023 13:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17294

--00000000000019e38c060a088967
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko <denis@denix.org> escreveu no dia domingo, 12/11/2023
=C3=A0(s) 19:07:

> From: Denys Dmytriyenko <denys@konsulko.com>
>
> This k3r5 multiconfig builds baremetal components (and corresponding
> native,
> nativesdk and cross tools) and sets TCLIBC accordingly to "baremetal". Th=
e
> expectation is that those components and tools will use a separate TMPDIR
> to isolate from the main Linux build that uses "glibc" TCLIBC and to avoi=
d
> potential conflicts.
>
> OE-Core "nodistro" default configuration already sets TCLIBCAPPEND facili=
ty
> to automatically add a suffix to TMPDIR, resulting in "tmp-baremetal" tem=
p
> directory for this multiconfig and "tmp-glibc" for the main Linux one.
> Other
> distros like Arago follow this convention and even extend a bit (e.g. Ara=
go
> also adds TCMODE suffix to TMPDIR for external toolchain support
> separation).
>
> But Poky (and derivative distros, like AGL or YoE) disable TCLIBCAPPEND a=
nd
> result in a combined TMPDIR, leading to potential conflicts, such as:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15273
>
> And that's just the beginning, there were other conflicts observed later =
in
> the build, e.g. during nativesdk builds - that's why we also set a unique
> SDKPKGSUFFIX here.
>
> To force a separate TMPDIR for k3r5 multiconfig, we have to directly appe=
nd
> a suffix to it. Multiple other options were tested in hopes of making it
> slightly cleaner, but they either didn't work or were dismissed. For
> example,
> trying to override TCLIBCAPPEND getting cleared by a distro would require
> using a machine/soc-override, which doesn't have enough scope (nativesdk)
> or forcing it with :forcevariable would also change the main Linux TMPDIR
> and affect existing CI flows. Also, using TCLIBC itself as a suffix to ad=
d
> to TMPDIR may result in getting it appended twice (tmp-baremetal-baremeta=
l)
> when normal TCLIBCAPPEND facility is used. Hence the least
> invasive/confusing
> option is to always append "-k3r5" suffix to this multiconfig TMPDIR. Tha=
t
> results in "tmp-k3r5" in Poky (leaving main TMPDIR as "tmp"), while OE-Co=
re
> "nodistro" and Arago would end up with "tmp-baremetal-k3r5" (and
> "tmp-glibc"
> for the main).
>
> Also note, meta-ti-bsp layer.conf sets up images and sdks to be deployed
> into a common location outside of TMPDIRs, but TI_COMMON_DEPLOY variable
> that controls it is set weakly, allowing to be modified from a distro
> configuration or local.conf. It means that all images and sdks can be
> deployed into the main TMPDIR if one's CI flow expects tmp/deploy/ as
> the final destination, by using :=3D for immediate variable expansion:
> TI_COMMON_DEPLOY :=3D "${TMPDIR}/deploy"
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> index 04b9a746..e36c87ed 100644
> --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> @@ -4,4 +4,6 @@ DEPLOY_DIR_IMAGE:k3r5 =3D
> "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
>
>  MACHINE:append =3D "-k3r5"
>  TCLIBC =3D "baremetal"
> +TMPDIR:append =3D "-k3r5"
> +
>

Thanks for fixing this long remaining issue on the kirkstone branch.

AFAIK all the collision issues are mostly fixed on oe-core master.
For me there are still sporadic failures with the SPDX bbclass.
Can this change be optional? with something like:

TMPDIRAPPEND ?=3D "-k3r5"
TMPDIR:append =3D "${TMPDIRAPPEND}"

This adds the possibility of more easily reverting this change
to being able to fix what is pending in oe-core master.

Jose


>  SDKPKGSUFFIX =3D "k3r5-nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17293):
> https://lists.yoctoproject.org/g/meta-ti/message/17293
> Mute This Topic: https://lists.yoctoproject.org/mt/102547765/5052612
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

--00000000000019e38c060a088967
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mail=
to:denis@denix.org">denis@denix.org</a>&gt; escreveu no dia domingo, 12/11/=
2023 =C3=A0(s) 19:07:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.com" tar=
get=3D"_blank">denys@konsulko.com</a>&gt;<br>
<br>
This k3r5 multiconfig builds baremetal components (and corresponding native=
,<br>
nativesdk and cross tools) and sets TCLIBC accordingly to &quot;baremetal&q=
uot;. The<br>
expectation is that those components and tools will use a separate TMPDIR<b=
r>
to isolate from the main Linux build that uses &quot;glibc&quot; TCLIBC and=
 to avoid<br>
potential conflicts.<br>
<br>
OE-Core &quot;nodistro&quot; default configuration already sets TCLIBCAPPEN=
D facility<br>
to automatically add a suffix to TMPDIR, resulting in &quot;tmp-baremetal&q=
uot; temp<br>
directory for this multiconfig and &quot;tmp-glibc&quot; for the main Linux=
 one. Other<br>
distros like Arago follow this convention and even extend a bit (e.g. Arago=
<br>
also adds TCMODE suffix to TMPDIR for external toolchain support separation=
).<br>
<br>
But Poky (and derivative distros, like AGL or YoE) disable TCLIBCAPPEND and=
<br>
result in a combined TMPDIR, leading to potential conflicts, such as:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15273" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D15273</a><br>
<br>
And that&#39;s just the beginning, there were other conflicts observed late=
r in<br>
the build, e.g. during nativesdk builds - that&#39;s why we also set a uniq=
ue<br>
SDKPKGSUFFIX here.<br>
<br>
To force a separate TMPDIR for k3r5 multiconfig, we have to directly append=
<br>
a suffix to it. Multiple other options were tested in hopes of making it<br=
>
slightly cleaner, but they either didn&#39;t work or were dismissed. For ex=
ample,<br>
trying to override TCLIBCAPPEND getting cleared by a distro would require<b=
r>
using a machine/soc-override, which doesn&#39;t have enough scope (nativesd=
k)<br>
or forcing it with :forcevariable would also change the main Linux TMPDIR<b=
r>
and affect existing CI flows. Also, using TCLIBC itself as a suffix to add<=
br>
to TMPDIR may result in getting it appended twice (tmp-baremetal-baremetal)=
<br>
when normal TCLIBCAPPEND facility is used. Hence the least invasive/confusi=
ng<br>
option is to always append &quot;-k3r5&quot; suffix to this multiconfig TMP=
DIR. That<br>
results in &quot;tmp-k3r5&quot; in Poky (leaving main TMPDIR as &quot;tmp&q=
uot;), while OE-Core<br>
&quot;nodistro&quot; and Arago would end up with &quot;tmp-baremetal-k3r5&q=
uot; (and &quot;tmp-glibc&quot;<br>
for the main).<br>
<br>
Also note, meta-ti-bsp layer.conf sets up images and sdks to be deployed<br=
>
into a common location outside of TMPDIRs, but TI_COMMON_DEPLOY variable<br=
>
that controls it is set weakly, allowing to be modified from a distro<br>
configuration or local.conf. It means that all images and sdks can be<br>
deployed into the main TMPDIR if one&#39;s CI flow expects tmp/deploy/ as<b=
r>
the final destination, by using :=3D for immediate variable expansion:<br>
TI_COMMON_DEPLOY :=3D &quot;${TMPDIR}/deploy&quot;<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.com" =
target=3D"_blank">denys@konsulko.com</a>&gt;<br>
---<br>
=C2=A0meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/mult=
iconfig/k3r5.conf<br>
index 04b9a746..e36c87ed 100644<br>
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
@@ -4,4 +4,6 @@ DEPLOY_DIR_IMAGE:k3r5 =3D &quot;${TI_COMMON_DEPLOY}/images/=
${MAINMACHINE}&quot;<br>
<br>
=C2=A0MACHINE:append =3D &quot;-k3r5&quot;<br>
=C2=A0TCLIBC =3D &quot;baremetal&quot;<br>
+TMPDIR:append =3D &quot;-k3r5&quot;<br>
+<br></blockquote><div><br>Thanks=C2=A0for fixing this long remaining issue=
 on the kirkstone branch.</div><div><br></div><div>AFAIK all the collision =
issues are mostly fixed on oe-core master.<br>For me there are still sporad=
ic failures with the=C2=A0SPDX bbclass.<br>Can this change be optional? wit=
h something like:<br><br>TMPDIRAPPEND ?=3D &quot;-k3r5&quot;<br>TMPDIR:appe=
nd =3D &quot;${TMPDIRAPPEND}&quot;<br><br>This adds the possibility of more=
 easily reverting this change<br>to being able to fix what is pending in oe=
-core master.<br><br>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
=C2=A0SDKPKGSUFFIX =3D &quot;k3r5-nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#17293): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17293" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/17293</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/102547765/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/102547765/5052612</a><br>
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

--00000000000019e38c060a088967--


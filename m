Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBB6EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 12:11:36 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.9158.1687349486516982588
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 05:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Zf4UN0pc;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-440cff7870aso638863137.1
        for <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 05:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687349485; x=1689941485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fnx2RbgM2ulAksod1rsj7Ez9TPFpc1Yx/iO8fp2WNO4=;
        b=Zf4UN0pcyX09YqJ4takvJEaUkmxNiDhtSX2znq91CIMlpu3ZLeqkeOlc9C6TgE6zzL
         +oTbp/Xn6vMSJ03qOKCKfVmN+9ZuY1v7oKkgNFl9BdqzCeI1YtpGdZxcYyiIgCmhV7Z/
         gQyepnhRwn3zjPEgZv1KDaV9JoTmvTdXWU6e7cxWiYXCRxflBGMnTAkmaJkvNcn6GLyI
         FVhHhnKNJ1wT8hvmDUJIhR2kz1fXK3HL6fhbtg8VUF+UVZ4qFb8ROS9m3BOQ8a0WZRum
         mR9S/fHcP/yVTYHvjeD/D0zWAB38Trk5UpW44drZkgCSib0try2ab/eePBePouAmVb41
         Qamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687349485; x=1689941485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fnx2RbgM2ulAksod1rsj7Ez9TPFpc1Yx/iO8fp2WNO4=;
        b=VvjayHGTSMXwlWP32BKoloAzcyzIVJB1MuDXqdPncF4CcoEfPeVdyhyUmiG8zp/sle
         tJfnDPfSofjHIIMnzPqVxnZ8dtMmUfZc//4aVrfbRbVan8BHkcHEJ3P8K2VALM9qFUQX
         eG7DL0q8k5zqo1f7azJxy6jYCVPnYp3HNcsgbHAuoO25bBW3ssT5ZQ0XOzo9b8SWWrKu
         FeixA8r9CQGFHrDdWg05yaj5m+B8WYlVFgJyp8F+GElDFnA1DkXNbEIy0nHKH5dlsDNn
         q/AsChehHkzmJ+fLfr4nw0DJd+auxvTRd++tAP6SUohR3HW96MdjWc7YJ8Ff2YWv/XLY
         wKGw==
X-Gm-Message-State: AC+VfDwD2NbLnJj7+xfTylBrsMF6pWiv0M87wb5ufETh6IhLpZBAqdRl
	aMf7hIIJRVQ6CnpgvxOs69CbGq1l4iC0247C9v8=
X-Google-Smtp-Source: ACHHUZ7jyfDESJWoGLAZXtb+nPD+bcBjQuPzHPywfonVXLBkar4uKLE2QyyOYrePb+EHJXCrCQMgEh5NT53QJ+577ag=
X-Received: by 2002:a05:6102:3d9f:b0:440:ce13:1eff with SMTP id
 h31-20020a0561023d9f00b00440ce131effmr1242491vsv.17.1687349485365; Wed, 21
 Jun 2023 05:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230530154218.21641-1-afd@ti.com>
In-Reply-To: <20230530154218.21641-1-afd@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 21 Jun 2023 13:11:14 +0100
Message-ID: <CANPvuR=hzxhywNxt13TW-Qio5VRZxXGCaE4=zzsbbtY=najPhg@mail.gmail.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] conf: machine: am62xx:
 Default to HS-FS instead of GP
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000afedab05fea2aa32"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 12:11:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16758

--000000000000afedab05fea2aa32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Andrew Davis via lists.yoctoproject.org <afd=3Dti.com@lists.yoctoproject.or=
g>
escreveu no dia ter=C3=A7a, 30/05/2023 =C3=A0(s) 16:47:

> This matches how we had the symlink for tiboot3.bin before binman.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> index 724a8d4a..9889ae38 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> @@ -6,6 +6,6 @@ require conf/machine/include/k3r5.inc
>
>  SYSFW_SOC =3D "am62x"
>  SYSFW_CONFIG =3D "evm"
> -SYSFW_SUFFIX =3D "gp"
> +SYSFW_SUFFIX =3D "hs-fs"
>

Should we use a default assignment ? so it will be easier to change for
folks using the gp.
Currently there is no way without using the :remove override.

Jose


>
>  UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16623):
> https://lists.yoctoproject.org/g/meta-ti/message/16623
> Mute This Topic: https://lists.yoctoproject.org/mt/99222576/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000afedab05fea2aa32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Andrew,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Andrew Davis via <a href=3D"http://lists.yo=
ctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;afd=3D<a h=
ref=3D"mailto:ti.com@lists.yoctoproject.org" target=3D"_blank">ti.com@lists=
.yoctoproject.org</a>&gt; escreveu no dia ter=C3=A7a, 30/05/2023 =C3=A0(s) =
16:47:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This matc=
hes how we had the symlink for tiboot3.bin before binman.<br>
<br>
Signed-off-by: Andrew Davis &lt;<a href=3D"mailto:afd@ti.com" target=3D"_bl=
ank">afd@ti.com</a>&gt;<br>
---<br>
=C2=A0meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/am62xx-evm-k3r5.conf<br>
index 724a8d4a..9889ae38 100644<br>
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf<br>
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf<br>
@@ -6,6 +6,6 @@ require conf/machine/include/k3r5.inc<br>
<br>
=C2=A0SYSFW_SOC =3D &quot;am62x&quot;<br>
=C2=A0SYSFW_CONFIG =3D &quot;evm&quot;<br>
-SYSFW_SUFFIX =3D &quot;gp&quot;<br>
+SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br></blockquote><div><br>Should we use =
a default assignment=C2=A0? so it will be easier=C2=A0to change for folks u=
sing the gp.<br></div><div>Currently there is no way without using the :rem=
ove override.</div><div><br></div><div>Jose<br>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
=C2=A0UBOOT_MACHINE =3D &quot;am62x_evm_r5_defconfig&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#16623): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/16623" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/16623</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99222576/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/99222576/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">qua=
resma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000afedab05fea2aa32--


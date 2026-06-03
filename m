Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197AFCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 14:26:10 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21632.1780496764898754287
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 07:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=p4sbmgLY;
 spf=pass (domain: criticallink.com, ip: 209.85.218.52, mailfrom: jcormier@criticallink.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bebbc325000so520178966b.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 07:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780496763; cv=none;
        d=google.com; s=arc-20240605;
        b=A4UzS5jp2/arQsabcB8yif85g6y2juebzBZO90k08QYF1HMBP0w/RGWLNxLlSosHjM
         9luOYiq7gPVvoLkvbZckvjwADpaUGkkXVn8fAf/AHVA2QWsSAoLKvDbr9yRfjQkTTNeA
         rLG7Cu1rmP51iWmza7Z64nVu6DHG5jWexwI17qAbinBZvWKF/vBPO9gx2U/xvwk3MTKh
         aZPcKjW/vSz2fyTiHXaCU2vW+4TnhZ8vJGovosJ0I1lyFglPdl4c/wSzPLQb0pGs6Qz6
         wJWm/+8HrPAPy4a+CvKcIuXhVe5f90KhXyNTXebWlQu25a2mcKZ3obbuVaL/wraeaZWb
         Mmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hVfTc9sYxi0xCumSbgB36uLXfQjdjFJZB0PAPrYd5/M=;
        fh=LDxwcELlN9Zg1aJUJZt+oK5Zib/ytqJrymME92bsGag=;
        b=VgC8YAgP/2+/TkdNU4dp0czXGupylLfzg1tIKGgp/g+q+DepXc/dyXJeit85Cx7jYl
         UaCmtYGsGzhGjvNJpVU0GtPQFTjG1MptSGD/yQLvboQbhPHp06yfIkJZaZ5bO9uFJYal
         xfwlvz1QnZKyAcGko4Q/ST68x2vRc4CBBDiFe0WVTQ58FTguxF5r7UE+rg6J9FydpmMm
         92pZSslRIya41fiTfYJmBezxipkNOcM3KB/xV0FYyduuYqHj3H9JYuiS2Nwnd/JrQuy7
         Erx/S9bXreSQPEmtxq6Dq31deBaIck4HCS3339WH1lvU0fzD+GDMTbHoHXeLPkkCp8qA
         EM1Q==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1780496763; x=1781101563; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hVfTc9sYxi0xCumSbgB36uLXfQjdjFJZB0PAPrYd5/M=;
        b=p4sbmgLY6mbzzmN36MX0XS+gjZWAzRZiafWl4+J74yX+/texn7KXZCq/kZw1B58a1e
         RXioVQmZ5QMwoFcwa3gNfTUCWDdKgZXiSN57m70v+50gDNm6dd9SMGR07G2ciQld6VAt
         y+MeNTwO5OuOU3RUx/UPuDJ7UHkj6QRWkH1SL49DoK3+M/2ezbJycdzX/J+XbJctUjgB
         Zl480vZp/x62nk5NXintrYYTx5BhCKiWTBg5eJ99i95twdAz9Uw5EhcUNi0wU3peUjVi
         xJMFYsu44KrPAtMWOcAb55gRxohVCzGfNSLJdY+qB4T3ng5ox5IR4E8K6QnlA/CH6Zvz
         Vufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496763; x=1781101563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVfTc9sYxi0xCumSbgB36uLXfQjdjFJZB0PAPrYd5/M=;
        b=malqp/c+AQPdSyI7HCUhuSmODrYW9HFeBeovYrfBwtrOMMiIRJEW0FPKt+NuG0AUbt
         BETZYBIDgzAHlVRmLwQsj1DFr7CtsIdBjE4/KMce4zQnhYhewLX/YDjIbLhQYYVA1lUe
         rRMreOu2gOT1w4e+SsDOWZaTx/wJd41/6rhnxaFEZM0umgR3hTDbsHb0mASWb3Blhc0/
         OYUtLF+q1R1RAq1y4lHqEXTEfkV0FRx7J9K7acqSuoIK9DKHwJbhhmby/vG5WP2U5/9X
         9c3sszVrZLZ07qNOxWBtVug62sG34hncQ5zzXPeRj6eX99lS68vM73AZBi94jfQdo8eN
         grpg==
X-Gm-Message-State: AOJu0YwIV+i/hVy2tr9eLh3/cvOItzucXHlSrOWrOPfGUDXqrZsdpWVk
	iRwnm9vQai0w9IT8o4x5GamXpE38m8KZiDeRIEyQ7C8fM2M6uvI0Iv2Vd6Nhe2x2LABlblRKGdn
	/3Sj9O8YN0ibiP35qJAvzweuZyWtRBkV81khbbty+
X-Gm-Gg: Acq92OGyXGYj+KZyQRqkQh1tqOzotBCPl+qcdcR+0eTgSIHWYHcivmOigh6h9VkWndk
	HIcxdZy6glcQ5B48CX/XCcs2mhLeqqO4rTw/r9j2LDOZ0l7caeEoV8TdulX3Aoz0vXbkjdCTxl8
	B8FWLnxN62N5tX0YbqQFvgdLhQ6daH6w2BZJFFztgmMucv1js5a0rGk5UT7CDZ+vfXk7WNgxFA2
	JZtVtCKKvn3YHhWcNxwOAaXIa91p1UGBTeLA1Bukfucycfmv79AKN/C55WVXG9EgBU8vu/RPVow
	zeKu5Rjd+JtPj1bQ
X-Received: by 2002:a17:907:2dac:b0:bec:64c3:9ac0 with SMTP id
 a640c23a62f3a-bf0b10d94b7mr178172566b.14.1780496762926; Wed, 03 Jun 2026
 07:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260603072932.1273938-1-m-shah@ti.com> <20260603072932.1273938-2-m-shah@ti.com>
In-Reply-To: <20260603072932.1273938-2-m-shah@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Wed, 3 Jun 2026 10:25:48 -0400
X-Gm-Features: AVHnY4Ize2lSs90anKRoIiAtN4nncuRHGICuClDH-7Kbt-QJibXaImFE0f0ge5Y
Message-ID: <CADL8D3aFJLbtWr3wCNwsFCMj3UO9XNS5niZL+Uj7hPmHXbd6Yg@mail.gmail.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v2 1/2] k3.inc: Add CPSW modules
 to initramfs for bsp-next NFS boot
To: m-shah@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, nm@ti.com, u-kumar1@ti.com, 
	s-vadapalli@ti.com, a-limaye@ti.com, gehariprasath@ti.com, denys@konsulko.com
Content-Type: multipart/alternative; boundary="0000000000001408f006535a3522"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 14:26:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19963

--0000000000001408f006535a3522
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 3:30=E2=80=AFAM Moteen Shah via lists.yoctoproject.o=
rg
<m-shah=3Dti.com@lists.yoctoproject.org> wrote:

> AM65_CPSW_NUSS and its dependencies changed from built-in to loadable
> modules in linux-next. Add them to TI_CORE_INITRAMFS_KERNEL_MODULES so
> NFS boot continues to work on K3 platforms with the bsp-next kernel.
>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/k3.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc
> b/meta-ti-bsp/conf/machine/include/k3.inc
> index 6833789c..726c071f 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -61,3 +61,9 @@ FALCON_INCLUDE =3D ""
>  FALCON_INCLUDE:ti-falcon =3D "conf/machine/include/ti-falcon.inc"
>
>  require ${FALCON_INCLUDE}
> +
> +# AM65_CPSW_NUSS and its direct Kconfig dependencies became loadable
> modules
> +# in linux-next (post 7.1). Include them in the initramfs so NFS boot
> works.
> +# TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=3Dy).
> +
> +TI_CORE_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D "
> kernel-module-ti-am65-cpsw-nuss kernel-module-k3-cppi-desc-pool
> kernel-module-davinci-mdio kernel-module-ti-cpsw-ale
> kernel-module-ti-cpsw-sl kernel-module-phylink kernel-module-mdio-bitbang
> kernel-module-phy-gmii-sel"
>
Is there any way to link the inclusion of these kernel modules to the
inclusion of the net boot recipe?  If we don't need NFS boot support, how
much larger does this make the initramfs? Just a thought.

> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19959):
> https://lists.yoctoproject.org/g/meta-ti/message/19959
> Mute This Topic: https://lists.yoctoproject.org/mt/119625158/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

--0000000000001408f006535a3522
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 3, =
2026 at 3:30=E2=80=AFAM Moteen Shah via <a href=3D"http://lists.yoctoprojec=
t.org">lists.yoctoproject.org</a> &lt;m-shah=3D<a href=3D"mailto:ti.com@lis=
ts.yoctoproject.org">ti.com@lists.yoctoproject.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">AM65_CPSW_NUSS and its de=
pendencies changed from built-in to loadable<br>
modules in linux-next. Add them to TI_CORE_INITRAMFS_KERNEL_MODULES so<br>
NFS boot continues to work on K3 platforms with the bsp-next kernel.<br>
<br>
Signed-off-by: Moteen Shah &lt;<a href=3D"mailto:m-shah@ti.com" target=3D"_=
blank">m-shah@ti.com</a>&gt;<br>
---<br>
=C2=A0meta-ti-bsp/conf/machine/include/k3.inc | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/mac=
hine/include/k3.inc<br>
index 6833789c..726c071f 100644<br>
--- a/meta-ti-bsp/conf/machine/include/k3.inc<br>
+++ b/meta-ti-bsp/conf/machine/include/k3.inc<br>
@@ -61,3 +61,9 @@ FALCON_INCLUDE =3D &quot;&quot;<br>
=C2=A0FALCON_INCLUDE:ti-falcon =3D &quot;conf/machine/include/ti-falcon.inc=
&quot;<br>
<br>
=C2=A0require ${FALCON_INCLUDE}<br>
+<br>
+# AM65_CPSW_NUSS and its direct Kconfig dependencies became loadable modul=
es<br>
+# in linux-next (post 7.1). Include them in the initramfs so NFS boot work=
s.<br>
+# TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=3Dy).<br>
+<br>
+TI_CORE_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D &quot; kernel-module-=
ti-am65-cpsw-nuss kernel-module-k3-cppi-desc-pool kernel-module-davinci-mdi=
o kernel-module-ti-cpsw-ale kernel-module-ti-cpsw-sl kernel-module-phylink =
kernel-module-mdio-bitbang kernel-module-phy-gmii-sel&quot;<br></blockquote=
><div>Is there any way to link the inclusion of these kernel modules to the=
 inclusion of the net boot recipe?=C2=A0 If we don&#39;t need NFS boot supp=
ort, how much larger does this make the initramfs? Just a thought.</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#19959): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/19959" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/19959</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119625158/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119625158/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_blank">j=
cormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div><div><div><div><div><div>Jonathan Cormier<br>Senio=
r Software Engineer<br><br>Office: =C2=A0315.425.4045 x222</div><div><img s=
rc=3D"https://www.criticallink.com/wp-content/uploads/critical-link-logo-em=
ail.png"><br></div><div><div><a href=3D"http://www.criticallink.com/" targe=
t=3D"_blank">http://www.CriticalLink.com</a></div></div></div>6712 Brooklaw=
n Parkway, Syracuse, NY 13211 </div></div></div></div></div><br></div></div=
></div>

--0000000000001408f006535a3522--


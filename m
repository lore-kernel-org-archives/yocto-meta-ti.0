Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCF6C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 14:16:30 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.50183.1737036980911457054
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 06:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=cHQ7JXzi;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=VeoSdCM6;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737036981; x=1768572981;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=KVog0JtPyL0Z+Hl6WzTzxdsHOqZhfptt3Az2ghq8wn0=;
  b=cHQ7JXzi5Qg1VfItM0nJvRoTTrvyKgKlopiqo74j+yrhLVbUf5UpfU5Z
   ZRzFDqKsCvkJPFx7R10DHb7ETQEFzozS8UXchP+ewJC/FzGeRfaKUsOKc
   LR+t0KPbCGj22MiJRDJZ6oh6MKcHgaOVNnOqUWN4mjWcczQs5f8yIp0Po
   BHQjnIy7W/K4qUt584/dtTl30ScqFgkbWfUXCQgWSk0O2GRaPozOmhSlV
   LeVxFkvCMJ/lW4bgsVQB4R+KuYyoiQI2vbaYgBN7ZoCyXYz+WccQt9k40
   GlPp/UuKPU61ziNJdM6mS/gFMmYRVZrkTm40J/hieKvgxned/td+WAaMm
   g==;
X-CSE-ConnectionGUID: z1nQd1r2SnuR2RO3EZG8IA==
X-CSE-MsgGUID: +/fxcNWfRSaZGqFmqBXUcg==
X-IronPort-AV: E=Sophos;i="6.13,209,1732575600"; 
   d="scan'208";a="41121969"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Jan 2025 15:16:18 +0100
X-CheckPoint: {678914B2-22-9B2B6168-EB6F31C5}
X-MAIL-CPID: 1AB29550A20C2E7C1EF87A064328CDDB_5
X-Control-Analysis: str=0001.0A682F17.678914B2.00C6,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4276C16C62C;
	Thu, 16 Jan 2025 15:16:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737036974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KVog0JtPyL0Z+Hl6WzTzxdsHOqZhfptt3Az2ghq8wn0=;
	b=VeoSdCM6zNWmYYUzPFy639D3t5k3MLi8tRJGgHIseKnMZyCcfd2g8iT/NI9xPclZxO/3yX
	Pfx22QiKuCAl2FhlSNK+c0flurA9z0tXwf3Mvc99zAtrQ62Cdo7Hr+mWCJhKkHc0RVKC46
	aV7+g6V3O01ep3E4Kue8vY+e0DIDUBmwawhhRmtxt41SVfRcnY98wYM4S2AmK+naahTahB
	GSZZZh+uePbNTiJq5uv5m6WoKXDk+0DBGKRFZZ0ZDrSecsTu+NYt2wemj1tHnGpPXLvdlO
	2D1p4JFfbt2HdL2ajoA/i5z0Dsgt7tgRqYfolYGSOOPwCaDi+ya00HX888xUbQ==
Message-ID: <600d5483778f22a8330fc7150cf402558b12cb29.camel@ew.tq-group.com>
Subject: Re: [meta-ti][master][PATCH 1/4] ti-img-rogue-*: version
 24.1.6554834 -> 24.2.6643903
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: rs@ti.com, reatmon@ti.com, denys@konsulko.com
Cc: meta-ti@lists.yoctoproject.org, a-christidis@ti.com, detheridge@ti.com, 
	linux@ew.tq-group.com
Date: Thu, 16 Jan 2025 15:16:12 +0100
In-Reply-To: <20250114015945.3554905-2-rs@ti.com>
References: <20250114015945.3554905-1-rs@ti.com>
	 <20250114015945.3554905-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Jan 2025 14:16:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18199

On Mon, 2025-01-13 at 19:59 -0600, Randolph Sapp via lists.yoctoproject.org
wrote:
> From: Randolph Sapp <rs@ti.com>
>=20
> Bump the package version for DDK 24.2, this includes a few fixups from
> IMG and support for a newer version of mesa.
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>


A first test in our TQMa62xx BSP found that the build of ti-img-rogue-drive=
r
currently fails with ti-linux 6.12.y if CONFIG_TRACING is enabled in the ke=
rnel
config.

Without CONFIG_TRACING, the build is successful and the driver is working a=
s
expected (tested with Weston + weston-simple-egl so far).

Best,
Matthias



> ---
>  ...er_24.1.6554834.bb =3D> ti-img-rogue-driver_24.2.6643903.bb} | 4 ++--
>  ...bs_24.1.6554834.bb =3D> ti-img-rogue-umlibs_24.2.6643903.bb} | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24.1=
.6554834.bb =3D> ti-img-rogue-driver_24.2.6643903.bb} (93%)
>  rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_=
24.1.6554834.bb =3D> ti-img-rogue-umlibs_24.2.6643903.bb} (98%)
>=20
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
24.1.6554834.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driv=
er_24.2.6643903.bb
> similarity index 93%
> rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_2=
4.1.6554834.bb
> rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.=
2.6643903.bb
> index 9007872f..eef940d6 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.65=
54834.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.66=
43903.bb
> @@ -13,13 +13,13 @@ COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am=
62xx|am62pxx|j722s"
> =20
>  DEPENDS =3D "virtual/kernel"
> =20
> -BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
> +BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
> =20
>  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -SRCREV =3D "707bb373902babf9ced5fd2f99139209ca0f605a"
> +SRCREV =3D "51a23d9fba59a9aa9179793dfa6ee649fdd44015"
> =20
>  TARGET_PRODUCT:j721e =3D "j721e_linux"
>  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-uml=
ibs_24.1.6554834.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-ro=
gue-umlibs_24.2.6643903.bb
> similarity index 98%
> rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umli=
bs_24.1.6554834.bb
> rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs=
_24.2.6643903.bb
> index 720a3cff..0de66b72 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.=
1.6554834.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.=
2.6643903.bb
> @@ -12,9 +12,9 @@ COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62=
xx|am62pxx|j722s"
> =20
>  PR =3D "r3"
> =20
> -BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
> +BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
>  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
> -SRCREV =3D "ba93a3e38c683ccb03a7cf8f2e7dffe2f9cbcf1c"
> +SRCREV =3D "d578666fc6ecd09f7d6c3431747f1d93d128fe28"
>  S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
> =20
>  TARGET_PRODUCT:j721e =3D "j721e_linux"
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18196): https://lists.yoctoproject.org/g/meta-ti/mess=
age/18196
> Mute This Topic: https://lists.yoctoproject.org/mt/110600827/4454427
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [matthias.sch=
iffer@ew.tq-group.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/


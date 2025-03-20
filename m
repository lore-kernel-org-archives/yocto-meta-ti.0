Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657D9C36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 09:12:47 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.3084.1742461964237142131
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 02:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=pLYGkJO+;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=EnzWh+dd;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742461964; x=1773997964;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=eTIN7oz6Qsq5zPPCvOVaVsnnKknz50rnOSAZ874WLJM=;
  b=pLYGkJO+S8k7di6FbGtNuXhTeyKmOX6oijUMnhWvs6T4QOc3TEol1al2
   0C0CLxQSv61VzJGmHNmAKWQVXtC8MGN4HqcEFQJ89IZ1cTZSt0PemN2BN
   eG2VB9Ge+6TgIyTJXboVGLR0nJbURj8GHoN6EB+nF8CT656Yxb35tL3NS
   vmWmE0gmn1i2jeQ03h0XuC1SuZYsysGOofrA073zn8A0dRzNCJJG/ke+n
   Gct4ViFhi900Nb7LzJT3WfRUGnyOgUtjofQQAV/wN5jetcHCVH4gXwc9H
   WGH69xKer4d/gFuE0fvIcjx7f8ldwOQlzDBLs1woakRWqY1QfdLGlGijO
   A==;
X-CSE-ConnectionGUID: 2zDTkMhcQDGe1clVkeuC2w==
X-CSE-MsgGUID: tykTTBSdSbGjjWshtaMGqA==
X-IronPort-AV: E=Sophos;i="6.14,261,1736809200"; 
   d="scan'208";a="43064643"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Mar 2025 10:12:41 +0100
X-CheckPoint: {67DBDC09-37-903EAEAC-E04C76C8}
X-MAIL-CPID: 3D1166091D226B85E27AB34AD9D6AADF_5
X-Control-Analysis: str=0001.0A006371.67DBDC01.0046,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BBBA16902F;
	Thu, 20 Mar 2025 10:12:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742461957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eTIN7oz6Qsq5zPPCvOVaVsnnKknz50rnOSAZ874WLJM=;
	b=EnzWh+ddoPEZYQGHZdzfqVc2yP/fRzWDLkBpuHffqFSjl6ccp6HrQEqwY+w/fAeb3ZQs80
	zlevGbJUdfClyRi1QevQcOIWH1b/3isOL49/qLUoe1qtajhYlavq8gHBXJPbl2zmDzNMNc
	xzVvbR4ZavxMo5MkkZ8HmCXU/gvdLujvvVnLmrSp9G9CITFLQ5xsld8PzA0ikyVqIdn26T
	RtAsBAucXoMu2gm/EexMDKu4fEQi/sWKpKiu02FI/uJT7YTC9LP/QNNcyk7At1MYpZQjVP
	o/TiM+xKSHG8ShcKJBqLgSTrgvRw+j784y312YVWVZSuludHkE060YTSqdCIfg==
Message-ID: <94455bb5a7ab81a4f31aa8797cc5d9bfddafcb63.camel@ew.tq-group.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH] ti-sgx-ddk-km: rework
 preferred_target selection
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: rs@ti.com
Cc: meta-ti@lists.yoctoproject.org, denis@denix.org, reatmon@ti.com
Date: Thu, 20 Mar 2025 10:12:36 +0100
In-Reply-To: <20250319213819.955726-1-rs@ti.com>
References: <20250319213819.955726-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Mar 2025 09:12:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18415

On Wed, 2025-03-19 at 16:38 -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
>=20
> Bump SRCREV to include a patch that changes the way
> compiler_preferred_target is selected for a given toolchain. This now
> checks specified SYS_CFLAGS to see if hardfloat is set explicitly and
> will override the default target selection if necessary.
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>

Tested-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>



> ---
>  .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4=
948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948=
957.bb
> index 49376221..18b81d2f 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
> @@ -19,7 +19,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/omap5-sgx-dd=
k-linux.git;protocol=3Dhttps;
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -SRCREV =3D "f555b9e1ae4b2baf68ac778ca41dc0c17e96f89a"
> +SRCREV =3D "9ae0fa4998b1c624408945e062bf8fb0ea7efb9d"
> =20
>  TARGET_PRODUCT:omap-a15 =3D "ti572x_linux"
>  TARGET_PRODUCT:ti33x =3D "ti335x_linux"

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/


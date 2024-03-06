Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E351C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 23:34:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.10842.1709768060740613203
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 15:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dwZz2ng8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 426NYJ64106759;
	Wed, 6 Mar 2024 17:34:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709768059;
	bh=7At1y1OZNusxb5GPTDAEo/pdW8QMjT6ZELUaDM0hOSE=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=dwZz2ng82hZhQFynIe4qLfchfgLal+pGrJ9eFBNj1DUyn7AW/ACs08OwXFJYUoclO
	 rFunCM6zL9fmWSYx4pLruRhlkRaINTLRYNkiO5oYgbrD4+Jnqp52hzd3sLq4gvXaYd
	 0Enm7N4hkK4Ot29n1zLYFpJBomn/zwx6DvflSTds=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 426NYJBh001075
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Mar 2024 17:34:19 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Mar 2024 17:34:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Mar 2024 17:34:19 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 426NYJmA029373;
	Wed, 6 Mar 2024 17:34:19 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 6 Mar 2024 17:34:19 -0600
Message-ID: <CZN26Z34WVP3.26UHLMEIIS7G6@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-driver: bump version to
 align with dt
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>, <detheridge@ti.com>
X-Mailer: aerc 0.15.2
References: <17BA4E96805D5D0C.10210@lists.yoctoproject.org>
In-Reply-To: <17BA4E96805D5D0C.10210@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Mar 2024 23:34:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17501

On Wed Mar 6, 2024 at 4:50 PM CST, Randolph Sapp via lists.yoctoproject.org=
 wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Bump the package version to align with the changed AM62 GPU device tree
> compatible string. This will make it easer to switch back and forth
> between the proprietary and open source driver.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driv=
er_23.3.6512818.bb
> index 02ec9fe9..7f3cd27c 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.65=
12818.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.65=
12818.bb
> @@ -22,7 +22,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue=
-driver.git;protocol=3Dhttps;
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -SRCREV =3D "2f409b4dd2540e896b54bff02219d4fc51129b81"
> +SRCREV =3D "ee3fc7b2caaa1fc22bafd26c025bf0d824f6c5b8"
> =20
>  TARGET_PRODUCT:j721e =3D "j721e_linux"
>  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"

I guess it's worth noting that this will break interoperability with kernel=
 6.1
on master...


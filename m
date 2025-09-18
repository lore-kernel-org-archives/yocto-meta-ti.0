Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AB1CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 18:46:05 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.23519.1758221160797800518
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 11:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bRgRLysx;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IIjwrr071022;
	Thu, 18 Sep 2025 13:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758221158;
	bh=N93X2kIy0uhBfptXUzv928BUaxCpB9pQ+Z4jODg90x8=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=bRgRLysx/N+fJ3ve7esKWLnHAq6CDFMk8MbGO1tK9Affq5UDGoU+naLtRE5/c442i
	 hhpAQAme+8akBXt6F4ayeiDLzm7Afk3zhBCEUVAEgYRgGOKUhrQILAZYd2wO6kEzdn
	 cXt1f18B/35Kv8zgY8b89Sz4JfJawait8DMcRYZk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IIjwFS1752498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 13:45:58 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 13:45:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 13:45:58 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IIjw2O1325067;
	Thu, 18 Sep 2025 13:45:58 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 18 Sep 2025 13:45:58 -0500
Message-ID: <DCW5DTD9TEB8.C7P6SA935JAT@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan
 Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH 1/5] ti-sgx-ddk-um: UM side driver
 depends on KM side driver
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250917220926.1116988-1-afd@ti.com>
In-Reply-To: <20250917220926.1116988-1-afd@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 18:46:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19038

On Wed Sep 17, 2025 at 5:09 PM CDT, Andrew Davis wrote:
> This also matches what is done for ti-img-rogue-umlibs.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb              | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.=
17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1=
.17.4948957.bb
> index b260abdf..b6f5534e 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948=
957.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948=
957.bb
> @@ -40,9 +40,7 @@ TARGET_PRODUCT:ti43x =3D "ti437x_linux"
>  TARGET_PRODUCT:omap-a15 =3D "ti572x_linux"
>  TARGET_PRODUCT:am65xx =3D "ti654x_linux"
> =20
> -RDEPENDS:${PN} +=3D "libdrm"
> -
> -RRECOMMENDS:${PN} +=3D "ti-sgx-ddk-km"
> +RDEPENDS:${PN} +=3D "libdrm ti-sgx-ddk-km"
> =20
>  S =3D "${WORKDIR}/git"
> =20

Don't have the spare compute to build and test this right now, but this ser=
ies
looks fine to me.

Reviewed-by: Randolph Sapp <rs@ti.com>


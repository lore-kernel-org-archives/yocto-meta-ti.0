Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7881C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 07:07:24 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.8550.1699427241379017115
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 23:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=E9R68rMY;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-luthra@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A877KNp130756
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 01:07:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699427240;
	bh=G9BjOzaaMlMsl1NRGy+Wgsh2nSvv/gFBna1cXOliSzw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=E9R68rMY57TjMIZhU1glHWt3s/6x0LuY3sQOMqXgClZ9KeVCsDpmP0GYFAmmI7u8Y
	 XPdQG5hZyV+Uve7hz8ab/0mrq4JQg+5ZBCqiJp9y21YmSYmANUtl4bcSv4A31kpd+u
	 7JeqvnE8pT2pDgxPe4sqNq2br2bXmsc6LAaMv+oU=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A877KfZ093851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 01:07:20 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 01:07:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 01:07:19 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A877JLg074963;
	Wed, 8 Nov 2023 01:07:19 -0600
Date: Wed, 8 Nov 2023 12:37:18 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Judith Mendez <jm@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>
Subject: Re: [kirkstone PATCH] conf: machine: am62*: extend picking common
 overlays by prefix
Message-ID: <kgov7kcyobeprifgp5unjgtlojlfquv5jrdrndcdfh4owikvhh@sng65qgpanzb>
References: <20231107235316.29646-1-praneeth@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bft2nguobxq42a74"
Content-Disposition: inline
In-Reply-To: <20231107235316.29646-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 07:07:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17266

--bft2nguobxq42a74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Praneeth,

Thanks for the patch.

On Nov 07, 2023 at 17:53:16 -0600, Praneeth Bajjuri wrote:
> commit f5851386 ("conf: machine: am62*: Pick common overlays by prefix")
> picks common HDMI and CSI overlays for am62 platform variants.
>=20
> Adding capability to extend the same prefix for common overlays for
> am62 family in more generic way to include new mcan overlays added [1]
>=20
> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=
=3D3b01c392627f
>=20
> given the differences in SK-AM62-LP containing  B2B HDMI Samtec connector,
> just added the kernel prefix to pick common mcan overlay.
>=20
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am62axx-evm.conf   | 3 +--
>  meta-ti-bsp/conf/machine/am62pxx-evm.conf   | 3 +--
>  meta-ti-bsp/conf/machine/am62xx-evm.conf    | 3 +--
>  meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>  4 files changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf=
/machine/am62axx-evm.conf
> index ef60e9d1..22f61401 100644
> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
> @@ -6,8 +6,7 @@ require conf/machine/include/am62axx.inc
> =20
>  KERNEL_DEVICETREE_PREFIX =3D " \
>      ti/k3-am62a7 \
> -    ti/k3-am62x-sk-csi2 \
> -    ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk \
>      ti/k3-fpdlink \
>  "
> =20
> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf=
/machine/am62pxx-evm.conf
> index 931de953..5e0bab97 100644
> --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> @@ -6,8 +6,7 @@ require conf/machine/include/am62pxx.inc
> =20
>  KERNEL_DEVICETREE_PREFIX =3D " \
>      ti/k3-am62p5 \
> -    ti/k3-am62x-sk-csi2 \
> -    ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk \
>  "
> =20
>  KERNEL_DEVICETREE =3D " \
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/=
machine/am62xx-evm.conf
> index b60ba156..fadbc6f4 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf

I would guess we can also do this for am62xxsip-evm.conf.
Or is MCAN not available on the SIP board for some reason?

With that handled -
Reviewed-by: Jai Luthra <j-luthra@ti.com>

> @@ -7,8 +7,7 @@ require conf/machine/include/ti-extras.inc
> =20
>  KERNEL_DEVICETREE_PREFIX =3D " \
>      ti/k3-am625 \
> -    ti/k3-am62x-sk-csi2 \
> -    ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk \
>  "
> =20
>  KERNEL_DEVICETREE =3D " \
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/co=
nf/machine/am62xx-lp-evm.conf
> index 0d2f89ca..afa5e061 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX =3D " \
>      ti/k3-am62-lp \
>      ti/k3-am625-sk \
>      ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk-mcan \
>  "
> =20
>  KERNEL_DEVICETREE =3D " \
> --=20
> 2.17.1
>=20

Thanks,
Jai

--bft2nguobxq42a74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmVLM6MACgkQQ96R+SSa
cUUDpA//Y5Ixr9zFukg6B9gzFceZp7pjQIbSkKG1tUCG+SRBu+lq5WtjrMIHZi77
rRBkSEC0GivmKINKSXjJBpXfKU4nP5hQO17Q4wqow/STodOKBbiEkCvUcwuZioLT
rTwZy7ge5tUusGsAudV6f7jla4V/CUJvBQhSZwWTUfCR2sgavTDZ7WSoHHW+aQH6
YGessIKcZRVFBIepgKyPg9jk/uUpulJnRSRPXzemFyi9CDDhf4jV+VfzoBNUQ8Ec
pp5d6SS5uzUtACT157BkQqL1J3ZXonIxRMduDSN8Khf8KL5sRofTkHivDTkcDRqT
NzXbFV3OvdeuJPdgP3X2JP+eaiyksNlbk/98Hxfx2R6AhT3f0sgDdgSqWcYBXyDw
I3Cs/qBIXkQGjlD7KjCS4mVHSNStmSF7/An9dHWzD1iNtZlkhOdpUtnLCfyDp/IK
r7vUWgD2NOZ/5OxjFbITTPR9wJNufZ/fnrfOJiVGMzxNltZStkxPOT7k8j8o0WOe
OLcBhnAOVhZhDN4hemI5dkq9iCzFL26g4vhtoeuBcjCGdQOVVIi2uJqCyoC2EF2G
4UmtNu1HgRYzMMUbPQ/VdKRnKuXNXRCuNRoLFVKJFU+jrLRHV0C8q+4SR1Y09eTZ
QBvtmzwKl/MtSEkUALucUau9dsodtczLc4iRomCyMqMgajdIDzc=
=gRdV
-----END PGP SIGNATURE-----

--bft2nguobxq42a74--


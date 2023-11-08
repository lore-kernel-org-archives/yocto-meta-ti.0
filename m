Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60430C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 16:12:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.18027.1699459961171122740
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 08:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jFYiTtut;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-luthra@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8GCeXn071134
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 10:12:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699459960;
	bh=CshQcJA5L+uOYn87yWfIaPG8CrXDNjjEQvwcEvJj37M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jFYiTtut91qGqSJqBDhFYsRqCILxtxCXOx2XXftu8/nu3hvHv0+OCDDDCF0X0gHNz
	 7zhEPtCoe7EVlja/7eaPmzmHh0DirSd7TIpyH8+nBySW9US2qcLaDFbXxu859RkgcD
	 CtJeDVn8JRdR31LPhLmFP2WOO2yjz+Zz+iirsZfg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8GCe1S010515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 10:12:40 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 10:12:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 10:12:39 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8GCc5j058375;
	Wed, 8 Nov 2023 10:12:39 -0600
Date: Wed, 8 Nov 2023 21:42:38 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Judith Mendez <jm@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>
Subject: Re: [kirkstone PATCH v2] conf: machine: am62*: extend picking common
 overlays by prefix
Message-ID: <iletedlpu3xlf67fstjnbvegzs5p52qqx2tsysspm6aycd3nem@l73rfl4gzrpa>
References: <20231108160437.15536-1-praneeth@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6pnlco4sbemyiisc"
Content-Disposition: inline
In-Reply-To: <20231108160437.15536-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 16:12:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17275

--6pnlco4sbemyiisc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Nov 08, 2023 at 10:04:37 -0600, Praneeth Bajjuri wrote:
> commit f5851386 ("conf: machine: am62*: Pick common overlays by prefix")
> picks common HDMI and CSI overlays for am62 platform variants.
>=20
> Adding capability to extend the same prefix for common overlays for appli=
cable
> am62 platforms in more generic way to include new mcan overlays added [1]
>=20
> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=
=3D3b01c392627f
>=20
> given the differences in SK-AM62-LP containing  B2B HDMI Samtec connector,
> just added the kernel prefix to pick common mcan overlay.
>=20
> for am62pxx: It has 4 MCANs vs all other am62xx devices have 3 MCANs,
> hence keeping this prefix seperate for am62pxx to pick right overlay.
>=20

Reviewed-by: Jai Luthra <j-luthra@ti.com>

> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
> v2: updated am62xxsip conf and updated for am62pxx to pick different
> mcan overlay
>=20
>  meta-ti-bsp/conf/machine/am62axx-evm.conf   | 3 +--
>  meta-ti-bsp/conf/machine/am62xx-evm.conf    | 3 +--
>  meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>  meta-ti-bsp/conf/machine/am62xxsip-evm.conf | 4 ++--
>  4 files changed, 5 insertions(+), 6 deletions(-)
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
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/=
machine/am62xx-evm.conf
> index b60ba156..fadbc6f4 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
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
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/co=
nf/machine/am62xxsip-evm.conf
> index b3bda44a..cae58afe 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> @@ -6,8 +6,8 @@ require conf/machine/include/am62xx.inc
> =20
>  KERNEL_DEVICETREE_PREFIX =3D " \
>      ti/k3-am625 \
> -    ti/k3-am62x-sk-csi2 \
> -    ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk \
> +
>  "
> =20
>  KERNEL_DEVICETREE =3D " \
> --=20
> 2.17.1
>=20

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--6pnlco4sbemyiisc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmVLs3UACgkQQ96R+SSa
cUXOLBAAm8P/64DLt6Y/mmNBu2xgqAbDoK0RZ9eRqhGgGymCxZZgo31O8GTGAv3E
J9IXUFwlDt1mM1DdBz/df2kJ91o1ZCsB8KWDbUFNn8foy55/+gQDO94uvzL5F4O3
33aeFjKZUhCDjfrvvi6HbE9naRa/yX/e3x1CNrIfuDcGKVAiE/R7g+pzv6BN5Q2D
XVXcdnBspEwUXk1AQJ3txlo0Ps/MxK9GHJH+8fNThH7AVXWvTFjB1Wo+Jhrtrelg
BX7gZuYblFLJ6dMnDnfl3HdWOFl17Ah4ypWHjzOjugQBzm2YNJxi4IUz8UFkWpar
u/vSz6v1nf+Z8dQxhF7NpLn3GjNwTxZFjK1+d1TDZa0ud5dD0LapTuhnUrxDKDrV
tdKUxjEfa7deKc1Y+GPzlmO4Piwi0Kyxi2hwKHFvufKrub+LlA+C8kwRwXm2uuz8
0Vrd+UrexeIkBo5xxv0GCfl6++Aq/nXxfQEApkVsFG/1fPJYB1lFVo54PKpYGkaA
tBPkyUQOCab5z70aHOkIn7c8uJIxaWCfi7izqivZ329L2PKKa9fosnL7Puq64Dqx
wnbqTSer8lRmU5K9R3ai1Vt9BqkFMmtsU30PBfajb+Cpj3z+5K4SZEy3tokm5eje
ekt91/Yxl5kDW0hMnZO7lxt5BjuogypA5W7qTDk7f108jY7++c8=
=lH0V
-----END PGP SIGNATURE-----

--6pnlco4sbemyiisc--


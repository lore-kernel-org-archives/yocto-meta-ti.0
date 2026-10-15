Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A54CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 14:42:50 +0000 (UTC)
Subject: Re: [master/wrynose][PATCH] ti-bsp: enable legacy SGX driver for ti-6_18 BSP
To: meta-ti@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: Bengaluru, Karnataka, IN (103.146.116.9)
X-Originating-Platform: Linux Chrome 154
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 07:42:47 -0700
References: <20261015130618.1811556-1-j-sahu@ti.com>
In-Reply-To: <20261015130618.1811556-1-j-sahu@ti.com>
Message-ID: <2269369.1792075367517493989@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2026 14:42:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20463

On Thu, Oct 15, 2026 at 06:36 PM, Jeevan wrote:

>

Please ignore this patch for now.  The mesa SGX support isn't ready yet.

> Add BSP_SGX_DRIVER_PROVIDER and BSP_SGX_DRIVER_VERSION for ti-6_18
> to enable SGX530/544 GPU support on AM335x, AM437x, AM57xx, AM65xx.
>=20
> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index bf90d1da..d9f59159 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -42,6 +42,8 @@ BSP_KERNEL_VERSION:bsp-ti-6_18 =3D "6.18%"
>  BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 =3D "u-boot-ti-staging"
>  BSP_BOOTLOADER_VERSION:bsp-ti-6_18 =3D "2026.01%"
> =20
> +BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_18 =3D "ti-sgx-ddk-km"
> +BSP_SGX_DRIVER_VERSION:bsp-ti-6_18 =3D "1.17%"
>  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 =3D "ti-img-rogue-driver"
>  BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 =3D "26%"
>  BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "25%"
> --=20
> 2.34.1
>=20
>


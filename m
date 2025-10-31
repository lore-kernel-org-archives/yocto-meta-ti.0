Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7356CCF9FA
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 10:13:26 +0000 (UTC)
Subject: Re: [master/scarthgap][PATCH] conf: machine: am62dxx-evm: Package eHRPWM overlay
To: meta-ti@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.10)
X-Originating-Platform: Linux Firefox 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 31 Oct 2025 03:13:21 -0700
References: <20251029025619.499855-1-p-bhagat@ti.com>
In-Reply-To: <20251029025619.499855-1-p-bhagat@ti.com>
Message-ID: <23307.1761905601441075645@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Oct 2025 10:13:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19215

On Wed, Oct 29, 2025 at 08:26 AM, Paresh Bhagat wrote:

>
> Package eHRPWM overlay for am62dxx-evm by reusing the existing overlay
> for am62a7-sk.
>=20
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

Reviewd-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am62dxx-evm.conf | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> index 9008a6dd..b229132e 100644
> --- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> @@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX =3D " \
>      ti/k3-am62d2 \
>      ti/k3-am62a7-sk-edgeai \
>      ti/k3-am62x-sk \
> +    ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
>  "
> =20
>  KERNEL_DEVICETREE =3D ""
> --=20
> 2.34.1
>=20
>


Subject: Re: [wrynose][PATCH] conf: am335x-evm : Bump up max_leb_cnt
To: meta-ti@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.10)
X-Originating-Platform: Linux Firefox 158
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 09:54:30 -0700
References: <20261027080058.3446900-1-s-sadik@ti.com>
In-Reply-To: <20261027080058.3446900-1-s-sadik@ti.com>
Message-ID: <2723585.1793292870589841039@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 29 Oct 2026 16:54:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20502

On Tue, Oct 27, 2026 at 01:31 PM, Sadik wrote:

>

Gentle reminder on this patch. With 12.02.00.03 RC, PSDK builds are failing=
. Needed this patch for PSDK builds to pass.

> New features added require another increase to max_leb_cnt
>=20
> Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf
> b/meta-ti-bsp/conf/machine/am335x-evm.conf
> index 0dd4e7ce..9cfef275 100644
> --- a/meta-ti-bsp/conf/machine/am335x-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
> @@ -22,7 +22,7 @@ SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS3"
>  # UBI: logical eraseblock size:    126976 bytes
>  # from ubiattach stdout:
>  # UBI device number 0, total 1988 LEBs
> -MKUBIFS_ARGS ?=3D "-F -m 2048 -e 126976 -c 24000"
> +MKUBIFS_ARGS ?=3D "-F -m 2048 -e 126976 -c 30000"
> =20
>  # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
>  # from dmesg:
> --=20
> 2.34.1
>=20
>

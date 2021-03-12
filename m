Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.27.1615590453692484778
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 15:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0610F40BEA;
	Fri, 12 Mar 2021 23:07:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p5lATSprX9z4; Fri, 12 Mar 2021 23:07:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CB46240B66;
	Fri, 12 Mar 2021 23:07:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 91861174541; Fri, 12 Mar 2021 18:07:30 -0500 (EST)
Date: Fri, 12 Mar 2021 18:07:30 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: shiju@ti.com
Cc: meta-ti@lists.yoctoproject.org, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti] [dunfell/next v2 PATCH] ti-rtos: update to uisng fw from mcu-plus-sdk for AM64x
Message-ID: <20210312230730.GD4892@denix.org>
References: <20210311102430.26263-1-shiju@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210311102430.26263-1-shiju@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 03:54:30PM +0530, Shiju Sivasankaran via lists.yo=
ctoproject.org wrote:
> update ti-rtos-metadata and ti-rtos-firmware recipes of meta-ti to
> pick AM64x rtos firmware from mcu-plus-sdk instead of PDK.
>=20
> Other devices such as AM65x, J7 continue to use fw from PDK.
>=20
> Built and tested both IPC echo test applications - "rpmsg_client_sample=
=E2=80=9D
> & =E2=80=9Crpmsg_char_simple=E2=80=9D. Both tests passed for all remote=
 R5F cores
> on AM64x EVM
>=20
> Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
> ---
> v2: rebased to dunfell-next
> DEFAULT_FIRMWARE_SHA256SUM_am65xx updated

Why are you updating am65xx when you said only am64xx is being switched f=
rom=20
PDK to mcu-plus-sdk?

Also, can you explain what is it and why it has to be the default for am6=
4x?=20
Shouldn't CoreSDK Linux pick CoreSDK RTOS (i.e. PDK) components by defaul=
t?

Thanks.


>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 14 +++++++++-----
>  recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  3 ++-
>  2 files changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti=
-rtos-bin/ti-rtos-firmware.bb
> index 507d0000..c70fc50d 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -11,17 +11,20 @@ INHIBIT_DEFAULT_DEPS =3D "1"
> =20
>  inherit deploy
> =20
> +DEFAULT_METADATA_FILE ?=3D "metadata.inc"
> +DEFAULT_METADATA_FILE_am64xx ?=3D "mcusdk_metadata.inc"
> +
>  # First, let's try including metadata.inc that could be fetched and de=
ployed
>  # by ti-rtos-metadata earlier and provide new set of CORESDK_RTOS_* va=
riables
> -include ${DEPLOY_DIR_IMAGE}/metadata.inc
> +include ${DEPLOY_DIR_IMAGE}/${DEFAULT_METADATA_FILE}
> =20
>  # Set some defaults for when metadata.inc is not available
>  DEFAULT_RTOS_FAMILY =3D "jacinto"
>  DEFAULT_RTOS_VERSION =3D "07_03_00_16"
>  DEFAULT_RTOS_VERSION_DOT =3D "07.03.00.16"
> =20
> -DEFAULT_RTOS_VERSION_am64xx =3D "07_03_01_06"
> -DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.01.06"
> +DEFAULT_RTOS_VERSION_am64xx =3D "07_03_00_03"
> +DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.00.03"
> =20
>  DEFAULT_RTOS_SOC =3D "undefined"
>  DEFAULT_RTOS_SOC_j7 =3D "j721e"
> @@ -36,6 +39,7 @@ DEFAULT_RTOS_WEBLINK_am65xx =3D "https://software-dl.=
ti.com/processor-sdk-rtos/esd
>  DEFAULT_RTOS_WEBLINK_am64xx =3D "https://software-dl.ti.com/processor-=
sdk-rtos/esd/AM64X/firmware/${CORESDK_RTOS_VERSION}"
> =20
>  DEFAULT_FIRMWARE_FILE =3D "coresdk_rtos_${CORESDK_RTOS_SOC}_${CORESDK_=
RTOS_VERSION}_firmware.tar.xz"
> +DEFAULT_FIRMWARE_FILE_am64xx =3D "mcu_plus_sdk_${CORESDK_RTOS_SOC}_${C=
ORESDK_RTOS_VERSION}_firmware.tar.xz"
> =20
>  DEFAULT_FIRMWARE_URL =3D "file://empty"
>  DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWAR=
E_FILE}"
> @@ -43,8 +47,8 @@ DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/=
${DEFAULT_FIRMWARE_FILE}"
>  DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
>  DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "78f3ab929a0f3c6e2907538061de82e16d8=
aff7ffb2fac0c3c4d56df8abec3b0"
>  DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "5bae696d35e206bbcd9b26ab6508=
af59a2c2d72f9b89aa1d3fc1aa808f7a8615"
> -DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "7bd854dbf96c25683d684ac731fde3e=
dd7fb8a65f8727f7aae3802a2e9a9cab6"
> -DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "450bf23d659756695d62168fe06eebe=
4641522293d89692a9eea837426bac0f9"
> +DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "d3cffd472fdd17b000afcee80631834=
4e6033ac271ab3a6fa9ca8f432e8420c9"
> +DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "bc2d3d603ad30006ea3fefa3e777c26=
c19b95ee6d6f5a630259009f2f5a4996b"
> =20
>  # Use weak assignment for CORESDK_RTOS_* variables to use defaults if =
not yet set
>  CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti=
-rtos-bin/ti-rtos-metadata.bb
> index 9bb0d3c5..466a22a8 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -18,10 +18,11 @@ PLAT_SFX_am64xx =3D "/am64x"
>  # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
>  TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rtos=
_releases.git"
>  TI_RTOS_METADATA_PROTOCOL ?=3D "git"
> -TI_RTOS_METADATA_SRCREV ?=3D "ba81dc5a9342fc35435920092a0df2cb2ab342ef=
"
> +TI_RTOS_METADATA_SRCREV ?=3D "e558080592d910783bf2f9ad46ed3b622f899155=
"
>  TI_RTOS_METADATA_BRANCH ?=3D "master"
>  TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
>  TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
> +TI_RTOS_METADATA_FILE_am64xx ?=3D "${S}${TI_RTOS_METADATA_DIR}/mcusdk_=
metadata.inc"
> =20
>  PV =3D "1.0.0+git${SRCPV}"
> =20
> --=20
> 2.17.1
>=20

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

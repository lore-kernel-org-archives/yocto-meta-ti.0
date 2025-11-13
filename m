Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C5ECD8C94
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 15:26:39 +0000 (UTC)
Subject: Re: [scarthgap][PATCH v3] meta-ti-bsp: optee: Enable PKCS#11 with REE_FS
To: meta-ti@lists.yoctoproject.org
From: "Ryan Eatmon" <reatmon@ti.com>
X-Originating-Location: Allen, Texas, US (192.228.64.13)
X-Originating-Platform: Windows Firefox 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 13 Nov 2025 07:26:39 -0800
References: <20251113104156.1436579-1-s-joshi@ti.com>
In-Reply-To: <20251113104156.1436579-1-s-joshi@ti.com>
Message-ID: <436791.1763047599398974676@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 15:26:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19273

On Thu, Nov 13, 2025 at 04:42 AM, Suhaas Joshi wrote:

>
> PKCS#11 is a standard that defines an interface for applications to
> interact with security modules, including OP-TEE's PKCS#11 TA.
>=20
> Enable PKCS#11 with REE_FS. CFG_REE_FS=3Dy is set by default, but set it
> explicitly for clarity.
>=20
> Further, copy libckteec library files to the filesystem. These files are
> required by pkcs11-tool to interact with the TA.
>=20
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
> v2 -> v3:
> * As Andrew suggested: RPMB with CFG_RPMB_WRITE_KEY already enabled is a =
risk.
>   Therefore, instead of enabling RPMB, enable only PKCS#11 to work with
> REE_FS.
>   This allows users to try PKCS#11 and run OPTEE secure storage examples,
>   with REE_FS.
> * By Denys' and Ryan's suggestions, move extra logic away from .bbappend =
to
>   optee-client-ti-overrides.inc file.
> * Link to v2:
> =20
> https://lore.kernel.org/yocto-meta-ti/8ad8d349-0841-497a-91a3-340ec08a3ea=
5@ti.com/T/#t
> ---
>  .../optee/optee-client-ti-overrides.inc          | 10 ++++++++++
>  .../optee/optee-client_%.bbappend                |  5 +++++
>  .../optee/optee-os-ti-overrides.inc              | 16 ++++++++++++----
>  3 files changed, 27 insertions(+), 4 deletions(-)
>  create mode 100644
> meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
>=20
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides=
.inc
> b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
> new file mode 100644
> index 00000000..1ac1684e
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
> @@ -0,0 +1,10 @@
> +do_install:append:am62axx:am62dxx:am62pxx:am62xx() {
> +    install -d ${D}${libdir}
> +
> +    install -m 0644 ${B}/libckteec/libckteec.so.0.1.0 ${D}${libdir}/
> +    ln -v -sf libckteec.so.0.1.0 ${D}${libdir}/libckteec.so.0
> +    ln -v -sf libckteec.so.0 ${D}${libdir}/libckteec.so
> +}
> +
> +FILES:${PN}:am62axx:am62dxx:am62pxx:am62xx +=3D " ${libdir}/libckteec.so=
.0
> ${libdir}/libckteec.so.0.1.0"
> +FILES:${PN}-dev:am62axx:am62dxx:am62pxx:am62xx +=3D " ${libdir}/libcktee=
c.so"

I'm not sure these additions will work correctly.  I think chained override=
s like this require that all of the overrides be present in order to have t=
he statement apply.  Plus this is just really unreadable.

For the do_install:append I think you need to create a variable that you ca=
n default to "" and then override for all of the platforms listed above.  S=
omething like:

LIBCKTEEC =3D ""
LIBCKTEEC:am62xx =3D "${libdir}/libckteec.so*"
LIBCKTEEC:am62axx =3D "${libdir}/libckteec.so*"
LIBCKTEEC:am62dxx =3D "${libdir}/libckteec.so*"
LIBCKTEEC:am62pxx =3D "${libdir}/libckteec.so*"

do_install:append() {
    if [ "${LIBCKTEEC}" !=3D "" ]; then
        install -d ${D}${libdir}
        install -m 0644 ${B}/libckteec/libckteec.so.0.1.0 ${D}${libdir}/
        ln -v -sf libckteec.so.0.1.0 ${D}${libdir}/libckteec.so.0
        ln -v -sf libckteec.so.0 ${D}${libdir}/libckteec.so
    fi
}

FILES:${PN} +=3D "${LIBCKTEEC}"

I don't think you need the FILES:${PN}-dev.  It just including another syml=
ink and not additional files or headers needed for dev.  Just have the the =
link in the single package.


> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> index f193e78b..0cee127f 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> @@ -2,3 +2,8 @@ OPTEE_TI_VERSION =3D ""
>  OPTEE_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
> =20
>  require ${OPTEE_TI_VERSION}
> +
> +OPTEE_TI_OVERRIDES =3D ""
> +OPTEE_TI_OVERRIDES:ti-soc =3D "${BPN}-ti-overrides.inc"
> +
> +require ${OPTEE_TI_OVERRIDES}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index 61a74a06..ece8c50d 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -6,11 +6,11 @@ EXTRA_OEMAKE:remove =3D "CFG_MAP_EXT_DT_SECURE=3Dy"
>  EXTRA_OEMAKE:append:k3 =3D " ${@ 'CFG_CONSOLE_UART=3D'+
> d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>  EXTRA_OEMAKE:append:k3 =3D " ${@ 'CFG_TZDRAM_START=3D'+
> d.getVar('OPTEE_K3_TZDRAM_START') if d.getVar('OPTEE_K3_TZDRAM_START') el=
se
> ''}"
> =20
> -EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
> +EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=
=3Dy
> CFG_PKCS11_TA=3Dy"
>  EXTRA_OEMAKE:append:am62lxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
> -EXTRA_OEMAKE:append:am62pxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
> -EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
> -EXTRA_OEMAKE:append:am62dxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
> +EXTRA_OEMAKE:append:am62pxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=
=3Dy
> CFG_PKCS11_TA=3Dy"
> +EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=
=3Dy
> CFG_PKCS11_TA=3Dy"
> +EXTRA_OEMAKE:append:am62dxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=
=3Dy
> CFG_PKCS11_TA=3Dy"
>  EXTRA_OEMAKE:append:j722s =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
> =20
>  do_compile:append:k3() {
> @@ -49,6 +49,14 @@ do_install:append() {
>      install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || =
true
>      install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ ||=
 true
>      install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ ||=
 true
> +
> +    case "${MACHINE}" in
> +        am62pxx-evm|am62xx-evm|am62axx-evm|am62dxx-evm)
> +
> +        install -d ${D}${nonarch_base_libdir}/optee_armtz
> +        install -m 644 ${B}/ta/pkcs11/fd02c9da-306c-48c7-a49c-bbd827ae86=
ee.ta
> ${D}${nonarch_base_libdir}/optee_armtz
> +        ;;
> +    esac

This should be done with an append and not a case statement.  At the very l=
east, you could create a new variable that defaults to "" and then override=
 it with "1" for the platforms that need the extra steps and then have an i=
f on the variable in the existing do_install:append.

>  }
> =20
>  optee_deploy_legacyhs() {
> --=20
> 2.34.1
>=20
>


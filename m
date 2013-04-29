Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A4B5E00310
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 09:18:13 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3TGIC8P017352
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 11:18:12 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3TGICAt031432
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 11:18:12 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 29 Apr 2013 11:18:12 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/2] am33x-cm3: Split init script into its
	own	recipe
Thread-Index: AQHOROW9Oa6DQyzZE0GCdLeOz3OSKpjtYCSQ
Date: Mon, 29 Apr 2013 16:18:11 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159520139@DLEE11.ent.ti.com>
References: <1367245658-15077-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1367245658-15077-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] am33x-cm3: Split init script into its own	recipe
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2013 16:18:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Cooper Jr., Franklin
> Sent: Monday, April 29, 2013 9:28 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 1/2] am33x-cm3: Split init script into
> its own recipe
>=20
> * 3.8+ kernels uses an init script to load the cm3 firmware.
> * 3.2 kernel require the cm3 firmware during compile time
> therefore not
>   requiring an init script.
> * Remove the init script from the main am33x-cm3 recipe and place
> it in its own
>   recipe to allow specific kernel recipes to choose to load the
> firmware via an
>   init script.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  recipes-bsp/ti/am33x-cm3_git.bb                    |   14 +-----
> -----
>  .../{am33x-cm3 =3D> am33x-load-cm3}/init-am33x-cm3   |    0
>  recipes-bsp/ti/am33x-load-cm3_1.0.bb               |   22
> ++++++++++++++++++++
>  recipes-kernel/linux/linux-ti-staging_3.8.bb       |    4 +-
>  4 files changed, 26 insertions(+), 14 deletions(-)
>  rename recipes-bsp/ti/{am33x-cm3 =3D> am33x-load-cm3}/init-am33x-
> cm3 (100%)
>  create mode 100644 recipes-bsp/ti/am33x-load-cm3_1.0.bb
>=20
> diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-
> bsp/ti/am33x-cm3_git.bb
> index 4829b78..4835e17 100644
> --- a/recipes-bsp/ti/am33x-cm3_git.bb
> +++ b/recipes-bsp/ti/am33x-cm3_git.bb
> @@ -4,19 +4,13 @@ LICENSE =3D "TI-BSD"
>  LIC_FILES_CHKSUM =3D
> "file://License.txt;md5=3D858099c817e47ea63559fc6b67ae8d91"
>=20
>  PV =3D "04.06.00.10"
> -PR =3D "r2"
> +PR =3D "r3"
>=20
>  # SRCREV corresponds to tag "AM335xPSP_04.06.00.10-rc1"
>  SRCREV =3D "27ca4643e422245a95723de1df0247a00eada45b"
>  BRANCH ?=3D "master"
>=20
> -INITSCRIPT_NAME =3D "am335x-pm-firmware-load"
> -INITSCRIPT_PARAMS =3D "defaults 96"
> -
> -inherit update-rc.d
> -
>  SRC_URI =3D "git://arago-project.org/git/projects/am33x-
> cm3.git;protocol=3Dgit;branch=3D${BRANCH} \
> -           file://init-am33x-cm3 \
>            "
>=20
>  S =3D "${WORKDIR}/git"
> @@ -28,11 +22,7 @@ do_compile() {
>  do_install() {
>  	install -d ${D}${base_libdir}/firmware
>  	install -m 0644 bin/am335x-pm-firmware.bin
> ${D}${base_libdir}/firmware/
> -
> -	# Install the init script to load the PM firmware at boot
> -	install -d ${D}${sysconfdir}/init.d
> -	install -m 0755 ${WORKDIR}/init-am33x-cm3
> ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
>  }
>=20
> -FILES_${PN} +=3D "${base_libdir}/firmware"
> +FILES_${PN} =3D "${base_libdir}/firmware"

Why this change?

>=20
> diff --git a/recipes-bsp/ti/am33x-cm3/init-am33x-cm3 b/recipes-
> bsp/ti/am33x-load-cm3/init-am33x-cm3
> similarity index 100%
> rename from recipes-bsp/ti/am33x-cm3/init-am33x-cm3
> rename to recipes-bsp/ti/am33x-load-cm3/init-am33x-cm3
> diff --git a/recipes-bsp/ti/am33x-load-cm3_1.0.bb b/recipes-
> bsp/ti/am33x-load-cm3_1.0.bb
> new file mode 100644
> index 0000000..d99757b
> --- /dev/null
> +++ b/recipes-bsp/ti/am33x-load-cm3_1.0.bb
> @@ -0,0 +1,22 @@

Rather than a separate recipe why not a different package in the cm3 recipe=
?

> +DESCRIPTION =3D "Cortex-M3 binary blob for suspend-resume"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +
> +PR =3D "r0"
> +
> +RDEPENDS_${PN} =3D "am33x-cm3"
> +
> +INITSCRIPT_NAME =3D "am335x-pm-firmware-load"
> +INITSCRIPT_PARAMS =3D "defaults 96"
> +
> +inherit update-rc.d
> +
> +SRC_URI =3D "file://init-am33x-cm3"
> +
> +
> +do_install() {
> +	# Install the init script to load the PM firmware at boot
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 0755 ${WORKDIR}/init-am33x-cm3
> ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> +}
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> index 622fa3e..561bb55 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> @@ -26,7 +26,7 @@ require recipes-kernel/linux/setup-
> defconfig.inc
>=20
>  # Add a run-time dependency for the PM firmware to be installed
>  # on the target file system.
> -RDEPENDS_ti33x +=3D "am33x-cm3"
> +RDEPENDS_ti33x +=3D "am33x-cm3 am33x-load-cm3"
>=20
>  # Default is to package all dts files for ti33x devices unless
> building
>  # for the specific beaglebone machine.
> @@ -44,7 +44,7 @@ SRCREV =3D
> "1de3616c36710b6949844738f9c63b96e307c49f"
>  PV =3D "3.8.8"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will
> cause a rebuild
> -MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
>=20
>  SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>             file://defconfig \
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


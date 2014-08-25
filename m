Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3EC78E0079A; Mon, 25 Aug 2014 10:14:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3043E006B5
	for <meta-ti@yoctoproject.org>; Mon, 25 Aug 2014 10:14:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7PHEN12019831;
	Mon, 25 Aug 2014 12:14:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7PHEM4L023280;
	Mon, 25 Aug 2014 12:14:22 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Mon, 25 Aug 2014 12:14:22 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Arago Project git <git@arago-project.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Denys Dmytriyenko : am33x-cm3: update with version
	1.8.7
Thread-Index: AQHPtnpzqUnXLqpuDU+5BBVjrLA3DZvhofLg
Date: Mon, 25 Aug 2014 17:14:22 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C703EDD@DFLE08.ent.ti.com>
References: <20140812221102.3E60D52981@arago-project.org>
In-Reply-To: <20140812221102.3E60D52981@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: Denys Dmytriyenko : am33x-cm3: update with version 1.8.7
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
X-List-Received-Date: Mon, 25 Aug 2014 17:14:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

FYI
I already built this package before this patch was introduced and found tha=
t PM was never working.

The PV of this new firmware  (1.8.7) is smaller than the old version of the=
 package (05.00.00.03) so I kept getting the old version of the firmware.=20
So you need to clean out the old version of this package to make sure that =
the new version is picked up.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Arago Project git
> Sent: Tuesday, August 12, 2014 5:11 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] Denys Dmytriyenko : am33x-cm3: update with version
> 1.8.7
>=20
> Module: meta-ti
> Branch: master
> Commit: dca184c6791df0195d5d0b927767296be684c3fe
> URL:    http://arago-project.org/git/meta-
> ti.git?a=3Dcommit;h=3Ddca184c6791df0195d5d0b927767296be684c3fe
>=20
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Wed Aug 13 02:03:49 2014 +0000
>=20
> am33x-cm3: update with version 1.8.7
>=20
> * Move repo to git.ti.com
> * Bump PE due to versioning schema change
> * Drop init scripts needed back in 3.8 days
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
>  recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3 |    6 ---
>  recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3 |    6 ---
>  recipes-bsp/am33x-cm3/am33x-cm3_git.bb         |   43 ++++--------------=
------
>  3 files changed, 7 insertions(+), 48 deletions(-)
>=20
> diff --git a/recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3 b/recipes-
> bsp/am33x-cm3/am33x-cm3/init-am33x-cm3
> deleted file mode 100644
> index 56c17b3..0000000
> --- a/recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#!/bin/sh
> -
> -# Load the PM CM3 firmware
> -echo 1 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> firmware.bin/loading
> -cat /lib/firmware/am335x-pm-firmware.bin >
> /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> firmware.bin/data
> -echo 0 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> firmware.bin/loading
> diff --git a/recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3 b/recipes-
> bsp/am33x-cm3/am33x-cm3/init-am43x-cm3
> deleted file mode 100644
> index 0a75c1f..0000000
> --- a/recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#!/bin/sh
> -
> -# Load the PM CM3 firmware
> -echo 1 >
> /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-
> firmware.bin/loading
> -cat /lib/firmware/am335x-pm-firmware.bin >
> /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-
> firmware.bin/data
> -echo 0 >
> /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-
> firmware.bin/loading
> diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-
> bsp/am33x-cm3/am33x-cm3_git.bb
> index 42f20da..51ec9bd 100644
> --- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> +++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> @@ -3,35 +3,14 @@ DESCRIPTION =3D "Cortex-M3 binary blob for suspend-
> resume"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D
> "file://License.txt;md5=3D7bdc54a749ab7a7dea999d25d99a41b8"
>=20
> -PV =3D "05.00.00.03"
> -PR =3D "r1"
> +PV =3D "1.8.7"
> +PR =3D "r0"
> +PE =3D "1"
>=20
> -# Make package machine specific due to different init scripts -
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +SRCREV =3D "fb0117edd5810a8d3bd9b1cd8abe34e12ff2d0ba"
> +BRANCH ?=3D "next"
>=20
> -# SRCREV corresponds to tag v05.00.00.03 -SRCREV =3D
> "a0ddffb63147e2079a08944c0e399c75538201a9"
> -BRANCH ?=3D "master"
> -
> -# This init script is only used for older kernels that do not support -#=
 hotplug
> of the firmware.  Newer kernels do not require the initscript -# package.
> -INITSCRIPT_NAME =3D "am335x-pm-firmware-load"
> -INITSCRIPT_PARAMS =3D "defaults 96"
> -
> -inherit update-rc.d
> -
> -UPDATERCPN =3D "${PN}-initscript"
> -
> -RDEPENDS_${PN}-initscript =3D "am33x-cm3"
> -
> -SRC_URI =3D "git://arago-project.org/git/projects/am33x-
> cm3.git;protocol=3Dgit;branch=3D${BRANCH} \
> -           file://init-am33x-cm3 \
> -           file://init-am43x-cm3 \
> -          "
> -
> -SCRIPT_ti33x =3D "init-am33x-cm3"
> -SCRIPT_ti43x =3D "init-am43x-cm3"
> +SRC_URI =3D "git://git.ti.com/ti-cm3-pm-firmware/amx3-
> cm3.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> @@ -41,15 +20,7 @@ do_compile() {
>=20
>  do_install() {
>  	install -d ${D}${base_libdir}/firmware
> -	install -m 0644 bin/am335x-pm-firmware.bin
> ${D}${base_libdir}/firmware/
> -
> -	# Install the init script to load the PM firmware at boot
> -	install -d ${D}${sysconfdir}/init.d
> -	install -m 0755 ${WORKDIR}/${SCRIPT}
> ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> +	install -m 0644 bin/am335x-pm-firmware.elf
> +${D}${base_libdir}/firmware/
>  }
>=20
> -PACKAGES =3D+ "${PN}-initscript"
> -
>  FILES_${PN} +=3D "${base_libdir}/firmware"
> -
> -FILES_${PN}-initscript =3D "${sysconfdir}/*"
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 734D8E0147D
	for <meta-ti@yoctoproject.org>; Fri, 19 Apr 2013 09:15:08 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3JGF78M007721;
	Fri, 19 Apr 2013 11:15:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3JGF73Q000383;
	Fri, 19 Apr 2013 11:15:07 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 19 Apr 2013 11:15:06 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 19 Apr 2013 11:15:06 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Arago Project git <git@arago-project.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Chase Maupin : am33x-cm3: use init script to load
	firmware
Thread-Index: AQHOPG1UmzI2Spot7EGgLJsW6Wu5lpjdt+Tg
Date: Fri, 19 Apr 2013 16:15:05 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C42A73A@DFLE08.ent.ti.com>
References: <20130418194532.39C0952A8F@arago-project.org>
In-Reply-To: <20130418194532.39C0952A8F@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: Chase Maupin : am33x-cm3: use init script to load firmware
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
X-List-Received-Date: Fri, 19 Apr 2013 16:15:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is this change related to the 3.8 kernel? The patch "linux-ti-staging: make=
 cm3 firmware a run-time dependency" implies that this is indeed a 3.8 rela=
ted change.
This makes things a bit tricky since this breaks the 3.2 kernel.




> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Arago Project git
> Sent: Thursday, April 18, 2013 2:46 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] Chase Maupin : am33x-cm3: use init script to load
> firmware
>=20
> Module: meta-ti
> Branch: master
> Commit: 14a312f1e9d724d61d163d9872d7f6542ee180b9
> URL:    http://arago-project.org/git/meta-
> ti.git?a=3Dcommit;h=3D14a312f1e9d724d61d163d9872d7f6542ee180b9
>=20
> Author: Chase Maupin <Chase.Maupin@ti.com>
> Date:   Thu Apr 18 13:10:00 2013 -0500
>=20
> am33x-cm3: use init script to load firmware
>=20
> * The PM firmware is now loaded using an init script so make
>   the init script installation part of the firmware package.
> * Fix up the SRC_URI to the proper format.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
>  recipes-bsp/ti/am33x-cm3/init-am33x-cm3 |    6 ++++++
>  recipes-bsp/ti/am33x-cm3_git.bb         |   17 +++++++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-bsp/ti/am33x-cm3/init-am33x-cm3 b/recipes-
> bsp/ti/am33x-cm3/init-am33x-cm3
> new file mode 100644
> index 0000000..56c17b3
> --- /dev/null
> +++ b/recipes-bsp/ti/am33x-cm3/init-am33x-cm3
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +
> +# Load the PM CM3 firmware
> +echo 1 >
> +/sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> firmware.bin/loa
> +ding cat /lib/firmware/am335x-pm-firmware.bin >
> +/sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> firmware.bin/dat
> +a echo 0 >
> +/sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> firmware.bin/loa
> +ding
> diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-
> cm3_git.bb index 247ba4d..169789e 100644
> --- a/recipes-bsp/ti/am33x-cm3_git.bb
> +++ b/recipes-bsp/ti/am33x-cm3_git.bb
> @@ -4,9 +4,18 @@ LICENSE =3D "TI-BSD"
>  LIC_FILES_CHKSUM =3D
> "file://License.txt;md5=3D858099c817e47ea63559fc6b67ae8d91"
>=20
>  PV =3D "04.06.00.07"
> +PR =3D "r1"
>  SRCREV =3D "cf07b841d6e8c5e026eecb259d143f3dff412c8e"
> +BRANCH ?=3D "master"
>=20
> -SRC_URI =3D "git://arago-project.org/git/projects/am33x-cm3.git"
> +INITSCRIPT_NAME =3D "am335x-pm-firmware-load"
> +INITSCRIPT_PARAMS =3D "defaults 96"
> +
> +inherit update-rc.d
> +
> +SRC_URI =3D "git://arago-project.org/git/projects/am33x-
> cm3.git;protocol=3Dgit;branch=3D${BRANCH} \
> +           file://init-am33x-cm3 \
> +          "
>=20
>  S =3D "${WORKDIR}/git"
>=20
> @@ -17,7 +26,11 @@ do_compile() {
>  do_install() {
>  	install -d ${D}${base_libdir}/firmware
>  	install -m 0644 bin/am335x-pm-firmware.bin
> ${D}${base_libdir}/firmware/
> +
> +	# Install the init script to load the PM firmware at boot
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 0755 ${WORKDIR}/init-am33x-cm3
> +${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
>  }
>=20
> -FILES_${PN} =3D "${base_libdir}/firmware"
> +FILES_${PN} +=3D "${base_libdir}/firmware"
>=20
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


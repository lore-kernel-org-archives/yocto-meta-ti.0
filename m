Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D638CE00292
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 13:11:43 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AKBgTI007773;
	Wed, 10 Oct 2012 15:11:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AKBgef015685;
	Wed, 10 Oct 2012 15:11:42 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 15:11:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Arago Project git <git@arago-project.org>
Thread-Topic: [meta-ti] Franklin S. Cooper Jr : recipes: Fix ti-eula-unpack
	issue. Tweak sgx modules and libgles recipes.
Thread-Index: AQHNpyIGUiBMYEp7JEiZBbk3ZPz9gZey+KeS
Date: Wed, 10 Oct 2012 20:11:41 +0000
Message-ID: <8657FEE2-597B-40E3-A542-6F3A7CE432DF@ti.com>
References: <20121010200115.169B752A10@arago-project.org>
In-Reply-To: <20121010200115.169B752A10@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Franklin S. Cooper Jr : recipes: Fix ti-eula-unpack	issue. Tweak sgx modules and libgles recipes.
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
X-List-Received-Date: Wed, 10 Oct 2012 20:11:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denzil pull :)

On Oct 10, 2012, at 3:01 PM, "Arago Project git" <git@arago-project.org> wr=
ote:

> Module: meta-ti
> Branch: master
> Commit: 2a3c7305fb81967d1358e731fb564182480b0338
> URL:    http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3D2a3c7305f=
b81967d1358e731fb564182480b0338
>=20
> Author: Franklin S. Cooper Jr <fcooper@ti.com>
> Date:   Sat Sep  1 12:45:03 2012 -0500
>=20
> recipes: Fix ti-eula-unpack issue. Tweak sgx modules and libgles recipes.
>=20
> * Commit d8fc4a686262c50fd0053afa7240020909ec430b addressed an issue wher=
e
>  too many newlines characters were being sent since print by default alre=
ady
>  sends a newline character. This commit however resulted in bin files bei=
ng
>  installed in the WORKDIR and broke other recipes which commit
>  a94f765b9867abefd5f0bd262b5dddb8782b3187 addressed. This lead to a very
>  cluttered WORKDIR.
> * This patch updates ti-eula-unpack.inc to switch from using a print to a=
 write.
>  Since write doesn't automatically send newlines it is a bit more obvious=
 when
>  newlines are sent.
> * Part of the reason that bin files were being installed in the WORKDIR w=
as
>  due to TI_BIN_UNPK_WDEXT being blank for some recipes. For instance in t=
he
>  libgles-omap3 recipes, when the workdir command is set in TI_BIN_UNPK_CM=
DS the
>  directory that the Graphics SDK will be installed into is
>  workdir+TI_BIN_UNPK_WDEXT. A blank TI_BIN_UNPK_WDEXT means the SDK will =
be
>  installed in WORKDIR. By setting TI_BIN_UNPK_WDEXT to a proper value the
>  recipes can be sure it is installed in the proper directory.
> * Determine which file to download based on the defined BINFILE and not a
>  hardcoded value. This idea was taken from arago.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
> .../omap3-sgx-modules_1.6.16.3977.bb               |    8 ++++----
> recipes-graphics/libgles/libgles-omap3.inc         |    4 ++--
> .../libgles/libgles-omap3_4.03.00.02.bb            |    6 +++---
> .../libgles/libgles-omap3_4.05.00.03.bb            |    6 +++---
> recipes-ti/includes/ti-eula-unpack.inc             |    4 ++--
> 5 files changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb=
 b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> index 0affee1..4f9be7b 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> @@ -11,17 +11,17 @@ BINFILE :=3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
>=20
> inherit module
>=20
> -MACHINE_KERNEL_PR_append =3D "a"
> +MACHINE_KERNEL_PR_append =3D "b"
> PR =3D "${MACHINE_KERNEL_PR}"
>=20
> -SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
> +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/gfxsdk/${SGXPV}/exports/${BINFILE} \
>            file://Compile-fixes-for-38-kernel.patch \
>            file://kernel-30.patch \
>           "
> SRC_URI[md5sum] =3D "ff8c1f2b8e4cb42f4ced6a613b081ada"
> SRC_URI[sha256sum] =3D "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc03=
6423458c8d75255"
> -
> -S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}/GFX_Linux_KM"
> +TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"
> +S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
>=20
> PVRBUILD =3D "release"
> export KERNELDIR =3D "${STAGING_KERNEL_DIR}"
> diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphic=
s/libgles/libgles-omap3.inc
> index b6aa382..db0d1cb 100644
> --- a/recipes-graphics/libgles/libgles-omap3.inc
> +++ b/recipes-graphics/libgles/libgles-omap3.inc
> @@ -3,7 +3,7 @@ LICENSE =3D "proprietary-binary"
> # 'TSPA.txt' might not be the best file to md5sum
> LIC_FILES_CHKSUM =3D "file://TSPA.txt;md5=3Dc0d5d9c1e38b41677144c4e24d6dd=
ee1"
>=20
> -PR =3D "r32"
> +PR =3D "r33"
>=20
> COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x)"
>=20
> @@ -15,7 +15,7 @@ RREPLACES_${PN} =3D "libegl libgles1 libgles2"
> RREPLACES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev"
> RREPLACES_${PN}-dbg =3D "libegl-dbg"
>=20
> -SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/gfxsdk/${SGXPV}/exports/OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bi=
n \
> +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/gfxsdk/${SGXPV}/exports/${BINFILE} \
>           file://cputype \
>           file://rc.pvr \
>           file://sample.desktop \
> diff --git a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb b/recip=
es-graphics/libgles/libgles-omap3_4.03.00.02.bb
> index 97a22fe..e98fe02 100644
> --- a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
> +++ b/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
> @@ -15,8 +15,9 @@ require libgles-omap3.inc
> SGXPV =3D "4_03_00_02"
> IMGPV =3D "1.6.16.3977"
> BINFILE :=3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
> +TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
>=20
> -SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
> +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/gfxsdk/${SGXPV}/exports/${BINFILE} \
>                    file://cputype \
>                    file://rc.pvr \
>                    file://sample.desktop \
> @@ -26,5 +27,4 @@ SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public=
_sw/sdo_sb/targetcontent/gf
> SRC_URI[md5sum] =3D "ff8c1f2b8e4cb42f4ced6a613b081ada"
> SRC_URI[sha256sum] =3D "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc03=
6423458c8d75255"
>=20
> -S =3D "${WORKDIR}"
> -
> +S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
> diff --git a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb b/recip=
es-graphics/libgles/libgles-omap3_4.05.00.03.bb
> index d55dd05..7795e2e 100644
> --- a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
> +++ b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
> @@ -12,8 +12,9 @@ require libgles-omap3.inc
> SGXPV =3D "4_05_00_03"
> IMGPV =3D "1.6.16.4117"
> BINFILE :=3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
> +TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
>=20
> -SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
> +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/gfxsdk/${SGXPV}/exports/${BINFILE} \
>                    file://cputype \
>                    file://rc.pvr \
>                    file://sample.desktop \
> @@ -23,5 +24,4 @@ SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public=
_sw/sdo_sb/targetcontent/gf
> SRC_URI[md5sum] =3D "0e651eaa92bb91760f0b40a17697a7dc"
> SRC_URI[sha256sum] =3D "bfe764a8959556195545d6fff76f63a489642f345c105bbbc=
309a3f243c2dd0e"
>=20
> -S =3D "${WORKDIR}"
> -
> +S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
> diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes=
/ti-eula-unpack.inc
> index 60f5558..aee88f1 100644
> --- a/recipes-ti/includes/ti-eula-unpack.inc
> +++ b/recipes-ti/includes/ti-eula-unpack.inc
> @@ -14,7 +14,7 @@ python do_unpack () {
>     bb.build.exec_func('ti_bin_do_unpack', d)
> }
>=20
> -TI_BIN_UNPK_WDEXT +=3D ""
> +TI_BIN_UNPK_WDEXT ?=3D ""
> python ti_bin_do_unpack() {
>=20
>     import os
> @@ -60,7 +60,7 @@ python ti_bin_do_unpack() {
>             wdext =3D bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
>             wdext =3D bb.data.expand(wdext, localdata)
>             cmd =3D workdir+wdext
> -        print >>f, cmd
> +        f.write(cmd+'\n');
>     f.close()
>=20
>     # Expand the tarball that was created if required
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


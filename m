Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 806B8E0155F
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2013 05:12:22 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8DCCLqX031636;
	Fri, 13 Sep 2013 07:12:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8DCCLxb008901;
	Fri, 13 Sep 2013 07:12:21 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 13 Sep 2013 07:12:21 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/2] omap3-sgx-modules: add automatic
	selection between softfp and hardfp binaries
Thread-Index: AQHOsDDsU0KI7Zq5ukK7uWVXLSUpf5nDlF0A
Date: Fri, 13 Sep 2013 12:12:20 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015972726C@DLEE11.ent.ti.com>
References: <1379042687-25413-1-git-send-email-denis@denix.org>
In-Reply-To: <1379042687-25413-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] omap3-sgx-modules: add automatic selection between softfp and hardfp binaries
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
X-List-Received-Date: Fri, 13 Sep 2013 12:12:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

You added a MAKE_TARGETS for PM_RUNTIME but I don't see a note saying why i=
n the commit message.

Aside from that

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Thursday, September 12, 2013 10:25 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 1/2] omap3-sgx-modules: add automatic
>selection between softfp and hardfp binaries
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>This is based on the work by Franklin Cooper, with following
>changes:
>* Cleanup and simplify the logic
>* Reduce the number of Python calls
>* Expand support from Raw to X11 variant
>
>The original description:
>* The Graphics SDK includes some binaries that are prebuilt.
>* These prebuilt binaries come in two versions of the Graphics
>SDK. By default
>  the prebuilt binaries are built using a softfp toolchain. A
>separate hardfp
>  Graphics SDK exist that contains binaries that are prebuilt with
>a hardfp
>  toolchain.
>* Add support for both by checking to see if the toolchain used in
>the OE build
>  is using a hardfp or softfp toolchain.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>Cc: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../omap3-sgx-modules-x11_4.09.00.01.bb              | 18
>++++++++++++++----
> .../powervr-drivers/omap3-sgx-modules_4.09.00.01.bb  | 20
>++++++++++++++++----
> 2 files changed, 30 insertions(+), 8 deletions(-)
>
>diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-
>x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-
>x11_4.09.00.01.bb
>index 9134e61..fd79818 100644
>--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-
>x11_4.09.00.01.bb
>+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-
>x11_4.09.00.01.bb
>@@ -7,19 +7,29 @@ require ../../recipes-ti/includes/ti-eula-
>unpack.inc
>
> SGXPV =3D "4_09_00_01"
> IMGPV =3D "1.9.2188537"
>-BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
>
> inherit module
>
>-MACHINE_KERNEL_PR_append =3D "b"
>+MACHINE_KERNEL_PR_append =3D "c"
> PR =3D "${MACHINE_KERNEL_PR}"
>
> DEFAULT_PREFERENCE =3D "-1"
>
>+# Select the corresponding hardfp/softfp filename and checksums
>based on tune flags
>+BINFILE_SOFTFP =3D
>"Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
>+MD5SUM_SOFTFP =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
>+SHA256SUM_SOFTFP =3D
>"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
>+
>+BINFILE_HARDFP =3D
>"Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
>+MD5SUM_HARDFP =3D "c9f656dce062d1ab10afffd4dfb71b67"
>+SHA256SUM_HARDFP =3D
>"dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
>+
>+BINFILE =3D "${@base_contains('TUNE_FEATURES', 'callconvention-
>hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
>+
> SRC_URI =3D "http://software-
>dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}
>/exports/${BINFILE}"
>
>-SRC_URI[md5sum] =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
>-SRC_URI[sha256sum] =3D
>"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
>+SRC_URI[md5sum] =3D "${@base_contains('TUNE_FEATURES',
>'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}',
>d)}"
>+SRC_URI[sha256sum] =3D "${@base_contains('TUNE_FEATURES',
>'callconvention-hard', '${SHA256SUM_HARDFP}',
>'${SHA256SUM_SOFTFP}', d)}"
>
> TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"
> S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
>diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-
>modules_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-
>modules_4.09.00.01.bb
>index 399374d..1c8718c 100644
>--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
>+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
>@@ -7,19 +7,29 @@ require ../../recipes-ti/includes/ti-eula-
>unpack.inc
>
> SGXPV =3D "4_09_00_01"
> IMGPV =3D "1.9.2188537"
>-BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
>
> inherit module
>
>-MACHINE_KERNEL_PR_append =3D "a"
>+MACHINE_KERNEL_PR_append =3D "b"
> PR =3D "${MACHINE_KERNEL_PR}"
>
> DEFAULT_PREFERENCE =3D "-1"
>
>+# Select the corresponding hardfp/softfp filename and checksums
>based on tune flags
>+BINFILE_SOFTFP =3D
>"Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
>+MD5SUM_SOFTFP =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
>+SHA256SUM_SOFTFP =3D
>"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
>+
>+BINFILE_HARDFP =3D
>"Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
>+MD5SUM_HARDFP =3D "c9f656dce062d1ab10afffd4dfb71b67"
>+SHA256SUM_HARDFP =3D
>"dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
>+
>+BINFILE =3D "${@base_contains('TUNE_FEATURES', 'callconvention-
>hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
>+
> SRC_URI =3D "http://software-
>dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}
>/exports/${BINFILE}"
>
>-SRC_URI[md5sum] =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
>-SRC_URI[sha256sum] =3D
>"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
>+SRC_URI[md5sum] =3D "${@base_contains('TUNE_FEATURES',
>'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}',
>d)}"
>+SRC_URI[sha256sum] =3D "${@base_contains('TUNE_FEATURES',
>'callconvention-hard', '${SHA256SUM_HARDFP}',
>'${SHA256SUM_SOFTFP}', d)}"
>
> TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"
> S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
>@@ -41,6 +51,8 @@ MODULESLOCATION_ti33x =3D "dc_ti335x_linux"
>
> MAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM}
>SUPPORT_XORG=3D0"
>
>+MAKE_TARGETS_append_ti33x =3D " PM_RUNTIME=3D1"
>+
> do_install() {
>     mkdir -p
>${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
>     cp  ${S}/pvrsrvkm.ko \
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti


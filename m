Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9A40E0155F
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2013 05:10:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8DCAU0i028646;
	Fri, 13 Sep 2013 07:10:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8DCAToY006851;
	Fri, 13 Sep 2013 07:10:29 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 13 Sep 2013 07:10:29 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/2] libgles-omap3: add automatic selection
	between softfp and hardfp binaries
Thread-Index: AQHOsDDfPwfSA3x5TEudIUXjvSQqaZnDlATQ
Date: Fri, 13 Sep 2013 12:10:29 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015972722F@DLEE11.ent.ti.com>
References: <1379042687-25413-1-git-send-email-denis@denix.org>
	<1379042687-25413-2-git-send-email-denis@denix.org>
In-Reply-To: <1379042687-25413-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] libgles-omap3: add automatic selection between softfp and hardfp binaries
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
X-List-Received-Date: Fri, 13 Sep 2013 12:10:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Thursday, September 12, 2013 10:25 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 2/2] libgles-omap3: add automatic
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
> .../libgles/libgles-omap3-x11_4.09.00.01.bb        | 23
>+++++++++++++++++-----
> .../libgles/libgles-omap3_4.09.00.01.bb            | 23
>+++++++++++++++++-----
> 2 files changed, 36 insertions(+), 10 deletions(-)
>
>diff --git a/recipes-graphics/libgles/libgles-omap3-
>x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-
>x11_4.09.00.01.bb
>index 6b9c561..df84f9b 100644
>--- a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
>@@ -2,11 +2,11 @@ require libgles-omap3-x11.inc
>
> LICENSE =3D "TSPA"
>
>-PR =3D "${INC_PR}.0"
>+PR =3D "${INC_PR}.1"
>
> DEFAULT_PREFERENCE =3D "-1"
>
>-BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
>+BINLOCATION_omap3 =3D "${S}/gfx_rel_es3.x"
> BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
> BINLOCATION_ti814x =3D "${S}/gfx_rel_es6.x"
> BINLOCATION_ti33x =3D "${S}/gfx_rel_es8.x"
>@@ -20,8 +20,20 @@ PVR_INIT =3D "pvrsrvctl"
>
> SGXPV =3D "4_09_00_01"
> IMGPV =3D "1.9.2188537"
>-BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
>+
> TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
>+
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
>/exports/${BINFILE} \
>            file://cputype \
>            file://rc.pvr \
>@@ -29,8 +41,9 @@ SRC_URI =3D "http://software-
>dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
>            file://sample.desktop \
>            file://99-bufferclass.rules  \
> "
>-SRC_URI[md5sum] =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
>-SRC_URI[sha256sum] =3D
>"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
>+
>+SRC_URI[md5sum] =3D "${@base_contains('TUNE_FEATURES',
>'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}',
>d)}"
>+SRC_URI[sha256sum] =3D "${@base_contains('TUNE_FEATURES',
>'callconvention-hard', '${SHA256SUM_HARDFP}',
>'${SHA256SUM_SOFTFP}', d)}"
>
> S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
>
>diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>index a4da2f9..6899cfc 100644
>--- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>@@ -2,11 +2,11 @@ require libgles-omap3-no-x.inc
>
> LICENSE =3D "TSPA"
>
>-PR =3D "${INC_PR}.0"
>+PR =3D "${INC_PR}.1"
>
> DEFAULT_PREFERENCE =3D "-1"
>
>-BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
>+BINLOCATION_omap3 =3D "${S}/gfx_rel_es3.x"
> BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
> BINLOCATION_ti814x =3D "${S}/gfx_rel_es6.x"
> BINLOCATION_ti33x =3D "${S}/gfx_rel_es8.x"
>@@ -20,15 +20,28 @@ PVR_INIT =3D "pvrsrvctl"
>
> SGXPV =3D "4_09_00_01"
> IMGPV =3D "1.9.2188537"
>-BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
>+
> TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
>+
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
>/exports/${BINFILE} \
>            file://cputype \
>            file://rc.pvr \
>            file://99-bufferclass.rules  \
> "
>-SRC_URI[md5sum] =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
>-SRC_URI[sha256sum] =3D
>"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
>+
>+SRC_URI[md5sum] =3D "${@base_contains('TUNE_FEATURES',
>'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}',
>d)}"
>+SRC_URI[sha256sum] =3D "${@base_contains('TUNE_FEATURES',
>'callconvention-hard', '${SHA256SUM_HARDFP}',
>'${SHA256SUM_SOFTFP}', d)}"
>
> S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
>
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti


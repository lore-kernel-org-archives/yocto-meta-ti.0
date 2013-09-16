Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8BD7E014EA
	for <meta-ti@yoctoproject.org>; Sun, 15 Sep 2013 19:33:18 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8G2XFix005883
	for <meta-ti@yoctoproject.org>; Sun, 15 Sep 2013 21:33:16 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8G2XCtD020726
	for <meta-ti@yoctoproject.org>; Sun, 15 Sep 2013 21:33:14 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Mon, 16 Sep 2013 10:33:12 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/2] omap3-sgx-modules: add automatic
	selection between softfp and hardfp binaries
Thread-Index: AQHOsDDtMsKKWAKGXkKLiwImX2+MH5nDDn8AgABBVQCABFlXwA==
Date: Mon, 16 Sep 2013 02:33:11 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EBCCB81@DBDE04.ent.ti.com>
References: <1379042687-25413-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015972726C@DLEE11.ent.ti.com>
	<20130913160610.GB13687@edge>
In-Reply-To: <20130913160610.GB13687@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Mon, 16 Sep 2013 02:33:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Denys, Chase,

Does the below reference help ?

http://processors.wiki.ti.com/index.php/SGXDbg#pvrsrvkm.2C_omaplfb_modules_=
not_inserted_.26_getting_SrvInit_failed_message

http://processors.wiki.ti.com/index.php/SGXDbg#SGX_drivers_not_inserted_suc=
cessfully_.26_observing_sysfs:_cannot_create_duplicate_filename_.27.2Fbus.2=
Fplatform.2Fdevices.2Fpvrsrvkm.27_message

regards,
Prabu

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Friday, September 13, 2013 9:36 PM
To: Maupin, Chase
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 1/2] omap3-sgx-modules: add automatic selecti=
on between softfp and hardfp binaries

On Fri, Sep 13, 2013 at 12:12:20PM +0000, Maupin, Chase wrote:
> You added a MAKE_TARGETS for PM_RUNTIME but I don't see a note saying=20
> why in the commit message.

Yeah, I noticed that too in the original patch - I remember Prabu was expla=
ining when this var needs to be set and when doesn't, based on the kernel a=
nd gfx sdk versions, but don't remember all the details...


> Aside from that
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-=20
> >bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> >Sent: Thursday, September 12, 2013 10:25 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH 1/2] omap3-sgx-modules: add automatic=20
> >selection between softfp and hardfp binaries
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >This is based on the work by Franklin Cooper, with following
> >changes:
> >* Cleanup and simplify the logic
> >* Reduce the number of Python calls
> >* Expand support from Raw to X11 variant
> >
> >The original description:
> >* The Graphics SDK includes some binaries that are prebuilt.
> >* These prebuilt binaries come in two versions of the Graphics SDK.=20
> >By default
> >  the prebuilt binaries are built using a softfp toolchain. A=20
> >separate hardfp
> >  Graphics SDK exist that contains binaries that are prebuilt with a=20
> >hardfp
> >  toolchain.
> >* Add support for both by checking to see if the toolchain used in=20
> >the OE build
> >  is using a hardfp or softfp toolchain.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >Cc: Franklin S. Cooper Jr <fcooper@ti.com>
> >---
> > .../omap3-sgx-modules-x11_4.09.00.01.bb              | 18
> >++++++++++++++----
> > .../powervr-drivers/omap3-sgx-modules_4.09.00.01.bb  | 20
> >++++++++++++++++----
> > 2 files changed, 30 insertions(+), 8 deletions(-)
> >
> >diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-
> >x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-
> >x11_4.09.00.01.bb
> >index 9134e61..fd79818 100644
> >--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-
> >x11_4.09.00.01.bb
> >+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-
> >x11_4.09.00.01.bb
> >@@ -7,19 +7,29 @@ require ../../recipes-ti/includes/ti-eula-
> >unpack.inc
> >
> > SGXPV =3D "4_09_00_01"
> > IMGPV =3D "1.9.2188537"
> >-BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
> >
> > inherit module
> >
> >-MACHINE_KERNEL_PR_append =3D "b"
> >+MACHINE_KERNEL_PR_append =3D "c"
> > PR =3D "${MACHINE_KERNEL_PR}"
> >
> > DEFAULT_PREFERENCE =3D "-1"
> >
> >+# Select the corresponding hardfp/softfp filename and checksums
> >based on tune flags
> >+BINFILE_SOFTFP =3D
> >"Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
> >+MD5SUM_SOFTFP =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
> >+SHA256SUM_SOFTFP =3D
> >"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
> >+
> >+BINFILE_HARDFP =3D
> >"Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
> >+MD5SUM_HARDFP =3D "c9f656dce062d1ab10afffd4dfb71b67"
> >+SHA256SUM_HARDFP =3D
> >"dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
> >+
> >+BINFILE =3D "${@base_contains('TUNE_FEATURES', 'callconvention-
> >hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
> >+
> > SRC_URI =3D "http://software-
> >dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}
> >/exports/${BINFILE}"
> >
> >-SRC_URI[md5sum] =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
> >-SRC_URI[sha256sum] =3D
> >"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
> >+SRC_URI[md5sum] =3D "${@base_contains('TUNE_FEATURES',
> >'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
> >+SRC_URI[sha256sum] =3D "${@base_contains('TUNE_FEATURES',
> >'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}',=20
> >d)}"
> >
> > TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"
> > S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
> >diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-
> >modules_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-
> >modules_4.09.00.01.bb
> >index 399374d..1c8718c 100644
> >--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
> >+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
> >@@ -7,19 +7,29 @@ require ../../recipes-ti/includes/ti-eula-
> >unpack.inc
> >
> > SGXPV =3D "4_09_00_01"
> > IMGPV =3D "1.9.2188537"
> >-BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
> >
> > inherit module
> >
> >-MACHINE_KERNEL_PR_append =3D "a"
> >+MACHINE_KERNEL_PR_append =3D "b"
> > PR =3D "${MACHINE_KERNEL_PR}"
> >
> > DEFAULT_PREFERENCE =3D "-1"
> >
> >+# Select the corresponding hardfp/softfp filename and checksums
> >based on tune flags
> >+BINFILE_SOFTFP =3D
> >"Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
> >+MD5SUM_SOFTFP =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
> >+SHA256SUM_SOFTFP =3D
> >"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
> >+
> >+BINFILE_HARDFP =3D
> >"Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
> >+MD5SUM_HARDFP =3D "c9f656dce062d1ab10afffd4dfb71b67"
> >+SHA256SUM_HARDFP =3D
> >"dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
> >+
> >+BINFILE =3D "${@base_contains('TUNE_FEATURES', 'callconvention-
> >hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
> >+
> > SRC_URI =3D "http://software-
> >dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}
> >/exports/${BINFILE}"
> >
> >-SRC_URI[md5sum] =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
> >-SRC_URI[sha256sum] =3D
> >"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
> >+SRC_URI[md5sum] =3D "${@base_contains('TUNE_FEATURES',
> >'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
> >+SRC_URI[sha256sum] =3D "${@base_contains('TUNE_FEATURES',
> >'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}',=20
> >d)}"
> >
> > TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"
> > S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
> >@@ -41,6 +51,8 @@ MODULESLOCATION_ti33x =3D "dc_ti335x_linux"
> >
> > MAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM}=20
> >SUPPORT_XORG=3D0"
> >
> >+MAKE_TARGETS_append_ti33x =3D " PM_RUNTIME=3D1"
> >+
> > do_install() {
> >     mkdir -p
> >${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> >     cp  ${S}/pvrsrvkm.ko \
> >--
> >1.8.3.2
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7543E0049B; Mon, 19 Oct 2015 14:06:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E34F6E00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:06:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JL65LB005047
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 16:06:05 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JL65Vu031257
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 16:06:05 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Mon, 19 Oct 2015 16:06:05 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-ti] [PATCH v4] dspdce-fw: add recipe to build dspdce-fw
	from git source and remove recipe which uses prebuilt firmware
Thread-Index: AQHRCp2bNeTz9TO4h0+oom1UdbUaQJ5zTc8Q
Date: Mon, 19 Oct 2015 21:06:04 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926AD8D20@DLEE08.ent.ti.com>
References: <1443107610-28736-1-git-send-email-h-gou@ti.com>
	<561FAC9A.2060408@ti.com> <20151019184004.GD5620@edge>
In-Reply-To: <20151019184004.GD5620@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v4] dspdce-fw: add recipe to build dspdce-fw from git source and remove recipe which uses prebuilt firmware
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
X-List-Received-Date: Mon, 19 Oct 2015 21:06:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The v5 patch was submitted to use "update-alternatives", and the difference=
 from the old recipe is summarized under "v5 changes".=20

The ~50% size change of the v4 patch comes from deleting the old recipe, wh=
ich was summarized under " v4 changes" in the v4 patch.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, October 19, 2015 2:40 PM
> To: Stiffler, Jacob
> Cc: Gou, Hongmei; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v4] dspdce-fw: add recipe to build dspdce-f=
w
> from git source and remove recipe which uses prebuilt firmware
>=20
> Also, please show the difference between the old and the new recipes. You
> may need to lower the threshold, as it seems the new recipe grew almost
> 50% in size.
>=20
>=20
> On Thu, Oct 15, 2015 at 09:39:38AM -0400, Jacob Stiffler wrote:
> > Can you use "update-alternatives" here?
> >
> > On 9/24/2015 11:13 AM, Hongmei Gou wrote:
> > >Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > >
> > >v4 changes:
> > >1) Remove recipe which uses prebuilt firmware
> > >2) Update PV to use version number only, "git+[commit]" is not needed
> any more
> > >
> > >---
> > >  recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb | 26 -------------
> > >  recipes-bsp/dspdce-fw/dspdce-fw_git.bb        | 56
> +++++++++++++++++++++++++++
> > >  2 files changed, 56 insertions(+), 26 deletions(-)
> > >  delete mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
> > >  create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> > >
> > >diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb b/recipes-
> bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
> > >deleted file mode 100644
> > >index 777c221..0000000
> > >--- a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
> > >+++ /dev/null
> > >@@ -1,26 +0,0 @@
> > >-DESCRIPTION =3D "Firmware for DSP for an example application called
> copycodectest"
> > >-LICENSE =3D "TI-TSPA"
> > >-LIC_FILES_CHKSUM =3D "file://DSPDCE-${PV}-
> Manifest.doc;md5=3D386d1802eefc2fcf00ab01a5b4556277"
> > >-
> > >-COMPATIBLE_MACHINE =3D "dra7xx-evm"
> > >-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > >-
> > >-SRC_URI =3D
> "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_05/
> exports/dspdce-${MACHINE}-1.00.00.05.tar.gz;protocol=3Dftp"
> > >-
> > >-S =3D "${WORKDIR}/dspdce-${MACHINE}-${PV}"
> > >-
> > >-SRC_URI[md5sum] =3D "4f3d5c6ef088019aa4804eaaedc8e949"
> > >-SRC_URI[sha256sum] =3D
> "8d99c4f149613448a6d72c62a18cc7445c63c687b786658da1762c4e1c03a6a0"
> > >-
> > >-TARGET =3D "dra7-dsp1-fw.xe66"
> > >-
> > >-do_install() {
> > >-        mkdir -p ${D}${base_libdir}/firmware
> > >-        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARG=
ET}
> > >-}
> > >-
> > >-FILES_${PN} +=3D "${base_libdir}/firmware/${TARGET}"
> > >-
> > >-INSANE_SKIP_${PN} =3D "arch"
> > >-
> > >-PR =3D "r1"
> > >diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-
> bsp/dspdce-fw/dspdce-fw_git.bb
> > >new file mode 100644
> > >index 0000000..594f330
> > >--- /dev/null
> > >+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> > >@@ -0,0 +1,56 @@
> > >+DESCRIPTION =3D "Firmware for DSP for an example application called
> copycodectest"
> > >+LICENSE =3D "TI-TSPA"
> > >+LIC_FILES_CHKSUM =3D
> "file://src/ti/framework/dce/dce.c;startline=3D1;endline=3D31;md5=3D2c6e9=
aba6e
> d75f22b1a2b7544b1c809d"
> > >+
> > >+COMPATIBLE_MACHINE =3D "dra7xx"
> > >+
> > >+SRC_URI =3D "git://git.ti.com/glsdk/dspdce.git;protocol=3Dgit"
> > >+
> > >+SRCREV =3D "71e8fbf8e4f91b60680cf18a0c202a222e9ae3ba"
> > >+
> > >+PV =3D "1.00.00.06"
> > >+
> > >+S =3D "${WORKDIR}/git"
> > >+
> > >+require recipes-ti/includes/ti-paths.inc
> > >+require recipes-ti/includes/ti-staging.inc
> > >+
> > >+PR =3D "r0"
> > >+
> > >+DEPENDS =3D "ti-xdctools ti-sysbios ti-codec-engine ti-framework-
> components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
> > >+
> > >+export HWVERSION=3D"ES10"
> > >+export BIOSTOOLSROOT=3D"${STAGING_DIR_TARGET}/usr/share/ti"
> > >+
> > >+export XDCVERSION=3D"ti-xdctools-tree"
> > >+export BIOSVERSION=3D"ti-sysbios-tree"
> > >+export IPCVERSION=3D"ti-ipc-tree"
> > >+export CEVERSION=3D"ti-codec-engine-tree"
> > >+export FCVERSION=3D"ti-framework-components-tree"
> > >+export XDAISVERSION=3D"ti-xdais-tree"
> > >+export OSALVERSION=3D"ti-osal-tree"
> > >+
> > >+export IPCSRC=3D"${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
> > >+export
> C66XCGTOOLSPATH=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> > >+
> > >+do_configure() {
> > >+    cd ${S}
> > >+    make unconfig
> > >+    make vayu_config
> > >+}
> > >+
> > >+do_compile() {
> > >+    cd ${S}
> > >+    make dspbin
> > >+}
> > >+
> > >+TARGET =3D "dra7-dsp1-fw.xe66.dce"
> > >+
> > >+do_install() {
> > >+        mkdir -p ${D}${base_libdir}/firmware
> > >+        cp ${S}/dra7xx-c66x-dsp.xe66
> ${D}${base_libdir}/firmware/${TARGET}
> > >+}
> > >+
> > >+INSANE_SKIP_${PN} =3D "arch"
> > >+
> > >+FILES_${PN} +=3D "${base_libdir}/firmware/${TARGET}"
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86010E00876; Wed,  1 Oct 2014 05:55:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03303E0079A
	for <meta-ti@yoctoproject.org>; Wed,  1 Oct 2014 05:55:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s91Ct3KH021488
	for <meta-ti@yoctoproject.org>; Wed, 1 Oct 2014 07:55:03 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s91Ct2rI008021
	for <meta-ti@yoctoproject.org>; Wed, 1 Oct 2014 07:55:03 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Wed, 1 Oct 2014 07:55:02 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-ti] [daisy][PATCH] ti-ipc: Upgraded to IPC 3.30.00.06_eng
Thread-Index: AQHP0OC+z77KL0TrkUyLXzQCSoS6tJwQaYOAgABdFICAAAmNAIAJxzcAgAC0ozA=
Date: Wed, 1 Oct 2014 12:55:02 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140B4740@DFLE09.ent.ti.com>
References: <1410784171-25486-1-git-send-email-j-stiffler@ti.com>
	<4B26FB5A64EBA14C87266869E037F958140B2C34@DFLE09.ent.ti.com>
	<5422DFE1.9080404@ti.com> <20140924154852.GY6303@edge>
	<20140930210814.GQ6303@edge>
In-Reply-To: <20140930210814.GQ6303@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [daisy][PATCH] ti-ipc: Upgraded to IPC 3.30.00.06_eng
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
X-List-Received-Date: Wed, 01 Oct 2014 12:55:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, I will submit a v2 sometime today.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Tuesday, September 30, 2014 5:08 PM
To: R, Karthik
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [daisy][PATCH] ti-ipc: Upgraded to IPC 3.30.00.06_en=
g

Jake,

Ping, will you be updating it to 3.30.00.09?


On Wed, Sep 24, 2014 at 11:48:52AM -0400, Denys Dmytriyenko wrote:
> On Wed, Sep 24, 2014 at 08:44:41PM +0530, Karthik Ramanan wrote:
> > Two points:
> >=20
> > * GA version 3.30.00.09 is available.
> >=20
> > * It may not be applicable to this patch, but making an assumption=20
> > about every component being on the latest IPC and removing the older=20
> > recipes may not be a good idea.
>=20
> The second point would require a bigger discussion, but basically we'd=20
> like to consolidate ipc versions at least in master for 3.14 kernel.=20
> For now we can keep older specific versions in Dora and Dylan for GL=20
> and MC variants on 3.12 and 3.10 kernels...
>=20
>=20
> > On 24-Sep-14 8:12 PM, Stiffler, Jacob wrote:
> > >ping
> > >
> > >-----Original Message-----
> > >From: Stiffler, Jacob
> > >Sent: Monday, September 15, 2014 8:30 AM
> > >To: meta-ti@yoctoproject.org
> > >Cc: Stiffler, Jacob
> > >Subject: [daisy][PATCH] ti-ipc: Upgraded to IPC 3.30.00.06_eng
> > >
> > >* Added new recipe for latest IPC
> > >* Removed older recipe versions
> > >* Latest recipe points to IPC 3.30.00.06_eng
> > >
> > >Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > >---
> > >  ...nstallation-prefix-feature-to-products.ma.patch |   38 ----------=
--------
> > >  recipes-ti/ipc/ti-ipc/ipc.pc                       |    8 ----
> > >  recipes-ti/ipc/ti-ipc_1.24.00.16.bb                |   41 ----------=
----------
> > >  recipes-ti/ipc/ti-ipc_3.00.00.bb                   |    7 ----
> > >  recipes-ti/ipc/ti-ipc_3.21.00.07.bb                |    4 --
> > >  recipes-ti/ipc/{ti-ipc.inc =3D> ti-ipc_git.bb}       |   26 +++++++-=
-----
> > >  6 files changed, 15 insertions(+), 109 deletions(-)  delete mode=20
> > >100644=20
> > >recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to
> > >-products.ma.patch
> > >  delete mode 100644 recipes-ti/ipc/ti-ipc/ipc.pc  delete mode=20
> > >100644 recipes-ti/ipc/ti-ipc_1.24.00.16.bb
> > >  delete mode 100644 recipes-ti/ipc/ti-ipc_3.00.00.bb  delete mode=20
> > >100644 recipes-ti/ipc/ti-ipc_3.21.00.07.bb
> > >  rename recipes-ti/ipc/{ti-ipc.inc =3D> ti-ipc_git.bb} (75%)
> > >
> > >diff --git=20
> > >a/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-
> > >to-products.ma.patch=20
> > >b/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-
> > >to-products.ma.patch
> > >deleted file mode 100644
> > >index 58d77c7..0000000
> > >---=20
> > >a/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-
> > >to-products.ma.patch
> > >+++ /dev/null
> > >@@ -1,38 +0,0 @@
> > >-From 26d09063063593aec760151393226b96bc7ab9f8 Mon Sep 17 00:00:00=20
> > >2001
> > >-From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > >-Date: Thu, 5 Sep 2013 17:01:15 +0530
> > >-Subject: [PATCH] ipc: Added installation prefix feature to=20
> > >products.mak
> > >-
> > >-Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > >----
> > >- ipc-linux.mak |    1 +
> > >- products.mak  |    1 +
> > >- 2 files changed, 2 insertions(+)
> > >-
> > >-diff --git a/ipc-linux.mak b/ipc-linux.mak -index 788a5a2..01579e4=20
> > >100644
> > >---- a/ipc-linux.mak
> > >-+++ b/ipc-linux.mak
> > >-@@ -38,6 +38,7 @@ include products.mak
> > >- config:
> > >- 	@echo "Configuring Linux Ipc ..."
> > >- 	./configure --host=3D$(TOOLCHAIN_LONGNAME) \
> > >-+            --prefix=3D$(PREFIX) \
> > >-             CC=3D$(TOOLCHAIN_PREFIX)gcc \
> > >-             PLATFORM=3D$(PLATFORM) \
> > >-             CMEM_INSTALL_DIR=3D$(CMEM_INSTALL_DIR) \
> > >-diff --git a/products.mak b/products.mak -index e418d2f..4578a1e=20
> > >100644
> > >---- a/products.mak
> > >-+++ b/products.mak
> > >-@@ -55,6 +55,7 @@ PLATFORM ?=3D
> > >- TOOLCHAIN_LONGNAME =3D arm-none-linux-gnueabi
> > >- TOOLCHAIN_INSTALL_DIR =3D $(DEPOT)/_your_arm_code_gen_install_
> > >- TOOLCHAIN_PREFIX =3D=20
> > >$(TOOLCHAIN_INSTALL_DIR)/bin/$(TOOLCHAIN_LONGNAME)-
> > >-+PREFIX =3D /usr/local
> > >-
> > >- # Optional: Path to Linux Kernel - needed to build the MmRpc user=20
> > >libraries
> > >- # (for devices that support it)
> > >---
> > >-1.7.9.5
> > >-
> > >diff --git a/recipes-ti/ipc/ti-ipc/ipc.pc=20
> > >b/recipes-ti/ipc/ti-ipc/ipc.pc deleted file mode 100644 index=20
> > >1a8c52d..0000000
> > >--- a/recipes-ti/ipc/ti-ipc/ipc.pc
> > >+++ /dev/null
> > >@@ -1,8 +0,0 @@
> > >-prefix=3D/../../ipc_@VERSION@
> > >-includedir=3D${prefix}/ti/ipc
> > >-
> > >-Name: TI IPC
> > >-Description: TI ARM-DSP IPC (Inter Processor Communication)
> > >-Version: @VERSION@
> > >-Requires:
> > >-Cflags: -I${includedir}
> > >diff --git a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb=20
> > >b/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
> > >deleted file mode 100644
> > >index 420d0f7..0000000
> > >--- a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
> > >+++ /dev/null
> > >@@ -1,41 +0,0 @@
> > >-DESCRIPTION =3D "TI Inter Process Ccommunication (IPC) Mechanisms (fo=
r Uni- and Multi- Processor Configurations)"
> > >-HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/ta=
rgetcontent/ipc/index.html"
> > >-SECTION =3D "devel"
> > >-LICENSE =3D "BSD"
> > >-LIC_FILES_CHKSUM =3D "file://ipc_${PV}_manifest.html;md5=3D573f5a5c04=
48d28bf8db35f438244d7f"
> > >-
> > >-
> > >-require ../includes/ti-paths.inc
> > >-require ../includes/ti-staging.inc -require=20
> > >../includes/ti-eula-unpack.inc
> > >-
> > >-PV =3D "1_24_00_16"
> > >-
> > >-S =3D "${WORKDIR}/ipc_${PV}"
> > >-
> > >-SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/tar=
getcontent/ipc/${PV}/exports/ipc_setuplinux_${PV}.bin;name=3Dipcbin \
> > >-           file://ipc.pc"
> > >-
> > >-DEPENDS =3D "ti-sysbios ti-cgt6x ti-xdctools"
> > >-
> > >-BINFILE=3D"ipc_setuplinux_${PV}.bin"
> > >-TI_BIN_UNPK_CMDS=3D"Y: q:workdir:Y"
> > >-
> > >-do_configure() {
> > >-    sed -i -e s:@VERSION@:${PV}:g ${WORKDIR}/ipc.pc
> > >-
> > >-    cp ${WORKDIR}/ipc.pc ${S}
> > >-}
> > >-
> > >-do_install() {
> > >-    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
> > >-    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
> > >-
> > >-    install -d ${D}/${libdir}/pkgconfig
> > >-    install ${S}/ipc.pc ${D}/${libdir}/pkgconfig/
> > >-}
> > >-
> > >-FILES_${PN}-dev =3D "${libdir}/*"
> > >-
> > >-SRC_URI[ipcbin.md5sum] =3D "d2f7cc82310d555ca039dcd353bd94c5"
> > >-SRC_URI[ipcbin.sha256sum] =3D "96df7835e920c7dabcd63d30ec8bc2aea7cd0c=
6197c9fb9ca0f8a9b681aa5396"
> > >diff --git a/recipes-ti/ipc/ti-ipc_3.00.00.bb=20
> > >b/recipes-ti/ipc/ti-ipc_3.00.00.bb
> > >deleted file mode 100644
> > >index a6922c0..0000000
> > >--- a/recipes-ti/ipc/ti-ipc_3.00.00.bb
> > >+++ /dev/null
> > >@@ -1,7 +0,0 @@
> > >-require ti-ipc.inc
> > >-
> > >-# For this version of IPC the PLATFORM value is lowercase -PLATFORM_k=
eystone =3D "tci6638"
> > >-
> > >-# The following commit corresponds to 3.00.04.29 -SRCREV =3D "12794ea=
33870b782bffe1fe4398e86e93fb64396"
> > >diff --git a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb=20
> > >b/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
> > >deleted file mode 100644
> > >index 17cdab0..0000000
> > >--- a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
> > >+++ /dev/null
> > >@@ -1,4 +0,0 @@
> > >-require ti-ipc.inc
> > >-
> > >-# This commit corresponds to 3.21.00.07 -SRCREV =3D "c18fece0c9f0dc76=
361dc1ee11b7ee2417479847"
> > >diff --git a/recipes-ti/ipc/ti-ipc.inc=20
> > >b/recipes-ti/ipc/ti-ipc_git.bb similarity index 75% rename from=20
> > >recipes-ti/ipc/ti-ipc.inc rename to recipes-ti/ipc/ti-ipc_git.bb=20
> > >index 860f55f..af1973e 100644
> > >--- a/recipes-ti/ipc/ti-ipc.inc
> > >+++ b/recipes-ti/ipc/ti-ipc_git.bb
> > >@@ -2,11 +2,22 @@ DESCRIPTION =3D "TI Inter Process Communication (IPC=
) Mechanisms (for Uni- and Mul  HOMEPAGE=3D"http://processors.wiki.ti.com/i=
ndex.php/Category:IPC"
> > >
> > >  LICENSE =3D "BSD"
> > >-LIC_FILES_CHKSUM =3D "file://${S}/ipc-linux.mak;beginline=3D1;endline=
=3D30;md5=3Df2518e421e230f06fe6d449718d02edc"
> > >+LIC_FILES_CHKSUM =3D "file://${S}/ipc-linux.mak;beginline=3D1;endline=
=3D30;md5=3Dabd112f156e5eb9b0f3e202e48747f9a"
> > >
> > >  DEPENDS +=3D "virtual/kernel"
> > >
> > >-PR =3D "r1"
> > >+PV =3D "3.30.00.06"
> > >+
> > >+# This is the first version of the 3.30.00.06 # PR =3D "r0"
> > >+
> > >+BRANCH =3D "ipc-next"
> > >+SRC_URI =3D "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit;branch=3D=
${BRANCH} \
> > >+           file://tiipclad-daemon.sh \
> > >+           "
> > >+SRCREV =3D "a0eea0e953a94a64c541e468e8f7a7244361a0fb"
> > >+
> > >+S =3D "${WORKDIR}/git"
> > >
> > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > >
> > >@@ -22,20 +33,13 @@ DAEMON_keystone =3D "lad_tci6638"
> > >
> > >  inherit autotools pkgconfig update-rc.d
> > >
> > >-SRC_URI =3D "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit \
> > >-           file://0002-ipc-Added-installation-prefix-feature-to-produ=
cts.ma.patch \
> > >-           file://tiipclad-daemon.sh \
> > >-           "
> > >-
> > >-S =3D "${WORKDIR}/git"
> > >-
> > >  INITSCRIPT_NAME =3D "tiipclad-daemon.sh"
> > >  INITSCRIPT_PARAMS =3D "defaults 10"
> > >
> > >-EXTRA_OEMAKE +=3D "KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR} TOOLCHA=
IN_INSTALL_DIR=3D${TOOLCHAIN_PATH} TOOLCHAIN_LONGNAME=3D${TOOLCHAIN_SYS} PL=
ATFORM=3D${PLATFORM} PREFIX=3D${prefix}"
> > >+EXTRA_OECONF +=3D "PLATFORM=3D${PLATFORM} KERNEL_INSTALL_DIR=3D${STAG=
ING_KERNEL_DIR}"
> > >
> > >  do_configure() {
> > >-    oe_runmake -f ${S}/ipc-linux.mak config
> > >+    oe_runconf
> > >  }
> > >
> > >  do_install_append() {
> > >--
> > >1.7.9.5
> > >
> >=20
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24ACDE0086A; Wed,  1 Oct 2014 06:35:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C215EE00857
	for <meta-ti@yoctoproject.org>; Wed,  1 Oct 2014 06:35:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s91DZMrp011073
	for <meta-ti@yoctoproject.org>; Wed, 1 Oct 2014 08:35:22 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s91DZMdM008672
	for <meta-ti@yoctoproject.org>; Wed, 1 Oct 2014 08:35:22 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 1 Oct 2014 08:35:22 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [daisy][PATCH v2] ti-ipc: Upgrade to IPC 3.30.00.09
Thread-Index: AQHP3Xmlk5nh00P5fEW7DNDYW5orzZwbPhqw
Date: Wed, 1 Oct 2014 13:35:20 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140B4773@DFLE09.ent.ti.com>
References: <1412169273-30215-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1412169273-30215-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [daisy][PATCH v2] ti-ipc: Upgrade to IPC 3.30.00.09
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
X-List-Received-Date: Wed, 01 Oct 2014 13:35:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Wednesday, October 01, 2014 9:15 AM
To: meta-ti@yoctoproject.org
Cc: Stiffler, Jacob
Subject: [daisy][PATCH v2] ti-ipc: Upgrade to IPC 3.30.00.09

* Added new recipe for latest IPC
* Removed older recipe versions
* Latest recipe points to IPC 3.30.00.09

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...nstallation-prefix-feature-to-products.ma.patch |   38 ----------------=
--
 recipes-ti/ipc/ti-ipc/ipc.pc                       |    8 ----
 recipes-ti/ipc/ti-ipc_1.24.00.16.bb                |   41 ----------------=
----
 recipes-ti/ipc/ti-ipc_3.00.00.bb                   |    7 ----
 recipes-ti/ipc/ti-ipc_3.21.00.07.bb                |    4 --
 recipes-ti/ipc/{ti-ipc.inc =3D> ti-ipc_git.bb}       |   26 +++++++------
 6 files changed, 15 insertions(+), 109 deletions(-)  delete mode 100644 re=
cipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.=
ma.patch
 delete mode 100644 recipes-ti/ipc/ti-ipc/ipc.pc  delete mode 100644 recipe=
s-ti/ipc/ti-ipc_1.24.00.16.bb
 delete mode 100644 recipes-ti/ipc/ti-ipc_3.00.00.bb  delete mode 100644 re=
cipes-ti/ipc/ti-ipc_3.21.00.07.bb
 rename recipes-ti/ipc/{ti-ipc.inc =3D> ti-ipc_git.bb} (75%)

diff --git a/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-featu=
re-to-products.ma.patch b/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation=
-prefix-feature-to-products.ma.patch
deleted file mode 100644
index 58d77c7..0000000
--- a/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-p=
roducts.ma.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 26d09063063593aec760151393226b96bc7ab9f8 Mon Sep 17 00:00:00 2001
-From: Mrinmayee Hingolikar <mrinmayee@ti.com>
-Date: Thu, 5 Sep 2013 17:01:15 +0530
-Subject: [PATCH] ipc: Added installation prefix feature to products.mak
-
-Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
----
- ipc-linux.mak |    1 +
- products.mak  |    1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/ipc-linux.mak b/ipc-linux.mak -index 788a5a2..01579e4 100644
---- a/ipc-linux.mak
-+++ b/ipc-linux.mak
-@@ -38,6 +38,7 @@ include products.mak
- config:
- 	@echo "Configuring Linux Ipc ..."
- 	./configure --host=3D$(TOOLCHAIN_LONGNAME) \
-+            --prefix=3D$(PREFIX) \
-             CC=3D$(TOOLCHAIN_PREFIX)gcc \
-             PLATFORM=3D$(PLATFORM) \
-             CMEM_INSTALL_DIR=3D$(CMEM_INSTALL_DIR) \
-diff --git a/products.mak b/products.mak -index e418d2f..4578a1e 100644
---- a/products.mak
-+++ b/products.mak
-@@ -55,6 +55,7 @@ PLATFORM ?=3D
- TOOLCHAIN_LONGNAME =3D arm-none-linux-gnueabi
- TOOLCHAIN_INSTALL_DIR =3D $(DEPOT)/_your_arm_code_gen_install_
- TOOLCHAIN_PREFIX =3D $(TOOLCHAIN_INSTALL_DIR)/bin/$(TOOLCHAIN_LONGNAME)-
-+PREFIX =3D /usr/local
-
- # Optional: Path to Linux Kernel - needed to build the MmRpc user librari=
es
- # (for devices that support it)
---
-1.7.9.5
-
diff --git a/recipes-ti/ipc/ti-ipc/ipc.pc b/recipes-ti/ipc/ti-ipc/ipc.pc de=
leted file mode 100644 index 1a8c52d..0000000
--- a/recipes-ti/ipc/ti-ipc/ipc.pc
+++ /dev/null
@@ -1,8 +0,0 @@
-prefix=3D/../../ipc_@VERSION@
-includedir=3D${prefix}/ti/ipc
-
-Name: TI IPC
-Description: TI ARM-DSP IPC (Inter Processor Communication)
-Version: @VERSION@
-Requires:=20
-Cflags: -I${includedir}
diff --git a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb b/recipes-ti/ipc/ti-ipc_1.=
24.00.16.bb
deleted file mode 100644
index 420d0f7..0000000
--- a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION =3D "TI Inter Process Ccommunication (IPC) Mechanisms (for Uni=
- and Multi- Processor Configurations)"
-HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetc=
ontent/ipc/index.html"
-SECTION =3D "devel"
-LICENSE =3D "BSD"=20
-LIC_FILES_CHKSUM =3D "file://ipc_${PV}_manifest.html;md5=3D573f5a5c0448d28=
bf8db35f438244d7f"
-
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
-
-PV =3D "1_24_00_16"
-
-S =3D "${WORKDIR}/ipc_${PV}"
-
-SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetco=
ntent/ipc/${PV}/exports/ipc_setuplinux_${PV}.bin;name=3Dipcbin \
-           file://ipc.pc"
-
-DEPENDS =3D "ti-sysbios ti-cgt6x ti-xdctools"
-
-BINFILE=3D"ipc_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS=3D"Y: q:workdir:Y"
-
-do_configure() {
-    sed -i -e s:@VERSION@:${PV}:g ${WORKDIR}/ipc.pc
-   =20
-    cp ${WORKDIR}/ipc.pc ${S}
-}
-
-do_install() {
-    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
-  =20
-    install -d ${D}/${libdir}/pkgconfig
-    install ${S}/ipc.pc ${D}/${libdir}/pkgconfig/
-}
-
-FILES_${PN}-dev =3D "${libdir}/*"
-
-SRC_URI[ipcbin.md5sum] =3D "d2f7cc82310d555ca039dcd353bd94c5"
-SRC_URI[ipcbin.sha256sum] =3D "96df7835e920c7dabcd63d30ec8bc2aea7cd0c6197c=
9fb9ca0f8a9b681aa5396"
diff --git a/recipes-ti/ipc/ti-ipc_3.00.00.bb b/recipes-ti/ipc/ti-ipc_3.00.=
00.bb
deleted file mode 100644
index a6922c0..0000000
--- a/recipes-ti/ipc/ti-ipc_3.00.00.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ti-ipc.inc
-
-# For this version of IPC the PLATFORM value is lowercase -PLATFORM_keysto=
ne =3D "tci6638"
-
-# The following commit corresponds to 3.00.04.29 -SRCREV =3D "12794ea33870=
b782bffe1fe4398e86e93fb64396"
diff --git a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb b/recipes-ti/ipc/ti-ipc_3.=
21.00.07.bb
deleted file mode 100644
index 17cdab0..0000000
--- a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ti-ipc.inc
-
-# This commit corresponds to 3.21.00.07 -SRCREV =3D "c18fece0c9f0dc76361dc=
1ee11b7ee2417479847"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc_git.bb simil=
arity index 75% rename from recipes-ti/ipc/ti-ipc.inc rename to recipes-ti/=
ipc/ti-ipc_git.bb index 860f55f..185e58b 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -2,11 +2,22 @@ DESCRIPTION =3D "TI Inter Process Communication (IPC) Mec=
hanisms (for Uni- and Mul  HOMEPAGE=3D"http://processors.wiki.ti.com/index.=
php/Category:IPC"
=20
 LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://${S}/ipc-linux.mak;beginline=3D1;endline=3D30=
;md5=3Df2518e421e230f06fe6d449718d02edc"
+LIC_FILES_CHKSUM =3D "file://${S}/ipc-linux.mak;beginline=3D1;endline=3D30=
;md5=3Dabd112f156e5eb9b0f3e202e48747f9a"
=20
 DEPENDS +=3D "virtual/kernel"
=20
-PR =3D "r1"
+PV =3D "3.30.00.09"
+
+# This is the first version of the 3.30.00.09 # PR =3D "r0"
+
+BRANCH =3D "master"
+SRC_URI =3D "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit;branch=3D${BRA=
NCH} \
+           file://tiipclad-daemon.sh \
+           "
+SRCREV =3D "595bc3e3bbb2e7ec12a8287145d8e3929291e59d"
+
+S =3D "${WORKDIR}/git"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -22,20 +33,13 @@ DAEMON_keystone =3D "lad_tci6638"
=20
 inherit autotools pkgconfig update-rc.d
=20
-SRC_URI =3D "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit \
-           file://0002-ipc-Added-installation-prefix-feature-to-products.m=
a.patch \
-           file://tiipclad-daemon.sh \
-           "
-
-S =3D "${WORKDIR}/git"
-
 INITSCRIPT_NAME =3D "tiipclad-daemon.sh"
 INITSCRIPT_PARAMS =3D "defaults 10"
=20
-EXTRA_OEMAKE +=3D "KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR} TOOLCHAIN_IN=
STALL_DIR=3D${TOOLCHAIN_PATH} TOOLCHAIN_LONGNAME=3D${TOOLCHAIN_SYS} PLATFOR=
M=3D${PLATFORM} PREFIX=3D${prefix}"
+EXTRA_OECONF +=3D "PLATFORM=3D${PLATFORM} KERNEL_INSTALL_DIR=3D${STAGING_K=
ERNEL_DIR}"
=20
 do_configure() {
-    oe_runmake -f ${S}/ipc-linux.mak config
+    oe_runconf
 }
=20
 do_install_append() {
--
1.7.9.5



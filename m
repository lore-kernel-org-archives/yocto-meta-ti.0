Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30F5DE0027E
	for <meta-ti@yoctoproject.org>; Mon,  8 Oct 2012 08:00:28 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q98F0M2e025284;
	Mon, 8 Oct 2012 10:00:22 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q98F0Mm6005224;
	Mon, 8 Oct 2012 10:00:22 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 8 Oct 2012 10:00:22 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH v2] bt-firmware: Port bt-firmware recipe
Thread-Index: AQHNpWU5fXWMmqTOEUWEf5WSilTdEZevgBhQ
Date: Mon, 8 Oct 2012 15:00:21 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2FF499@DFLE09.ent.ti.com>
References: <1349709981-5570-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349709981-5570-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2] bt-firmware: Port bt-firmware recipe
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
X-List-Received-Date: Mon, 08 Oct 2012 15:00:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore. I will probably need to make a similar change to this recipe but I =
grabbed the wrong patch. Comments were for the bt-enable recipe

-----Original Message-----
From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]=20
Sent: Monday, October 08, 2012 10:26 AM
To: meta-ti@yoctoproject.org
Cc: Cooper Jr., Franklin
Subject: [PATCH v2] bt-firmware: Port bt-firmware recipe

* Port bt-firmware recipe from arago.
* Bt-firmware provides the bluetooth firmware for the TI wl12xx
  Wi+Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Update ordering based on OE Styling Guide:
    http://www.openembedded.org/wiki/Styleguide
Remove unneeded DEPENDS and PACKAGE_ARCH setting Use updated package strip =
syntax.
Remove the machine da850-omapl138-evm from the recipe Remove tab from oe_ru=
nmake Appending to EXTRA_OEMAKE instead of overriding it

 ...001-Makefile-allow-building-within-the-OE.patch |   49 ++++++++++++++++=
++++
 recipes-bsp/bt-firmware/bt-firmware_git.bb         |   41 ++++++++++++++++
 2 files changed, 90 insertions(+), 0 deletions(-)  create mode 100644 reci=
pes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.=
patch
 create mode 100644 recipes-bsp/bt-firmware/bt-firmware_git.bb

diff --git a/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-buildi=
ng-within-the-OE.patch b/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-=
allow-building-within-the-OE.patch
new file mode 100644
index 0000000..49caa85
--- /dev/null
+++ b/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-w
+++ ithin-the-OE.patch
@@ -0,0 +1,49 @@
+From 8f226ccc9d2cbd10d454e131376c35f502a45e3b Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Wed, 7 Mar 2012 14:11:42 -0600
+Subject: [PATCH] Makefile: allow building with OE
+
+* Use defaults and source values that allow building this
+  component with OE.
+
+Upstread-Status: Pending
+    * Will be accepted into next release
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ Makefile |   21 +++++++++++++++++++++
+ 1 files changed, 21 insertions(+), 0 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9035e40..bd94881 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,26 @@
+ # Installs the the Bluetooth firmware files into the root file system
+
++-include ../../../Rules.make
++
++# If KERNEL_DIR is not set then use the default in Rules.make DEST_DIR=20
++?=3D ${DESTDIR}
++
++PLATFORM ?=3D "unknown"
++MACHINE_NAME ?=3D "unknown"
++
++ifeq ($(PLATFORM), am335x-evm)
++    MACHINE_NAME :=3D am335x
++endif
++ifeq ($(PLATFORM), am180x-evm)
++    MACHINE_NAME :=3D am1808
++endif
++ifeq ($(PLATFORM), da850-omapl138-evm)
++    MACHINE_NAME :=3D am1808
++endif
++ifeq ($(PLATFORM), am37x-evm)
++    MACHINE_NAME :=3D omap3evm
++endif
++
+ install:
+	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
+	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
+--
+1.7.0.4
diff --git a/recipes-bsp/bt-firmware/bt-firmware_git.bb b/recipes-bsp/bt-fi=
rmware/bt-firmware_git.bb
new file mode 100644
index 0000000..f6888d4
--- /dev/null
+++ b/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION =3D "Firmware files for Bluetooth"
+LICENSE =3D "TI-TSPA"
+LIC_FILES_CHKSUM =3D "file://am335x/LICENCE;md5=3Dba590e1d103f891d01516090=
46aef9e8 \
+                    file://am1808/LICENCE;md5=3Dba590e1d103f891d0151609046=
aef9e8 \
+                   =20
+file://omap3evm/LICENCE;md5=3Dba590e1d103f891d0151609046aef9e8 \ "
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+# This recipe provides the latest firmware files for wl12xx.
+# Therefore, use the contents of this recipe instead of the contents #=20
+of linux-firmware-wl12xx.
+RCONFLICTS_${PN} =3D "linux-firmware-wl12xx"
+RREPLACES_${PN}  =3D "linux-firmware-wl12xx"
+
+PR =3D "r0+gitr${SRCREV}"
+
+COMPATIBLE_MACHINE =3D "omap3|omapl138|da850-omapl138-evm|ti33x"
+
+SRCREV =3D "db43d1f05efda9777d7ac1ac366637e29e21f77f"
+SRC_URI =3D "git://github.com/TI-ECS/bt-firmware.git;protocol=3Dgit \
+           file://0001-Makefile-allow-building-within-the-OE.patch"
+
+PLATFORM =3D "unknown"
+PLATFORM_ti33x =3D "am335x-evm"
+PLATFORM_omap3 =3D "am37x-evm"
+PLATFORM_omapl138 =3D "am180x-evm"
+PLATFORM_da850-omapl138-evm =3D "am180x-evm"
+
+S =3D "${WORKDIR}/git"
+
+do_compile() {
+	:
+}
+
+do_install() {
+    install -d ${D}${base_libdir}/firmware
+	oe_runmake 'DEST_DIR=3D${D}' 'BASE_LIB_DIR=3D${base_libdir}'=20
+'PLATFORM=3D${PLATFORM}' install }
+
+FILES_${PN} +=3D "${base_libdir}/firmware"
--
1.7.0.4



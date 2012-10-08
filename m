Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B444BE0027E
	for <meta-ti@yoctoproject.org>; Mon,  8 Oct 2012 08:06:39 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q98F6clI006433;
	Mon, 8 Oct 2012 10:06:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q98F6c92012766;
	Mon, 8 Oct 2012 10:06:38 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 8 Oct 2012 10:06:38 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH v2] bt-enable: Add bt-enable recipe
Thread-Index: AQHNpWYKsO2ve8fva0SOSUiqB/rRpJevgXbw
Date: Mon, 8 Oct 2012 15:06:37 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2FF4DC@DFLE09.ent.ti.com>
References: <1349710367-6810-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349710367-6810-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2] bt-enable: Add bt-enable recipe
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
X-List-Received-Date: Mon, 08 Oct 2012 15:06:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If there are any other issues with the actual recipe let me know.

-----Original Message-----
From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]=20
Sent: Monday, October 08, 2012 10:33 AM
To: meta-ti@yoctoproject.org
Cc: Cooper Jr., Franklin
Subject: [PATCH v2] bt-enable: Add bt-enable recipe

* Port bt-enable recipe from arago.
* Bt-enable is used to enable the BT module on the TI wl12xx
  Wi-Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Update ordering based on OE Styling Guide:
    http://www.openembedded.org/wiki/Styleguide
Remove unneeded DEPENDS and PACKAGE_ARCH Use updated package strip syntax.
Remove the machine da850-omapl138-evm from the recipe.
Remove tab from oe_runmake
Appending to EXTRA_OEMAKE instead of overriding it

 ...kefile-Update-makefile-to-work-well-in-OE.patch |   78 ++++++++++++++++=
++++
 recipes-bsp/bt-enable/bt-enable_1.0.bb             |   32 ++++++++
 2 files changed, 110 insertions(+), 0 deletions(-)  create mode 100644 rec=
ipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-=
OE.patch
 create mode 100644 recipes-bsp/bt-enable/bt-enable_1.0.bb

diff --git a/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-=
to-work-well-in-OE.patch b/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Up=
date-makefile-to-work-well-in-OE.patch
new file mode 100644
index 0000000..7e6756c
--- /dev/null
+++ b/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-w
+++ ork-well-in-OE.patch
@@ -0,0 +1,78 @@
+From a400ac3d83023a66a356d056899d6b380cb30473 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Wed, 7 Mar 2012 10:51:43 -0600
+Subject: [PATCH] Makefile: Update makefile to work with OE
+
+* Updated the makefile to with OE
+* Use the kernel install target for installing the module
+
+Upstream-Status: Pending
+    * will be in next release
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ Makefile |   45 ++++++++++++++++++++++++++++++++++++++++-----
+ 1 files changed, 40 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ebbcd11..b17d33e 100755
+--- a/Makefile
++++ b/Makefile
+@@ -7,15 +7,50 @@ else
+   EXTRA_CFLAGS +=3D -O2
+ endif
+
++-include ../../../Rules.make
++
++# If KERNEL_DIR is not set then use the default in Rules.make=20
++KERNEL_DIR ?=3D ${LINUXKERNEL_INSTALL_DIR} DEST_DIR ?=3D ${DESTDIR}
++
++PLATFORM ?=3D "unknown"
++MACHINE_NAME ?=3D "unknown"
++
++# Use the PLATFORM value from the Rules.make if it was sourced ifeq=20
++($(PLATFORM), am335x-evm)
++    MACHINE_NAME :=3D "am335x"
++endif
++ifeq ($(PLATFORM), am180x-evm)
++    MACHINE_NAME :=3D "am1808"
++endif
++ifeq ($(PLATFORM), da850-omapl138-evm)
++    MACHINE_NAME :=3D "am1808"
++endif
++ifeq ($(PLATFORM), am37x-evm)
++    MACHINE_NAME :=3D "omap3evm"
++endif
++
++# If CROSS_COMPILE is not set by Rules.make then set a sane default=20
++CROSS_COMPILE ?=3D arm-arago-linux-gnueabi- export CROSS_COMPILE
++
++# set the INSTALL_MOD_DIR so that the executables won't be placed in=20
++extra INSTALL_MOD_DIR =3D kernel/drivers/bt_enable export=20
++INSTALL_MOD_DIR
++
+ obj-m :=3D gpio_en.o
+
++MAKE_ENV =3D ARCH=3Darm
++
+ PWD :=3D $(shell pwd)
+ all:
+-	pwd
+-	@echo EXTRA_CFLAGS =3D $(EXTRA_CFLAGS)
+-	$(MAKE) CROSS_COMPILE=3D$(CROSS_COMPILE) ARCH=3D$(ARCH) EXTRA_CFLAGS=3D"=
$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) M=3D$(PWD) modules
++	@cp -f gpio_en_${MACHINE_NAME}.c gpio_en.c
++	$(MAKE) EXTRA_CFLAGS=3D"$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) $(MAKE_ENV) \
++    M=3D$(PWD) modules
++
+ install:
+-	install -d ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers=
/bt_enable
+-	install -m 0755 ./gpio_en.ko ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_V=
ER}/kernel/drivers/bt_enable
++	$(MAKE) EXTRA_CFLAGS=3D"$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) $(MAKE_ENV) \
++    M=3D$(PWD) INSTALL_MOD_PATH=3D"${DEST_DIR}" modules_install
++
+ clean:
+	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions *.symvers
+--
+1.7.0.4
diff --git a/recipes-bsp/bt-enable/bt-enable_1.0.bb b/recipes-bsp/bt-enable=
/bt-enable_1.0.bb
new file mode 100644
index 0000000..27d8e1d
--- /dev/null
+++ b/recipes-bsp/bt-enable/bt-enable_1.0.bb
@@ -0,0 +1,32 @@
+DESCRIPTION =3D "BT GPIO Enable"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://gpio_en_am1808.c;beginline=3D1;endline=3D34;m=
d5=3Dfe94639d8f61c867d1bc4bf61473d3cd \
+                    file://gpio_en_am335x.c;beginline=3D1;endline=3D34;md5=
=3Dfe94639d8f61c867d1bc4bf61473d3cd \
+                   =20
+file://gpio_en_omap3evm.c;beginline=3D1;endline=3D34;md5=3Dfe94639d8f61c86=
7d1bc4bf61473d3cd \ "
+COMPATIBLE_MACHINE =3D "omap3|omapl138|ti33x"
+
+PR =3D "r0+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append =3D "a"
+
+SRCREV =3D "97c4600ff7d39f1cc6079939248cd9ed15100db4"
+
+SRC_URI =3D "git://github.com/TI-ECS/bt_enable.git;protocol=3Dgit \
+          =20
+file://0001-Makefile-Update-makefile-to-work-well-in-OE.patch \ "
+
+S =3D "${WORKDIR}/git"
+
+inherit module
+
+INHIBIT_PACKAGE_STRIP =3D "1"
+
+PLATFORM_ti33x =3D "am335x-evm"
+PLATFORM_omap3 =3D "am37x-evm"
+PLATFORM_omapl138 =3D "am180x-evm"
+
+EXTRA_OEMAKE +=3D "KERNEL_DIR=3D${STAGING_KERNEL_DIR} PLATFORM=3D${PLATFOR=
M}"
+
+do_install () {
+    oe_runmake 'DEST_DIR=3D${D}' install
+}
--
1.7.0.4



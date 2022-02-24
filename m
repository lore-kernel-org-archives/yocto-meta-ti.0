Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.125.1645723887819208435
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 09:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5795C40C30;
	Thu, 24 Feb 2022 17:31:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EgZiNZjC5ebp; Thu, 24 Feb 2022 17:31:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3A02E40BEB;
	Thu, 24 Feb 2022 17:31:25 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 04AE61747A2;
	Thu, 24 Feb 2022 12:31:25 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] meta-ti: convert licenses to SPDX format
Date: Thu, 24 Feb 2022 17:31:24 +0000
Message-Id: <20220224173124.2136529-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Update LICENSE variable to use SPDX license identifiers.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/cmem/cmem.inc                           | 2 +-
 .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb      | 2 +-
 .../powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb         | 2 +-
 .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb   | 2 +-
 .../recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb   | 2 +-
 .../recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb   | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc                    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb       | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb       | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb        | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb     | 2 +-
 meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb | 2 +-
 meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb        | 2 +-
 .../wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb        | 2 +-
 meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb      | 2 +-
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb            | 2 +-
 .../recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb    | 2 +-
 .../recipes-ti/beagleboard/beaglebone-getting-started.bb        | 2 +-
 .../recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb   | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc       | 2 +-
 meta-ti-extras/recipes-ti/xdais/ti-xdais.inc                    | 2 +-
 21 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc b/meta-ti-bsp/recipes-=
bsp/cmem/cmem.inc
index aaed8f06..99717f87 100644
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
+++ b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
@@ -1,6 +1,6 @@
 HOMEPAGE =3D "http://processors.wiki.ti.com/index.php/Category:CMEM"
=20
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://include/ti/cmem.h;beginline=3D1;endline=3D3=
0;md5=3D26be509e4bb413905bda8309e338e2b1"
=20
 BRANCH =3D "master"
diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11=
.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.=
bb
index e815ae29..f7771caf 100644
--- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Kernel drivers for the Vivante GC320 chipset found in T=
I SoCs"
 HOMEPAGE =3D "https://git.ti.com/graphics/ti-gc320-driver"
-LICENSE =3D "MIT | GPLv2"
+LICENSE =3D "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D78d9818a51b9a8e9bb89dea418=
bac297"
=20
 inherit module features_check
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
1.13.5776728.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_1.13.5776728.bb
index 09f6f03a..6ed3a40b 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.57=
76728.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.57=
76728.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D  "Kernel drivers for the PowerVR Rogue GPU found in the =
TI SoCs"
 HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-driver"
-LICENSE =3D "MIT | GPLv2"
+LICENSE =3D "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D04=
03c7dea01a2b8232261e805325fac2"
=20
 inherit module features_check
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4=
948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.49=
48957.bb
index 5fe6c201..2ec2ffef 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D  "Kernel drivers for the PowerVR SGX chipset found in th=
e TI SoCs"
 HOMEPAGE =3D "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
-LICENSE =3D "MIT | GPLv2"
+LICENSE =3D "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://eurasia_km/README;beginline=3D13;endline=3D=
22;md5=3D74506d9b8e5edbce66c2747c50fcef12"
=20
 inherit module features_check
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app=
_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_=
1.0.0.bb
index 9fb473b7..718fdbe1 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.=
bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.=
bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Test applications for TI DEC (v4l2 decoder for IMG D5520)"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://main.c;beginline=3D1;endline=3D14;md5=3Df17=
e17d664f72942124e4fcf06c178ee"
=20
 DEPENDS =3D "libdrm ffmpeg"
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app=
_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_=
1.0.0.bb
index 3a128b92..4dc81c54 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.=
bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.=
bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Test applications for TI ENC (v4l2 encoder for IMG VXE384)"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://main.c;beginline=3D1;endline=3D14;md5=3D354=
5dd5bdf513840937d38c10b866605"
=20
 DEPENDS =3D "libdrm"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index 7ffc1f27..a5b24f49 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -20,7 +20,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/u-boot:"
=20
 SUMMARY =3D "u-boot bootloader for TI devices"
=20
-LICENSE =3D "GPLv2+"
+LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D30503fd321432fc713238=
f582193b78e"
=20
 BRANCH ?=3D "master"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 6fe21071..f7719e9b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -1,6 +1,6 @@
 SECTION =3D "kernel"
 SUMMARY =3D "Mainline Linux kernel for TI devices (with ti-upstream-tool=
s)"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
=20
 inherit kernel
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 09551e03..6ca3db54 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -1,6 +1,6 @@
 SECTION =3D "kernel"
 SUMMARY =3D "Linux kernel for TI devices"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
=20
 inherit kernel
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb b/m=
eta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
index fbfa497f..9b2d1be1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -1,6 +1,6 @@
 SECTION =3D "kernel"
 SUMMARY =3D "Linux kernel for TI devices"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
=20
 inherit kernel
diff --git a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb =
b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
index a250b825..51e82983 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Debug Sub-System (DebugSS) driver for Keystone and DRA7=
xx devices"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D9d4316fe434ba450dca4da253=
48ca5a3"
=20
 # This package builds a kernel module, use kernel PR as base and append =
a local
diff --git a/meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00=
.bb b/meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
index 98ab387c..449a9095 100644
--- a/meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
+++ b/meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Builds eDMA module used by eDMA libraries for PRU sw ex=
ample applications"
 HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://edmautils.c;beginline=3D1;endline=3D23;md5=3D=
312e9cb8a37a044c617c98a9e980ad1b"
=20
 COMPATIBLE_MACHINE =3D "omapl138"
diff --git a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb b/m=
eta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
index 72e2166f..8d4f9182 100644
--- a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
+++ b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Shared Transport Line Discipline User Mode initialisati=
on Manager Daemon"
-LICENSE =3D "GPLv2+"
+LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://uim.c;beginline=3D1;endline=3D18;md5=3D9f0b=
bfbc10c67689e81a523e2976c31e"
=20
 INITSCRIPT_NAME =3D "uim-sysfs"
diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl=
18xx-target-scripts_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx=
-target-scripts/wl18xx-target-scripts_8.7.3.bb
index 2a44fa84..e553ff49 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-ta=
rget-scripts_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-ta=
rget-scripts_8.7.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Scripts and configuration files for TI wireless drivers=
"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D1;endline=3D21;md5=3Db8d=
6a0865f50159bf5c0d175d1f4a705"
=20
 # Tag: R8.7_SP3 (8.7.3)
diff --git a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb b=
/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
index 39d38853..477c5a96 100644
--- a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Configuration utility for TI wireless drivers"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D1;endline=3D21;md5=3Dadc=
05a1903d3f107f85c90328e3a9438"
=20
 # Tag: R8.7_SP3 (8.7.3)
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-=
ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index df9aaee9..d3ada9c6 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "GNU debugger for TI C6X DSP."
 SECTION =3D "devel"
-LICENSE =3D "GPLv3+"
+LICENSE =3D "GPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dbf0fe2872eb3dfeebb2c=
be38206fe81f"
=20
 DEPENDS =3D "ncurses bison-native texinfo flex-native gettext"
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module=
-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-modul=
e-drv_git.bb
index 168e4be3..cb9e4c24 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_gi=
t.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_gi=
t.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Interface for GDB to commincate witha TI C66X DSP"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D75859989545e37968a99b631e=
f42722e"
=20
 # This package builds a kernel module, use kernel PR as base and append =
a local
diff --git a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-sta=
rted.bb b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-starte=
d.bb
index 25538ace..85ab861d 100644
--- a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
+++ b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
@@ -4,7 +4,7 @@ PR =3D "r22"
=20
 inherit allarch
=20
-LICENSE =3D "CC-BY-SA-3.0 & GPLv3+ & MIT & PD"
+LICENSE =3D "CC-BY-SA-3.0 & GPL-3.0-or-later & MIT & PD"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df6f02761e31334c48f7021fb9=
4c89aaa"
=20
 SRCREV =3D "05bedba192646152b7bc80b0accaea75aef864e5"
diff --git a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-=
q2-update.bb b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-201=
8-q2-update.bb
index e0feb02c..64bac240 100644
--- a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-upda=
te.bb
+++ b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-upda=
te.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Baremetal GCC for ARM"
-LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
+LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://share/doc/gcc-arm-none-eabi/license.txt;md5=
=3Df77466c63f5787f4bd669c402aabe061"
=20
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc b/=
meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
index f97a40ce..7051fccc 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "TI XDCtools (RTSC - Real Time Software Components - htt=
p://rtsc.eclipse.org)"
 HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/rtsc"
 SECTION =3D "devel"
-LICENSE =3D "BSD-3-Clause & GPLv2"
+LICENSE =3D "BSD-3-Clause & GPL-2.0-only"
=20
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
diff --git a/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc b/meta-ti-extra=
s/recipes-ti/xdais/ti-xdais.inc
index daa93ddf..67d19022 100644
--- a/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
+++ b/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "TI eXpress DSP Algorithm Interface Standard (XDAIS) spe=
cification"
 HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/xdais"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 SECTION =3D "devel"
=20
 require ../includes/ti-paths.inc
--=20
2.25.1


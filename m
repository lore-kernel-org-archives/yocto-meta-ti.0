Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8944.1645503247241037187
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 819F340C79
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nu7_bCyTGfsE for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 930E240C8A
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 634CC17476E
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 12/17] meta-ti: update ambiguous "BSD" license with "BSD-3-Clause"
Date: Tue, 22 Feb 2022 04:13:56 +0000
Message-Id: <20220222041401.2840172-13-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core recently removed ambiguous "BSD" license[1] in order for recipes =
to
be more specific and use the exact variants of BSD. Update meta-ti recipe=
s
with "BSD-3-Clause" as that was the previous default.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D14d4c007c=
49652d836d325a12bdbcd3bfa42e6d5

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc       | 2 +-
 meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb              | 2 +-
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc                           | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb                 | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb                 | 2 +-
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb                | 2 +-
 meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb     | 2 +-
 meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.bb   | 2 +-
 meta-ti-extras/recipes-ti/bios/ti-sysbios.inc                   | 2 +-
 .../recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb       | 2 +-
 meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb               | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb         | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc       | 2 +-
 .../recipes-ti/framework-components/ti-framework-components.inc | 2 +-
 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc               | 2 +-
 meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb        | 2 +-
 meta-ti-extras/recipes-ti/osal/ti-osal.inc                      | 2 +-
 meta-ti-extras/recipes-ti/swtools/swtools_git.bb                | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc b/=
meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
index 8081d021..2c22e0cf 100644
--- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -1,4 +1,4 @@
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2b7c96eb2aed7b0f6f922214d=
bde9016"
=20
 BRANCH =3D "master"
diff --git a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb b/meta-ti=
-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
index 92c425b1..9447f44d 100644
--- a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "VPE test program"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74d2f71d8898c54e3d1c9d0058c48=
4aa"
=20
 DEPENDS =3D "virtual/kernel vpdma-fw"
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc b/meta-ti-bsp/recipes-=
ti/ipc/ti-ipc.inc
index 34278d4b..3f6b7bce 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "TI Inter Process Communication (IPC) Mechanisms (for Un=
i- and Multi- Processor Configurations)"
 HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:IPC"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://${S}/ipc-linux.mak;beginline=3D1;endline=3D=
30;md5=3D7b327f9b710fd7c95e545b91cec79255"
=20
 TI_IPC_GIT_URI =3D "git://git.ti.com/ipc/ipcdev.git"
diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-ex=
tras/recipes-bsp/dsptop/dsptop_git.bb
index 20818443..e8853ff8 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "TI dsptop utility."
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D309825aa8f5edfcf2c44=
912ac094b979"
=20
 DEPENDS =3D "libulm ncurses"
diff --git a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-ex=
tras/recipes-bsp/dsptop/libulm_git.bb
index f3e7ec3c..6a2cde30 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "TI Usage & Load Monitor Implementation"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://../debian/copyright;md5=3D309825aa8f5edfcf2=
c44912ac094b979"
=20
 inherit features_check
diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx=
-calibrator_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-calibra=
tor/wl18xx-calibrator_8.7.3.bb
index 50eaa1c1..1b9710af 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibr=
ator_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibr=
ator_8.7.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "The calibrator utility for TI wireless solution based o=
n wl18xx driver"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4725015cb0be7be389cf06deeae36=
83d"
=20
 DEPENDS =3D "libnl"
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb =
b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
index fab4fbd2..3460eadb 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "TI gdb-server to be used with c6xgdb."
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://../debian/copyright;md5=3D82c616b6c8f9c11c4=
6feaaf8f9a11495"
=20
 DEPENDS =3D "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios=
 ti-xdctools-native"
diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.b=
b b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.bb
index 42482c11..a6dc1d1d 100644
--- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.bb
+++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Library for remotely invoking HW accelerated codecs on IVA-=
HD"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://libdce.h;beginline=3D1;endline=3D31;md5=3D0=
a398cf815b8b5f31f552266cd453dae"
=20
 inherit autotools pkgconfig
diff --git a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc b/meta-ti-extr=
as/recipes-ti/bios/ti-sysbios.inc
index 0009dfcc..f31decec 100644
--- a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
+++ b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "TI SYS/BIOS v6 Kernel"
 HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/bios/sysbios"
 SECTION =3D "devel"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
diff --git a/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.=
00.08.bb b/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00=
.08.bb
index 5851b899..2e25ea76 100644
--- a/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.b=
b
+++ b/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.b=
b
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Codec Engine for TI ARM/DSP processors"
 HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/ce"
 SECTION =3D "devel"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
diff --git a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb b/meta-ti-=
extras/recipes-ti/ctoolslib/libaet_git.bb
index c15ab229..ece07183 100644
--- a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
+++ b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "TI Emulation CTools AET library"
 DESCRIPTION =3D "The AETLIB library provides programmatic access to the =
Advanced Event Triggering capability on C6x processor cores"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 PV =3D "4.19.0.0"
=20
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb b/me=
ta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
index 8e36be6d..c7608a76 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "TI CG_XML"
 HOMEPAGE =3D "http://software-dl.ti.com/ccs/non-esd/releases/other/appli=
cations_packages/cg_xml/index.htm"
 SECTION =3D "devel"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc b/=
meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
index 3caf7b8d..f97a40ce 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "TI XDCtools (RTSC - Real Time Software Components - htt=
p://rtsc.eclipse.org)"
 HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/rtsc"
 SECTION =3D "devel"
-LICENSE =3D "BSD & GPLv2"
+LICENSE =3D "BSD-3-Clause & GPLv2"
=20
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
diff --git a/meta-ti-extras/recipes-ti/framework-components/ti-framework-=
components.inc b/meta-ti-extras/recipes-ti/framework-components/ti-framew=
ork-components.inc
index e8b7c414..81407ed7 100644
--- a/meta-ti-extras/recipes-ti/framework-components/ti-framework-compone=
nts.inc
+++ b/meta-ti-extras/recipes-ti/framework-components/ti-framework-compone=
nts.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "TI Framework Components"
 HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/fc"
 SECTION =3D "devel"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 require recipes-ti/includes/ti-paths.inc
=20
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc b/meta-ti-=
extras/recipes-ti/ipc/ti-ipc-examples.inc
index c34a6078..09352505 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
@@ -2,7 +2,7 @@ HOMEPAGE =3D "http://processors.wiki.ti.com/index.php/Cat=
egory:IPC"
 require recipes-ti/ipc/ti-ipc-common.inc
 require ti-ipc-rtos.inc
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://${S_ipc-examples}/src/makefile;beginline=3D=
1;endline=3D30;md5=3Da52324bd5033bb49ea07bade1244ac9a"
=20
 INSANE_SKIP:${PN} +=3D "arch"
diff --git a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/m=
eta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 59a9635d..7c4a3409 100644
--- a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "TI OpenMP RTOS"
 HOMEPAGE =3D "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 require recipes-ti/includes/ti-paths.inc
=20
diff --git a/meta-ti-extras/recipes-ti/osal/ti-osal.inc b/meta-ti-extras/=
recipes-ti/osal/ti-osal.inc
index dbd64f7b..b0470793 100644
--- a/meta-ti-extras/recipes-ti/osal/ti-osal.inc
+++ b/meta-ti-extras/recipes-ti/osal/ti-osal.inc
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "TI Operating System Abstraction Library (OSAL)"
 HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/osal"
-LICENSE =3D "BSD & EPL-1.0"
+LICENSE =3D "BSD-3-Clause & EPL-1.0"
 SECTION =3D "devel"
=20
 require ../includes/ti-paths.inc
diff --git a/meta-ti-extras/recipes-ti/swtools/swtools_git.bb b/meta-ti-e=
xtras/recipes-ti/swtools/swtools_git.bb
index d3b9a9b1..a4cb1053 100644
--- a/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
+++ b/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "TI Software Tools"
 HOMEPAGE =3D "https://git.ti.com/ep-processor-libraries/swtools"
 SECTION =3D "devel"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://ti/mas/swtools/copyright.txt;md5=3Db1f52a14=
35051fdb18f8885b0384147d"
=20
 require ../includes/ti-paths.inc
--=20
2.25.1


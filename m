Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60854C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:58:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32408.1784663903619187957
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 12:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 73FD940CB1;
	Tue, 21 Jul 2026 19:58:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5KgEaKTFuyFG; Tue, 21 Jul 2026 19:58:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 29C0E40BD6;
	Tue, 21 Jul 2026 19:58:20 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 3A36817416B;
	Tue, 21 Jul 2026 15:58:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH v3] recipes: Convert to SPDX license strings
Date: Tue, 21 Jul 2026 15:58:18 -0400
Message-Id: <20260721195818.18455-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 19:58:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20183

From: Ryan Eatmon <reatmon@ti.com>

Converts all LICENSE strings to SPDX licenses expressions

Rename Stream-Benchmark-License to replace underscores with dashes,
per SPDX syntax.

Expand previously mapped "Foo-with-exception" into proper SPDX
"Foo WITH Exception" syntax.

License-Update: No change, just reformatting to SPDX syntax

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
v3 changes vs v2:
1) clarify Stream Benchmark license rename
2) update "Foo WITH exception" licenses from non-SPDX mapping
3) drop old recipes being removed to avoid conflicts

 meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb  | 2 +-
 meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb         | 2 +-
 meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb      | 2 +-
 .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb      | 2 +-
 .../powervr-drivers/ti-img-rogue-driver_25.3.6908880.bb         | 2 +-
 .../powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb         | 2 +-
 .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb   | 2 +-
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb                    | 2 +-
 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb                  | 2 +-
 meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb  | 2 +-
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc             | 2 +-
 meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb              | 2 +-
 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb      | 2 +-
 .../recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb      | 2 +-
 meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb               | 2 +-
 meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb            | 2 +-
 meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb  | 2 +-
 .../powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb          | 2 +-
 .../powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb          | 2 +-
 .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb                | 2 +-
 meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.bb   | 2 +-
 meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb                   | 2 +-
 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb           | 2 +-
 meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb             | 2 +-
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb                  | 2 +-
 meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb    | 2 +-
 .../recipes-ti/beagleboard/beaglebone-getting-started.bb        | 2 +-
 .../recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb   | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb        | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb          | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb            | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb            | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb    | 2 +-
 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc            | 2 +-
 meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc                    | 2 +-
 .../{Stream_Benchmark_License =3D> Stream-Benchmark-License}      | 0
 meta-ti-test/recipes-benchmark/stream/stream_5.10.bb            | 2 +-
 meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb    | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc          | 2 +-
 meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb          | 2 +-
 .../recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb         | 2 +-
 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb    | 2 +-
 42 files changed, 41 insertions(+), 41 deletions(-)
 rename meta-ti-test/licenses/{Stream_Benchmark_License =3D> Stream-Bench=
mark-License} (100%)

diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.=
bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index b25e04d2..023eb914 100644
--- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Cadence MHDP DP bridge firmware"
=20
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
=20
-LICENSE =3D "BSD-3-Clause | Apache-2.0"
+LICENSE =3D "Apache-2.0 OR BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSES/LICENCE.cadence;md5=3D009f46816f69=
56cfb75ede13d3e1cee0"
=20
 PV =3D "${CADENCE_MHDP_FW_VERSION}"
diff --git a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/me=
ta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index db080c62..ce0ab176 100644
--- a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Cortex-M3 binary blob for suspend-resume"
=20
-LICENSE =3D "TI-TSPA"
+LICENSE =3D "LicenseRef-TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D7bdc54a749ab7a7dea999d25d=
99a41b8"
=20
 PV =3D "1.9.2"
diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b=
/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index 4e379c5d..272b850b 100755
--- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "R5 PSDK CPSW9G Ethernet Switch Firmware"
=20
-LICENSE =3D "TI-TFL"
+LICENSE =3D "LicenseRef-TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3D04ad0a015d4bb63c2b9e7b112d=
ebf3db"
=20
 PV =3D "6.2+git"
diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11=
.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.=
bb
index 336f4ce4..ab0df0a5 100644
--- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Kernel drivers for the Vivante GC320 chipset found in TI So=
Cs"
 HOMEPAGE =3D "https://git.ti.com/graphics/ti-gc320-driver"
-LICENSE =3D "MIT | GPL-2.0-only"
+LICENSE =3D "GPL-2.0-only OR MIT"
 LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D78d9818a51b9a8e9bb89dea418=
bac297"
=20
 inherit module features_check
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
25.3.6908880.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_25.3.6908880.bb
index 190417ca..a095fcf9 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.69=
08880.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.69=
08880.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D  "Kernel drivers for the PowerVR Rogue GPU found in the TI S=
oCs"
 HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-driver"
-LICENSE =3D "MIT | GPL-2.0-only"
+LICENSE =3D "GPL-2.0-only OR MIT"
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D04=
03c7dea01a2b8232261e805325fac2"
=20
 inherit module
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
26.1.6967606.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_26.1.6967606.bb
index 876c3e50..3731cec6 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.69=
67606.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.69=
67606.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D  "Kernel drivers for the PowerVR Rogue GPU found in the TI S=
oCs"
 HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-driver"
-LICENSE =3D "MIT | GPL-2.0-only"
+LICENSE =3D "GPL-2.0-only OR MIT"
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D04=
03c7dea01a2b8232261e805325fac2"
=20
 inherit module
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4=
948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.49=
48957.bb
index 343f09de..e858d608 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
@@ -1,6 +1,6 @@
 SUMMARY =3D  "Kernel drivers for the PowerVR SGX chipset found in the TI=
 SoCs"
 HOMEPAGE =3D "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
-LICENSE =3D "MIT | GPL-2.0-only"
+LICENSE =3D "GPL-2.0-only OR MIT"
 LIC_FILES_CHKSUM =3D "file://GPL-COPYING;md5=3D60422928ba677faaa13d6ab5f=
5baaa1e"
=20
 inherit module
diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/r=
ecipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 2d9ad499..92671833 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI DM prebuilt binary firmware images"
=20
-LICENSE =3D "TI-TFL"
+LICENSE =3D "LicenseRef-TI-TFL"
 LIC_FILES_CHKSUM =3D "file://${THISDIR}/../../licenses/TI-TFL;md5=3Da1b5=
9cb7ba626b9dbbcbf00f3fbc438a"
=20
 COMPATIBLE_MACHINE =3D "k3"
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp=
/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index 04e43609..a985188c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI Ethernet prebuilt binary firmware images"
=20
-LICENSE =3D "TI-TFL"
+LICENSE =3D "LicenseRef-TI-TFL"
 LIC_FILES_CHKSUM =3D "file://${THISDIR}/../../licenses/TI-TFL;md5=3Da1b5=
9cb7ba626b9dbbcbf00f3fbc438a"
=20
 COMPATIBLE_MACHINE =3D "j721e|j7200|j784s4"
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.=
bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
index 74729c16..ebd3d868 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Video Decoding Firmware"
-LICENSE =3D "TI-IMG"
+LICENSE =3D "LicenseRef-TI-IMG"
 LIC_FILES_CHKSUM =3D "file://LICENSE.ti-img;md5=3D84ca7278930db001870686=
ad997d6bb1"
=20
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 982a3512..cfb8ac0d 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -1,6 +1,6 @@
 SUMMARY =3D "Common include for TI Linux firmware"
=20
-LICENSE =3D "TI-TFL"
+LICENSE =3D "LicenseRef-TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf95621259288c4=
a46d76"
=20
 PV =3D "2022.01"
diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
index c3d2bce4..5b022edd 100644
--- a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "PKA prebuilt binary firmware image"
=20
-LICENSE =3D "TI-TFL & INSIDE-Secure"
+LICENSE =3D "LicenseRef-INSIDE-Secure AND LicenseRef-TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENCE.pka_fw;md5=3Ddc20391b287874f0dce069=
cf87917206"
=20
 COMPATIBLE_MACHINE =3D "k3"
diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b=
/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
index 20c6b531..d5353e82 100644
--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI Echo Test prebuilt binary firmware images"
=20
-LICENSE =3D "TI-TFL"
+LICENSE =3D "LicenseRef-TI-TFL"
 LIC_FILES_CHKSUM =3D "file://${THISDIR}/../../licenses/TI-TFL;md5=3Da1b5=
9cb7ba626b9dbbcbf00f3fbc438a"
=20
 COMPATIBLE_MACHINE =3D "k3"
diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_=
git.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.=
bb
index 980fe5cc..26a2f665 100644
--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI MessageQ prebuilt binary firmware images"
=20
-LICENSE =3D "TI-TFL"
+LICENSE =3D "LicenseRef-TI-TFL"
 LIC_FILES_CHKSUM =3D "file://${THISDIR}/../../licenses/TI-TFL;md5=3Da1b5=
9cb7ba626b9dbbcbf00f3fbc438a"
=20
 COMPATIBLE_MACHINE =3D "am57xx"
diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-=
bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index 1b1cff6b..b088f589 100644
--- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Radio Application Firmware"
-LICENSE =3D "TI-TSPA"
+LICENSE =3D "LicenseRef-TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-M=
anifest.html;md5=3Da59aa54b9470f555cf086b91dca0afa3"
=20
 COMPATIBLE_MACHINE =3D "am57xx"
diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-=
ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
index 4c2ea375..6958c603 100644
--- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
+++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "VPDMA firmware for Video Input Port and Video Processing En=
gine"
=20
-LICENSE =3D "TI-TSPA"
+LICENSE =3D "LicenseRef-TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfd463c9500441ed91d07a0331baa6=
35c"
=20
 COMPATIBLE_MACHINE =3D "am57xx"
diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.=
bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 86aa71b8..563f72eb 100644
--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Userspace libraries for GC320 chipset on TI SoCs"
 HOMEPAGE =3D "https://git.ti.com/graphics/ti-gc320-libs"
-LICENSE =3D "TI-TSPA"
+LICENSE =3D "LicenseRef-TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://Manifest.html;md5=3Da9121e8936ace09820d23f7=
626daaca5"
=20
 inherit features_check
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-uml=
ibs_25.3.6908880.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_25.3.6908880.bb
index fad29691..f5f01633 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.=
3.6908880.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.=
3.6908880.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
 HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlibs"
-LICENSE =3D "TI-TFL"
+LICENSE =3D "LicenseRef-TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e=
76f"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-uml=
ibs_26.1.6967606.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_26.1.6967606.bb
index 29c5154f..a3c3c08a 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.=
1.6967606.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.=
1.6967606.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
 HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlibs"
-LICENSE =3D "TI-TFL"
+LICENSE =3D "LicenseRef-TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e=
76f"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.=
17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um=
_1.17.4948957.bb
index c4cc5f10..44c2a2c5 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948=
957.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948=
957.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Userspace libraries for PowerVR SGX chipset on TI SoCs"
 HOMEPAGE =3D "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
-LICENSE =3D "TI-TSPA"
+LICENSE =3D "LicenseRef-TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e=
76f"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.b=
b b/meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.bb
index 13599d99..70733c96 100644
--- a/meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "RPMsg DMA shared library"
-LICENSE =3D "TI-TFL"
+LICENSE =3D "LicenseRef-TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D91dc4ee6d125d0aaba4e5bd2fcc50=
ed3"
=20
 SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3D=
https;branch=3Dmain"
diff --git a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb b/meta-ti-extr=
as/recipes-bsp/bt-fw/bt-fw_git.bb
index 0d856362..ba767916 100644
--- a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Firmware files for Bluetooth"
-LICENSE =3D "TI-TSPA"
+LICENSE =3D "LicenseRef-TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df39eac9f4573be5b012e8313831e7=
2a9"
=20
 PV =3D "8.7.1+git"
diff --git a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb b/meta=
-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
index a4dfc4da..915ee64b 100644
--- a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Firmware files for use with TI cc33xx"
-LICENSE =3D "TI-TSPA"
+LICENSE =3D "LicenseRef-TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Ddf68504cbd0a4da1643ebcfd5783d=
bc9"
=20
 SRCREV =3D "0b4f850d6c0fd8e0fe0ae1d3e80ac6733aced29b"
diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-t=
i-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index fbc6d956..cc27df41 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Firmware for IPU to support Accelerated MM decode and encod=
e"
=20
-LICENSE =3D "TI-TSPA"
+LICENSE =3D "LicenseRef-TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://LICENCE.ti-tspa;md5=3Da1b59cb7ba626b9dbbcbf=
00f3fbc438a"
=20
 COMPATIBLE_MACHINE =3D "am57xx"
diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-ext=
ras/recipes-bsp/pru/pru-icss_git.bb
index b7066583..30ff2bcc 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Programmable Real-time Unit Software Package"
 HOMEPAGE =3D "http://processors.wiki.ti.com/index.php/PRU-ICSS"
-LICENSE =3D "BSD-3-Clause & PD"
+LICENSE =3D "BSD-3-Clause AND LicenseRef-PD"
=20
 LIC_FILES_CHKSUM =3D "file://PRU-Package-v6.1-Manifest.html;md5=3D1e3779=
7ebe9254922f4278bb6047211c"
=20
diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb=
 b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
index 3e61db88..b49ed736 100644
--- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
+++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Firmware files for use with TI wl18xx"
-LICENSE =3D "TI-TSPA"
+LICENSE =3D "LicenseRef-TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D4977a0fe767ee17765ae63c435a32=
a9e"
=20
 SRC_URI =3D "git://git.ti.com/git/wilink8-wlan/wl18xx_fw.git;protocol=3D=
https;branch=3D${BRANCH}"
diff --git a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-sta=
rted.bb b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-starte=
d.bb
index 8ad75f26..41eea044 100644
--- a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
+++ b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
@@ -4,7 +4,7 @@ PR =3D "r22"
=20
 inherit allarch
=20
-LICENSE =3D "CC-BY-SA-3.0 & GPL-3.0-or-later & MIT & PD"
+LICENSE =3D "CC-BY-SA-3.0 AND GPL-3.0-or-later AND MIT AND LicenseRef-PD=
"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df6f02761e31334c48f7021fb9=
4c89aaa"
=20
 SRCREV =3D "05bedba192646152b7bc80b0accaea75aef864e5"
diff --git a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-=
q2-update.bb b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-201=
8-q2-update.bb
index df34a39e..11b5c226 100644
--- a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-upda=
te.bb
+++ b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-upda=
te.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Baremetal GCC for ARM"
-LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
+LICENSE =3D "GPL-3.0-only AND GPL-3.0-or-later WITH GCC-exception-3.1"
=20
 LIC_FILES_CHKSUM =3D "file://share/doc/gcc-arm-none-eabi/license.txt;md5=
=3Df77466c63f5787f4bd669c402aabe061"
=20
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/m=
eta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
index 031d889f..07d7b6dc 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI ARM Code Generation Tools"
 HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/TICodegeneratio=
nTools/download.htm"
-LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause=
 & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-C=
lause"
+LICENSE =3D "AFL-3.0 AND BSD-2-Clause AND BSD-3-Clause AND BSD-4-Clause =
AND BSL-1.0 AND MIT AND LicenseRef-PD AND LicenseRef-Patrick-Powell AND L=
icenseRef-TI-TSPA AND LicenseRef-Thai-Open-Source-Software-Center"
=20
 LIC_FILES_CHKSUM =3D "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3D79631=
eb21b2e5b7190cd3ff1dfd41108"
=20
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb b/met=
a-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
index 7ef20b7a..b83064c6 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI PRU Code Generation Tools"
 HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/TICodegeneratio=
nTools/download.htm"
-LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause=
 & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
+LICENSE =3D "AFL-3.0 AND BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND M=
IT AND LicenseRef-Hewlett-Packard AND LicenseRef-PD AND LicenseRef-TI-TSP=
A AND LicenseRef-Thai-Open-Source-Software-Center"
=20
 LIC_FILES_CHKSUM =3D "file://${UNPACKDIR}/ti-cgt-pru_${PV}/PRU_Code_Gene=
ration_Tools_2.3.x_manifest.html;md5=3De22f9d8240f7cca0c0aa5242d9ffa5bc"
 LIC_FILES_CHKSUM:class-target =3D "file://usr/share/doc/ti/cgt-pru/PRU_C=
ode_Generation_Tools_2.3.x_manifest.html;md5=3De22f9d8240f7cca0c0aa5242d9=
ffa5bc"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/meta-=
ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
index 25e0f596..24157360 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI DSP Code Generation Tools"
 HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/TICodegeneratio=
nTools/download.htm"
-LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause=
 & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
+LICENSE =3D "AFL-3.0 AND BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND M=
IT AND LicenseRef-PD AND LicenseRef-Patrick-Powell AND LicenseRef-TI-TSPA=
 AND LicenseRef-Thai-Open-Source-Software-Center"
=20
 LIC_FILES_CHKSUM =3D "file://ti-cgt-c6000_${PV}/C6000CodeGenerationTools=
_8.3.x_manifest.html;md5=3Dd06c6f9acebf78df4108a8535396e9f1"
 LIC_FILES_CHKSUM:class-target =3D "file://usr/share/doc/ti/cgt-c6x/C6000=
CodeGenerationTools_8.3.x_manifest.html;md5=3Dd06c6f9acebf78df4108a853539=
6e9f1"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/meta-=
ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
index 04b16032..30116b02 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
@@ -6,7 +6,7 @@ applications for the C7000 DSP family. This includes tool=
s such as: \
 compiler, linker, assembler, etc. This also includes C runtime \
 libraries and standard header files needed to produce a working DSP appl=
ication."
 HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/TICodegeneratio=
nTools/download.htm"
-LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause=
 & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
+LICENSE =3D "AFL-3.0 AND BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND M=
IT AND LicenseRef-PD AND LicenseRef-Patrick-Powell AND LicenseRef-TI-TSPA=
 AND LicenseRef-Thai-Open-Source-Software-Center"
=20
 LIC_FILES_CHKSUM =3D "file://ti-cgt-c7000_${PV}.STS/C7000_Code_Generatio=
n_Tools_1.x_manifest.html;md5=3Df1156d241d104c281bc64a6ec8eadc64"
=20
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb=
 b/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
index 969518e2..7d297d65 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "TI XDCtools (RTSC - Real Time Software Compo=
nents"
 DESCRIPTION =3D "TI XDCtools (RTSC - Real Time Software Components - htt=
p://rtsc.eclipse.org)"
 HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/rtsc"
 SECTION =3D "devel"
-LICENSE =3D "BSD-3-Clause & GPL-2.0-only"
+LICENSE =3D "BSD-3-Clause AND GPL-2.0-only"
=20
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-=
ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index bad264d8..23a10e35 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -5,7 +5,7 @@ platform in a way that none of these domains, called 'cel=
ls' here, can interfere
 HOMEPAGE =3D "https://github.com/siemens/jailhouse"
 SECTION =3D "jailhouse"
=20
-LICENSE =3D "GPL-2.0-only & BSD-2-Clause"
+LICENSE =3D "BSD-2-Clause AND GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D " \
     file://COPYING;md5=3D9fa7f895f96bde2d47fd5b7d95b6ba4d \
diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extra=
s/recipes-ti/vlib/vlib-c66x.inc
index c7c14f91..aa0ad8bb 100644
--- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
+++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
@@ -1,7 +1,7 @@
 SUMMARY =3D "TI Vision Library (VLIB) for C66x"
 HOMEPAGE =3D "http://software-dl.ti.com/libs/vlib/latest/index_FDS.html"
 SECTION =3D "devel"
-LICENSE =3D "TI-TSPA & BSD-3-Clause"
+LICENSE =3D "BSD-3-Clause AND LicenseRef-TI-TSPA"
=20
 require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
diff --git a/meta-ti-test/licenses/Stream_Benchmark_License b/meta-ti-tes=
t/licenses/Stream-Benchmark-License
similarity index 100%
rename from meta-ti-test/licenses/Stream_Benchmark_License
rename to meta-ti-test/licenses/Stream-Benchmark-License
diff --git a/meta-ti-test/recipes-benchmark/stream/stream_5.10.bb b/meta-=
ti-test/recipes-benchmark/stream/stream_5.10.bb
index 484be34d..3084c040 100644
--- a/meta-ti-test/recipes-benchmark/stream/stream_5.10.bb
+++ b/meta-ti-test/recipes-benchmark/stream/stream_5.10.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Stream Benchmark"
 HOMEPAGE =3D "http://www.cs.virginia.edu/stream/"
-LICENSE =3D "Stream_Benchmark_License"
+LICENSE =3D "LicenseRef-Stream-Benchmark-License"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbca8cbe07976fe64c8946378d=
08314b0"
 SECTION =3D "system"
=20
diff --git a/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb=
 b/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
index 6a3c64d1..ec604a94 100644
--- a/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
+++ b/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "OpenNTPD is an implementation of the Network=
 Time Protocol."
 DESCRIPTION =3D "OpenNTPD is a FREE, easy to use implementation of the N=
etwork Time Protocol."
 HOMEPAGE =3D "http://www.openntpd.org/"
 SECTION =3D "console/network"
-LICENSE =3D "BSD-3-Clause & ISC"
+LICENSE =3D "BSD-3-Clause AND ISC"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfe922aad2b6ad1c359cf2adfdaaab=
1b6"
=20
 PR =3D "r0"
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/met=
a-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
index 4183b5d4..5d71837c 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
@@ -2,7 +2,7 @@ SUMMARY =3D "Linux Test Project"
 DESCRIPTION =3D "The Linux Test Project is a joint project with SGI, IBM=
, OSDL, and Bull with a goal to deliver test suites to the open source co=
mmunity that validate the reliability, robustness, and stability of Linux=
. The Linux Test Project is a collection of tools for testing the Linux k=
ernel and related features."
 HOMEPAGE =3D "https://linux-test-project.github.io/"
 SECTION =3D "console/utils"
-LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-=
2.1-or-later & BSD-2-Clause"
+LICENSE =3D "BSD-2-Clause AND GPL-2.0-only AND GPL-2.0-or-later AND LGPL=
-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "\
     file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
     file://testcases/open_posix_testsuite/COPYING;md5=3D48b1c5ec633e3e30=
ec2cf884ae699947 \
diff --git a/meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb b/met=
a-ti-test/recipes-devtools/omapconf/omapconf_git.bb
index 84226dd8..5ea2ac77 100644
--- a/meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Diagnostic tool for TI OMAP processors"
 HOMEPAGE =3D "https://github.com/omapconf/omapconf"
=20
-LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
+LICENSE =3D "BSD-3-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D205c83c4e2242a765acb923fc766e=
914"
=20
 PV =3D "1.75+git"
diff --git a/meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.=
1.bb b/meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
index cc566b37..54b454f3 100644
--- a/meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
+++ b/meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Build hwspinlock test as an external Linux kernel module"
 DESCRIPTION =3D "${SUMMARY}"
-LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
+LICENSE =3D "BSD-3-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbfa02c83df161e37647ee23a2c7ea=
cd4"
=20
 inherit module
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb=
 b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb
index e25ae146..a3ffc52f 100644
--- a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb
+++ b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Utilities and example programs for use with XDP"
 HOMEPAGE =3D "https://github.com/xdp-project/xdp-tools"
-LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
+LICENSE =3D "BSD-2-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9ee53f8d06bbdb4c11b1557ecc4f8=
cd5 \
                     file://LICENSES/GPL-2.0;md5=3D994331978b428511800bfb=
d17eea3001 \
                     file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b=
50909238dbd \
--=20
2.35.3



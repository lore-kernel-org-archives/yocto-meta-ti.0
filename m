Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 41552E007DF; Tue, 30 Sep 2014 22:48:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5524E0034C
	for <meta-ti@yoctoproject.org>; Tue, 30 Sep 2014 22:48:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s915mLCX004511
	for <meta-ti@yoctoproject.org>; Wed, 1 Oct 2014 00:48:21 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s915mLZK017732
	for <meta-ti@yoctoproject.org>; Wed, 1 Oct 2014 00:48:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 1 Oct 2014 00:48:21 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s915mJ3b002220;	Wed, 1 Oct 2014 00:48:20 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 1 Oct 2014 11:14:51 +0530
Message-ID: <1412142291-11850-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1411559009-7951-2-git-send-email-a0393906@ti.com>
References: <1411559009-7951-2-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2] dspdce-fw: Updated dspdce firmware for latest IPC version
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
X-List-Received-Date: Wed, 01 Oct 2014 05:48:40 -0000
Content-Type: text/plain

Also refactored the dspdce-fw recipes to have inc file
for common parts

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-bsp/dspdce-fw/dspdce-fw.inc           |   18 ++++++++++++++++++
 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb |   24 ------------------------
 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb |   11 +++++++++++
 3 files changed, 29 insertions(+), 24 deletions(-)
 create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw.inc
 delete mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb
 create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw.inc b/recipes-bsp/dspdce-fw/dspdce-fw.inc
new file mode 100644
index 0000000..9676888
--- /dev/null
+++ b/recipes-bsp/dspdce-fw/dspdce-fw.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "Firmware for DSP for an example application called copycodectest"
+LICENSE = "TI-TSPA"
+
+COMPATIBLE_MACHINE = "dra7xx-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/dspdce-${MACHINE}-${PV}"
+
+TARGET = "dra7-dsp1-fw.xe66"
+
+do_install() {
+        mkdir -p ${D}${base_libdir}/firmware
+        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
+
+INSANE_SKIP_${PN} = "arch"
diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb
deleted file mode 100644
index 69e9814..0000000
--- a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Firmware for DSP "
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://DSPDCE-${PV}-Manifest.doc;md5=587a7b9fdd99f98fbe99af4a4ba3362a"
-
-COMPATIBLE_MACHINE = "dra7xx-evm"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_02/exports/dspdce-${MACHINE}-1.00.00.02.tar.gz;protocol=http"
-
-S = "${WORKDIR}/dspdce-${MACHINE}-${PV}"
-
-SRC_URI[md5sum] = "df19baf16f828b5d32b4eed50f0364f5"
-SRC_URI[sha256sum] = "0c0f34674110d1ef0300b61b572a326daffb95a31cc9d45888b2e50a83c6f555"
-
-TARGET = "dra7-dsp1-fw.xe66"
-
-do_install() {
-        mkdir -p ${D}${base_libdir}/firmware
-        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
-}
-
-FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
-
-INSANE_SKIP_${PN} = "arch"
diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
new file mode 100644
index 0000000..db01f31
--- /dev/null
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
@@ -0,0 +1,11 @@
+require dspdce-fw.inc
+
+LIC_FILES_CHKSUM = "file://DSPDCE-${PV}-Manifest.doc;md5=b8feda5a3ed8197d05993c0d0ff5590e"
+
+PR = "r0"
+
+SRC_URI = " http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_04/exports/dspdce-${MACHINE}-1.00.00.04.tar.gz;protocol=ftp"
+
+SRC_URI[md5sum] = "72722b12e90c26a85f7f1b56d749cad0"
+SRC_URI[sha256sum] = "64057db41dbee5a992db88129a9154f27c67cfbba8efdc0f09b7de38df4d58eb"
+
-- 
1.7.9.5



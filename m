Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4F140E00A1E; Fri, 10 Mar 2017 10:42:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05D02E00A0C
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 10:42:20 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6DE4720BBB;
	Fri, 10 Mar 2017 18:42:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9unc_eTnKabY; Fri, 10 Mar 2017 18:42:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4E48520BAF;
	Fri, 10 Mar 2017 18:42:18 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id CEB0416239D;
	Fri, 10 Mar 2017 13:42:17 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 10 Mar 2017 13:42:17 -0500
Message-Id: <1489171337-9082-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] wl18xx-fw: add version 8.9.0.0.70 (R8.7_SP1)
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
X-List-Received-Date: Fri, 10 Mar 2017 18:42:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Previous versions were provided by meta-arago-extras, moving to meta-ti now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/wl18xx-fw/wl18xx-fw.bb                 | 30 ++++++++++++++++++++++
 ...01-Add-Makefile-to-install-firmware-files.patch | 29 +++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw.bb
 create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch

diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw.bb
new file mode 100644
index 0000000..c11c919
--- /dev/null
+++ b/recipes-bsp/wl18xx-fw/wl18xx-fw.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Firmware files for use with TI wl18xx"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
+
+inherit allarch
+
+PV = "8.9.0.0.70"
+
+SRC_URI = " \
+	git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
+	file://0001-Add-Makefile-to-install-firmware-files.patch \
+"
+
+# Tag: R8.7-SP1
+SRCREV = "fe3909e93d15a4b17e43699dde2bba0e9a3c0abc"
+BRANCH = "master"
+
+S = "${WORKDIR}/git"
+
+CLEANBROKEN = "1"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    oe_runmake 'DEST_DIR=${D}' install
+}
+
+FILES_${PN} = "/lib/firmware/ti-connectivity/*"
diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch b/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
new file mode 100644
index 0000000..a8db077
--- /dev/null
+++ b/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
@@ -0,0 +1,29 @@
+From 3a8fc3ccf00796254d6cef4b6d4cd70dc37012e1 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 10 Mar 2017 13:28:29 -0500
+Subject: [PATCH] Add Makefile to install firmware files
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ Makefile | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+ create mode 100644 Makefile
+
+diff --git a/Makefile b/Makefile
+new file mode 100644
+index 0000000..1cf38e3
+--- /dev/null
++++ b/Makefile
+@@ -0,0 +1,9 @@
++# Installs the the ti-connectivity wlan firmware files into the root file system
++
++install:
++	@if [ ! -d $(DESTDIR) ] ; then \
++		echo "Target filesystem directory doesn't exist."; \
++		exit 1; \
++	fi
++	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
++	cp *.bin $(DEST_DIR)/lib/firmware/ti-connectivity/
+-- 
+2.7.4
+
-- 
2.7.4



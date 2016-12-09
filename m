Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F71EE00D3F; Fri,  9 Dec 2016 13:48:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24135E00D12
	for <meta-ti@yoctoproject.org>; Fri,  9 Dec 2016 13:48:20 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 29E7D209D7;
	Fri,  9 Dec 2016 21:48:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jS5NVtNcPzRe; Fri,  9 Dec 2016 21:48:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 068FF2017D;
	Fri,  9 Dec 2016 21:48:18 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 6F1811621C7;
	Fri,  9 Dec 2016 16:48:18 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri,  9 Dec 2016 16:48:17 -0500
Message-Id: <1481320097-17451-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] goodix-fw: add Goodix GT9271 config firmware
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
X-List-Received-Date: Fri, 09 Dec 2016 21:48:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/goodix-fw/goodix-fw_git.bb       | 29 ++++++++++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_4.4.bb |  9 +++++----
 2 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 recipes-bsp/goodix-fw/goodix-fw_git.bb

diff --git a/recipes-bsp/goodix-fw/goodix-fw_git.bb b/recipes-bsp/goodix-fw/goodix-fw_git.bb
new file mode 100644
index 0000000..815466b
--- /dev/null
+++ b/recipes-bsp/goodix-fw/goodix-fw_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Goodix GT9271 config firmware"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENCE.Spectrum-GT9271;md5=2a6de6be7af1fe46370c684daf27c852"
+
+PV = "1.0.0.0"
+PR = "r0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "dra7xx"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "f1a8d1d0131f83bd1a775cde7075eb67c070892c"
+BRANCH ?= "ti-linux-firmware-4.1.y"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+ORIGIN = "DRA71x-RevA-GT9271_SpecDig_Config.bin"
+TARGET = "goodix_9271_cfg.bin"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware
+	install -m 0644 ${S}/ti-evm/${ORIGIN} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index a2f3a32..67ed01e 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -16,15 +16,16 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 # Pull in the devicetree files into the rootfs
 RDEPENDS_kernel-base += "kernel-devicetree"
 
-# Add a run-time dependency for the PM firmware to be installed
-# on the target file system.
+# Add run-time dependency for PM firmware to the rootfs
 RDEPENDS_kernel-base_append_ti33x = " amx3-cm3"
 RDEPENDS_kernel-base_append_ti43x = " amx3-cm3"
 
-# Add a run-time dependency for the VPE VPDMA firmware to be installed
-# on the target file system.
+# Add run-time dependency for VPE VPDMA firmware to the rootfs
 RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
 
+# Add run-time dependency for Goodix firmware to the rootfs
+RDEPENDS_kernel-base_append_dra7xx = " goodix-fw"
+
 # Install boot-monitor skern file into /boot dir of rootfs
 RDEPENDS_kernel-base_append_keystone = " boot-monitor"
 
-- 
2.7.4



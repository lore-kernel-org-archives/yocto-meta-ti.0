Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40AC1E00D57; Fri,  9 Dec 2016 14:27:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AAE5E00D81
	for <meta-ti@yoctoproject.org>; Fri,  9 Dec 2016 14:27:33 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2DF6252AA3; Fri,  9 Dec 2016 22:27:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161209222731.2DF6252AA3@arago-project.org>
Date: Fri,  9 Dec 2016 22:27:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : goodix-fw: add Goodix GT9271 config firmware
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
X-List-Received-Date: Fri, 09 Dec 2016 22:27:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: 26ed1010249b0404f9d4486d6761fe4e638fdaa8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=26ed1010249b0404f9d4486d6761fe4e638fdaa8

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Dec 10 03:48:17 2016 +0000

goodix-fw: add Goodix GT9271 config firmware

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/goodix-fw/goodix-fw_git.bb       |   29 ++++++++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_4.4.bb |    9 ++++---
 2 files changed, 34 insertions(+), 4 deletions(-)

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
index 92ef5eb..d1abdc9 100644
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
 



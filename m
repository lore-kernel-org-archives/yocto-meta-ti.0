Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E4FCE00477; Fri, 27 Feb 2015 14:20:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A21A7E00321
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 14:20:49 -0800 (PST)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NKG007IGBEEMK60@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 27 Feb 2015 16:20:39 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=OqT4EJ7o c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8	a=_PmLGqTdMzOlS5DtLUYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5630A20030;	Fri,
	27 Feb 2015 17:20:38 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 27 Feb 2015 17:20:38 -0500
Message-id: <1425075638-10718-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] linux-keystone: add 3.13 version
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
X-List-Received-Date: Fri, 27 Feb 2015 22:20:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-keystone-3.13/defconfig |  1 +
 recipes-kernel/linux/linux-keystone_3.13.bb        | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-keystone-3.13/defconfig
 create mode 100644 recipes-kernel/linux/linux-keystone_3.13.bb

diff --git a/recipes-kernel/linux/linux-keystone-3.13/defconfig b/recipes-kernel/linux/linux-keystone-3.13/defconfig
new file mode 100644
index 0000000..bcfc482
--- /dev/null
+++ b/recipes-kernel/linux/linux-keystone-3.13/defconfig
@@ -0,0 +1 @@
+use-kernel-config=keystone_defconfig
diff --git a/recipes-kernel/linux/linux-keystone_3.13.bb b/recipes-kernel/linux/linux-keystone_3.13.bb
new file mode 100644
index 0000000..13ce73e
--- /dev/null
+++ b/recipes-kernel/linux/linux-keystone_3.13.bb
@@ -0,0 +1,34 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI Keystone devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+COMPATIBLE_MACHINE = "keystone"
+
+inherit kernel
+
+require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
+
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.13:"
+
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+# Only k2hk DTB is available in this version
+KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+
+SRCREV = "11a8eaee39b68e6047f07382c251786b40bef165"
+PV = "3.13.0"
+
+BRANCH = "v3.13/master"
+SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
+           file://defconfig\
+           "
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_kernel-base = ""
-- 
2.2.0



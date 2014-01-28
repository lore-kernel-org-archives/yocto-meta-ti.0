Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33D42E005B4
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 20:22:53 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0S4MpUv007783
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 22:22:51 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S4MpUP001202
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 22:22:51 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 22:22:51 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0S4MpqP020780;	Mon, 27 Jan 2014 22:22:51 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Jan 2014 23:22:49 -0500
Message-ID: <1390882969-22545-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] linux-keystone: Create recipe for linux-keystone kernel version 3.10
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
X-List-Received-Date: Tue, 28 Jan 2014 04:22:56 -0000
Content-Type: text/plain

- Updated Source URL & version
- Added device tree file

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-kernel/linux/linux-keystone_3.10.bb |   36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-keystone_3.10.bb

diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
new file mode 100644
index 0000000..b37a404
--- /dev/null
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -0,0 +1,36 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI Keystone devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+COMPATIBLE_MACHINE = "keystone"
+
+inherit kernel
+
+do_deploy_append() {
+    cd ${S}
+}
+
+require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
+
+MACHINE_KERNEL_PR_append = "a"
+
+CORTEXA8FIXUP = "no"
+
+KERNEL_DEVICETREE_keystone-evm = "arch/${ARCH}/boot/dts/k2hk-evm.dts"
+
+#This commit corresponds to "K2_LINUX_03.10.10_13.12"
+SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
+
+BRANCH = "master"
+
+# for nightly switch the three lines below
+SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
+           file://defconfig\
+           "
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_kernel-base = ""
+
-- 
1.7.9.5



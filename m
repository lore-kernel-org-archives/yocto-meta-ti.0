Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5558E0078A
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 11:14:22 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15JEL1D011180
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 13:14:21 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15JELH1011898
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 13:14:21 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 13:14:21 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s15JEKSV027131;	Wed, 5 Feb 2014 13:14:20 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 5 Feb 2014 14:14:18 -0500
Message-ID: <1391627659-12229-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] linux-keystone-rt: Add new recipe for build rt-kernel
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
X-List-Received-Date: Wed, 05 Feb 2014 19:14:25 -0000
Content-Type: text/plain

- Builds kernel tree with RT patches

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../linux/linux-keystone-rt-3.10/defconfig         |    1 +
 recipes-kernel/linux/linux-keystone-rt_3.10.bb     |   32 ++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-keystone-rt-3.10/defconfig
 create mode 100644 recipes-kernel/linux/linux-keystone-rt_3.10.bb

diff --git a/recipes-kernel/linux/linux-keystone-rt-3.10/defconfig b/recipes-kernel/linux/linux-keystone-rt-3.10/defconfig
new file mode 100644
index 0000000..731bb00
--- /dev/null
+++ b/recipes-kernel/linux/linux-keystone-rt-3.10/defconfig
@@ -0,0 +1 @@
+use-kernel-config=keystone2_fullrt_defconfig
diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
new file mode 100644
index 0000000..5f6ac91
--- /dev/null
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -0,0 +1,32 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux RT kernel for TI Keystone devices"
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
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+
+#This commit corresponds to "K2_RT_LINUX_03.10.10_13.12"
+SRCREV = "8fa9091d0f9c91a048a975ddebbf2f492e73bf61"
+
+BRANCH = "master-rt"
+
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



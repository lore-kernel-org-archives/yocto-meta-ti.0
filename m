Return-Path: <m-karicheri2@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5266CE0144E
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 14:20:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47LKSY5008084
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:20:28 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47LKSHe026566
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:20:28 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 16:20:28 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r47LKSeF026280;	Tue, 7 May 2013 16:20:28 -0500
Received: from a0868495 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <m-karicheri2@ti.com>)	id 1UZpJD-0001Vu-W3;
	Tue, 07 May 2013 17:20:28 -0400
From: Murali Karicheri <m-karicheri2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 May 2013 17:20:25 -0400
Message-ID: <1367961625-5779-3-git-send-email-m-karicheri2@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1367961625-5779-1-git-send-email-m-karicheri2@ti.com>
References: <1367961625-5779-1-git-send-email-m-karicheri2@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] keystone2: linux: add support for building 3.8.4 based Linux kernel
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
X-List-Received-Date: Tue, 07 May 2013 21:20:29 -0000
Content-Type: text/plain

This also allow support for switching between release tag and tip of the
master/master for nightly builds.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 .../linux/linux-keystone-3.8.4/defconfig           |    1 +
 recipes-kernel/linux/linux-keystone_3.8.4.bb       |   41 ++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-keystone-3.8.4/defconfig
 create mode 100644 recipes-kernel/linux/linux-keystone_3.8.4.bb

diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/defconfig b/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
new file mode 100644
index 0000000..731bb00
--- /dev/null
+++ b/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
@@ -0,0 +1 @@
+use-kernel-config=keystone2_fullrt_defconfig
diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb b/recipes-kernel/linux/linux-keystone_3.8.4.bb
new file mode 100644
index 0000000..0237e66
--- /dev/null
+++ b/recipes-kernel/linux/linux-keystone_3.8.4.bb
@@ -0,0 +1,41 @@
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+COMPATIBLE_MACHINE = "keystone-evm"
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
+# The tree tends to rebase, use literal stable tags
+# for nightly switch the two lines below
+#SRCREV = "DEV.MCSDK-03.08.04.10"
+SRCREV = "${AUTOREV}"
+
+BRANCH = "master/master"
+#BRANCH = "releases/03.00.00.10"
+
+# for nightly switch the three lines below
+#SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=${BRANCH} \
+#           file://defconfig \
+#           "
+SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/linux-keystone.git;protocol=git;branch=${BRANCH} \
+           file://defconfig \
+           "
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_kernel-base = ""
+
-- 
1.7.9.5



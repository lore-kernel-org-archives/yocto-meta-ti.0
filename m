Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40364E003D2
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 15:44:12 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 036CD529D2; Wed,  5 Feb 2014 23:44:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140205234412.036CD529D2@arago-project.org>
Date: Wed,  5 Feb 2014 23:44:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : linux-keystone-rt: Add new recipe for build rt-kernel
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
X-List-Received-Date: Wed, 05 Feb 2014 23:44:12 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 87b39200b293562259c55cc52282cec361ce2578
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=87b39200b293562259c55cc52282cec361ce2578

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Feb  5 18:25:18 2014 -0500

linux-keystone-rt: Add new recipe for build rt-kernel

- Builds kernel tree with RT patches

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-keystone-rt/defconfig |    1 +
 recipes-kernel/linux/linux-keystone-rt_3.10.bb   |   32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-rt/defconfig b/recipes-kernel/linux/linux-keystone-rt/defconfig
new file mode 100644
index 0000000..731bb00
--- /dev/null
+++ b/recipes-kernel/linux/linux-keystone-rt/defconfig
@@ -0,0 +1 @@
+use-kernel-config=keystone2_fullrt_defconfig
diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
new file mode 100644
index 0000000..9c2f904
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
+PV = "3.10.10"
+
+BRANCH = "master-rt"
+SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
+           file://defconfig\
+           "
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_kernel-base = ""
+



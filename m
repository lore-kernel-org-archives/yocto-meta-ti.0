Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9895E00404; Fri, 27 Feb 2015 14:30:15 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53CE2E00404
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 14:30:11 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 25F0B529E0; Fri, 27 Feb 2015 22:30:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150227223011.25F0B529E0@arago-project.org>
Date: Fri, 27 Feb 2015 22:30:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-keystone: add 3.13 version
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
X-List-Received-Date: Fri, 27 Feb 2015 22:30:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 76cb99ae62d49de951a88e874e18dba6c0abfb4c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=76cb99ae62d49de951a88e874e18dba6c0abfb4c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Feb 28 04:20:38 2015 +0000

linux-keystone: add 3.13 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-keystone-3.13/defconfig |    1 +
 recipes-kernel/linux/linux-keystone_3.13.bb        |   34 ++++++++++++++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)

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



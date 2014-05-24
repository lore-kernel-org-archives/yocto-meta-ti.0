Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFCE2E00B85; Fri, 23 May 2014 20:38:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C773E009A7
	for <meta-ti@yoctoproject.org>; Fri, 23 May 2014 20:38:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0CA3052A8F; Sat, 24 May 2014 03:38:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140524033806.0CA3052A8F@arago-project.org>
Date: Sat, 24 May 2014 03:38:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: fix _append/ _prepend logic in prev changes
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
X-List-Received-Date: Sat, 24 May 2014 03:38:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c7f1fb41d70a12f9afb51edfe63bbda0b46c7cc6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c7f1fb41d70a12f9afb51edfe63bbda0b46c7cc6

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri May 23 23:13:47 2014 -0400

linux-ti-staging: fix _append/_prepend logic in prev changes

* Add a missing space to KERNEL_CONFIG_FRAGMENTS_append
* Use FILESEXTRAPATHS_prepend instead of _append version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_3.15.bb |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index cb289c4..90dab23 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}-3.12:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.12:"
 
 # Pull in the devicetree files into the rootfs
 RDEPENDS_kernel-base += "kernel-devicetree"
diff --git a/recipes-kernel/linux/linux-ti-staging_3.15.bb b/recipes-kernel/linux/linux-ti-staging_3.15.bb
index 308a412..a55b581 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.15.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.15.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}-3.15:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.15:"
 
 # Pull in the devicetree files into the rootfs
 RDEPENDS_kernel-base += "kernel-devicetree"
@@ -48,8 +48,8 @@ PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "ti_config_fragments"
 KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/ipc.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti33x = "${WORKDIR}/non-smp.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti43x = "${WORKDIR}/non-smp.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/non-smp.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/non-smp.cfg"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \



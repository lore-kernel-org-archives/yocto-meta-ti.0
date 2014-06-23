Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 054FBE0056A; Mon, 23 Jun 2014 09:02:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  2.0 TO_NO_BRKTS_PCNT To: misformatted + percentage
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 713A5E0056A
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 09:02:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4402852A87; Mon, 23 Jun 2014 16:02:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623160201.4402852A87@arago-project.org>
Date: Mon, 23 Jun 2014 16:02:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to latest 3.14 stable, as being LTS
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
X-List-Received-Date: Mon, 23 Jun 2014 16:02:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 57191eaf9e2495ea2394bce433ed40d20fdb6a0b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=57191eaf9e2495ea2394bce433ed40d20fdb6a0b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Jun 21 03:11:28 2014 +0000

linux-ti-staging: update to latest 3.14 stable, as being LTS

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../defconfig                                      |    0
 .../ipc.cfg                                        |    0
 .../non-smp.cfg                                    |    0
 .../systest.cfg                                    |    0
 ...ti-staging_3.15.bb => linux-ti-staging_3.14.bb} |   12 +++++-------
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/defconfig b/recipes-kernel/linux/linux-ti-staging-3.14/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-3.15/defconfig
rename to recipes-kernel/linux/linux-ti-staging-3.14/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg b/recipes-kernel/linux/linux-ti-staging-3.14/ipc.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.14/ipc.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg b/recipes-kernel/linux/linux-ti-staging-3.14/non-smp.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.14/non-smp.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg b/recipes-kernel/linux/linux-ti-staging-3.14/systest.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.14/systest.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging_3.15.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
similarity index 89%
rename from recipes-kernel/linux/linux-ti-staging_3.15.bb
rename to recipes-kernel/linux/linux-ti-staging_3.14.bb
index 64db8da..a3045b2 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.15.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -3,15 +3,13 @@ DESCRIPTION = "Linux kernel for TI devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-DEFAULT_PREFERENCE = "-1"
-
 inherit kernel
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.15:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:"
 
 # Pull in the devicetree files into the rootfs
 RDEPENDS_kernel-base += "kernel-devicetree"
@@ -39,13 +37,13 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "ti-linux-3.15.y"
+BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "3fd9aad17d3b4d1d7ee50ae788c0a096921e7216"
-PV = "3.14+3.15-rc6"
+SRCREV = "9d00dd1187099b0841125220c7432a3507e5b5fa"
+PV = "3.14.8"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "ti_config_fragments"



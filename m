Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2DF0E01669
	for <meta-ti@yoctoproject.org>; Sat, 28 Sep 2013 15:54:41 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTU006BQYAPT9A0@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 28 Sep 2013 17:54:25 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0B689200F4; Sat,
	28 Sep 2013 18:54:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sat, 28 Sep 2013 18:54:05 -0400
Message-id: <1380408845-18316-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1380408845-18316-1-git-send-email-denis@denix.org>
References: <1380408845-18316-1-git-send-email-denis@denix.org>
Subject: [PATCH 8/8] linux: set PR from MACHINE_KERNEL_PR, bypass machine_kernel_pr.bbclass from meta-oe
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
X-List-Received-Date: Sat, 28 Sep 2013 22:54:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Essentially, machine_kernel_pr.bbclass does this one line assignment, but
introduces a new unnecessary dependency on meta-openembedded/meta-oe layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-am335x-psp_3.2.bb      | 1 +
 recipes-kernel/linux/linux-keystone_3.8.4.bb      | 1 +
 recipes-kernel/linux/linux-mainline_3.2.bb        | 1 +
 recipes-kernel/linux/linux-omap-psp_2.6.37.bb     | 1 +
 recipes-kernel/linux/linux-omap4_3.4.bb           | 1 +
 recipes-kernel/linux/linux-omap_2.6.37.bb         | 3 +++
 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb | 1 +
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb        | 1 +
 recipes-kernel/linux/linux-ti-staging_3.8.bb      | 1 +
 recipes-kernel/linux/linux-ti-staging_git.bb      | 1 +
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb       | 2 ++
 recipes-kernel/linux/linux_3.3.7.bb               | 1 +
 12 files changed, 15 insertions(+)

diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
index eaf788f..9d08a86 100644
--- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
@@ -16,6 +16,7 @@ KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
 MACHINE_KERNEL_PR_append = "h+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
 
 BRANCH = "v3.2-staging"
 
diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb b/recipes-kernel/linux/linux-keystone_3.8.4.bb
index 989fde9..d176f14 100644
--- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
+++ b/recipes-kernel/linux/linux-keystone_3.8.4.bb
@@ -21,6 +21,7 @@ SRCREV = "20a48dc5309c4434650baef2b6072b5f1016f946"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=${BRANCH}\
            file://defconfig\
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index 7b4a2a2..7398d9a 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -10,6 +10,7 @@ SRCREV_pn-${PN} = "1f873aca1c7aa7a574b276c040d304d16f1dbfa4"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 MACHINE_KERNEL_PR_append = "b"
+PR = "${MACHINE_KERNEL_PR}"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-mainline-3.2:${FILE_DIRNAME}/linux-mainline-3.2/${MACHINE}:"
 
diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
index d1a6478..8333cc8 100644
--- a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
@@ -11,6 +11,7 @@ SRCREV= "adcd067326836777c049e3cb32a5b7d9d401fc31"
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 devices
 # see conf/machine/include/omap3.inc
 MACHINE_KERNEL_PR_append = "b"
+PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=git \
            file://defconfig"
diff --git a/recipes-kernel/linux/linux-omap4_3.4.bb b/recipes-kernel/linux/linux-omap4_3.4.bb
index 1928060..449e4eb 100644
--- a/recipes-kernel/linux/linux-omap4_3.4.bb
+++ b/recipes-kernel/linux/linux-omap4_3.4.bb
@@ -4,6 +4,7 @@ require linux.inc
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap4 see conf/machine/include/omap4.inc
 MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
 
 CORTEXA8FIXUP = "no"
 
diff --git a/recipes-kernel/linux/linux-omap_2.6.37.bb b/recipes-kernel/linux/linux-omap_2.6.37.bb
index 0a14cc8..1bbdde1 100644
--- a/recipes-kernel/linux/linux-omap_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omap_2.6.37.bb
@@ -6,7 +6,10 @@ COMPATIBLE_MACHINE = "(beagleboard|overo|omap3evm|omap3-touchbook)"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 PV = "2.6.37"
+
 MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
+PR = "${MACHINE_KERNEL_PR}"
+
 SRCREV = "fa3b4e23ec20cfc944db7cc2b30b0d82c20e4472"
 
 FILESEXTRAPATHS_prepend := "{THISDIR}/${PN}-${PV}:"
diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
index a138fb6..199499a 100644
--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
@@ -7,6 +7,7 @@ require tipspkernel.inc
 require setup-defconfig.inc
 
 MACHINE_KERNEL_PR_append = "c"
+PR = "${MACHINE_KERNEL_PR}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index 5fd17f8..291e852 100644
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -25,6 +25,7 @@ PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 833fb48..80b94f6 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -32,6 +32,7 @@ PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index b28667e..5b0c260 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -33,6 +33,7 @@ PV = "3.11+3.12-rc2"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 4200d03..1602e3f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,9 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.28", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
+
 MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
+PR = "${MACHINE_KERNEL_PR}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
diff --git a/recipes-kernel/linux/linux_3.3.7.bb b/recipes-kernel/linux/linux_3.3.7.bb
index aca5c53..f6d2172 100644
--- a/recipes-kernel/linux/linux_3.3.7.bb
+++ b/recipes-kernel/linux/linux_3.3.7.bb
@@ -14,6 +14,7 @@ require setup-defconfig.inc
 # The main PR is now using MACHINE_KERNEL_PR, for beagleboard see
 # conf/machine/include/omap3.inc
 MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
+PR = "${MACHINE_KERNEL_PR}"
 
 BRANCH = "linux-3.3.y"
 SRCREV = "v3.3.7"
-- 
1.8.3.2



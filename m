Return-Path: <Yasir_Khan@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B99FDE007F1; Tue, 26 Aug 2014 07:27:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6873DE007AD
	for <meta-ti@yoctoproject.org>; Tue, 26 Aug 2014 07:27:45 -0700 (PDT)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XMHir-00063Z-7N from Yasir_Khan@mentor.com 
	for meta-ti@yoctoproject.org; Tue, 26 Aug 2014 07:27:45 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 26 Aug 2014 07:27:44 -0700
From: Yasir-Khan <yasir_khan@mentor.com>
To: meta-ti@yoctoproject.org
Message-Id: <1409063231-47807-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 26 Aug 2014 14:27:45.0112 (UTC)
	FILETIME=[E7131D80:01CFC139]
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:51:53 -0800
Cc: Wade Farnsworth <wade_farnsworth@mentor.com>
Subject: [PATCH 2/5] linux-ti-staging: Add systemd related kconfig options
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
Date: Tue, 26 Aug 2014 14:27:46 -0000
X-Original-Date: Tue, 26 Aug 2014 19:27:11 +0500
X-List-Received-Date: Tue, 26 Aug 2014 14:27:46 -0000

Add missing kconfig options to linux-ti-staging kernel. This
allows systemd to fully initialize.

Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 ...nable-config-options-for-proper-systemd-o.patch |   44 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |    1 +
 2 files changed, 45 insertions(+)
 create mode 100644 recipes-kernel/linux/files/0001-omap2plus-Enable-config-options-for-proper-systemd-o.patch

diff --git a/recipes-kernel/linux/files/0001-omap2plus-Enable-config-options-for-proper-systemd-o.patch b/recipes-kernel/linux/files/0001-omap2plus-Enable-config-options-for-proper-systemd-o.patch
new file mode 100644
index 0000000..67b3366
--- /dev/null
+++ b/recipes-kernel/linux/files/0001-omap2plus-Enable-config-options-for-proper-systemd-o.patch
@@ -0,0 +1,44 @@
+From 6c37a195792e838302533cfb1a1da0010bc76310 Mon Sep 17 00:00:00 2001
+From: Wade Farnsworth <wade_farnsworth@mentor.com>
+Date: Mon, 21 Apr 2014 07:58:53 -0700
+Subject: [PATCH] omap2plus: Enable config options for proper systemd
+ operation
+
+CGROUPS, AUTOFS4, and FHANDLE are required for systemd to initialize
+properly.  These are missing from the omap2plus, which causes the
+boot to fail on Beaglebone and related platforms.
+
+Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
+---
+ arch/arm/configs/omap2plus_defconfig |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
+index ff579a7..d29c89c 100644
+--- a/arch/arm/configs/omap2plus_defconfig
++++ b/arch/arm/configs/omap2plus_defconfig
+@@ -1,11 +1,13 @@
+ CONFIG_SYSVIPC=y
+ CONFIG_POSIX_MQUEUE=y
++CONFIG_FHANDLE=y
+ CONFIG_NO_HZ=y
+ CONFIG_HIGH_RES_TIMERS=y
+ CONFIG_BSD_PROCESS_ACCT=y
+ CONFIG_IKCONFIG=y
+ CONFIG_IKCONFIG_PROC=y
+ CONFIG_LOG_BUF_SHIFT=16
++CONFIG_CGROUPS=y
+ CONFIG_BLK_DEV_INITRD=y
+ CONFIG_EXPERT=y
+ CONFIG_SLAB=y
+@@ -358,6 +360,7 @@ CONFIG_EXT3_FS=y
+ CONFIG_EXT4_FS=y
+ CONFIG_QUOTA=y
+ CONFIG_QFMT_V2=y
++CONFIG_AUTOFS4_FS=y
+ CONFIG_MSDOS_FS=y
+ CONFIG_VFAT_FS=y
+ CONFIG_TMPFS=y
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index c6e7d42..d169ec5 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -57,6 +57,7 @@ SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;bra
            file://connectivity.cfg \
            file://ipc.cfg \
            file://systest.cfg \
+           ${@base_contains('DISTRO_FEATURES', 'systemd', ' file://0001-omap2plus-Enable-config-options-for-proper-systemd-o.patch ', '', d)} \
           "
 
 # Disable SMP in defconfig on single-core platforms to reduce overhead
-- 
1.7.9.5



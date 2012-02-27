Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 134C5E0139E
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 06:12:31 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DDCF152A77; Mon, 27 Feb 2012 14:12:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120227141230.DDCF152A77@arago-project.org>
Date: Mon, 27 Feb 2012 14:12:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: enable PRU support for beaglebone
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2012 14:12:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7657df6284cd503d973518a291c72cbd7cf6e4c0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7657df6284cd503d973518a291c72cbd7cf6e4c0

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Feb 21 16:24:07 2012 +0100

linux-ti33x-psp 3.2: enable PRU support for beaglebone

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    7 +++++--
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 07b9987..c5b80d1 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -1,6 +1,6 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Linux/arm 3.2.0 Kernel Configuration
+# Linux/arm 3.2.6 Kernel Configuration
 #
 CONFIG_ARM=y
 CONFIG_HAVE_PWM=y
@@ -2894,7 +2894,10 @@ CONFIG_RTC_DRV_TWL4030=y
 CONFIG_RTC_DRV_OMAP=y
 # CONFIG_DMADEVICES is not set
 # CONFIG_AUXDISPLAY is not set
-# CONFIG_UIO is not set
+CONFIG_UIO=m
+CONFIG_UIO_PDRV=m
+CONFIG_UIO_PDRV_GENIRQ=m
+CONFIG_UIO_PRUSS=m
 CONFIG_VIRTIO=m
 CONFIG_VIRTIO_RING=m
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 42a606d..36df3e6 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 



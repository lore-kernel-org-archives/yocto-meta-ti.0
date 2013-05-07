Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 3651EE01484
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 08:34:35 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Tue, 7 May 2013
	17:34:26 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 6296E2870BA;
	Tue,  7 May 2013 17:34:30 +0200 (CEST)
From: <maxin.john@enea.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 May 2013 17:34:26 +0200
Message-ID: <1367940866-5055-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] keystone-evm: upgrade kernel to 3.8.4
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
X-List-Received-Date: Tue, 07 May 2013 15:34:36 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Update to latest supported kernel version for TI keystone-evm.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 conf/machine/include/keystone.inc                               |    2 +-
 .../{linux-keystone-3.6.6 => linux-keystone-3.8.4}/defconfig    |    7 +++++++
 .../linux/{linux-keystone_3.6.6.bb => linux-keystone_3.8.4.bb}  |    2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)
 rename recipes-kernel/linux/{linux-keystone-3.6.6 => linux-keystone-3.8.4}/defconfig (96%)
 rename recipes-kernel/linux/{linux-keystone_3.6.6.bb => linux-keystone_3.8.4.bb} (90%)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 72e71bf..e14c26c 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -8,7 +8,7 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-keystone"
 PREFERRED_PROVIDER_u-boot = "u-boot-keystone"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r6"
+MACHINE_KERNEL_PR = "r7"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-keystone-3.6.6/defconfig b/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
similarity index 96%
rename from recipes-kernel/linux/linux-keystone-3.6.6/defconfig
rename to recipes-kernel/linux/linux-keystone-3.8.4/defconfig
index d326a41..d2939ef 100644
--- a/recipes-kernel/linux/linux-keystone-3.6.6/defconfig
+++ b/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
@@ -20,6 +20,10 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_ARCH_KEYSTONE=y
+CONFIG_ARM_LPAE=y
+CONFIG_PCI=y
+CONFIG_TI_KEYSTONE_PCIE=y
+CONFIG_PCI_REALLOC_ENABLE_AUTO=y
 CONFIG_SMP=y
 CONFIG_ARM_ARCH_TIMER=y
 CONFIG_PREEMPT__LL=y
@@ -108,6 +112,8 @@ CONFIG_IP6_NF_IPTABLES=m
 CONFIG_IP_SCTP=y
 CONFIG_VLAN_8021Q=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_CMA=y
 CONFIG_MTD=y
 CONFIG_MTD_TESTS=m
@@ -153,6 +159,7 @@ CONFIG_USB_GADGET=y
 CONFIG_DMADEVICES=y
 CONFIG_UIO=y
 CONFIG_UIO_PDRV=y
+CONFIG_VIRTIO_KEYSTONE=y
 CONFIG_COMMON_CLK_DEBUG=y
 CONFIG_REMOTEPROC_USER=y
 CONFIG_MEMORY=y
diff --git a/recipes-kernel/linux/linux-keystone_3.6.6.bb b/recipes-kernel/linux/linux-keystone_3.8.4.bb
similarity index 90%
rename from recipes-kernel/linux/linux-keystone_3.6.6.bb
rename to recipes-kernel/linux/linux-keystone_3.8.4.bb
index 4dd5d15..31138c1 100644
--- a/recipes-kernel/linux/linux-keystone_3.6.6.bb
+++ b/recipes-kernel/linux/linux-keystone_3.8.4.bb
@@ -7,7 +7,7 @@ MACHINE_KERNEL_PR_append = "a"
 CORTEXA8FIXUP = "no"
 
 # The tree tends to rebase, use literal stable tags
-SRCREV = "DEV.MCSDK-03.06.06.07"
+SRCREV = "DEV.MCSDK-03.08.04.10"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git \
            file://defconfig \
-- 
1.7.10.4



Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4951AE0030B
	for <meta-ti@yoctoproject.org>; Thu,  1 Mar 2012 14:00:21 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B01E952AA0; Thu,  1 Mar 2012 22:00:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120301220020.B01E952AA0@arago-project.org>
Date: Thu,  1 Mar 2012 22:00:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux 3.0: enable 'option' serial for beagleboard
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
X-List-Received-Date: Thu, 01 Mar 2012 22:00:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 05d3883a788500ea987865f4db7e547040b83bf6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=05d3883a788500ea987865f4db7e547040b83bf6

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Feb 28 20:23:46 2012 +0100

linux 3.0: enable 'option' serial for beagleboard

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-3.0/beagleboard/defconfig          |    5 +++--
 recipes-kernel/linux/linux_3.0.bb                  |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
index 5f2a7eb..5be7772 100644
--- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
+++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Linux/arm 3.0.14 Kernel Configuration
+# Linux/arm 3.0.22 Kernel Configuration
 #
 CONFIG_ARM=y
 CONFIG_HAVE_PWM=y
@@ -2785,7 +2785,8 @@ CONFIG_USB_SERIAL_SIERRAWIRELESS=m
 # CONFIG_USB_SERIAL_TI is not set
 CONFIG_USB_SERIAL_CYBERJACK=m
 # CONFIG_USB_SERIAL_XIRCOM is not set
-# CONFIG_USB_SERIAL_OPTION is not set
+CONFIG_USB_SERIAL_WWAN=m
+CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_SERIAL_OMNINET=m
 CONFIG_USB_SERIAL_OPTICON=m
 CONFIG_USB_SERIAL_VIVOPAY_SERIAL=m
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index 65084fb..fac6348 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -10,7 +10,7 @@ PV = "3.0.22"
 SRCREV_pn-${PN} = "a4a663513af05a98d6085d92f85c16bb64ac4050"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 



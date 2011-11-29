Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1691E00303
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 29 Nov 2011 00:07:35 -0800 (PST)
Received: by eekc41 with SMTP id c41so1473529eek.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 29 Nov 2011 00:07:34 -0800 (PST)
Received: by 10.213.20.16 with SMTP id d16mr34198ebb.38.1322554054355;
	Tue, 29 Nov 2011 00:07:34 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 8sm28609539eei.8.2011.11.29.00.07.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 00:07:09 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 29 Nov 2011 09:07:02 +0100
Message-Id: <1322554022-25456-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] linux 3.0: update to 3.0.12
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
X-List-Received-Date: Tue, 29 Nov 2011 08:07:36 -0000

The internal ethernet on the beagleboard is not affected by the 3.0.11 usb bug, but other usb devices might be.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/omap3.inc    |    2 +-
 recipes-kernel/linux/linux_3.0.bb |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 262e212..4530ae1 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r112"
+MACHINE_KERNEL_PR = "r113"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index 1e61628..5039b22 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -5,9 +5,9 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.0.11"
-# v3.0.11 tag
-SRCREV_pn-${PN} = "7a576d2dcd5807a7310032b380442eeba8c1c293"
+PV = "3.0.12"
+# v3.0.12 tag
+SRCREV_pn-${PN} = "ac6766564c0305ca020fe747dfd7dbdf0881369d"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 MACHINE_KERNEL_PR_append = "a"
-- 
1.7.2.5



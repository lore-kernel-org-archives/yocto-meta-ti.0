Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f41.google.com (mail-ww0-f41.google.com [74.125.82.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 182D0E00305
	for <meta-ti@lists.yoctoproject.org>;
	Sun, 27 Nov 2011 11:38:46 -0800 (PST)
Received: by wwf22 with SMTP id 22so5608497wwf.2
	for <meta-ti@lists.yoctoproject.org>;
	Sun, 27 Nov 2011 11:38:45 -0800 (PST)
Received: by 10.227.198.7 with SMTP id em7mr26843471wbb.13.1322422723607;
	Sun, 27 Nov 2011 11:38:43 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id dw6sm13595748wib.12.2011.11.27.11.38.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Nov 2011 11:38:42 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Sun, 27 Nov 2011 20:38:35 +0100
Message-Id: <1322422715-10741-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] linux 3.0: update to 3.0.11
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
X-List-Received-Date: Sun, 27 Nov 2011 19:38:47 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/omap3.inc    |    2 +-
 recipes-kernel/linux/linux_3.0.bb |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 1469f98..262e212 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r111"
+MACHINE_KERNEL_PR = "r112"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index 93042b3..1e61628 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -5,9 +5,9 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.0.10"
-# v3.0.10 tag
-SRCREV_pn-${PN} = "c7e2ea59cdd74342d3614bee9fc42fa2fb5add7e"
+PV = "3.0.11"
+# v3.0.11 tag
+SRCREV_pn-${PN} = "7a576d2dcd5807a7310032b380442eeba8c1c293"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 MACHINE_KERNEL_PR_append = "a"
-- 
1.7.2.5



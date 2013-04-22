Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 888ACE006F9
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 09:21:55 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3MGLsM9017441
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 11:21:54 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3MGLslC009647
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 11:21:54 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Apr 2013 11:21:53 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3MGLpaA001894;
	Mon, 22 Apr 2013 11:21:52 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 22 Apr 2013 11:21:40 -0500
Message-ID: <1366647702-24282-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/3] linux-omap-psp: Update commit
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
X-List-Received-Date: Mon, 22 Apr 2013 16:21:55 -0000
Content-Type: text/plain

* Update to latest supported release.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 conf/machine/include/omap3.inc                |    2 +-
 recipes-kernel/linux/linux-omap-psp_2.6.37.bb |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 212ebe7..c80939a 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -16,7 +16,7 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r124"
+MACHINE_KERNEL_PR = "r125"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
index 5d72af5..d1a6478 100644
--- a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
@@ -5,7 +5,8 @@ DESCRIPTION = "Linux kernel for OMAP3 EVM from PSP, based on linux-omap3 kernel"
 
 COMPATIBLE_MACHINE = "omap3"
 
-SRCREV= "20c003f2f024d9f50f59edf9f1b8f5f035fb15b8"
+# SRCREV corresponds to tag v2.6.37_OMAPPSP_04.02.00.07
+SRCREV= "adcd067326836777c049e3cb32a5b7d9d401fc31"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 devices
 # see conf/machine/include/omap3.inc
-- 
1.7.0.4



Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA806E0140C
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 03:07:19 -0700 (PDT)
Received: by wibhm6 with SMTP id hm6so4307576wib.5
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 03:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=bJ6myBqLIX/QgIil0WFfaiT+dTIkILdxTLZMTYG9npI=;
	b=eiBtBB+9ieC6Cn9gZS8V+LCb7w0ZJhF7sVcqty4zCAX8VLbPxw16iD3C6RbxnPiWkC
	QT1h2SEmPQVRXrwr4WALic7bqnUtZnsLhSkIP+Ljj8k9cwGU/xY4eshhPhgFe5pRNE6i
	88bHjZNbg+qNcjpdAPiT4lfFfG161j4okL0HEDxK8RzdJJpESiblwQnsuqx8jBBhqJrM
	5M8i1TYhtDr3V8r1WeH2j1v/fpdirUIFIa5yxbHMTgGaEg1MBbwJ95qFFub51K4MKh3O
	zsnwGYdll+Hgh2yb6nXmQmcTjtiWbXI/BIMkyJhxZgQ8wnjiaMbikXG9hR2A90pPs8pE
	IYaw==
Received: by 10.180.104.231 with SMTP id gh7mr16736801wib.10.1337249238145;
	Thu, 17 May 2012 03:07:18 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fo7sm55982372wib.9.2012.05.17.03.07.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 03:07:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 17 May 2012 12:07:06 +0200
Message-Id: <1337249227-9151-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnEbggllE/7RQa/e5esugzUvFMBBZy1WTaamMFsmuHJFBYhjPyBayZ8pRw+3E+iBlpQu22C
Cc: denys@ti.com
Subject: [PATCH 1/2] linux-ti33x-psp 3.2: demote cpsw PHY message to INFO
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
X-List-Received-Date: Thu, 17 May 2012 10:07:20 -0000

This keeps them from appearing on the screen during quiet boots. They are still being reported, so no info is lost.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...pws-phy_device-demote-PHY-message-to-INFO.patch |   51 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch
new file mode 100644
index 0000000..2aed646
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch
@@ -0,0 +1,51 @@
+From 04924dfd0335b8adca0e7783112827df30e70a5f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 17 May 2012 10:59:18 +0200
+Subject: [PATCH] cpsw,phy_device: demote PHY message to INFO
+
+This keeps them from appearing on the screen when booting with 'quiet'
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ drivers/net/ethernet/ti/cpsw.c |    2 +-
+ drivers/net/phy/phy_device.c   |    4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
+index 86fe57d..d10996d 100644
+--- a/drivers/net/ethernet/ti/cpsw.c
++++ b/drivers/net/ethernet/ti/cpsw.c
+@@ -638,7 +638,7 @@ static void cpsw_slave_open(struct cpsw_slave *slave, struct cpsw_priv *priv)
+ 		    slave->data->phy_id, slave->slave_num);
+ 		slave->phy = NULL;
+ 	} else {
+-		printk(KERN_ERR"\nCPSW phy found : id is : 0x%x\n",
++		printk(KERN_INFO"\nCPSW phy found : id is : 0x%x\n",
+ 			slave->phy->phy_id);
+ 		cpsw_set_phy_config(priv, slave->phy);
+ 		phy_start(slave->phy);
+diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
+index 83a5a5a..8b84789 100644
+--- a/drivers/net/phy/phy_device.c
++++ b/drivers/net/phy/phy_device.c
+@@ -380,7 +380,7 @@ struct phy_device * phy_connect(struct net_device *dev, const char *bus_id,
+ 	 * PHY with the requested name */
+ 	d = bus_find_device_by_name(&mdio_bus_type, NULL, bus_id);
+ 	if (!d) {
+-		pr_err("PHY %s not found\n", bus_id);
++		pr_info("PHY %s not found\n", bus_id);
+ 		return ERR_PTR(-ENODEV);
+ 	}
+ 	phydev = to_phy_device(d);
+@@ -503,7 +503,7 @@ struct phy_device *phy_attach(struct net_device *dev,
+ 	 * PHY with the requested name */
+ 	d = bus_find_device_by_name(bus, NULL, bus_id);
+ 	if (!d) {
+-		pr_err("PHY %s not found\n", bus_id);
++		pr_info("PHY %s not found\n", bus_id);
+ 		return ERR_PTR(-ENODEV);
+ 	}
+ 	phydev = to_phy_device(d);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 6c5056a..0fe3d4f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "k+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "l+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -970,4 +970,5 @@ PATCHES_OVER_PSP = " \
     file://beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch \
 	file://beaglebone/0044-omap-hwmod-silence-st_shift-error.patch \
 	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
+	file://beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch \
 "
-- 
1.7.10



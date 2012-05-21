Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE252E0030B
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 14:48:38 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C74B35299E; Mon, 21 May 2012 21:48:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120521214835.C74B35299E@arago-project.org>
Date: Mon, 21 May 2012 21:48:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: demote cpsw PHY message to INFO
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
X-List-Received-Date: Mon, 21 May 2012 21:48:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d33058225df1156174db1131d964de1ef0ab3b48
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d33058225df1156174db1131d964de1ef0ab3b48

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu May 17 12:07:06 2012 +0200

linux-ti33x-psp 3.2: demote cpsw PHY message to INFO

This keeps them from appearing on the screen during quiet boots. They are still
being reported, so no info is lost.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...pws-phy_device-demote-PHY-message-to-INFO.patch |   51 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 53 insertions(+), 1 deletions(-)

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
index bb26c70..97c1cd0 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "j+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "l+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -969,4 +969,5 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch \
     file://beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch \
 	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
+	file://beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch \
 "



Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17AE4E006DA
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 11:32:24 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4600E6FJHYQHH0@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 17 May 2012 13:32:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D2340201CA; Thu,
	17 May 2012 14:32:22 -0400 (EDT)
Date: Thu, 17 May 2012 14:32:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120517183222.GK6829@denix.org>
References: <1337249227-9151-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1337249227-9151-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH 1/2] linux-ti33x-psp 3.2: demote cpsw PHY message to INFO
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
X-List-Received-Date: Thu, 17 May 2012 18:32:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 17, 2012 at 12:07:06PM +0200, Koen Kooi wrote:
> This keeps them from appearing on the screen during quiet boots. They are still being reported, so no info is lost.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ...pws-phy_device-demote-PHY-message-to-INFO.patch |   51 ++++++++++++++++++++
>  recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch
> 
> diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch
> new file mode 100644
> index 0000000..2aed646
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch
> @@ -0,0 +1,51 @@
> +From 04924dfd0335b8adca0e7783112827df30e70a5f Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Thu, 17 May 2012 10:59:18 +0200
> +Subject: [PATCH] cpsw,phy_device: demote PHY message to INFO
> +
> +This keeps them from appearing on the screen when booting with 'quiet'
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + drivers/net/ethernet/ti/cpsw.c |    2 +-
> + drivers/net/phy/phy_device.c   |    4 ++--
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
> +index 86fe57d..d10996d 100644
> +--- a/drivers/net/ethernet/ti/cpsw.c
> ++++ b/drivers/net/ethernet/ti/cpsw.c
> +@@ -638,7 +638,7 @@ static void cpsw_slave_open(struct cpsw_slave *slave, struct cpsw_priv *priv)
> + 		    slave->data->phy_id, slave->slave_num);
> + 		slave->phy = NULL;
> + 	} else {
> +-		printk(KERN_ERR"\nCPSW phy found : id is : 0x%x\n",
> ++		printk(KERN_INFO"\nCPSW phy found : id is : 0x%x\n",
> + 			slave->phy->phy_id);
> + 		cpsw_set_phy_config(priv, slave->phy);
> + 		phy_start(slave->phy);
> +diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> +index 83a5a5a..8b84789 100644
> +--- a/drivers/net/phy/phy_device.c
> ++++ b/drivers/net/phy/phy_device.c
> +@@ -380,7 +380,7 @@ struct phy_device * phy_connect(struct net_device *dev, const char *bus_id,
> + 	 * PHY with the requested name */
> + 	d = bus_find_device_by_name(&mdio_bus_type, NULL, bus_id);
> + 	if (!d) {
> +-		pr_err("PHY %s not found\n", bus_id);
> ++		pr_info("PHY %s not found\n", bus_id);
> + 		return ERR_PTR(-ENODEV);
> + 	}
> + 	phydev = to_phy_device(d);
> +@@ -503,7 +503,7 @@ struct phy_device *phy_attach(struct net_device *dev,
> + 	 * PHY with the requested name */
> + 	d = bus_find_device_by_name(bus, NULL, bus_id);
> + 	if (!d) {
> +-		pr_err("PHY %s not found\n", bus_id);
> ++		pr_info("PHY %s not found\n", bus_id);
> + 		return ERR_PTR(-ENODEV);
> + 	}
> + 	phydev = to_phy_device(d);
> +-- 
> +1.7.7.6
> +
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> index 6c5056a..0fe3d4f 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> @@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
>  
>  BRANCH = "v3.2-staging"
>  SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
> -MACHINE_KERNEL_PR_append = "k+gitr${SRCREV}"
> +MACHINE_KERNEL_PR_append = "l+gitr${SRCREV}"
>  
>  COMPATIBLE_MACHINE = "(ti33x)"
>  
> @@ -970,4 +970,5 @@ PATCHES_OVER_PSP = " \
>      file://beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch \
>  	file://beaglebone/0044-omap-hwmod-silence-st_shift-error.patch \

This 0044 patch seems to be missing - did you forget to submit it?

-- 
Denys

>  	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
> +	file://beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch \
>  "
> -- 
> 1.7.10
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


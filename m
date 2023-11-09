Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3BDC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 15:18:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.123992.1699543126707973987
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Nov 2023 07:18:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YLFun3Rt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A9FIjSf100957;
	Thu, 9 Nov 2023 09:18:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699543125;
	bh=if7Hzl5Rw84O/QDCFLrwkSnKkhg8PfuwqWhX1ZTutMg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=YLFun3Rtkvb3UrSxoTaXcEXv4nZzCVs8h/Nujnbo/JnoKmtV5gvLlAMk8FC6D/MzW
	 qXK33aGL/Es3wlN9okaa+O8qfip24e1+LRbIm0123jPbZ1ymjzEqwfQoz0iUr2ZwB3
	 U7lNuIugVgzOiw/WI0jx9qm0eI8z5vuefWapOj7k=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A9FIjno033218
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Nov 2023 09:18:45 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Nov 2023 09:18:44 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Nov 2023 09:18:44 -0600
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A9FIiCR049854;
	Thu, 9 Nov 2023 09:18:44 -0600
Message-ID: <b687aea1-7d55-4c44-95f3-e1822c7a0dbf@ti.com>
Date: Thu, 9 Nov 2023 09:18:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] linux-ti-staging: Remove
 kernel v5.10 packages
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20231108165831.2774365-1-afd@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231108165831.2774365-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Nov 2023 15:18:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17283


Andrew,

Can we add a third patch to also remove the class:

kernel-fitimage-ti-u-boot.bbclass

I beleive it is only referenced in the 5.10 recipe.


On 11/8/2023 10:58 AM, Andrew Davis wrote:
> We support Linux v6.1 as our official version for Kirkstone. The older
> kernel version was kept around during the transition to the newer version,
> but we are past that now. Remove this old version.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   ...a-ahci-fix-enum-constants-for-gcc-13.patch | 351 ------------------
>   .../linux/linux-ti-staging-5.10/defconfig     |   1 -
>   .../linux-ti-staging-5.10/dra7xx/defconfig    |   1 -
>   .../linux/linux-ti-staging-5.10/k3/defconfig  |   1 -
>   .../linux-ti-staging-5.10/omapl138/defconfig  |   1 -
>   .../linux-ti-staging-5.10/ti33x/defconfig     |   1 -
>   .../linux-ti-staging-5.10/ti43x/defconfig     |   1 -
>   .../linux/linux-ti-staging-rt-5.10/defconfig  |   1 -
>   .../linux-ti-staging-rt-5.10/dra7xx/defconfig |   1 -
>   .../linux-ti-staging-rt-5.10/k3/defconfig     |   1 -
>   .../linux-ti-staging-rt-5.10/ti33x/defconfig  |   1 -
>   .../linux-ti-staging-rt-5.10/ti43x/defconfig  |   1 -
>   .../linux/linux-ti-staging-rt_5.10.bb         |  10 -
>   .../linux-ti-staging-systest-5.10/defconfig   |   1 -
>   .../dra7xx/defconfig                          |   1 -
>   .../k3/defconfig                              |   1 -
>   .../omapl138/defconfig                        |   1 -
>   .../ti33x/defconfig                           |   1 -
>   .../ti43x/defconfig                           |   1 -
>   .../linux/linux-ti-staging-systest_5.10.bb    |   5 -
>   .../linux/linux-ti-staging_5.10.bb            |  47 ---
>   21 files changed, 430 deletions(-)
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/dra7xx/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/k3/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/omapl138/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti33x/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti43x/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/dra7xx/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/k3/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti33x/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti43x/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/dra7xx/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/k3/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/omapl138/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/ti33x/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/ti43x/defconfig
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch b/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
> deleted file mode 100644
> index 634b1588..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
> +++ /dev/null
> @@ -1,351 +0,0 @@
> -From f07788079f515ca4a681c5f595bdad19cfbd7b1d Mon Sep 17 00:00:00 2001
> -From: Arnd Bergmann <arnd@arndb.de>
> -Date: Sat, 3 Dec 2022 11:54:25 +0100
> -Subject: [PATCH] ata: ahci: fix enum constants for gcc-13
> -
> -gcc-13 slightly changes the type of constant expressions that are defined
> -in an enum, which triggers a compile time sanity check in libata:
> -
> -linux/drivers/ata/libahci.c: In function 'ahci_led_store':
> -linux/include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_302' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
> -357 | _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> -
> -The new behavior is that sizeof() returns the same value for the
> -constant as it does for the enum type, which is generally more sensible
> -and consistent.
> -
> -The problem in libata is that it contains a single enum definition for
> -lots of unrelated constants, some of which are large positive (unsigned)
> -integers like 0xffffffff, while others like (1<<31) are interpreted as
> -negative integers, and this forces the enum type to become 64 bit wide
> -even though most constants would still fit into a signed 32-bit 'int'.
> -
> -Fix this by changing the entire enum definition to use BIT(x) in place
> -of (1<<x), which results in all values being seen as 'unsigned' and
> -fitting into an unsigned 32-bit type.
> -
> -Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107917
> -Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107405
> -Reported-by: Luis Machado <luis.machado@arm.com>
> -Cc: linux-ide@vger.kernel.org
> -Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> -Cc: stable@vger.kernel.org
> -Cc: Randy Dunlap <rdunlap@infradead.org>
> -Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> -Tested-by: Luis Machado <luis.machado@arm.com>
> -Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ----
> - drivers/ata/ahci.h | 245 +++++++++++++++++++++++----------------------
> - 1 file changed, 123 insertions(+), 122 deletions(-)
> -
> ---- a/drivers/ata/ahci.h
> -+++ b/drivers/ata/ahci.h
> -@@ -24,6 +24,7 @@
> - #include <linux/libata.h>
> - #include <linux/phy/phy.h>
> - #include <linux/regulator/consumer.h>
> -+#include <linux/bits.h>
> -
> - /* Enclosure Management Control */
> - #define EM_CTRL_MSG_TYPE              0x000f0000
> -@@ -54,12 +55,12 @@ enum {
> -	AHCI_PORT_PRIV_FBS_DMA_SZ	= AHCI_CMD_SLOT_SZ +
> -					  AHCI_CMD_TBL_AR_SZ +
> -					  (AHCI_RX_FIS_SZ * 16),
> --	AHCI_IRQ_ON_SG		= (1 << 31),
> --	AHCI_CMD_ATAPI		= (1 << 5),
> --	AHCI_CMD_WRITE		= (1 << 6),
> --	AHCI_CMD_PREFETCH	= (1 << 7),
> --	AHCI_CMD_RESET		= (1 << 8),
> --	AHCI_CMD_CLR_BUSY	= (1 << 10),
> -+	AHCI_IRQ_ON_SG		= BIT(31),
> -+	AHCI_CMD_ATAPI		= BIT(5),
> -+	AHCI_CMD_WRITE		= BIT(6),
> -+	AHCI_CMD_PREFETCH	= BIT(7),
> -+	AHCI_CMD_RESET		= BIT(8),
> -+	AHCI_CMD_CLR_BUSY	= BIT(10),
> -
> -	RX_FIS_PIO_SETUP	= 0x20,	/* offset of PIO Setup FIS data */
> -	RX_FIS_D2H_REG		= 0x40,	/* offset of D2H Register FIS data */
> -@@ -77,37 +78,37 @@ enum {
> -	HOST_CAP2		= 0x24, /* host capabilities, extended */
> -
> -	/* HOST_CTL bits */
> --	HOST_RESET		= (1 << 0),  /* reset controller; self-clear */
> --	HOST_IRQ_EN		= (1 << 1),  /* global IRQ enable */
> --	HOST_MRSM		= (1 << 2),  /* MSI Revert to Single Message */
> --	HOST_AHCI_EN		= (1 << 31), /* AHCI enabled */
> -+	HOST_RESET		= BIT(0),  /* reset controller; self-clear */
> -+	HOST_IRQ_EN		= BIT(1),  /* global IRQ enable */
> -+	HOST_MRSM		= BIT(2),  /* MSI Revert to Single Message */
> -+	HOST_AHCI_EN		= BIT(31), /* AHCI enabled */
> -
> -	/* HOST_CAP bits */
> --	HOST_CAP_SXS		= (1 << 5),  /* Supports External SATA */
> --	HOST_CAP_EMS		= (1 << 6),  /* Enclosure Management support */
> --	HOST_CAP_CCC		= (1 << 7),  /* Command Completion Coalescing */
> --	HOST_CAP_PART		= (1 << 13), /* Partial state capable */
> --	HOST_CAP_SSC		= (1 << 14), /* Slumber state capable */
> --	HOST_CAP_PIO_MULTI	= (1 << 15), /* PIO multiple DRQ support */
> --	HOST_CAP_FBS		= (1 << 16), /* FIS-based switching support */
> --	HOST_CAP_PMP		= (1 << 17), /* Port Multiplier support */
> --	HOST_CAP_ONLY		= (1 << 18), /* Supports AHCI mode only */
> --	HOST_CAP_CLO		= (1 << 24), /* Command List Override support */
> --	HOST_CAP_LED		= (1 << 25), /* Supports activity LED */
> --	HOST_CAP_ALPM		= (1 << 26), /* Aggressive Link PM support */
> --	HOST_CAP_SSS		= (1 << 27), /* Staggered Spin-up */
> --	HOST_CAP_MPS		= (1 << 28), /* Mechanical presence switch */
> --	HOST_CAP_SNTF		= (1 << 29), /* SNotification register */
> --	HOST_CAP_NCQ		= (1 << 30), /* Native Command Queueing */
> --	HOST_CAP_64		= (1 << 31), /* PCI DAC (64-bit DMA) support */
> -+	HOST_CAP_SXS		= BIT(5),  /* Supports External SATA */
> -+	HOST_CAP_EMS		= BIT(6),  /* Enclosure Management support */
> -+	HOST_CAP_CCC		= BIT(7),  /* Command Completion Coalescing */
> -+	HOST_CAP_PART		= BIT(13), /* Partial state capable */
> -+	HOST_CAP_SSC		= BIT(14), /* Slumber state capable */
> -+	HOST_CAP_PIO_MULTI	= BIT(15), /* PIO multiple DRQ support */
> -+	HOST_CAP_FBS		= BIT(16), /* FIS-based switching support */
> -+	HOST_CAP_PMP		= BIT(17), /* Port Multiplier support */
> -+	HOST_CAP_ONLY		= BIT(18), /* Supports AHCI mode only */
> -+	HOST_CAP_CLO		= BIT(24), /* Command List Override support */
> -+	HOST_CAP_LED		= BIT(25), /* Supports activity LED */
> -+	HOST_CAP_ALPM		= BIT(26), /* Aggressive Link PM support */
> -+	HOST_CAP_SSS		= BIT(27), /* Staggered Spin-up */
> -+	HOST_CAP_MPS		= BIT(28), /* Mechanical presence switch */
> -+	HOST_CAP_SNTF		= BIT(29), /* SNotification register */
> -+	HOST_CAP_NCQ		= BIT(30), /* Native Command Queueing */
> -+	HOST_CAP_64		= BIT(31), /* PCI DAC (64-bit DMA) support */
> -
> -	/* HOST_CAP2 bits */
> --	HOST_CAP2_BOH		= (1 << 0),  /* BIOS/OS handoff supported */
> --	HOST_CAP2_NVMHCI	= (1 << 1),  /* NVMHCI supported */
> --	HOST_CAP2_APST		= (1 << 2),  /* Automatic partial to slumber */
> --	HOST_CAP2_SDS		= (1 << 3),  /* Support device sleep */
> --	HOST_CAP2_SADM		= (1 << 4),  /* Support aggressive DevSlp */
> --	HOST_CAP2_DESO		= (1 << 5),  /* DevSlp from slumber only */
> -+	HOST_CAP2_BOH		= BIT(0),  /* BIOS/OS handoff supported */
> -+	HOST_CAP2_NVMHCI	= BIT(1),  /* NVMHCI supported */
> -+	HOST_CAP2_APST		= BIT(2),  /* Automatic partial to slumber */
> -+	HOST_CAP2_SDS		= BIT(3),  /* Support device sleep */
> -+	HOST_CAP2_SADM		= BIT(4),  /* Support aggressive DevSlp */
> -+	HOST_CAP2_DESO		= BIT(5),  /* DevSlp from slumber only */
> -
> -	/* registers for each SATA port */
> -	PORT_LST_ADDR		= 0x00, /* command list DMA addr */
> -@@ -129,24 +130,24 @@ enum {
> -	PORT_DEVSLP		= 0x44, /* device sleep */
> -
> -	/* PORT_IRQ_{STAT,MASK} bits */
> --	PORT_IRQ_COLD_PRES	= (1 << 31), /* cold presence detect */
> --	PORT_IRQ_TF_ERR		= (1 << 30), /* task file error */
> --	PORT_IRQ_HBUS_ERR	= (1 << 29), /* host bus fatal error */
> --	PORT_IRQ_HBUS_DATA_ERR	= (1 << 28), /* host bus data error */
> --	PORT_IRQ_IF_ERR		= (1 << 27), /* interface fatal error */
> --	PORT_IRQ_IF_NONFATAL	= (1 << 26), /* interface non-fatal error */
> --	PORT_IRQ_OVERFLOW	= (1 << 24), /* xfer exhausted available S/G */
> --	PORT_IRQ_BAD_PMP	= (1 << 23), /* incorrect port multiplier */
> --
> --	PORT_IRQ_PHYRDY		= (1 << 22), /* PhyRdy changed */
> --	PORT_IRQ_DEV_ILCK	= (1 << 7), /* device interlock */
> --	PORT_IRQ_CONNECT	= (1 << 6), /* port connect change status */
> --	PORT_IRQ_SG_DONE	= (1 << 5), /* descriptor processed */
> --	PORT_IRQ_UNK_FIS	= (1 << 4), /* unknown FIS rx'd */
> --	PORT_IRQ_SDB_FIS	= (1 << 3), /* Set Device Bits FIS rx'd */
> --	PORT_IRQ_DMAS_FIS	= (1 << 2), /* DMA Setup FIS rx'd */
> --	PORT_IRQ_PIOS_FIS	= (1 << 1), /* PIO Setup FIS rx'd */
> --	PORT_IRQ_D2H_REG_FIS	= (1 << 0), /* D2H Register FIS rx'd */
> -+	PORT_IRQ_COLD_PRES	= BIT(31), /* cold presence detect */
> -+	PORT_IRQ_TF_ERR		= BIT(30), /* task file error */
> -+	PORT_IRQ_HBUS_ERR	= BIT(29), /* host bus fatal error */
> -+	PORT_IRQ_HBUS_DATA_ERR	= BIT(28), /* host bus data error */
> -+	PORT_IRQ_IF_ERR		= BIT(27), /* interface fatal error */
> -+	PORT_IRQ_IF_NONFATAL	= BIT(26), /* interface non-fatal error */
> -+	PORT_IRQ_OVERFLOW	= BIT(24), /* xfer exhausted available S/G */
> -+	PORT_IRQ_BAD_PMP	= BIT(23), /* incorrect port multiplier */
> -+
> -+	PORT_IRQ_PHYRDY		= BIT(22), /* PhyRdy changed */
> -+	PORT_IRQ_DEV_ILCK	= BIT(7), /* device interlock */
> -+	PORT_IRQ_CONNECT	= BIT(6), /* port connect change status */
> -+	PORT_IRQ_SG_DONE	= BIT(5), /* descriptor processed */
> -+	PORT_IRQ_UNK_FIS	= BIT(4), /* unknown FIS rx'd */
> -+	PORT_IRQ_SDB_FIS	= BIT(3), /* Set Device Bits FIS rx'd */
> -+	PORT_IRQ_DMAS_FIS	= BIT(2), /* DMA Setup FIS rx'd */
> -+	PORT_IRQ_PIOS_FIS	= BIT(1), /* PIO Setup FIS rx'd */
> -+	PORT_IRQ_D2H_REG_FIS	= BIT(0), /* D2H Register FIS rx'd */
> -
> -	PORT_IRQ_FREEZE		= PORT_IRQ_HBUS_ERR |
> -				  PORT_IRQ_IF_ERR |
> -@@ -162,34 +163,34 @@ enum {
> -				  PORT_IRQ_PIOS_FIS | PORT_IRQ_D2H_REG_FIS,
> -
> -	/* PORT_CMD bits */
> --	PORT_CMD_ASP		= (1 << 27), /* Aggressive Slumber/Partial */
> --	PORT_CMD_ALPE		= (1 << 26), /* Aggressive Link PM enable */
> --	PORT_CMD_ATAPI		= (1 << 24), /* Device is ATAPI */
> --	PORT_CMD_FBSCP		= (1 << 22), /* FBS Capable Port */
> --	PORT_CMD_ESP		= (1 << 21), /* External Sata Port */
> --	PORT_CMD_HPCP		= (1 << 18), /* HotPlug Capable Port */
> --	PORT_CMD_PMP		= (1 << 17), /* PMP attached */
> --	PORT_CMD_LIST_ON	= (1 << 15), /* cmd list DMA engine running */
> --	PORT_CMD_FIS_ON		= (1 << 14), /* FIS DMA engine running */
> --	PORT_CMD_FIS_RX		= (1 << 4), /* Enable FIS receive DMA engine */
> --	PORT_CMD_CLO		= (1 << 3), /* Command list override */
> --	PORT_CMD_POWER_ON	= (1 << 2), /* Power up device */
> --	PORT_CMD_SPIN_UP	= (1 << 1), /* Spin up device */
> --	PORT_CMD_START		= (1 << 0), /* Enable port DMA engine */
> --
> --	PORT_CMD_ICC_MASK	= (0xf << 28), /* i/f ICC state mask */
> --	PORT_CMD_ICC_ACTIVE	= (0x1 << 28), /* Put i/f in active state */
> --	PORT_CMD_ICC_PARTIAL	= (0x2 << 28), /* Put i/f in partial state */
> --	PORT_CMD_ICC_SLUMBER	= (0x6 << 28), /* Put i/f in slumber state */
> -+	PORT_CMD_ASP		= BIT(27), /* Aggressive Slumber/Partial */
> -+	PORT_CMD_ALPE		= BIT(26), /* Aggressive Link PM enable */
> -+	PORT_CMD_ATAPI		= BIT(24), /* Device is ATAPI */
> -+	PORT_CMD_FBSCP		= BIT(22), /* FBS Capable Port */
> -+	PORT_CMD_ESP		= BIT(21), /* External Sata Port */
> -+	PORT_CMD_HPCP		= BIT(18), /* HotPlug Capable Port */
> -+	PORT_CMD_PMP		= BIT(17), /* PMP attached */
> -+	PORT_CMD_LIST_ON	= BIT(15), /* cmd list DMA engine running */
> -+	PORT_CMD_FIS_ON		= BIT(14), /* FIS DMA engine running */
> -+	PORT_CMD_FIS_RX		= BIT(4), /* Enable FIS receive DMA engine */
> -+	PORT_CMD_CLO		= BIT(3), /* Command list override */
> -+	PORT_CMD_POWER_ON	= BIT(2), /* Power up device */
> -+	PORT_CMD_SPIN_UP	= BIT(1), /* Spin up device */
> -+	PORT_CMD_START		= BIT(0), /* Enable port DMA engine */
> -+
> -+	PORT_CMD_ICC_MASK	= (0xfu << 28), /* i/f ICC state mask */
> -+	PORT_CMD_ICC_ACTIVE	= (0x1u << 28), /* Put i/f in active state */
> -+	PORT_CMD_ICC_PARTIAL	= (0x2u << 28), /* Put i/f in partial state */
> -+	PORT_CMD_ICC_SLUMBER	= (0x6u << 28), /* Put i/f in slumber state */
> -
> -	/* PORT_FBS bits */
> -	PORT_FBS_DWE_OFFSET	= 16, /* FBS device with error offset */
> -	PORT_FBS_ADO_OFFSET	= 12, /* FBS active dev optimization offset */
> -	PORT_FBS_DEV_OFFSET	= 8,  /* FBS device to issue offset */
> -	PORT_FBS_DEV_MASK	= (0xf << PORT_FBS_DEV_OFFSET),  /* FBS.DEV */
> --	PORT_FBS_SDE		= (1 << 2), /* FBS single device error */
> --	PORT_FBS_DEC		= (1 << 1), /* FBS device error clear */
> --	PORT_FBS_EN		= (1 << 0), /* Enable FBS */
> -+	PORT_FBS_SDE		= BIT(2), /* FBS single device error */
> -+	PORT_FBS_DEC		= BIT(1), /* FBS device error clear */
> -+	PORT_FBS_EN		= BIT(0), /* Enable FBS */
> -
> -	/* PORT_DEVSLP bits */
> -	PORT_DEVSLP_DM_OFFSET	= 25,             /* DITO multiplier offset */
> -@@ -197,52 +198,52 @@ enum {
> -	PORT_DEVSLP_DITO_OFFSET	= 15,             /* DITO offset */
> -	PORT_DEVSLP_MDAT_OFFSET	= 10,             /* Minimum assertion time */
> -	PORT_DEVSLP_DETO_OFFSET	= 2,              /* DevSlp exit timeout */
> --	PORT_DEVSLP_DSP		= (1 << 1),       /* DevSlp present */
> --	PORT_DEVSLP_ADSE	= (1 << 0),       /* Aggressive DevSlp enable */
> -+	PORT_DEVSLP_DSP		= BIT(1),       /* DevSlp present */
> -+	PORT_DEVSLP_ADSE	= BIT(0),       /* Aggressive DevSlp enable */
> -
> -	/* hpriv->flags bits */
> -
> - #define AHCI_HFLAGS(flags)		.private_data	= (void *)(flags)
> -
> --	AHCI_HFLAG_NO_NCQ		= (1 << 0),
> --	AHCI_HFLAG_IGN_IRQ_IF_ERR	= (1 << 1), /* ignore IRQ_IF_ERR */
> --	AHCI_HFLAG_IGN_SERR_INTERNAL	= (1 << 2), /* ignore SERR_INTERNAL */
> --	AHCI_HFLAG_32BIT_ONLY		= (1 << 3), /* force 32bit */
> --	AHCI_HFLAG_MV_PATA		= (1 << 4), /* PATA port */
> --	AHCI_HFLAG_NO_MSI		= (1 << 5), /* no PCI MSI */
> --	AHCI_HFLAG_NO_PMP		= (1 << 6), /* no PMP */
> --	AHCI_HFLAG_SECT255		= (1 << 8), /* max 255 sectors */
> --	AHCI_HFLAG_YES_NCQ		= (1 << 9), /* force NCQ cap on */
> --	AHCI_HFLAG_NO_SUSPEND		= (1 << 10), /* don't suspend */
> --	AHCI_HFLAG_SRST_TOUT_IS_OFFLINE	= (1 << 11), /* treat SRST timeout as
> -+	AHCI_HFLAG_NO_NCQ		= BIT(0),
> -+	AHCI_HFLAG_IGN_IRQ_IF_ERR	= BIT(1), /* ignore IRQ_IF_ERR */
> -+	AHCI_HFLAG_IGN_SERR_INTERNAL	= BIT(2), /* ignore SERR_INTERNAL */
> -+	AHCI_HFLAG_32BIT_ONLY		= BIT(3), /* force 32bit */
> -+	AHCI_HFLAG_MV_PATA		= BIT(4), /* PATA port */
> -+	AHCI_HFLAG_NO_MSI		= BIT(5), /* no PCI MSI */
> -+	AHCI_HFLAG_NO_PMP		= BIT(6), /* no PMP */
> -+	AHCI_HFLAG_SECT255		= BIT(8), /* max 255 sectors */
> -+	AHCI_HFLAG_YES_NCQ		= BIT(9), /* force NCQ cap on */
> -+	AHCI_HFLAG_NO_SUSPEND		= BIT(10), /* don't suspend */
> -+	AHCI_HFLAG_SRST_TOUT_IS_OFFLINE	= BIT(11), /* treat SRST timeout as
> -							link offline */
> --	AHCI_HFLAG_NO_SNTF		= (1 << 12), /* no sntf */
> --	AHCI_HFLAG_NO_FPDMA_AA		= (1 << 13), /* no FPDMA AA */
> --	AHCI_HFLAG_YES_FBS		= (1 << 14), /* force FBS cap on */
> --	AHCI_HFLAG_DELAY_ENGINE		= (1 << 15), /* do not start engine on
> -+	AHCI_HFLAG_NO_SNTF		= BIT(12), /* no sntf */
> -+	AHCI_HFLAG_NO_FPDMA_AA		= BIT(13), /* no FPDMA AA */
> -+	AHCI_HFLAG_YES_FBS		= BIT(14), /* force FBS cap on */
> -+	AHCI_HFLAG_DELAY_ENGINE		= BIT(15), /* do not start engine on
> -						        port start (wait until
> -						        error-handling stage) */
> --	AHCI_HFLAG_NO_DEVSLP		= (1 << 17), /* no device sleep */
> --	AHCI_HFLAG_NO_FBS		= (1 << 18), /* no FBS */
> -+	AHCI_HFLAG_NO_DEVSLP		= BIT(17), /* no device sleep */
> -+	AHCI_HFLAG_NO_FBS		= BIT(18), /* no FBS */
> -
> - #ifdef CONFIG_PCI_MSI
> --	AHCI_HFLAG_MULTI_MSI		= (1 << 20), /* per-port MSI(-X) */
> -+	AHCI_HFLAG_MULTI_MSI		= BIT(20), /* per-port MSI(-X) */
> - #else
> -	/* compile out MSI infrastructure */
> -	AHCI_HFLAG_MULTI_MSI		= 0,
> - #endif
> --	AHCI_HFLAG_WAKE_BEFORE_STOP	= (1 << 22), /* wake before DMA stop */
> --	AHCI_HFLAG_YES_ALPM		= (1 << 23), /* force ALPM cap on */
> --	AHCI_HFLAG_NO_WRITE_TO_RO	= (1 << 24), /* don't write to read
> -+	AHCI_HFLAG_WAKE_BEFORE_STOP	= BIT(22), /* wake before DMA stop */
> -+	AHCI_HFLAG_YES_ALPM		= BIT(23), /* force ALPM cap on */
> -+	AHCI_HFLAG_NO_WRITE_TO_RO	= BIT(24), /* don't write to read
> -							only registers */
> --	AHCI_HFLAG_IS_MOBILE		= (1 << 25), /* mobile chipset, use
> -+	AHCI_HFLAG_IS_MOBILE		= BIT(25), /* mobile chipset, use
> -							SATA_MOBILE_LPM_POLICY
> -							as default lpm_policy */
> --	AHCI_HFLAG_SUSPEND_PHYS		= (1 << 26), /* handle PHYs during
> -+	AHCI_HFLAG_SUSPEND_PHYS		= BIT(26), /* handle PHYs during
> -							suspend/resume */
> --	AHCI_HFLAG_IGN_NOTSUPP_POWER_ON	= (1 << 27), /* ignore -EOPNOTSUPP
> -+	AHCI_HFLAG_IGN_NOTSUPP_POWER_ON	= BIT(27), /* ignore -EOPNOTSUPP
> -							from phy_power_on() */
> --	AHCI_HFLAG_NO_SXS		= (1 << 28), /* SXS not supported */
> -+	AHCI_HFLAG_NO_SXS		= BIT(28), /* SXS not supported */
> -
> -	/* ap->flags bits */
> -
> -@@ -258,22 +259,22 @@ enum {
> -	EM_MAX_RETRY			= 5,
> -
> -	/* em_ctl bits */
> --	EM_CTL_RST		= (1 << 9), /* Reset */
> --	EM_CTL_TM		= (1 << 8), /* Transmit Message */
> --	EM_CTL_MR		= (1 << 0), /* Message Received */
> --	EM_CTL_ALHD		= (1 << 26), /* Activity LED */
> --	EM_CTL_XMT		= (1 << 25), /* Transmit Only */
> --	EM_CTL_SMB		= (1 << 24), /* Single Message Buffer */
> --	EM_CTL_SGPIO		= (1 << 19), /* SGPIO messages supported */
> --	EM_CTL_SES		= (1 << 18), /* SES-2 messages supported */
> --	EM_CTL_SAFTE		= (1 << 17), /* SAF-TE messages supported */
> --	EM_CTL_LED		= (1 << 16), /* LED messages supported */
> -+	EM_CTL_RST		= BIT(9), /* Reset */
> -+	EM_CTL_TM		= BIT(8), /* Transmit Message */
> -+	EM_CTL_MR		= BIT(0), /* Message Received */
> -+	EM_CTL_ALHD		= BIT(26), /* Activity LED */
> -+	EM_CTL_XMT		= BIT(25), /* Transmit Only */
> -+	EM_CTL_SMB		= BIT(24), /* Single Message Buffer */
> -+	EM_CTL_SGPIO		= BIT(19), /* SGPIO messages supported */
> -+	EM_CTL_SES		= BIT(18), /* SES-2 messages supported */
> -+	EM_CTL_SAFTE		= BIT(17), /* SAF-TE messages supported */
> -+	EM_CTL_LED		= BIT(16), /* LED messages supported */
> -
> -	/* em message type */
> --	EM_MSG_TYPE_LED		= (1 << 0), /* LED */
> --	EM_MSG_TYPE_SAFTE	= (1 << 1), /* SAF-TE */
> --	EM_MSG_TYPE_SES2	= (1 << 2), /* SES-2 */
> --	EM_MSG_TYPE_SGPIO	= (1 << 3), /* SGPIO */
> -+	EM_MSG_TYPE_LED		= BIT(0), /* LED */
> -+	EM_MSG_TYPE_SAFTE	= BIT(1), /* SAF-TE */
> -+	EM_MSG_TYPE_SES2	= BIT(2), /* SES-2 */
> -+	EM_MSG_TYPE_SGPIO	= BIT(3), /* SGPIO */
> - };
> -
> - struct ahci_cmd_hdr {
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/defconfig
> deleted file mode 100644
> index d083d182..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_omap2_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/dra7xx/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/dra7xx/defconfig
> deleted file mode 100644
> index dcb53bab..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/dra7xx/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_dra7x_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/k3/defconfig
> deleted file mode 100644
> index b9bc6137..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/k3/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_arm64_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/omapl138/defconfig
> deleted file mode 100644
> index b3467853..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/omapl138/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_omapl138_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti33x/defconfig
> deleted file mode 100644
> index 88f80fa9..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti33x/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_am3x_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti43x/defconfig
> deleted file mode 100644
> index 4b9daaf9..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti43x/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_am4x_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/defconfig
> deleted file mode 100644
> index f0b8bab0..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_omap2_rt_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/dra7xx/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/dra7xx/defconfig
> deleted file mode 100644
> index 47e3d04a..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/dra7xx/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_dra7x_rt_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/k3/defconfig
> deleted file mode 100644
> index cc10bfda..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/k3/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_arm64_rt_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti33x/defconfig
> deleted file mode 100644
> index 0a4fbac2..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti33x/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_am3x_rt_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti43x/defconfig
> deleted file mode 100644
> index 99594c81..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti43x/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_am4x_rt_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> deleted file mode 100644
> index 952af859..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require linux-ti-staging_5.10.bb
> -
> -# Look in the generic major.minor directory for files
> -# This will have priority over generic non-rt path
> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.10:"
> -
> -BRANCH = "ti-rt-linux-5.10.y"
> -
> -SRCREV = "101d44260b8dfbab27763581e4bbd534dd36ae33"
> -PV = "5.10.168+git${SRCPV}"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/defconfig
> deleted file mode 100644
> index 5d051bd1..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_omap2_debug
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/dra7xx/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/dra7xx/defconfig
> deleted file mode 100644
> index 2b3635c3..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/dra7xx/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_dra7x_debug
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/k3/defconfig
> deleted file mode 100644
> index 56cf9302..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/k3/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_arm64_debug
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/omapl138/defconfig
> deleted file mode 100644
> index 95b61168..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/omapl138/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_omapl138_debug
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/ti33x/defconfig
> deleted file mode 100644
> index 9ab6733c..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/ti33x/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_am3x_debug
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/ti43x/defconfig
> deleted file mode 100644
> index 825c31cd..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/ti43x/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_am4x_debug
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
> deleted file mode 100644
> index e57d82eb..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require linux-ti-staging_5.10.bb
> -
> -# Look in the generic major.minor directory for files
> -# This will have priority over generic non-rt path
> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.10:"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> deleted file mode 100644
> index 0cf0a319..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -SECTION = "kernel"
> -SUMMARY = "Linux kernel for TI devices"
> -LICENSE = "GPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> -
> -KERNEL_CLASSES += "${@bb.utils.contains('TFA_PLATFORM', 'k3', 'kernel-fitimage-ti-u-boot', '', d)}"
> -
> -inherit kernel
> -
> -DEFCONFIG_BUILDER = "${S}/ti_config_fragments/defconfig_builder.sh"
> -require recipes-kernel/linux/setup-defconfig.inc
> -require recipes-kernel/linux/ti-kernel.inc
> -include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
> -
> -DEPENDS += "gmp-native libmpc-native"
> -
> -# Look in the generic major.minor directory for files
> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.10:"
> -
> -KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
> -		      ${EXTRA_DTC_ARGS}"
> -
> -S = "${WORKDIR}/git"
> -
> -BRANCH = "ti-linux-5.10.y"
> -
> -SRCREV = "991c5ce91e43cb620f534dc9fe7b0ad21f4f4388"
> -PV = "5.10.168+git${SRCPV}"
> -
> -# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR:append = "b"
> -PR = "${MACHINE_KERNEL_PR}"
> -
> -KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
> -KERNEL_GIT_PROTOCOL = "https"
> -SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
> -            file://0001-ata-ahci-fix-enum-constants-for-gcc-13.patch \
> -            file://defconfig"
> -
> -FILES:${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
> -
> -# Special configuration for remoteproc/rpmsg IPC modules
> -module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
> -module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
> -module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
> -KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
> -KERNEL_MODULE_AUTOLOAD:append:j721e = " rpmsg_kdrv_switch"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


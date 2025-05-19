Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AD5C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:22:15 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1000.1747675334556975787
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JF5tox9r;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54JHM9oI520983
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 12:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747675329;
	bh=v7GOxnlZU3dib1RLWP9xSKAIwihKpbimfNAckAvF5cM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JF5tox9reXEJzO11h0Fl85Nwdyy9CRrbh9VikZ6uJYD9QcsesMv2xS8T8Kp+l/98Z
	 dUQj/tTYLYxlX0zBSomRAhstDpXgd1Qbk4Whs21QoQP4UVe7axDqBky0OjDqyl27LV
	 FpaI1ajUQzPgoorSAtSVnWnZ7gxkWbGZQc/2f+/w=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54JHM9K6026576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 May 2025 12:22:09 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:22:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:22:09 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JHM8FV126106;
	Mon, 19 May 2025 12:22:09 -0500
Message-ID: <23d2cb8c-3603-4389-8737-caf2fc9b3d0f@ti.com>
Date: Mon, 19 May 2025 12:22:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH 5/6] beagley-ai: upgrade BeagleY-AI to
 6.12
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20250517005430.3648211-1-denis@denix.org>
 <20250517005430.3648211-5-denis@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250517005430.3648211-5-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 19 May 2025 17:22:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18584

On 5/16/25 7:54 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Upgrade BeagleY-AI platform to 6.12 BSP.
> 
> U-boot support for this platform is still in its own branch.
> 
> Also adjust U-boot bootcmd, as Distro Boot doesn't fully work yet.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-beagle/conf/machine/beagley-ai-k3r5.conf             | 3 +--
>   meta-beagle/conf/machine/beagley-ai.conf                  | 8 ++++++--
>   .../u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti-mmc.cfg   | 1 +
>   meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb   | 7 +++++++
>   4 files changed, 15 insertions(+), 4 deletions(-)
>   create mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti-mmc.cfg
> 
> diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> index 6cc370d1..8d5111f0 100644
> --- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> +++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> @@ -3,8 +3,6 @@
>   #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
>   
>   require conf/machine/include/k3r5.inc
> -
> -TI_PREFERRED_BSP ?= "bb_org-6_1"
>   require conf/machine/include/beagle-bsp.inc
>   
>   SYSFW_SOC = "j722s"
> @@ -12,5 +10,6 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "j722s_evm_r5_defconfig"
> +UBOOT_MACHINE:bsp-bb_org-6_12 = "am67a_beagley_ai_r5_defconfig"
>   
>   UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am67a_beagley_ai_r5.config"
> diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/machine/beagley-ai.conf
> index 9b1832d2..497001ee 100644
> --- a/meta-beagle/conf/machine/beagley-ai.conf
> +++ b/meta-beagle/conf/machine/beagley-ai.conf
> @@ -3,11 +3,10 @@
>   #@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
>   
>   require conf/machine/include/j722s.inc
> -
> -TI_PREFERRED_BSP ?= "bb_org-6_1"
>   require conf/machine/include/beagle-bsp.inc
>   
>   UBOOT_MACHINE = "j722s_evm_a53_config"
> +UBOOT_MACHINE:bsp-bb_org-6_12 = "am67a_beagley_ai_a53_defconfig"
>   
>   UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am67a_beagley_ai_a53.config"
>   
> @@ -22,4 +21,9 @@ ti/k3-j722s-evm.dtb \
>   ti/k3-am67a-beagley-ai.dtb \
>   "
>   
> +KERNEL_DEVICETREE:append:bsp-bb_org-6_12 = " \
> +ti/k3-j722s-evm.dtb \
> +ti/k3-am67a-beagley-ai.dtb \
> +"
> +
>   MACHINE_GUI_CLASS = "bigscreen"
> diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti-mmc.cfg b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti-mmc.cfg
> new file mode 100644
> index 00000000..362696b9
> --- /dev/null
> +++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti-mmc.cfg
> @@ -0,0 +1 @@
> +CONFIG_BOOTCOMMAND="run bootcmd_ti_mmc"
> diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> index 492705c2..9fc4015e 100644
> --- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> +++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> @@ -10,3 +10,10 @@ UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
>   UBOOT_GIT_PROTOCOL = "https"
>   BRANCH = "v2025.04-Beagle"
>   SRCREV = "ea2aeefcb2de36f8ca1b51d0580826d13c01f143"
> +
> +BRANCH:beagley-ai = "v2025.04-rc3-BeagleY-AI"

BeagleY-AI support is now in the latest upstream master. This branch here
is missing some updates for BeagleY-AI that can be found in master.

Would it be better here to take the v2025.07-rc1-Beagle here which
includes both these additional BeagleY-AI patches and also PB2 support?
Maybe it should be the default then.

Andrew

[0] $ git log --oneline 5a0a93a7684..9f5f9965960

> +BRANCH:beagley-ai-k3r5 = "v2025.04-rc3-BeagleY-AI"
> +SRCREV:beagley-ai = "cc376f9faef201670c7bb1734f42f5475c73f85d"
> +SRCREV:beagley-ai-k3r5 = "cc376f9faef201670c7bb1734f42f5475c73f85d"
> +
> +SRC_URI:append:beagley-ai = " file://bootcmd-ti-mmc.cfg"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18567): https://lists.yoctoproject.org/g/meta-ti/message/18567
> Mute This Topic: https://lists.yoctoproject.org/mt/113155503/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


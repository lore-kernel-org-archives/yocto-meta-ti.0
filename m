Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A78C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 11:53:10 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.46571.1748001188185862816
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 May 2025 04:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pamR7coo;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54NBr4fo2093809;
	Fri, 23 May 2025 06:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748001184;
	bh=IBZCjmv3RBka8LUhTr/kWNIPLemMWf3EbTw0uEzf+tk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pamR7cooCMdbCE3+MlrAQupX7J/Wxi5BKp3R87eX4FBSNmmwwUwNnccHRaFJ+T0sJ
	 ROL2CjzY6qDpLeLhPzhc3bJSPLldTYzvIwrUHPd8+zerI40YBNbpHs9q0aJlcFe+c4
	 0IUDN8/PsqhL2KBRzCPt8N5oGqR+inz0XUFYrJG0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54NBr4cf2193659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 06:53:04 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 06:53:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 06:53:04 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54NBr2bp043188;
	Fri, 23 May 2025 06:53:03 -0500
Message-ID: <ad550e5e-3f13-45ff-8b42-08ff4e7117eb@ti.com>
Date: Fri, 23 May 2025 17:23:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH 6/6] pocketbeagle2: add configs for new
 PocketBeagle2 platform
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, "Gole, Dhruva" <d-gole@ti.com>
References: <20250517005430.3648211-1-denis@denix.org>
 <20250517005430.3648211-6-denis@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250517005430.3648211-6-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 11:53:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18590

+ Dhruva from beagleboard.org

Looks like Beagle-board.org just released Rev A1 which
makes it quad-core A53 plus GPU [0]

Dhruva,

Any idea if beagleboard/u-boot will do s/am6232/am6254 in [1]

[0]: 
https://www.hackster.io/news/beagleboard-org-releases-a-surprise-pocketbeagle-2-refresh-doubles-the-cores-and-adds-a-gpu-286c3fe8ccd3

[1]: 
https://github.com/beagleboard/u-boot/commit/f7439516453b7728bda496ff6496ef6f1411aae3 


--
Chirag


On 17/05/25 06:24, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> Add configuration files for the new PocketBeagle2 platform.
>
> U-boot support for this platform is still in its own branch.
>
> Adjust U-boot bootcmd, since EFI boot doesn't seem to work.
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../conf/machine/pocketbeagle2-k3r5.conf      | 12 ++++++++
>   meta-beagle/conf/machine/pocketbeagle2.conf   | 28 +++++++++++++++++++
>   .../u-boot/u-boot-bb.org_2025.04.bb           |  9 +++++-
>   .../recipes-kernel/linux/linux-bb.org_6.12.bb |  2 +-
>   4 files changed, 49 insertions(+), 2 deletions(-)
>   create mode 100644 meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
>   create mode 100644 meta-beagle/conf/machine/pocketbeagle2.conf
>
> diff --git a/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf b/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
> new file mode 100644
> index 00000000..32e40312
> --- /dev/null
> +++ b/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
> @@ -0,0 +1,12 @@
> +#@TYPE: Machine
> +#@NAME: PocketBeagle2 (R5F)
> +#@DESCRIPTION: Machine configuration for the PocketBeagle2 (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +require conf/machine/include/beagle-bsp.inc
> +
> +SYSFW_SOC = "am62x"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs-fs"
> +
> +UBOOT_MACHINE = "am6232_pocketbeagle2_r5_defconfig"
> diff --git a/meta-beagle/conf/machine/pocketbeagle2.conf b/meta-beagle/conf/machine/pocketbeagle2.conf
> new file mode 100644
> index 00000000..3d9651bd
> --- /dev/null
> +++ b/meta-beagle/conf/machine/pocketbeagle2.conf
> @@ -0,0 +1,28 @@
> +#@TYPE: Machine
> +#@NAME: PocketBeagle2 (A53)
> +#@DESCRIPTION: Machine configuration for the PocketBeagle2 board (A53 core)
> +
> +require conf/machine/include/k3.inc
> +require conf/machine/include/mc_k3r5.inc
> +
> +require conf/machine/include/beagle-bsp.inc
> +
> +SOC_FAMILY:append = ":am62xx"
> +
> +SERIAL_CONSOLES = "115200;ttyS2"
> +
> +TFA_BOARD = "lite"
> +TFA_K3_SYSTEM_SUSPEND = "1"
> +
> +OPTEEMACHINE = "k3-am62x"
> +
> +UBOOT_MACHINE = "am6232_pocketbeagle2_a53_defconfig"
> +
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am6232 \
> +"
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-am6232-pocketbeagle2.dtb \
> +    ti/k3-am6232-pocketbeagle2-techlab-cape.dtbo \
> +"
> diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> index 9fc4015e..aa825d99 100644
> --- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> +++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> @@ -2,7 +2,7 @@ require recipes-bsp/u-boot/u-boot-ti.inc
>   
>   SUMMARY = "BeagleBoard.org U-Boot"
>   
> -COMPATIBLE_MACHINE = "beagle.*"
> +COMPATIBLE_MACHINE = "pocketbeagle2|beagle.*"
>   
>   PV = "2025.04"
>   
> @@ -17,3 +17,10 @@ SRCREV:beagley-ai = "cc376f9faef201670c7bb1734f42f5475c73f85d"
>   SRCREV:beagley-ai-k3r5 = "cc376f9faef201670c7bb1734f42f5475c73f85d"
>   
>   SRC_URI:append:beagley-ai = " file://bootcmd-ti-mmc.cfg"
> +
> +BRANCH:pocketbeagle2 = "v2025.04-pocketbeagle2"
> +BRANCH:pocketbeagle2-k3r5 = "v2025.04-pocketbeagle2"
> +SRCREV:pocketbeagle2 = "f7439516453b7728bda496ff6496ef6f1411aae3"
> +SRCREV:pocketbeagle2-k3r5 = "f7439516453b7728bda496ff6496ef6f1411aae3"
> +
> +SRC_URI:append:pocketbeagle2 = " file://bootcmd-ti-mmc.cfg"
> diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> index 2ef82e0c..bdfd4646 100644
> --- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> +++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> @@ -6,7 +6,7 @@ SUMMARY = "BeagleBoard.org Linux kernel"
>   LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>   
> -COMPATIBLE_MACHINE = "beagle.*"
> +COMPATIBLE_MACHINE = "pocketbeagle2|beagle.*"
>   
>   inherit kernel
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18569): https://lists.yoctoproject.org/g/meta-ti/message/18569
> Mute This Topic: https://lists.yoctoproject.org/mt/113155505/7030289
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


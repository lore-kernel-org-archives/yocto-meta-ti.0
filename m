Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95849C38142
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 15:44:10 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.45836.1674488641230797438
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 07:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=madf6DU9;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30NFhwe3067999;
	Mon, 23 Jan 2023 09:43:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674488638;
	bh=Kofn+CS8dwdqAftkQkLu/KQloIEGxnX80iKF7hEt6nA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=madf6DU9/+6aHD6Gx345qxsawMos5dGTzQWYqv6MCFhaiIAimuzhjjGOgskceRd4d
	 CT75aPrtp+cbLNDL1C/rKi5BHUqDp1pc6hCOlhnxY+WwZ7WoJZCtlnobh/h8Y0ydW2
	 34sxfcI8a1/bhbxWAqIDWhhTqkIyAI/GD1HUHuIw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30NFhwCB097293
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Jan 2023 09:43:58 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 09:43:57 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 09:43:57 -0600
Received: from [10.250.32.60] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30NFhvlE012208;
	Mon, 23 Jan 2023 09:43:57 -0600
Message-ID: <70e8956f-77ff-464c-40c4-d7d4a61f775f@ti.com>
Date: Mon, 23 Jan 2023 09:43:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: am62xx-evm: Add Support
 for AM62xx HS-SE
Content-Language: en-US
To: <c-shilwant@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20230123102459.562886-1-c-shilwant@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230123102459.562886-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 15:44:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15623

On 1/23/23 4:24 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
> - Add machine conf for AM62xx HS-SE.
> - The wic images will boot on AM62x GP devices by default. To boot on AM62x HS-SE, simply switch out the SYSFW image:
> 

/me longs for day when HS is first-class and GP is treated like the degenerate case it is..

Reviewed-by: Andrew Davis <afd@ti.com>

> $ cd /mnt/sd-card/boot
> $ mv tiboot3-am62x-hs-evm.bin tiboot3.bin
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   ...-evm-k3r5.conf => am62xx-evm-k3r5-gp.conf} |  3 +++
>   conf/machine/am62xx-evm-k3r5-hs-se.conf       | 21 +++++++++++++++++++
>   conf/machine/am62xx-evm.conf                  |  4 ++++
>   conf/machine/include/am62xx.inc               | 11 ++++++++--
>   4 files changed, 37 insertions(+), 2 deletions(-)
>   rename conf/machine/{am62xx-evm-k3r5.conf => am62xx-evm-k3r5-gp.conf} (67%)
>   create mode 100644 conf/machine/am62xx-evm-k3r5-hs-se.conf
> 
> diff --git a/conf/machine/am62xx-evm-k3r5.conf b/conf/machine/am62xx-evm-k3r5-gp.conf
> similarity index 67%
> rename from conf/machine/am62xx-evm-k3r5.conf
> rename to conf/machine/am62xx-evm-k3r5-gp.conf
> index 724a8d4a..d9867bc7 100644
> --- a/conf/machine/am62xx-evm-k3r5.conf
> +++ b/conf/machine/am62xx-evm-k3r5-gp.conf
> @@ -9,3 +9,6 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "gp"
>   
>   UBOOT_MACHINE = "am62x_evm_r5_defconfig"
> +
> +UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/am62xx-evm-k3r5-hs-se.conf b/conf/machine/am62xx-evm-k3r5-hs-se.conf
> new file mode 100644
> index 00000000..913e69fa
> --- /dev/null
> +++ b/conf/machine/am62xx-evm-k3r5-hs-se.conf
> @@ -0,0 +1,21 @@
> +#@TYPE: Machine
> +#@NAME: AM62xx HS-SE EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62xx HS-SE EVM (R5F core)
> +
> +# Booting HS-SE requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-hs-se"
> +
> +SYSFW_SOC = "am62x"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs"
> +
> +SYSFW_TIBOOT3_SYMLINK = ""
> +
> +UBOOT_MACHINE = "am62x_evm_r5_defconfig"
> +
> +SPL_BINARY = ""
> +UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE = "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK = "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
> index 3d9e3b90..b4904eca 100644
> --- a/conf/machine/am62xx-evm.conf
> +++ b/conf/machine/am62xx-evm.conf
> @@ -19,3 +19,7 @@ KERNEL_DEVICETREE = " \
>   "
>   
>   UBOOT_MACHINE = "am62x_evm_a53_defconfig"
> +
> +SPL_BINARY = "tispl.bin_HS"
> +UBOOT_BINARY = "u-boot.img_HS"
> +UBOOT_SYMLINK = "u-boot.img"
> diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
> index 0231235f..912318e9 100644
> --- a/conf/machine/include/am62xx.inc
> +++ b/conf/machine/include/am62xx.inc
> @@ -8,8 +8,15 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   
>   TFA_K3_SYSTEM_SUSPEND = "1"
>   
> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +BBMULTICONFIG = "k3r5-gp"
> +do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +
> +# Since default tiboot3.bin on AM62x is for GP, add a version for HS-SE
> +BBMULTICONFIG += "k3r5-hs-se"
> +IMAGE_BOOT_FILES += " tiboot3-am62x-hs-evm.bin"
> +do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
>   
>   TFA_BOARD = "lite"
>   OPTEEMACHINE = "k3-am62x"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15619): https://lists.yoctoproject.org/g/meta-ti/message/15619
> Mute This Topic: https://lists.yoctoproject.org/mt/96470962/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


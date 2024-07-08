Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9884C3DA42
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 08:27:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.75147.1720427253550479421
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jul 2024 01:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YAPIBoEu;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4688RRR9010426;
	Mon, 8 Jul 2024 03:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720427247;
	bh=z1H+5dXm5B/doQ8UUzLLaB4ncanT6lwcYC2gegetFs8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YAPIBoEuquiSkTVeUI3/9DvruJCDhM3TQZ+taS/I3/M94cZ/32Hr5sr2C+5nuJlQs
	 GxboQ221Ggcmub11HZZ140jfSps0TbznJcoxseD3U9xh/IhU6PtX21AhFStmKAoS+A
	 0XpE2DOZuzMAyhovL8yNHtaloMZ/1q9HB+MOaySw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4688RR26064285
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 03:27:27 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 03:27:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 03:27:27 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4688ROuM107583;
	Mon, 8 Jul 2024 03:27:24 -0500
Message-ID: <32db66e5-730c-42ec-9145-72abdf35b6d1@ti.com>
Date: Mon, 8 Jul 2024 13:57:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v2] conf: machine:
 am62*-evm-k3r5.conf: apply fragment for enabling USB DFU
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <danishanwar@ti.com>, <srk@ti.com>,
        <denys@konsulko.com>, <praneeth@ti.com>, <reatmon@ti.com>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20240708060054.1985156-1-s-vadapalli@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240708060054.1985156-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Jul 2024 08:27:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17829

Hi Siddharth,


I believe this patch is applicable to master branch as well.
So, an update is needed in patch title.


s/[scarthgap]/[master/scarthgap]

On 08/07/24 11:30, Siddharth Vadapalli wrote:
> The config fragment "am62x_r5_usbdfu.config" is applicable to AM62x,
> AM62x-LP-EVM, AM62Ax and AM62Px devices and enables USB DFU boot support at
> the R5 stage of boot.




We need similar update in am62xxsip-evm-k3r5.conf [1] as well to enable 
USB DFU support
on AM62SIP by default.

[1]: 
https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf?h=scarthgap




>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> Hello,
>
> This patch is based on commit
> ff9bf7b9 CI/CD Auto-Merger: cicd.scarthgap.202407071800
> of scarthgap-next branch of meta-ti tree.
>
> v1:
> https://lore.kernel.org/r/20240708052457.1974547-1-s-vadapalli@ti.com/
> Changes since v1:
> - As pointed out by Vignesh Raghavendra <vigneshr@ti.com> at:
>    https://lore.kernel.org/r/829dc5b5-e87c-4679-9e2d-7417c744a9c9@ti.com/
>    the A53 defconfigs already include the "am62x_a53_usbdfu.config" config
>    fragment. Hence, they are not required in the am62*-evm.conf files and
>    have been dropped in this patch.
> - Commit message has been updated accordingly.
>
> Regards,
> Siddharth.
>
>   meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   | 1 +
>   meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf   | 1 +
>   meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    | 1 +
>   meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 1 +
>   4 files changed, 4 insertions(+)
>
> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> index 2af3317e..5ba8c27e 100644
> --- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> @@ -9,3 +9,4 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
> +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> index 36915381..9b68e626 100644
> --- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> @@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "am62px_evm_r5_defconfig"
> +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> index 548369ca..85c48334 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> @@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "am62x_evm_r5_defconfig"
> +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> index 52b69a72..24f96858 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> @@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
> +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"


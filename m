Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7230DEE800B
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 14:17:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.39928.1694182619915092288
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 07:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=w9uMit8X;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388EGuAM015496;
	Fri, 8 Sep 2023 09:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694182616;
	bh=LVGlE3je9bySoBxk6YomgVfdhwRrh5KDzct5IZqBvMg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=w9uMit8XP+cfUgVGsP5ZGcwe6Ratp6WLZrHFN4yifLUFhzHoi90+CX5dLFouKNpM6
	 1g3hwNUUMOicZABYGh4kP6C4NUyf2H3JC+pIhLrAkJL9osKOeWclCCWUzZWqPa2HoF
	 EbRDh0hwu1XTXPGAInwF4koAXFjaGx3CscV2XYjg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388EGuBJ020711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Sep 2023 09:16:56 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 09:16:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 09:16:55 -0500
Received: from [10.247.18.57] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388EGtL7005639;
	Fri, 8 Sep 2023 09:16:55 -0500
Message-ID: <0285dd35-5107-7290-a40c-65880b6a186b@ti.com>
Date: Fri, 8 Sep 2023 09:16:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 2/2] recipes-bsp: u-boot: Add
 logic to handle fragment u-boot configs
Content-Language: en-US
To: Chirag Shilwant <c-shilwant@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20230908131427.2237438-1-c-shilwant@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230908131427.2237438-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 14:17:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16936



On 9/8/2023 8:14 AM, Chirag Shilwant wrote:
> - Add u-boot-mergeconfig.inc which will ensure we handle fragment u-boot configs.
> - Include u-boot-mergeconfig.inc in u-boot-ti.inc.
> - Add a new variable UBOOT_CONFIG_FRAGMENT which stores the name of fragment defconfig to be used.

This patch has to be split,
The config fragment part belongs separately as its own patch and should 
go first.

am62xxsip machine including the necessary uboot config is its seperate 
patch on top

> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf     | 1 +
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 +++++++
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          | 1 +
>   3 files changed, 9 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
> index 472da1cc..a5be1130 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
> @@ -9,3 +9,4 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "am62x_evm_r5_defconfig"
> +UBOOT_CONFIG_FRAGMENT = "am62xsip_sk_r5.config"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> new file mode 100644
> index 00000000..69db6260
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> @@ -0,0 +1,7 @@
> +do_compile:prepend () {
> +   if [ -n "${UBOOT_CONFIG_FRAGMENT}" ]
> +   then
> +       oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE} ${UBOOT_CONFIG_FRAGMENT}
> +       oe_runmake -C ${S} O=${B} olddefconfig
> +   fi
> +}
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index f3285c23..5292517b 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -7,6 +7,7 @@ SPL_BINARY ?= "MLO"
>   
>   require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
>   require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> +require u-boot-mergeconfig.inc
>   
>   FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
>   


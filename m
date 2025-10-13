Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5147CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 12:01:08 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.41893.1760356865273332390
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 05:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Nc+sPlzE;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DC14XU891812
	for <meta-ti@lists.yoctoproject.org>; Mon, 13 Oct 2025 07:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760356864;
	bh=SUBKc0pXfZkjp8gBJfrz5q1ECmlzHlqr27iEWSBh0FY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Nc+sPlzEDX+ftrvMOdLahuEIE/ZOwCZ3Ujvt7rJ+H0RZPY6C1knfR5QbmQC4t+9+a
	 W4Z9uf6dgTRnK3PblzyGt7X6ErGgN2gZCHhy5XiZbToypYeXhMoLtaynlvkKA45keN
	 uu58tFN7iFU3mBIP9QM4DncemBZpO7Ufkw97eQn4=
Received: from DLEE204.ent.ti.com (dlee204.ent.ti.com [157.170.170.84])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DC14l83788850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 13 Oct 2025 07:01:04 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 07:01:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 07:01:04 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DC13SV2009619;
	Mon, 13 Oct 2025 07:01:03 -0500
Message-ID: <9f11242d-a331-4cf2-b6d9-b0aa84cf20ca@ti.com>
Date: Mon, 13 Oct 2025 07:01:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] ti-dm-fw: Update DM for
 am62dxx
To: <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <v-singh1@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
References: <20251013115734.1403394-1-p-bhagat@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251013115734.1403394-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Oct 2025 12:01:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19118

On 10/13/25 6:57 AM, Paresh Bhagat via lists.yoctoproject.org wrote:
> am62dxx previously reused am62axx DM, but now that a dedicated DM is
> available, migrate to device-specific DM.
> 

What does this DM do differently than the AM62a DM?

Andrew

> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
> Boot logs
> https://gist.github.com/paresh-bhagat12/2c09bb5e3c22b70b8afd823abc2704c9
> 
>   meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 6 ++++--
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> index 03016993..2d9ad499 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> @@ -29,7 +29,7 @@ PLAT_SFX:am65xx = "am65xx"
>   PLAT_SFX:am64xx = "am64xx"
>   PLAT_SFX:am62xx = "am62xx"
>   PLAT_SFX:am62axx = "am62axx"
> -PLAT_SFX:am62dxx = "am62axx"
> +PLAT_SFX:am62dxx = "am62dxx"
>   PLAT_SFX:am62lxx = "am62lxx"
>   PLAT_SFX:am62pxx = "am62pxx"
>   
> @@ -87,7 +87,7 @@ do_deploy() {
>   ALTERNATIVE:${PN}:am62xx  = "am62-main-r5f0_0-fw"
>   ALTERNATIVE:${PN}:am62pxx  = "am62p-main-r5f0_0-fw"
>   ALTERNATIVE:${PN}:am62axx = "am62a-main-r5f0_0-fw"
> -ALTERNATIVE:${PN}:am62dxx = "am62a-main-r5f0_0-fw"
> +ALTERNATIVE:${PN}:am62dxx = "am62d-main-r5f0_0-fw"
>   ALTERNATIVE:${PN}:j721e   = "j7-mcu-r5f0_0-fw"
>   ALTERNATIVE:${PN}:j7200   = "j7200-mcu-r5f0_0-fw"
>   ALTERNATIVE:${PN}:j721s2  = "j721s2-mcu-r5f0_0-fw"
> @@ -99,6 +99,7 @@ ALTERNATIVE:${PN}:j742s2  = "j742s2-mcu-r5f0_0-fw"
>   ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
>   ALTERNATIVE_LINK_NAME[am62p-main-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/am62p-main-r5f0_0-fw"
>   ALTERNATIVE_LINK_NAME[am62a-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am62a-main-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[am62d-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am62d-main-r5f0_0-fw"
>   ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_0-fw"
>   ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
>   ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
> @@ -110,6 +111,7 @@ ALTERNATIVE_LINK_NAME[j742s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j
>   ALTERNATIVE_TARGET[am62-main-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>   ALTERNATIVE_TARGET[am62p-main-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>   ALTERNATIVE_TARGET[am62a-main-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
> +ALTERNATIVE_TARGET[am62d-main-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>   ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw]     = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>   ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>   ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index eeb3f428..4e956cbb 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -63,7 +63,7 @@ PLAT_SFX:am65xx = "am65xx"
>   PLAT_SFX:am64xx = "am64xx"
>   PLAT_SFX:am62xx = "am62xx"
>   PLAT_SFX:am62axx = "am62axx"
> -PLAT_SFX:am62dxx = "am62axx"
> +PLAT_SFX:am62dxx = "am62dxx"
>   PLAT_SFX:am62lxx = "am62lxx"
>   PLAT_SFX:am62pxx = "am62pxx"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19116): https://lists.yoctoproject.org/g/meta-ti/message/19116
> Mute This Topic: https://lists.yoctoproject.org/mt/115732782/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



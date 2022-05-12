Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B228C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 15:31:56 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.123.1652369509958665641
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 May 2022 08:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jCWTjgV2;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CFVjxM083052;
	Thu, 12 May 2022 10:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652369505;
	bh=ddcnQfWoCBX9+dN/GcSxWgFej8JniZXtPVhLwGiuRCg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jCWTjgV2XTcNUuOUfz//MlkUIkqeXnFtjUAfPMpY+7dDUErCBha7XLXbLsuxYWB7g
	 b1J+esNlM58xpbnpp4X0BdAATj99oB7Zx6LpgwWS5vXYE+wj5wd9pDb9X6VWXZ7yb1
	 k42+/K3PaLg/S5IDPcWHj6HjAP74rYfu7/MWGpV4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CFVjLO029292
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 May 2022 10:31:45 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 10:31:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 10:31:44 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CFVifr075746;
	Thu, 12 May 2022 10:31:44 -0500
Message-ID: <9ca3eb40-5fcf-7348-1a2c-72daecf6839a@ti.com>
Date: Thu, 12 May 2022 10:31:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [meta-ti][dunfell][PATCH] ti-sci-fw: Add DM firmware to deploy
 directory for am62xx-evm
Content-Language: en-US
To: Aparna M <a-m1@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denis@denix.org>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
References: <20220512134657.31238-1-a-m1@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220512134657.31238-1-a-m1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 May 2022 15:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14731



On 5/12/2022 8:46, Aparna M wrote:
> Add DM firmware ipc_echo_testb_mcu1_0_release_strip.xer5f to deploy
> directory for am62xx-evm. This is required for building tispl.bin.
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 099473b4..bb88633a 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -186,6 +186,7 @@ do_deploy_am62xx-evm-k3r5() {
>   	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
>   	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
>   	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
> +        install -m 644 ${S}/ti-dm/am62xx/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}/
>   }
>   
>   addtask deploy before do_build after do_compile

NACK.

I think this is in the wrong recipe.  This file is referenced for all of 
the other platforms in:

recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb


I think it would make more sense to put this change in that recipe for 
consistency.



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


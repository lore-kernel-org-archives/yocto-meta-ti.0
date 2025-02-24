Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65E1C021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 15:36:47 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.92282.1740411400179365031
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 07:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Rww1NTZa;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51OFaXKm953927
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 24 Feb 2025 09:36:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740411393;
	bh=xF9iZxC3pDmBso+Pg3+UAWve6xW55fKPLeoCIQzZHTA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Rww1NTZaQsGbBOpjAazADm3aPpHN3xAixG6LuU1iYStx4LIcwH8idd+kbHbElYI6I
	 uXIdSRzgSMEjQwNI9U3ixwB+l5jmrvfh8rPFIFs9fY18YeXKheaEoqmU5rtsroXtv/
	 hOHVvTcRgu0Cy32l3AbDvtJS7aTksPwZhNK5GbfM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51OFaXAc038592;
	Mon, 24 Feb 2025 09:36:33 -0600
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Feb 2025 09:36:33 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Mon, 24 Feb
 2025 09:36:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Feb 2025 09:36:32 -0600
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51OFaXVB081972;
	Mon, 24 Feb 2025 09:36:33 -0600
Message-ID: <44f13deb-082b-4104-8164-ca02ef4bc518@ti.com>
Date: Mon, 24 Feb 2025 09:36:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] conf: machine: j742s2: skip
 HS-SE SPL for 6.12
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20250224011318.2801708-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250224011318.2801708-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Feb 2025 15:36:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18336


This is currently fixed on scarthgap and is waiting on master-next for a 
CICD promotion.  So this patch should not be needed.


On 2/23/2025 7:13 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> It appears there's no HS-SE SPL being produced with TI BSP 6.12, as there's
> no tiboot3-j742s2-hs-evm.bin being deployed. Disable it for now.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-ti-bsp/conf/machine/include/j742s2.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
> index 9a54e11e..67e30fe9 100644
> --- a/meta-ti-bsp/conf/machine/include/j742s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
> @@ -12,7 +12,9 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-fs-evm.bin"
>   
>   # Since default tiboot3.bin on J742S2 is for HS-FS, add a version for SR1.0 HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-evm.bin"
> +IMAGE_SR1_HS_SE_FILES = "tiboot3-j742s2-hs-evm.bin"
> +IMAGE_SR1_HS_SE_FILES:bsp-ti-6_12 = ""
> +IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_SE_FILES}"
>   
>   TFA_BOARD = "j784s4"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18335): https://lists.yoctoproject.org/g/meta-ti/message/18335
> Mute This Topic: https://lists.yoctoproject.org/mt/111350886/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


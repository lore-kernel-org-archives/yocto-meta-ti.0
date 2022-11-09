Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6EAC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 18:23:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.673.1668018234076149480
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 10:23:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NXvA3tGP;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A9INlXr107995;
	Wed, 9 Nov 2022 12:23:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1668018227;
	bh=Bb15xi1CusRnEyux7f1iSdJOzQN+D0TQB7DqXxPV/1I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NXvA3tGPULsrDiFX4BjHeL4rK1pYu8haNZMw3FE9zxAgCKSQQQeNHwnEJ6I0fhdst
	 dOUHjGt+/h+FxFg8biSeKlc5TVRKwMTluE2hbhz4ZlbS+E+8kAZZ/EbDgNwhAGlh8q
	 8PAkcCouVHW2pUp8qeNvos4JFCrkFtG3X8mPpy54=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A9INl30104529
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Nov 2022 12:23:47 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 9 Nov
 2022 12:23:46 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 9 Nov 2022 12:23:47 -0600
Received: from [10.249.37.150] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A9INkDY040426;
	Wed, 9 Nov 2022 12:23:46 -0600
Message-ID: <b1ebc09c-4476-283b-b51c-b066b576d3ff@ti.com>
Date: Wed, 9 Nov 2022 12:23:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][PATCH] conf: omap-a15: Fix parsing when
 KERNEL_DEVICETREE is not set
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: Zachary Booth <zachary.booth@garmin.com>,
        Joshua Watt
	<Joshua.Watt@garmin.com>
References: <20221107201830.1203599-1-JPEWhacker@gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221107201830.1203599-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 09 Nov 2022 18:23:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15338



On 11/7/2022 14:18, Joshua Watt wrote:
> From: Zachary Booth <zachary.booth@garmin.com>
> 
> Correctly handle parsing when KERNEL_DEVICETREE is not set.
> 
> Signed-off-by: Zachary Booth <zachary.booth@garmin.com>
> Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   conf/machine/include/omap-a15.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
> index 02225a4e..4f57e6d1 100644
> --- a/conf/machine/include/omap-a15.inc
> +++ b/conf/machine/include/omap-a15.inc
> @@ -19,7 +19,7 @@ UBOOT_ARCH = "arm"
>   UBOOT_ENTRYPOINT = "0x80008000"
>   UBOOT_LOADADDRESS = "0x80008000"
>   
> -DEVICETREE_FILE = "${@d.getVar('KERNEL_DEVICETREE').replace("ti/","")}"
> +DEVICETREE_FILE = "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("ti/","")}"

What is the scenario that results in KERNEL_DEVICETREE not being set?  I 
just checked all of the files in meta-ti that include omap-a15.inc and 
they all have the variable set.



>   # Generate an extlinux.conf file
>   UBOOT_EXTLINUX = "1"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15332): https://lists.yoctoproject.org/g/meta-ti/message/15332
> Mute This Topic: https://lists.yoctoproject.org/mt/94875941/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


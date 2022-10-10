Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAACFC433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 17:02:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.236.1665421361816748359
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 10:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LG6TUdKo;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AH2c3P008469;
	Mon, 10 Oct 2022 12:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665421358;
	bh=QkT5AO+bkPjvns7iqRcCf9jm+Dp4IFJoBrkN+8lw2ko=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LG6TUdKoV6ao+yWpTPZ/5T7iwXei+OUaotlt0ynhUkoetBKNGQrBRtOxyIj+dyVfX
	 YbdWg/Zxd5zXG5TB92bEtJ/iLM72zHc7EmeRWDgoMOttVBpM+FBGPa7wOJQpT23rSY
	 7jGJ2x/O4XMhzsSegkv+eH7mnLNdGPpTYTPz1vAI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AH2c77015075
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Oct 2022 12:02:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 12:02:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 12:02:37 -0500
Received: from [10.250.37.187] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AH2bWp025297;
	Mon, 10 Oct 2022 12:02:37 -0500
Message-ID: <be032743-c374-9c2e-e7ff-914e4895e1b3@ti.com>
Date: Mon, 10 Oct 2022 12:02:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [dunfell/master][PATCH] J721S2-evm: Correct serial console device
Content-Language: en-US
To: Jonathan Humphreys <j-humphreys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <denis@denix.org>
References: <20221007191115.19762-1-j-humphreys@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221007191115.19762-1-j-humphreys@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 17:02:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15132


This patch do not apply to dunfell since the file paths have changed 
with the split in meta layers that we put into place for kirkstone.

I'll submit a new patch that includes both j721s2 and j784s4 for dunfell 
on this patch.


On 10/7/2022 14:11, Jonathan Humphreys wrote:
> Serial console in J721S2 EVM config was set to ttyS10.  It should be ttyS2.
> This caused sysv based systems (eg, tiny) to apparently hang because of no login prompt.
> This didn't show up as a problem on systemd systems (eg, default) because systemd will
> automatically setup a serial tty with the console option passed in on the kernel command line
> (using console=...), which U-Boot correctly passes in as ttyS2 for J721S2.
> 
> Signed-off-by: Jonathan Humphreys <j-humphreys@ti.com>
> ---
>   meta-ti-bsp/conf/machine/j721s2-evm.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> index a2c15f74..04f8e4fe 100644
> --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> @@ -4,7 +4,7 @@
>   
>   require conf/machine/include/j721s2.inc
>   
> -SERIAL_CONSOLES = "115200;ttyS10"
> +SERIAL_CONSOLES = "115200;ttyS2"
>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   TFA_K3_USART = "0x8"
>   OPTEE_K3_USART = "0x8"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


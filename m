Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D968C36016
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:06:37 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.3947.1743455194948068243
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 14:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U67Mc0LB;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52VL6ShB3500516
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 16:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743455188;
	bh=PgLanPYjTqoST8V4mKa0E6qcnloDg1UUD70rpTQOxRY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=U67Mc0LBNSHZbVBO6qYN7Y79riraFfAIoW2Fk8NyHvuhbP20b7VxSvvCSncsR2CkV
	 5GSBxuKS9V/PqiZt5rIS8/Ro4dRDHO8sWBpBuz0+L/QBrDcXejQ0y2ihgpWcun4oMh
	 wwXHo3jhAxHBnDxz6zMS3saATX7TlLXNkEHCBHzc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52VL6S04061839
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 31 Mar 2025 16:06:28 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 31
 Mar 2025 16:06:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 31 Mar 2025 16:06:27 -0500
Received: from [10.249.32.249] ([10.249.32.249])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52VL6Rot059403;
	Mon, 31 Mar 2025 16:06:27 -0500
Message-ID: <bc21c6cb-508c-4f1e-8bf3-6306514f65a0@ti.com>
Date: Mon, 31 Mar 2025 16:06:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-img-rogue-driver: resolve
 issues with fdinfo
To: <rs@ti.com>, <u-kumar1@ti.com>, <m-shah@ti.com>, <denis@denix.org>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20250331195730.755864-1-rs@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250331195730.755864-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 31 Mar 2025 21:06:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18439



On 3/31/2025 2:57 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Bump the srcrev to include a fix or when the driver is requested to show

Did you mean "for" instead of "or" ?


> advanced information about file descriptors that are associated with the
> device but are not currently associated with a rendering task.
> 
> This should address any issues with fdinfo/lsof.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   .../powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb         | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
> index 96ca8ff5..b356ce48 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
>   
>   S = "${WORKDIR}/git"
>   
> -SRCREV = "3bcbba9708fe6a882cd0f4820469d026fff7aee5"
> +SRCREV = "8eaff654a8871118c08cfafe53795f57e3b6b396"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


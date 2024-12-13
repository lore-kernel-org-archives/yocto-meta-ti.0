Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D811BE7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 15:43:03 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.18556.1734104580594973577
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 07:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MPxVCEaP;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDFgx1m3426858
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 09:42:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734104579;
	bh=TPjsqI64RUliAd767SkPgQ5135oXd6K9io81gCnjYZQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=MPxVCEaPCXOk2LLHIUnGOJ972U8AZGMvd2UmXM7crgu4brdOWoPDJof8dUboX0m20
	 KpDbopLIDkNrJw4Xx8M58WD9V95AFZx+NmGKIuk7YCSKW6JNloKJYjTRioFGLoHFg9
	 QrIy+f8EdLABRoSmFzhmgEkJuxZIUVLR3JD8IGtI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDFgxHd094796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Dec 2024 09:42:59 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Dec 2024 09:42:50 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Dec 2024 09:42:49 -0600
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDFgn2h082888;
	Fri, 13 Dec 2024 09:42:49 -0600
Message-ID: <41e1750f-3d9f-4a8d-b653-ddf25610f210@ti.com>
Date: Fri, 13 Dec 2024 09:42:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] meta-ti-bsp: ti-rtos-bin: Move this with
 the other firmware recipes
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20241213153915.56965-1-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241213153915.56965-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Dec 2024 15:43:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18103



On 12/13/2024 9:39 AM, Andrew Davis wrote:
> All other firmware recipes are in recipes-bsp. There is nothing much
> special about this set of firmware so move it to match.
> 
> This firmware is the pre-compiled "echo test" example for various
> remote cores. The directory name is not very clear on that, so fix
> that up too.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../ti-rtos-echo-test-fw}/ti-rtos-firmware.bb                     | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename meta-ti-bsp/{recipes-ti/ti-rtos-bin => recipes-bsp/ti-rtos-echo-test-fw}/ti-rtos-firmware.bb (100%)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-echo-test-fw/ti-rtos-firmware.bb
> similarity index 100%
> rename from meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> rename to meta-ti-bsp/recipes-bsp/ti-rtos-echo-test-fw/ti-rtos-firmware.bb

Why make the parent directory so long?  ti-rtos-echo-test-fw?

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


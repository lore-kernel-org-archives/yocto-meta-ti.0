Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100ACE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 15:20:22 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.39277.1733498415609020944
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 07:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rcj//j9I;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6FKEIP2120897
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Fri, 6 Dec 2024 09:20:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733498414;
	bh=IkHPVxzpa8T3FCcNx9kDZEQ/k4uqQB0l3pAQoDYJt+c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rcj//j9I83R1joehP312jbRdDNXhD4QGI2M4Uy7aD+VsEVs9y/9hCTdMr9/cMKXGX
	 V/sk1GibAB6ilHEGoQ7MLk2u75at1RKKzQVPy8fcmvMQgyMcbosYw9eElkJehA4fpL
	 4W93icCB96az7B/APp4Q6x1NBVhyo7Fjy1fkpXTI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6FKEe6028447
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 6 Dec 2024 09:20:14 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 09:20:14 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 09:20:14 -0600
Received: from [10.249.33.166] ([10.249.33.166])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6FKEse062458;
	Fri, 6 Dec 2024 09:20:14 -0600
Message-ID: <25709f42-f9bd-4033-b416-a2639ae1a5b6@ti.com>
Date: Fri, 6 Dec 2024 09:20:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH 0/2] omap-a15: Add dra7-ipu1-fw to
 boot
To: Aniket Limaye <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <b-padhi@ti.com>, <u-kumar1@ti.com>
References: <20241205183103.3411587-1-a-limaye@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241205183103.3411587-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Dec 2024 15:20:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18088


As this platform still exists in scarthgap and master, should this patch 
also be applied to those branches as well?


On 12/5/2024 12:05 PM, Aniket Limaye wrote:
> The firmware is required for early boot of the remoteproc from SPL stage
> of the bootloader. Copy the ipc firmware into the boot partition of the
> wic images, where the bootloader expects it to be.
> 
> For this, add a deploy task for the firmware binary and also include the
> file in IMAGE_BOOT_FILES for omap-a15.
> 
> Aniket Limaye (2):
>    meta-ti-extras: ti-ipc-rtos: Deploy ipc firmware
>    conf: machine: omap-a15.inc: include ipu1 firmware in the boot
>      partition
> 
>   meta-ti-bsp/conf/machine/include/omap-a15.inc    |  3 ++-
>   meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb | 14 ++++++++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


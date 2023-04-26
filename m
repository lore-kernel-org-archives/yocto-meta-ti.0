Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9F2C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:01:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4520.1682542912926822809
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 14:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kAwJzg1F;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QL1pWo105158
	for <meta-ti@lists.yoctoproject.org>; Wed, 26 Apr 2023 16:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682542911;
	bh=lD24bBd0ov7sFtE/tfF3CiK/GpqNJCftjIi/3BebjIU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kAwJzg1FKv4dMmLgjoHVlvT9+BYT/r4dIrfxg7VpuusB0IMD9Y7LDec80gbsoafVs
	 YOcxfmh3i0EBeCTx+j3DYj9M9HSZbhBsGSSBR3Vj9VftTUD25YRGMb+/ayNxdlrDsm
	 fzGXZDuhHyqNEkToh0AGixx/1I5MnTeX5yCPsAHc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QL1pBc027890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 26 Apr 2023 16:01:51 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Apr 2023 16:01:51 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Apr 2023 16:01:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 16:01:51 -0500
Received: from [10.249.32.181] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QL1oZx092621;
	Wed, 26 Apr 2023 16:01:50 -0500
Message-ID: <50215c07-f153-6602-1d53-ca2b4147d621@ti.com>
Date: Wed, 26 Apr 2023 16:01:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-ti] [kirkstone][PATCH v2] recipes-ti: Add recipe and
 patches for jailhouse
Content-Language: en-US
To: "Raghavendra, Vignesh" <vigneshr@ti.com>, <p-bhagat@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
References: <20230426120608.17812-1-p-bhagat@ti.com>
 <a9e4677f-c376-a0e4-4bf4-b9adff5924b8@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <a9e4677f-c376-a0e4-4bf4-b9adff5924b8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Apr 2023 21:01:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16431



On 4/26/2023 10:40, Raghavendra, Vignesh wrote:
> 
> 
> On 4/26/2023 5:36 PM, Paresh Bhagat via lists.yoctoproject.org wrote:
>> Add and enable Jailhouse support for TI's k3-am625-sk similarly to how other
>> TI platforms were added and enabled in the past by adding platform-specific
>> configuration variables for the root cell DTB overlay, and the Linux demo inmate
>> DTB, configuration, and Kernel command line settings.
>>
>> Migrate the jailhouse recipe to kirkstone from dunfell.
>>
>> Switch to latest upstream source tree for jailhouse. The TI Jailhouse repo has
>> gone stale and now upstream is really the happening place where new development
>> happens including for new devices such as AM62x. Hence go ahead and switch to
>> using the upstream repo.
>>
>> Enable additional console on ttyS3 (usually mapped to main_uart1) and ttyS2 for
>> the Linux demo inmate to use.
>>
>> Add patches for the Jailhouse source tree for am62xx.
>>
>> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
>> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> 
>> Signed-off-by: paresh-ti <p-bhagat@ti.com>
> 
> You are supposed to sign-off with your legal name.
> 
> See: https://wiki.linuxfoundation.org/dco

Good catch.


> Regards
> Vignesh

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F31C3601C
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 12:47:20 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.7270.1743598038379201925
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 05:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yYRAGTzH;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532ClEWw3958939
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Apr 2025 07:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743598034;
	bh=2ChWjl++O06uuXXitspzrXikWErhcUSFPHbfcIoP4Q0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=yYRAGTzHxF6i2eSSj48/80u6aHwu0Dt3wvFbcMrwAnO0LZPEP0029Om/EJl+R2SUa
	 mzIfl6sXxIXKbnPrIc81YrEW/nAEj+ZX57CQbpB9tELZ5ojakNmGJpLPv77vtTogA0
	 Do5jwmNop2M7QGSPYzL0Hf5Pr3QyzBjGfSNUYv7Y=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532ClE5Y052640;
	Wed, 2 Apr 2025 07:47:14 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 07:47:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 07:47:14 -0500
Received: from [10.249.32.249] ([10.249.32.249])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532ClEjP113889;
	Wed, 2 Apr 2025 07:47:14 -0500
Message-ID: <16d0ba84-04d1-4eff-8e91-22f9178f4344@ti.com>
Date: Wed, 2 Apr 2025 07:47:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] Postinstall scriptlets of ['ti-sgx-ddk-um'] have
 failed.
To: <sebastian.krahl@lacon.de>, <meta-ti@lists.yoctoproject.org>
References: <CADL8D3YVBx+myquRxNm5h3yNnZcNnBgubT5VBbRAi6Gw7uLsdw@mail.gmail.com>
 <19208.1743571536033055456@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <19208.1743571536033055456@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 02 Apr 2025 12:47:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18446


I have released the patch to kirkstone.  The other branches will wait 
for the CICD process to promote them.


On 4/2/2025 12:25 AM, Sebastian via lists.yoctoproject.org wrote:
> Thanks for the hint. I'll override it.
> 
> Regards,
> 
> Sebastian
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18445): https://lists.yoctoproject.org/g/meta-ti/message/18445
> Mute This Topic: https://lists.yoctoproject.org/mt/111937570/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


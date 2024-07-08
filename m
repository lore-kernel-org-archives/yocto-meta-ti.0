Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D08C3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 14:08:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.80732.1720447735044827772
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jul 2024 07:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=w6JL8SZr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 468E8pOD013493;
	Mon, 8 Jul 2024 09:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720447731;
	bh=4YgpDeLEJrlPNydlul7u3wFkhuae0BikYuEdJ01f0XQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=w6JL8SZrXabi5dmKCB+Uc/FmJsfLU5lDYjSQMX2EpgS6lnbJgbWbaaWTGIFOtM8QI
	 d6GkZQRjN1henLWU60JVj+XQPNJdyMp+ZVY8o/u2s0UUM1XffxXZ8+LqulGZgboL61
	 SlJYJGABSZtmK2AaiSF02SuQcogHTJIt2O7U/E84=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 468E8pFq018499
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 09:08:51 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 09:08:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 09:08:50 -0500
Received: from [10.250.34.81] ([10.250.34.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 468E8o9U122167;
	Mon, 8 Jul 2024 09:08:50 -0500
Message-ID: <00af87cd-ba66-4096-97e0-da2bd04acc3b@ti.com>
Date: Mon, 8 Jul 2024 09:08:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v3] conf: machine:
 am62*-evm-k3r5.conf: apply fragment for enabling USB DFU
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <praneeth@ti.com>,
        <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <vigneshr@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
References: <20240708123653.2200919-1-s-vadapalli@ti.com>
 <17E041DF8B3225E4.13665@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17E041DF8B3225E4.13665@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Jul 2024 14:08:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17834



On 7/8/2024 9:04 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 

Also, is this something that beagleplay should also have in it's config, 
or will that board not support this?  The logic for supporting this will 
be a little more complicated because of the beagle uboot settings if so.




-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


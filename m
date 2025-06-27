Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53797C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 14:43:38 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.15573.1751035411099170369
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 07:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=V0wRLLee;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55REhUEf2431073
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 09:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751035410;
	bh=hWUi8RxdXjIWLz+dxV5asuJn4vPu2K2aSBm+mr96Bo8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=V0wRLLeeSoSs4+4GGKOIZcrl0s4nFMDN2IzyZbwrAScO5g1x92AOcB0E9WOYli9pf
	 dBWdREIYU/Jv8kfO5+7CJIa9zvt5v//uuoLhzwXSBsanYRop4Hy8sqxNVyZeZyq2j9
	 srdawooDuPB1H6oh+jp2g/WTX/xTzn5hO82j8oEU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55REhUTe526708
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 09:43:30 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 09:43:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 09:43:30 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55REhUsT3232607;
	Fri, 27 Jun 2025 09:43:30 -0500
Message-ID: <12150a10-3a0c-4a64-b5de-79660c02b4cc@ti.com>
Date: Fri, 27 Jun 2025 09:43:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] conf: machine: move UBOOR_*ADDRESS to top level
 ti-soc
To: Anshul Dalal <anshuld@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
References: <20250627060416.639661-1-anshuld@ti.com>
 <20250627060416.639661-2-anshuld@ti.com>
 <5b7c7d3c-22d6-4810-9951-84844b6d0e87@ti.com>
 <DAXE5YO8ORYB.3HV2T9D8I1RU7@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DAXE5YO8ORYB.3HV2T9D8I1RU7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 14:43:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18705


Ok...


On 6/27/2025 9:39 AM, Anshul Dalal wrote:
> On Fri Jun 27, 2025 at 8:02 PM IST, Ryan Eatmon wrote:
>>
>> UBOOR ?  Typo in the subject.
>>
> 
> My bad, didn't catch that earlier. Sorry for the inconvenience but could
> you reword it locally please :)
> 
> - Anshul

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


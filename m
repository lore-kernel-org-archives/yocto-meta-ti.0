Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC78CD613C
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 21:25:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.76079.1696886730105315339
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 14:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gT+JnnDk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 399LPKYY051010;
	Mon, 9 Oct 2023 16:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696886720;
	bh=3FZvjzHZIhUiTJo+x8HzD0WlcSl2f0D8UColWCoiVtg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gT+JnnDkP6BNKsvrVmvNxTawoa4DM3SLtk7CT8HgVeO4yInDdY/krK67iqN5l6X3f
	 kkxniGQ68kPRbXF1L2sS6LFLUVSDpmQ2hBZqxi0+Bp2jNhu5jP9yyfPNLx+D8GY8ky
	 9w6/pxyK2YfvSiZz29Zko90C59iYK5jrYEplGxsY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 399LPKIK108136
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Oct 2023 16:25:20 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 16:25:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 16:25:20 -0500
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 399LPJrG006851;
	Mon, 9 Oct 2023 16:25:19 -0500
Message-ID: <1086ef7c-d92e-4496-8a3f-38711fda8530@ti.com>
Date: Mon, 9 Oct 2023 16:25:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone][PATCH v3 1/2] preuth-fw: Remove packaging
 of PRU-ICSSM firmwares
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <r-gunasekaran@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <srk@ti.com>,
        <afd@ti.com>
References: <20231009070926.21629-1-r-gunasekaran@ti.com>
 <20231009070926.21629-2-r-gunasekaran@ti.com>
 <20231009202027.GD2408@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231009202027.GD2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Oct 2023 21:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17086



On 10/9/2023 3:20 PM, Denys Dmytriyenko wrote:
> On Mon, Oct 09, 2023 at 12:39:25PM +0530, Ravi Gunasekaran via lists.yoctoproject.org wrote:
>> PRU-ICSS on AM33x, AM43x, supports different ethernet modes such
>> as Ethernet, HSR and PRP by means of different firmwares and the
>> driver loads one of the these firmware. The PRU-ICSS linux driver
>> may not be available for all kernel versions.
>>
>> So add an .inc file that avoids the packaging of such firmwares
>> in the SDK, so that it can be referenced by kernel recipes that
>> don't support PRU-ICSS.
>>
>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>> ---
>>   meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc | 3 +++
>>   1 file changed, 3 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc b/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
>> new file mode 100644
>> index 00000000..6698c9ed
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
>> @@ -0,0 +1,3 @@
>> +# Do not package firmwares for kernels that don't support PRUETH
>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
> 
> This is asking for trouble - there's no way to un-do :remove downstream (e.g.
> any of the Distro, SDK, Product Line or Customer layers)
> 
> It is not recommended to use :remove (and :append to a lesser degree) on a
> regular basis when it can be done differently.
> 
> Moreover, what is a difference from v2? It is a more convoluted way to drop
> those FW images from getting installed, but it is still done unconditionally
> here in meta-ti - are there any benefits of doing it this way?

 From my understanding...   This firmware was supported under 5.10.  It 
is not being supported for 6.1 but will be supported next year some time.

So I was trying to communicate via the recipes that overall it is 
supported, but for this blip it is removed.

Either way we are adding some odd conditionals to support the logic. 
Two choices:

1) Enabled by default, disable in the kernels were it is not supported.
2) Disabled by default, enable in 5.10 and in the future.

Thoughts?


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


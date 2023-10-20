Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6877CC0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 22:20:12 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.67221.1697840407241894494
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 15:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Sfu3GTgB;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39KMK0ZB066625;
	Fri, 20 Oct 2023 17:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697840400;
	bh=lxfmtfJ8vAKeaH5H9oUSrX/6QJqcgCWCFv692mXGn7E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Sfu3GTgByCEgV9bgfyX0YsGUmDVGkP8o50Zr/DzL0yklphGc6LDZyKEV1ElI4b192
	 jC8r3sfGG67TVPyBkCb66RBHRpGdJx+wEfBTebRKGPFemS3sBKBW8gORxUHcTvan9u
	 60JlIUVYcazaaSF3UCr2VZ7xfVIRMgnJDucDiL7Q=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39KMK0Ys106349
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Oct 2023 17:20:00 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Oct 2023 17:20:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Oct 2023 17:20:00 -0500
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39KMK04b052899;
	Fri, 20 Oct 2023 17:20:00 -0500
Message-ID: <2ddee779-2ede-4ff0-8c20-fe8675fc8206@ti.com>
Date: Fri, 20 Oct 2023 17:20:00 -0500
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
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Oct 2023 22:20:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17163



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


Ravi, I hate to ask this of you as most of the waffling is from me.

But I agree with Denys.  I think what we need is the v2 patch, but with 
better wording (like what you have in v3) that explains the situation.

Can you put together a new v4 that looks like that?




-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


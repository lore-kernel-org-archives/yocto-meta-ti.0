Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2559CEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 19:17:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.126.1687288638570360949
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 12:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MmLSjuAH;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KJHEwA096947;
	Tue, 20 Jun 2023 14:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687288634;
	bh=y1m5KXT9YmqZrEnWpN3o6+tHJ/BQuQ1V46DWJhy3HhA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MmLSjuAHbYISQ8O25liVF0GowPcej2cLkF2dTYestqTFlplpDMLK0xoKWns48gQpI
	 lutrEXAEY/agtRNgc3fpyTwklevJfB8/EawFl+lcxnbRmC1hPQx02jGbCQlpqYgECv
	 xPFqf6tNH3J6GwI+4yBadynUDIrxvEXDrlPtpHBA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KJHEKc034060
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 14:17:14 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 14:17:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 14:17:14 -0500
Received: from [10.249.34.224] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KJHDvG014347;
	Tue, 20 Jun 2023 14:17:13 -0500
Message-ID: <9f070406-bc65-bfa1-b718-4fe935594183@ti.com>
Date: Tue, 20 Jun 2023 14:17:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] kernel-rdepends: Add ti-eth-fw
 as an RDEPENDS
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230620170925.19023-1-reatmon@ti.com>
 <20230620180537.GJ1518@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230620180537.GJ1518@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Jun 2023 19:17:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16746



On 6/20/2023 1:05 PM, Denys Dmytriyenko wrote:
> On Tue, Jun 20, 2023 at 12:09:25PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> When the ti-eth-fw recipe was split out from the ti-rtos-firmware recipe
>> we forgot to add it as a dependency.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>> index 18984e80..1f0c1ee8 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>> @@ -31,3 +31,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " vxd-dec-fw"
>>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 = " cnm-wave-fw"
>>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " cnm-wave-fw"
>>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx = " cnm-wave-fw"
>> +
>> +# Add run-time dependency for TI ETH firmware to the rootfs
>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:k3 = " ti-eth-fw"
> 
> Though, ETH FW is only enabled on j721e, j7200 and j784s4:
> 
> https://git.yoctoproject.org/meta-ti/commit/?id=91e5a1ca6541012e3d4285479ecf5a9f353307f9
> 
> ETH_FW_LIST = ""
> ETH_FW_LIST:j721e =   "${ETH_FW}"
> ETH_FW_LIST:j7200 =   "${ETH_FW}"
> ETH_FW_LIST:j721s2 =  ""
> ETH_FW_LIST:j784s4 =  "${ETH_FW}"
> ETH_FW_LIST:am65xx =  ""
> ETH_FW_LIST:am64xx =  ""
> ETH_FW_LIST:am62xx =  ""
> ETH_FW_LIST:am62axx = ""
> 
> Other platforms generate an empty package w/o the binary in it. So I guess for
> simpler dependency pulling it for all K3 platforms is an option? On one hand
> it makes kernel dependencies simpler, but executes build/packaging process for
> the firmware that ends up being no-op and produce an empty output...

Andrew and I talked about.  It seems annoying to have to update two 
files to add a platform, BUT doing it this way does mean we execute the 
recipe when the recipe does nothing...

This is sort of a holdover from the ti-rtos-firmware way of doing things.

Let me think about it...

> Similar question for DM FW? E.g.:
> 
> https://git.yoctoproject.org/meta-ti/commit/?id=b21d29d94694ac49b97a1f4ba428c7d8cd6fb64a
> 
> DM_FW_LIST = ""
> DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
> DM_FW_LIST:j7200 =   "${DM_FIRMWARE}"
> DM_FW_LIST:j721s2 =  "${DM_FIRMWARE}"
> DM_FW_LIST:j784s4 =  "${DM_FIRMWARE}"
> DM_FW_LIST:am65xx =  ""
> DM_FW_LIST:am64xx =  ""
> DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
> DM_FW_LIST:am62axx = "${DM_FIRMWARE}"
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


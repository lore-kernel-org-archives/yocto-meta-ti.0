Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8851FC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 12:23:28 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.86195.1754051005731073542
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 05:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RWPmj97s;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571CNOGV3727582;
	Fri, 1 Aug 2025 07:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754051004;
	bh=P8G3gTvQ8cj8Xfm3rGRXMjZ2X0rmLFmp+0cBfMjos8o=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=RWPmj97sSmLC3L9O+gBgG5AIBquKRAZxPS8p+ZXqN332H/F37dmDVBNnV2jUPK6jr
	 rqhaWk3ZmexMEa6sC4G7msssggUGgnwiB118QMw+vzZIscPu9ZOPRR060ZR91xQauc
	 ee0SE5i3wae5AOrEXHqummv9Lr9OpdZuO74cX+fk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571CNNNP765050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 07:23:24 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 07:23:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 07:23:23 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571CNN3W368522;
	Fri, 1 Aug 2025 07:23:23 -0500
Message-ID: <05c1b40b-2569-4ce1-b484-bdcff95929b4@ti.com>
Date: Fri, 1 Aug 2025 07:23:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] linux-ti-*: Fix support for building
 legacy HS platforms
To: Max <max.oss.09@gmail.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250722214327.16345-1-reatmon@ti.com>
 <b9c8b913068cfa6f0815f81e49aea1f501f7f12f.camel@gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <b9c8b913068cfa6f0815f81e49aea1f501f7f12f.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 12:23:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18869



On 8/1/2025 4:16 AM, Max wrote:
> Hi
> 
> Am Dienstag, dem 22.07.2025 um 16:43 -0500 schrieb Ryan Eatmon via lists.yoctoproject.org:
>> The legacy HS platforms (am335x-hs-evm, am437x-hs-evm, and
>> am57xx-hs-evm) are not using the new fitImage flow, but the kernels all
>> include the kernel.bbclass which disallows the old fitImage flow.
>>
>> Copy in the last version of the kernel.bbclass and name it
>> kernel_legacyhs.bbclass, and update the machine configs to defined a
>> variable to use as the KERNEL_BASE_CLASS to inherit.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
> ...
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
>> index e3a50fdd..56ea9e47 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
>> @@ -11,3 +11,6 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
>>   
>>   # TI platforms all use devicetrees with overlays
>>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree"
>> +
>> +# All machines should start off pointing at the default base kernel class
>> +KERNEL_BASE_CLASS = "kernel"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> index 4c740678..51723fc0 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> @@ -3,7 +3,7 @@ SUMMARY = "Mainline Linux kernel for TI devices"
>>   LICENSE = "GPL-2.0-only"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>>   
>> -inherit kernel
>> +inherit ${KERNEL_BASE_CLASS}
>>   
> ...
>>
> 
> This breaks building for any machine which does not define KERNEL_BASE_CLASS,
> i.e. any machine which does not include ti-soc.inc or its siblings.

Good call.  The default setting of KERNEL_BASE_CLASS should probably be 
in ti-kernel.inc which all of the recipes require.  Let me whip that up 
and test it real quick.


> Building for qemuarm64 results in the following parse error:
> 
> | $ MACHINE=qemuarm64 bitbake --parse-only
> | Loading cache: 100% |#################################| Time: 0:00:12
> | Loaded 5400 entries from dependency cache.
> | ERROR: ParseError at .../meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb:6:
> Could not inherit file classes/${KERNEL_BASE_CLASS}.bbclass
> | ERROR: Parsing halted due to errors, see error messages above
> 
> Regards,
> Max

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


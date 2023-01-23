Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B00C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 15:35:00 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.45089.1674488090120089704
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 07:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PbDZsz3w;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: jm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30NFYjeC066002;
	Mon, 23 Jan 2023 09:34:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674488085;
	bh=/aFQeUVTzSPdBr4oEfl1n2B5iTHdjSvmjOJbPxiipKU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PbDZsz3wmpglbN1l+NS/Xnd7zd45a4BsIt2rk04UMSe8YuY7kgXE6Mr8ZF1AOJmj7
	 s+XjpR8rq/t/0+22Uaug0VU3+ZqziIf61giu8rHb31KJ/qmOYRHzmpNlrflYgxHP+e
	 hopFhGSNDiDldaav7+dxQ+3618eyoKHEFPRYRLxM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30NFYj6C058495
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Jan 2023 09:34:45 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 09:34:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 09:34:44 -0600
Received: from [128.247.81.102] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30NFYiIQ013301;
	Mon, 23 Jan 2023 09:34:44 -0600
Message-ID: <7ad0dfad-7567-ce25-743a-bfb935d03cc6@ti.com>
Date: Mon, 23 Jan 2023 09:34:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti] [dunfell] trusted-firmware-a: upgrade to v2.8+
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230120225710.17751-1-jm@ti.com>
 <20230120231748.GS22689@denix.org>
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <20230120231748.GS22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 15:35:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15622

Hello,

On 1/20/2023 5:17 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 20, 2023 at 04:57:10PM -0600, Mendez, Judith via lists.yoctoproject.org wrote:
>> Upgrade arm-trusted-firmare to v2.8-226-g2fcd408bb.
> 
> Overall looks good, but if SRCREV doesn't point exactly to the release tag
> (v2.8), then it is customary to reflect that in the version with git commit
> ID in the suffix:
> 
> PV_append_k3 = "+git${SRCPV}"
> 

Thanks for the feedback, will update asap.

> 
>> This upgrade picks up K3 L2 cache, snoop delayed, and EA
>> handling updates from upstream master.
>>
>> Do not update to tip of master due to PSCI system off
>> support breaking AM62x and AM62q platforms.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> index a5eb9ff8..5eb49b4a 100644
>> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> @@ -1,6 +1,6 @@
>> -PV_k3 = "2.6"
>> +PV_k3 = "2.8"
>>   LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
>> -SRCREV_tfa_k3 = "1309c6c805190bd376c0561597653f3f8ecd0f58"
>> +SRCREV_tfa_k3 = "2fcd408bb3a6756767a43c073c597cef06e7f2d5"
>>   COMPATIBLE_MACHINE_k3 = "k3"
>>   TFA_BUILD_TARGET_k3 = "all"
>>   TFA_INSTALL_TARGET_k3 = "bl31"
>> -- 
>> 2.17.1

regards,
Judith


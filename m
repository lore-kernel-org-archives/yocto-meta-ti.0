Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5183C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 20:44:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.35726.1655757875534800534
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Jun 2022 13:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fHsaPElw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25KKiV4h118975;
	Mon, 20 Jun 2022 15:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655757871;
	bh=Jp9GJzY+5K2y9JwEKYiWa5HWyqWUh++A9vCyl1FTaHg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fHsaPElwI7F6QANyfustZWYiIcOc0DNxmyeyAwYzJfRO4j9YVOj6kZkxiBjvM4RE/
	 2AUn5K+gy6UhEaxrjUpTmY3ErYx/LaKSLwgpKYzXQTv05lkeGoVf6Q/m3p8MhnDjFl
	 HgXj0oY/7qXZgMPU/u3rvdZ0gq2twbY8EmE6v7yA=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25KKiVJw089528
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Jun 2022 15:44:31 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Jun 2022 15:44:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Jun 2022 15:44:30 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25KKiUKA089140;
	Mon, 20 Jun 2022 15:44:30 -0500
Message-ID: <8761164e-7381-1ba4-11fa-089b62d2de4f@ti.com>
Date: Mon, 20 Jun 2022 15:44:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-ti][dunfell][PATCH v3] conf: machine: wic: Fix HS image
 boot partition
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Andrew Davis <afd@ti.com>, Manorit Chawdhry <m-chawdhry@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220609145909.15483-1-afd@ti.com>
 <293f769d-d60e-4945-4f0b-fbed2dbbb4b7@ti.com>
 <20220620192258.GZ9834@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220620192258.GZ9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Jun 2022 20:44:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14835



On 6/20/2022 14:22, Denys Dmytriyenko wrote:
> On Mon, Jun 20, 2022 at 02:11:55PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 6/9/2022 9:59, Andrew Davis wrote:
>>> From: Manorit Chawdhry <m-chawdhry@ti.com>
>>>
>>> IMAGE_BOOT_FILES was being overwritten in the HS recipes leading to
>>> incomplete binaries in /boot and the naming of the binaries were not
>>> correct.
>>>
>>> Fixes /boot partition for HS devices.
>>>
>>> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
>>> [afd: Extended fix to all HS platforms]
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>>
>>> Changes from v2:
>>>   - Added UBOOT_SYMLINK to fix missing u-boot.img image
>>>
>>>   conf/machine/am64xx-hs-evm.conf | 3 +--
>>>   conf/machine/am65xx-hs-evm.conf | 3 +--
>>>   conf/machine/include/k3.inc     | 5 +++--
>>>   conf/machine/j7-hs-evm.conf     | 3 +--
>>>   conf/machine/j7200-hs-evm.conf  | 3 +--
>>>   5 files changed, 7 insertions(+), 10 deletions(-)
>>
>>
>> I am getting build errors for several of the HS platforms related to
>> this change.  The meta-arago/meta-arago-distro/recipces-core/images/tisdk-core-bundle.bb
>> recipe is failing because the u-boot-<MACHINE>.img file is not in
>> the deploy/images directory.
>>
>> When I drop the patch all of the builds work correctly.
> 
> Which platforms are failing?

The ones referenced in the patch.  am64xx-hs-evm, am65xx-hs-evm, 
j7-hs-evm and j7200-hs-evm.




-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


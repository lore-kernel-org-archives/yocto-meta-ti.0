Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B606AC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 19:52:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.2013.1654717969540396384
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EjKD5AtZ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 258JqhjX046604;
	Wed, 8 Jun 2022 14:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654717963;
	bh=vJpitHSa/LWpjcxSl1YRKdp3ZFkEoVMrMRE01Q5AK58=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EjKD5AtZIWr9cJlQcVD74S6EvQZj0utHm02fuyIIJAWZaE6ccvN7GWGogCY/VXXrV
	 yZW+TsGjq11FCiFKjB6DRHVYibzlZDRUz3X6iAXdj78t6QYt0snJm75z01Vbv7Xu0V
	 x/sA/rBfv4N5CRSQSnCL5eZxygox9MDh76yU6cx8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 258JqhIN006252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jun 2022 14:52:43 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Jun 2022 14:52:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Jun 2022 14:52:43 -0500
Received: from [10.250.32.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 258JqgP7008464;
	Wed, 8 Jun 2022 14:52:42 -0500
Message-ID: <d2a838c6-0720-7033-4fc9-d5feca51c32e@ti.com>
Date: Wed, 8 Jun 2022 14:52:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti][dunfell][PATCH v2 1/2] trusted-firmware-a: Update to
 latest upstream master
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20220608171418.576-1-afd@ti.com>
 <20220608192017.GW9834@denix.org>
 <2c842ab2-39f6-bba3-f3ea-af9789b2992c@ti.com>
 <20220608194354.GZ9834@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220608194354.GZ9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 19:52:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14805

On 6/8/22 2:43 PM, Denys Dmytriyenko wrote:
> On Wed, Jun 08, 2022 at 02:21:40PM -0500, Ryan Eatmon wrote:
>>
>> He sent this one as a mistake.  He is going to send a V3 that moves
>> the optee-[client|test|examples] out of meta-arago and into meta-ti
>> so that all of the optee stuff is in one place.
> 
> What is the pressing need to update optee in dunfell to the very latest?
> 


It pulls in new features for our plats like HUK and AM64x/AM62x support.

Andrew


> 
>> On 6/8/2022 14:20, Denys Dmytriyenko wrote:
>>> What is the difference between v1 and v2 of these patches?
>>>
>>>
>>> On Wed, Jun 08, 2022 at 12:14:17PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>>>> For TF-A we work against upstream first, our fork has only been
>>>> used in the rare cases we need to ship a feature before we can
>>>> get it upstream. This is not currently the case so lets switch
>>>> to upstream repo until there is a need for our fork.
>>>>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 +---
>>>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>>>> index 68bfa899..207f3dac 100644
>>>> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>>>> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>>>> @@ -1,8 +1,6 @@
>>>>   PV_k3 = "2.6"
>>>>   LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
>>>> -BRANCH_k3 = "ti-atf"
>>>> -SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
>>>> -SRCREV_tfa_k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
>>>> +SRCREV_tfa_k3 = "453abc80b2eacbf2816c838e47e40f063227d934"
>>>>   COMPATIBLE_MACHINE_k3 = "k3"
>>>>   TFA_BUILD_TARGET_k3 = "all"
>>>>   TFA_INSTALL_TARGET_k3 = "bl31"
>>>> -- 
>>>> 2.36.1
>>>>


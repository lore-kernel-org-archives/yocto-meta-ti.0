Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC23C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 13:48:51 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.7693.1668088124055428535
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 05:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=diBrdkRK;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AADmf7n084840;
	Thu, 10 Nov 2022 07:48:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1668088121;
	bh=lcBE4g1acL6ZzGk5Bg4siHvUnDxFcxjPM7kwQra7lQI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=diBrdkRKjSk9BUD7RHt+hYMY+Noab7HLzdsdwwtNWzjBb1zVRoJKHltg6QZuNyJeZ
	 q2UPPBzKCbU/Yf6BbG2H67d1N5aHWztu5CTqBYivrBrN/YQ/nhPJDbB+61NUkUjzwb
	 Gb+8VO9IKMtoCoDYRJ4NnXIghvXHkjw/2hC3XmcM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AADmf8X013594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Nov 2022 07:48:41 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 10
 Nov 2022 07:48:41 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 10 Nov 2022 07:48:40 -0600
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AADmeQp123214;
	Thu, 10 Nov 2022 07:48:40 -0600
Message-ID: <63db4393-7f2f-16d1-fdb7-c14b51c6fab7@ti.com>
Date: Thu, 10 Nov 2022 07:48:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][PATCH] conf: omap-a15: Fix parsing when
 KERNEL_DEVICETREE is not set
To: "Booth, Zachary" <Zachary.Booth@garmin.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
CC: "Watt, Joshua" <Joshua.Watt@garmin.com>
References: <20221107201830.1203599-1-JPEWhacker@gmail.com>
 <b1ebc09c-4476-283b-b51c-b066b576d3ff@ti.com>
 <618b2352aaa721093c3bf7cc1c673f76a4efe2f1.camel@garmin.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <618b2352aaa721093c3bf7cc1c673f76a4efe2f1.camel@garmin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Nov 2022 13:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15339



On 11/9/2022 1:23 PM, Booth, Zachary wrote:
> On Wed, 2022-11-09 at 12:23 -0600, Ryan Eatmon wrote:
>> CAUTION - EXTERNAL EMAIL: Do not click any links or open any attachments unless you trust the sender and know the content is safe.
>>
>>
>> On 11/7/2022 14:18, Joshua Watt wrote:
>>> From: Zachary Booth <zachary.booth@garmin.com>
>>>
>>> Correctly handle parsing when KERNEL_DEVICETREE is not set.
>>>
>>> Signed-off-by: Zachary Booth <zachary.booth@garmin.com>
>>> Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>> ---
>>>    conf/machine/include/omap-a15.inc | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
>>> index 02225a4e..4f57e6d1 100644
>>> --- a/conf/machine/include/omap-a15.inc
>>> +++ b/conf/machine/include/omap-a15.inc
>>> @@ -19,7 +19,7 @@ UBOOT_ARCH = "arm"
>>>    UBOOT_ENTRYPOINT = "0x80008000"
>>>    UBOOT_LOADADDRESS = "0x80008000"
>>>
>>> -DEVICETREE_FILE = "${@d.getVar('KERNEL_DEVICETREE').replace("ti/","")}"
>>> +DEVICETREE_FILE = "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("ti/","")}"
>>
>> What is the scenario that results in KERNEL_DEVICETREE not being set?  I
>> just checked all of the files in meta-ti that include omap-a15.inc and
>> they all have the variable set.
> 
> We have a custom machine inheriting omap-a15.inc that uses a separate provider for virtual/dtb. The dtb recipe
> is a thin wrapper around devicetree.bbclass and uses a custom variable instead of KERNEL_DEVICETREE.
> 
> This scenario doesn't use DEVICETREE_FILE, but fails parsing during variable expansion with .replace().


Thanks for explaining that.  I'm working through the backlog and will 
disposition this soon.


>>
>>
>>
>>>    # Generate an extlinux.conf file
>>>    UBOOT_EXTLINUX = "1"
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#15332):
>>> https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/message/15332__;!!EJc4YC3iFmQ!SdpzhPqTkZXzwPNri5y_Eg83qQTCVgsStIOOUn2B5I073BB1z5daCsySyGG4_N4a7dChqDYuP5zz12ae$
>>> Mute This Topic:
>>> https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/94875941/6551054__;!!EJc4YC3iFmQ!SdpzhPqTkZXzwPNri5y_Eg83qQTCVgsStIOOUn2B5I073BB1z5daCsySyGG4_N4a7dChqDYuP7GfleXS$
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe:
>>> https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/unsub__;!!EJc4YC3iFmQ!SdpzhPqTkZXzwPNri5y_Eg83qQTCVgsStIOOUn2B5I073BB1z5daCsySyGG4_N4a7dChqDYuP-QKB7KP$  [r
>>> eatmon@ti.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>>
>> --
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


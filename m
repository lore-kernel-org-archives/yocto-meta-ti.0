Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4706FC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 18:28:36 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.6295.1675880914044979350
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 10:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HIx+0xim;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318ISXAJ023293;
	Wed, 8 Feb 2023 12:28:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675880913;
	bh=JbjhOdrW0K4jf1DMdYJeRSGlbmzEOwQLiJfzkwBdSGo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HIx+0ximh815hcO0lrhyXd/esqbipAHuSymi2bTP5WiXVBCzqoO35nEfBmZmdfxFk
	 Rj8//6AQ74DumDHb1eOKwC/prDS6LfkGc/Rx30nAP0IlrXU0KLgqiVAzXMG2YafC/I
	 vxT8SKGmKlqz/5HrhgN81mDoe3OsI9mN6LzdCK8s=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318ISXVi037351
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 12:28:33 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 12:28:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 12:28:32 -0600
Received: from [10.250.32.98] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318ISWOd054505;
	Wed, 8 Feb 2023 12:28:32 -0600
Message-ID: <4c12871e-0da5-423b-be26-6263ddc3ec03@ti.com>
Date: Wed, 8 Feb 2023 12:28:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2: Add ehrpwm
 overlay for am68-sk
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, "Bajjuri, Praneeth" <praneeth@ti.com>
CC: <reatmon@ti.com>, <denys@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>,
        "Kumar,
 Udit" <u-kumar1@ti.com>
References: <20230207151300.3223-1-sinthu.raja@ti.com>
 <d5b39582-d7a8-2d0e-c6f0-8881f0f1ae7e@ti.com>
 <d8203dbe-37ec-6bd5-7928-f6e0b93d062b@ti.com>
 <CAEd-yTSg3gNDZSafhTYq6BEKXx3yOD7X7xgi-okq2SjDra+BCg@mail.gmail.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CAEd-yTSg3gNDZSafhTYq6BEKXx3yOD7X7xgi-okq2SjDra+BCg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 18:28:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15753

On 2/8/23 11:08 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> On Wed, Feb 8, 2023 at 10:31 PM Bajjuri, Praneeth <praneeth@ti.com> wrote:
>>
>>
>>
>> On 2/8/2023 10:37 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>
>>>
>>> On 2/7/2023 9:13, Sinthu Raja wrote:
>>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>>
>>>> The AM68 SK has PWM output pins connected to its RPi headers. Add
>>>> overlay file to enable PWM pins.
>>>>
>>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> ==============
>>>> Address review comment:
>>>>    - Remove extra space
>>>>
>>>> v1:https://lists.yoctoproject.org/g/meta-ti/message/15730
>>>>    conf/machine/j721s2-evm.conf | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
>>>> index 7c120dcc..f1127ed5 100644
>>>> --- a/conf/machine/j721s2-evm.conf
>>>> +++ b/conf/machine/j721s2-evm.conf
>>>> @@ -17,6 +17,7 @@ KERNEL_DEVICETREE = " \
>>>>        ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
>>>>        ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
>>>>        ti/k3-am68-sk-fpdlink-fusion.dtbo \
>>>> +    ti/k3-am68-sk-rpi-hdr-ehrpwm.dtbo \
>>>>        ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
>>>>        ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
>>>>        ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
>>>
>>>
>>> This file does not exists in the kernel (yet?).  I'm assuming that you
>>> all have put in the patch for it and we are just playing a waiting game?
>>>
>>> If that is the case, then I would appreciate (in the future) not
>>> submitting these patches to the meta-ti mailing list until the kernel
>>> .dtb changes have been accepted into the kernel.  This is the second
>>> patch in recent weeks that I'm having to sit on until the kernel catches
>>> up...
>>>
>>> It makes it really hard to test these patches if the kernel part is not
>>> there, and I do not have the bandwidth to keep checking daily if the
>>> change has made it into the public/cicd branches.
>>>
>>
>> Agreed here.
>> Sinthu, Please post the associated meta-ti change only once the kernel
>> dts change is merged to cicd build.
>>
> Agreed.
> 

I'm going to slightly disagree, I don't see an issue with getting some
early reviews. Just as long as you only post it as an "RFC" and only
post the real "PATCH" when ready.

I'd also like to poke again the idea of pulling in DTB/DTBO files based
on some pattern matching instead of manually adding each time. I know the
idea got shot down, but I think this is going to be a growing problem as
we start to increase our usage of DT Overlays in the near future..

Andrew

>> from what i see, the kernel patch is still under review.
>>
>>>
>>>
>>>
>>>
>>>
> 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15752): https://lists.yoctoproject.org/g/meta-ti/message/15752
> Mute This Topic: https://lists.yoctoproject.org/mt/96808923/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


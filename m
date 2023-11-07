Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5309C4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 19:35:00 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.4096.1699385697862799723
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 11:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ckBjka+z;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7JYudc130872;
	Tue, 7 Nov 2023 13:34:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699385696;
	bh=YfX1R+63WBGmAX8ARlO5pA+oOqz7n2VwvJoPwm0UxXE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ckBjka+zxCpxAVZhll9nGgMtP/zCkN8d3mlSIVLb0wJ4bgdKcjsmEjHPi+S9Z4Fco
	 D/JXpK7rkqPi/TwL4wQAS+sgYVvTQkvlSIiy1A73F4A22YiATTTK6w8wpu+o8EtYnj
	 xr5deN2rzUBxGyrtrnjZjigObdpzLWI/2760yue8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7JYunm042273
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 13:34:56 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 13:34:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 13:34:56 -0600
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7JYu1S096839;
	Tue, 7 Nov 2023 13:34:56 -0600
Message-ID: <f7858798-40da-4db6-a7b2-33b32df3d392@ti.com>
Date: Tue, 7 Nov 2023 13:34:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] optee-os: Enable OP-TEE TRNG in AM62X
Content-Language: en-US
To: Vibhore Vardhan <vibhore@ti.com>, Kamlesh Gurudasani <kamlesh@ti.com>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>, <vigneshr@ti.com>,
        <u-kumar1@ti.com>, <afd@ti.com>, <m-chawdhry@ti.com>,
        <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <vishalm@ti.com>
References: <20231106-enable-trng-v1-1-59cb0b4f9bcb@ti.com>
 <b4ec0bc6-7f32-4ae2-bac2-e3339557ecaf@ti.com>
 <871qd2t1wu.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <20231107095249.u3j5ncwrg2egczal@ult0866455>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231107095249.u3j5ncwrg2egczal@ult0866455>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 19:35:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17260



On 11/7/2023 3:52 AM, Vibhore Vardhan wrote:
> On 13:45-20231107, Kamlesh Gurudasani wrote:
> Hi Kamlesh,
> 
>> "Bajjuri, Praneeth" <praneeth@ti.com> writes:
>>
>> ...
>>>> ---
>>>>    meta-ti-bsp/recipes-security/optee/optee-os-ti.inc | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>>>> index 91b66a36..d1c15cb2 100644
>>>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>>>> @@ -6,7 +6,7 @@ inherit ti-secdev
>>>>    
>>>>    EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>>>>    
>>>> -EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
>>>> +EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
>>>>    EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
>>>
>>> How about doing the same for am62p ?
>> @vibhore, Considering instabilities with AM62a, let me know if I should
>> enable it for AM62p. Will send v2 accordingly.


When you send the V2 series, can you base the commit off of the 
kirkstone-wip branch.  I have applied some changes to the file you are 
changing above (renamed it in this case) so your patch would not apply 
currently.  Thanks.




> As discussed offline, the instabilities we are seeing on AM62a are only
> after a Deep Sleep cycle. The system is stable unless LPM is tried.
> Also, AM62p does not have Deep Sleep support. So, I do not have any
> objections to having TRNG support enabled for AM62p.
> 
> Regards,
> Vibhore

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


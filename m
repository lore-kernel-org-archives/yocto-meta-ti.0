Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D355C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 15:20:43 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.51994.1740064841565585841
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 07:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Dh080JQu;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51KFKahI630078
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2025 09:20:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740064837;
	bh=6nwM/Sn5SD4LgyBhn1WKPHgMJUp+YxNDLAOulbc3vXI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Dh080JQuyg0C6F86gYdVZ4plGGXKgDdxMhiA9lyWhTSesYIaTn+GeZymGInhcgOgy
	 lCS6lFH6aBMGYgBel6vMNBckEkFxWzG5pNfAZRCDIqwffK+pocYDEuqjoN4KYRO9Ue
	 13lSFleC1AjQVg3grafGHn9yLsWuQEZ36se56RAg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51KFKacR042170
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Feb 2025 09:20:36 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 09:20:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 09:20:36 -0600
Received: from [10.249.33.110] ([10.249.33.110])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51KFKa3V117891;
	Thu, 20 Feb 2025 09:20:36 -0600
Message-ID: <22a9f66d-0eb3-4749-a04e-e0a4f04870b0@ti.com>
Date: Thu, 20 Feb 2025 09:20:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] trusted-firmware-a: simplify
 TI customizations
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <20250219214801.2239589-1-denis@denix.org>
 <d486a357-8b00-4399-ad57-03007591743a@ti.com>
 <20250219225326.GA1879@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250219225326.GA1879@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Feb 2025 15:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18331



On 2/19/2025 4:53 PM, Denys Dmytriyenko wrote:
> On Wed, Feb 19, 2025 at 04:23:55PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 2/19/2025 3:48 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> The original .bbappend started with just a few customizations behind
>>> a :k3 SoC override, but eventually grew in size. It got converted into
>>> a .inc file, which is behind the same SoC override and hence it gets
>>> included by .bbappend only for K3 platforms:
>>> https://git.yoctoproject.org/meta-ti/commit/?id=389f9a8b726868768a8bed6cbe0b2a1f18c05410
>>>
>>> It doesn't make sense to use the same :k3 override inside this .inc
>>> file for every variable. Moreover, it makes it harder to change
>>> those variables downstream for any derivative platform or even for
>>> upstream testing.
>>>
>>> This change drops redundant :k3 SoC overrides, w/o changing existing
>>> behavior. It allows easier modifications of such customizations from
>>> downstream layers or a local.conf, e.g. SRC_URI_TRUSTED_FIRMWARE_A
>>>
>>> Note that SRC_URI is set exactly the same as in upstream base .inc
>>> file, but version-specific recipes in meta-arm tend to add extra
>>> patches directly to SRC_URI, which is undesirable here. Thus, reset
>>> SRC_URI back to its default.
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>>   .../trusted-firmware-a-ti.inc                 | 26 ++++++++++++-------
>>>   1 file changed, 16 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>>> index 9971e960..21aef489 100644
>>> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>>> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>>> @@ -1,14 +1,20 @@
>>> -PV:k3 = "2.12+git"
>>> -SRCREV_tfa:k3 = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
>>> -LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
>>> -SRC_URI:k3 = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https;name=tfa;branch=ti-master"
>>> -COMPATIBLE_MACHINE:k3 = "k3"
>>> -TFA_BUILD_TARGET:k3 = "all"
>>> -TFA_INSTALL_TARGET:k3 = "bl31"
>>> -TFA_SPD:k3 = "opteed"
>>> +# NOTE: This .inc file with customizations only gets included for K3 platforms
>>> +
>>> +PV = "2.12+git"
>>> +SRCREV_tfa = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
>>> +SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
>>> +SRCBRANCH = "ti-master"
>>> +SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
>>
>> I think this is already the value of SRC_URI from the main recipe...
>> so we shouldn't need to override it here if we are redefining the
>> SRC_URI_TRUSTED_FIRMWARE_A variable.
> 
> It was actually explained in the commit log above...

Got it.


> 
>>> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
>>> +COMPATIBLE_MACHINE = "k3"
>>> +
>>> +TFA_BUILD_TARGET = "all"
>>> +TFA_INSTALL_TARGET = "bl31"
>>> +TFA_SPD = "opteed"
>>>   # For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
>>>   TFA_INSTALL_TARGET:am62lxx = "bl31 bl1"
>>> -EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>>> -EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
>>> +EXTRA_OEMAKE += "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>>> +EXTRA_OEMAKE += "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


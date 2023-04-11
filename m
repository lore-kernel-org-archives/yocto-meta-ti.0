Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C44C7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 19:12:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.23484.1681240321900914278
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 12:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qgxUGZLe;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BJBq9v085074;
	Tue, 11 Apr 2023 14:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681240312;
	bh=s4Z1NrpoZZzmz1gOaIs65G6hWkeoFAIi5C2Ys1kMpsA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qgxUGZLeBHEMyXBE59yX5S6lH1+0l4xxx7/XPD5tO3uwt0D0qtJ6m8v8HnUmm3MGY
	 JeTqA7Ta1gCaW0Gt5RpGFPZXxK4dw8CBWpaXj+FJoGCUiT45gwsnM4QvoqTQ0uakWL
	 lsuFDF/KnVSunJ6Tl4gWJuwLY1lHKCVJoeSiTa+s=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BJBqfq050672
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 14:11:52 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 14:11:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 14:11:51 -0500
Received: from [10.250.33.184] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BJBpvM024900;
	Tue, 11 Apr 2023 14:11:51 -0500
Message-ID: <0174c422-81be-666d-fb62-265bd19df0db@ti.com>
Date: Tue, 11 Apr 2023 14:11:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: Set common
 default SERIAL_CONSOLES for all K3
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, "Menon, Nishanth" <nm@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230405185027.26235-1-afd@ti.com>
 <20230405234952.GK9226@denix.org>
 <25ebd8fa-bd96-5829-9681-e9a7d26accd7@ti.com>
 <20230411185910.GU9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230411185910.GU9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 19:12:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16353

On 4/11/23 1:59 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 11, 2023 at 12:27:10PM -0500, Andrew Davis wrote:
>> On 4/5/23 6:49 PM, Denys Dmytriyenko wrote:
>>> On Wed, Apr 05, 2023 at 01:50:27PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>>>> The traditional order of serial consoles for K3 has ttyS2 being the
>>>> primary UART attached console. ttyS0 is also a common choice for
>>>> distros and the TI kernel may switch at some point. To prepare
>>>> we check both UARTs on all K3 devices. Move this common check
>>>> to a K3 common location.
>>>
>>> I see different K3 platforms use ttyS0, ttyS1, ttyS2 and ttyS3.
>>>
>>> Were others just mis-used as MCU UARTs or some other leftovers?
>>>
>>
>> Some look to be just misusing MCU UARTs, others types/leftovers.
>> Hopefully this patch unifies everything. If one wants to use
>> a different port then these two then can be chosen in DT.
> 
> Are there any derivative boards (like SK or other product-specific spins) that
> use a different main UART? I remember in pre-K3 days that used to be the case
> for some platforms, where EVM uses one UART and SK/ICE/etc. a different one...
> 

Probably, in those cases we now use DT aliases and make the default serial
port always ttyS0*. That allows us to fix these differences in the kernel
instead of out here in the integration layers. Since non-Arago distro's
always expect ttyS0, anything else doesn't work.

*(well ttyS2 for some K3 platforms even though it breaks our
multi-distro story for any distro that is not Arago. Guess since it
was broken before, we want to be "backwards compatible" with "broken"
and keep it broken forever, IDK ask +Nishanth /rant)

Andrew

> 
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>>   meta-ti-bsp/conf/machine/beaglebone-ai64.conf  | 3 ---
>>>>   meta-ti-bsp/conf/machine/include/am62axx.inc   | 3 ---
>>>>   meta-ti-bsp/conf/machine/include/am62xx-lp.inc | 3 ---
>>>>   meta-ti-bsp/conf/machine/include/am62xx.inc    | 3 ---
>>>>   meta-ti-bsp/conf/machine/include/am64xx.inc    | 3 ---
>>>>   meta-ti-bsp/conf/machine/include/am65xx.inc    | 3 ---
>>>>   meta-ti-bsp/conf/machine/include/k3.inc        | 3 +++
>>>>   meta-ti-bsp/conf/machine/j7200-evm.conf        | 3 ---
>>>>   meta-ti-bsp/conf/machine/j721e-evm.conf        | 3 ---
>>>>   meta-ti-bsp/conf/machine/j721s2-evm.conf       | 2 --
>>>>   meta-ti-bsp/conf/machine/j721s2-hs-evm.conf    | 3 ---
>>>>   meta-ti-bsp/conf/machine/j784s4-evm.conf       | 2 --
>>>>   meta-ti-bsp/conf/machine/j784s4-hs-evm.conf    | 2 --
>>>>   13 files changed, 3 insertions(+), 33 deletions(-)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>>>> index 6e8c863c..e6cba3df 100644
>>>> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>>>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>>>> @@ -4,9 +4,6 @@
>>>>   require conf/machine/include/j721e.inc
>>>> -SERIAL_CONSOLES = "115200;ttyS2"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>> -
>>>>   UBOOT_MACHINE = "j721e_evm_a72_config"
>>>>   PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
>>>> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
>>>> index d0970948..0c6b8503 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
>>>> @@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am62axx"
>>>>   MACHINE_FEATURES += "screen touchscreen"
>>>> -SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>> -
>>>>   TFA_K3_SYSTEM_SUSPEND = "1"
>>>>   # Default tiboot3.bin on AM62A is for HS-FS
>>>> diff --git a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
>>>> index d37d4673..4601603c 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
>>>> @@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am62xx"
>>>>   MACHINE_FEATURES += "screen touchscreen"
>>>> -SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>> -
>>>>   TFA_K3_SYSTEM_SUSPEND = "1"
>>>>   # Default tiboot3.bin on AM62x LP is for HS-FS
>>>> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
>>>> index af6a6db4..953128cc 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
>>>> @@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am62xx"
>>>>   MACHINE_FEATURES += "screen gpu"
>>>> -SERIAL_CONSOLES = "115200;ttyS2"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>> -
>>>>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>>>>   # Default tiboot3.bin on AM62x is for HS-FS
>>>> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
>>>> index 157bf5d5..c486f3c1 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
>>>> @@ -1,9 +1,6 @@
>>>>   require conf/machine/include/k3.inc
>>>>   SOC_FAMILY:append = ":am64xx"
>>>> -SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>> -
>>>>   KERNEL_DEVICETREE_PREFIX = "ti/k3-am642"
>>>>   KERNEL_DEVICETREE = " \
>>>> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
>>>> index 564d61b0..b848881c 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
>>>> @@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am65xx"
>>>>   MACHINE_FEATURES += "screen touchscreen gpu"
>>>> -SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>> -
>>>>   PREFERRED_PROVIDER_virtual/gpudriver ?= ""
>>>>   KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
>>>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
>>>> index 93bcea76..5c3c771a 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>>>> @@ -53,3 +53,6 @@ MACHINE_FEATURES += "efi"
>>>>   WKS_FILE ?= "sdimage-2part-efi.wks"
>>>>   do_image_wic[depends] += "virtual/bootloader:do_deploy"
>>>>   do_image_wic[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
>>>> +
>>>> +SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
>>>> +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>> diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
>>>> index b17b65b7..dff1da69 100644
>>>> --- a/meta-ti-bsp/conf/machine/j7200-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
>>>> @@ -4,9 +4,6 @@
>>>>   require conf/machine/include/j7200.inc
>>>> -SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>> -
>>>>   KERNEL_DEVICETREE_PREFIX = "ti/k3-j7200"
>>>>   KERNEL_DEVICETREE = " \
>>>> diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
>>>> index f602a77b..8682ad60 100644
>>>> --- a/meta-ti-bsp/conf/machine/j721e-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
>>>> @@ -4,9 +4,6 @@
>>>>   require conf/machine/include/j721e.inc
>>>> -SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>> -
>>>>   KERNEL_DEVICETREE_PREFIX = " \
>>>>       ti/k3-j721e \
>>>>       ti/k3-j7200-mcspi-loopback \
>>>> diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
>>>> index 1f54c7b1..a16e744d 100644
>>>> --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
>>>> @@ -4,8 +4,6 @@
>>>>   require conf/machine/include/j721s2.inc
>>>> -SERIAL_CONSOLES = "115200;ttyS2"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>>   TFA_K3_USART = "0x8"
>>>>   OPTEE_K3_USART = "0x8"
>>>> diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
>>>> index 8fa98440..085c91e7 100644
>>>> --- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
>>>> @@ -4,9 +4,6 @@
>>>>   require conf/machine/include/j721s2.inc
>>>> -SERIAL_CONSOLES = "115200;ttyS2"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>> -
>>>>   TFA_K3_USART = "0x8"
>>>>   OPTEE_K3_USART = "0x8"
>>>> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>> index 53bb4e4f..c0483505 100644
>>>> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>> @@ -4,8 +4,6 @@
>>>>   require conf/machine/include/j784s4.inc
>>>> -SERIAL_CONSOLES = "115200;ttyS2"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>>   TFA_K3_USART = "0x8"
>>>>   OPTEE_K3_USART = "0x8"
>>>> diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
>>>> index 1c56f55a..4deb0f8b 100644
>>>> --- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
>>>> @@ -4,8 +4,6 @@
>>>>   require conf/machine/include/j784s4.inc
>>>> -SERIAL_CONSOLES = "115200;ttyS2"
>>>> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>>   TFA_K3_USART = "0x8"
>>>>   OPTEEMACHINE = "k3-j784s4"
>>>>   OPTEE_K3_USART = "0x8"
>>>> -- 
>>>> 2.39.2


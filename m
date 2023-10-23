Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271A6C25B46
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 17:18:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.126867.1698081503721109056
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 10:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XLfFQxZo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39NHIJ3e076227;
	Mon, 23 Oct 2023 12:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698081499;
	bh=pOH/uXPSxjpAtcerKaKRBDxLfuBI8Sl6wHgoWNCJbJ4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XLfFQxZoKq17GKY8gXFTTP1vOZk4rr1dd3mnqg0KMoyPTEe8iXFxQnKNNqbUKFRgu
	 gpMEfas0g4A8rHNl0HOSCj+725Fe8l0A5hslcrPMexJpPhmgWnqonWPwGgbmaXvfxh
	 gLDsEerc0zionJ2TfkX/Rb1KW7tmvPg/MkKB+oIs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39NHIJZU124739
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Oct 2023 12:18:19 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Oct 2023 12:18:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Oct 2023 12:18:19 -0500
Received: from [10.250.38.120] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39NHIIh7101650;
	Mon, 23 Oct 2023 12:18:18 -0500
Message-ID: <840ea77f-0e90-4422-afb8-07d3a4123eb0@ti.com>
Date: Mon, 23 Oct 2023 12:18:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/kirkstone][PATCH 5/5] conf: beagle*: recommend
 essential FW images for Beagle devices
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <20231020204458.546852-1-denis@denix.org>
 <20231020204458.546852-5-denis@denix.org>
 <190bcd54-29fd-4c2c-a39e-18e7fe42c4bd@ti.com>
 <20231023165614.GR2408@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231023165614.GR2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 17:18:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17174

On 10/23/23 11:56 AM, Denys Dmytriyenko wrote:
> On Mon, Oct 23, 2023 at 10:50:43AM -0500, Andrew Davis wrote:
>> On 10/20/23 3:44 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> Set MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS per platform to list recommended
>>> essential FW images to be added to rootfs by default.
>>>
>>> Correct beagle-x15 to pull devicetrees and kernel image as well.
>>>
>>
>> Would it be better to have the bb.org kernel pull in `kernel-rdepends.inc` like
>> the other kernels and get all these RDEPENDS/RRECOMMENDS from that?
> 
> No, I was actually working on the opposite - moving those to corresponding
> machine/SoC configs and removing kernel-rdepends.inc
> 
> MACHINE_ESSENTIAL_EXTRA_RDEPENDS and MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS are
> a proper way to express such dependencies for things like FW images to be
> pulled into an image, instead of making kernel RDEPENDS on them. And it is
> not specific to a particular kernel, so you don't need to keep including that
> kernel-rdepends.inc from every kernel recipe.
> 

If you are going to do it this way for all platforms, then you should
be able to do this in the machine/include/*.inc files vs out here
in each and every machine. So my question would be, if this is the right
direction, why only the Beagle plats in this patch?

Andrew

> 
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>>   meta-ti-bsp/conf/machine/beagle-x15.conf      | 2 ++
>>>   meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 3 +++
>>>   meta-ti-bsp/conf/machine/beaglebone.conf      | 2 ++
>>>   meta-ti-bsp/conf/machine/beagleplay.conf      | 3 +++
>>>   4 files changed, 10 insertions(+)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
>>> index be27705c..3b857165 100644
>>> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
>>> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
>>> @@ -19,3 +19,5 @@ MACHINE_GUI_CLASS = "bigscreen"
>>>   SERIAL_CONSOLES = "115200;ttyS2"
>>>   UBOOT_MACHINE = "am57xx_evm_config"
>>> +
>>> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-zimage"
>>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>>> index 2f9c7288..3f5a027e 100644
>>> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>>> @@ -24,4 +24,7 @@ ti/k3-j721e-sk.dtb \
>>>   "
>>>   MACHINE_GUI_CLASS = "bigscreen"
>>> +
>>>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-image"
>>> +
>>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw"
>>> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
>>> index 2d811d0d..45944ce8 100644
>>> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
>>> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
>>> @@ -23,3 +23,5 @@ MACHINE_FEATURES += "screen"
>>>   SERIAL_CONSOLES = "115200;ttyS0"
>>>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-zimage"
>>> +
>>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3"
>>> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
>>> index 6a0f697f..4dd550a1 100644
>>> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
>>> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
>>> @@ -42,4 +42,7 @@ ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
>>>   "
>>>   MACHINE_GUI_CLASS = "bigscreen"
>>> +
>>>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-image"
>>> +
>>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += ""


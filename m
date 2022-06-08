Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E07C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 19:12:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.1522.1654715527449727100
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 12:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gMDYUQWz;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 258JC6Hl041064
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jun 2022 14:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654715526;
	bh=HQWg2Ox8SfzXRlifTRuKyRYzWZH6Zo8Eb5Xx69IKu3Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gMDYUQWznikqTl3sKs/8iPN43JuUVYxDryKc0bJbzTeLDkSxWibmXkBrxLAYVW7Tf
	 uoPI9/8RmYdBChOrf7B5K/NkZZ+ZKFt8RJYK/nEfw86wmuVAXZMlubznNK3LOOkVSa
	 24O77w5ApYEy4XPrrdyBy7uk204wFXSxeK5UqMZ8=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 258JC6bZ015952
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jun 2022 14:12:06 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Jun 2022 14:12:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Jun 2022 14:12:05 -0500
Received: from [10.250.32.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 258JC5Ox032105;
	Wed, 8 Jun 2022 14:12:05 -0500
Message-ID: <e05fb099-2f3a-5481-c94a-004f74997a63@ti.com>
Date: Wed, 8 Jun 2022 14:12:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti] [dunfell PATCH v2 5/5] cnm-wave-fw: add compatible for
 j721s2-hs-evm
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>, <j-choudhary@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
References: <20220607103529.13068-1-j-choudhary@ti.com>
 <20220607103529.13068-6-j-choudhary@ti.com>
 <20220608180741.wotw5fzlr6e3hons@reunion>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220608180741.wotw5fzlr6e3hons@reunion>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 19:12:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14798

On 6/8/22 1:07 PM, Nishanth Menon wrote:
> On 16:05-20220607, Jayesh Choudhary via lists.yoctoproject.org wrote:
>> Add the HS platform to the compatible list in the recipe.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 3 ++-
>>   recipes-kernel/linux/kernel-rdepends.inc   | 1 +
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> index 0c432de2..83619090 100644
>> --- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> +++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> @@ -13,7 +13,7 @@ PR = "${INC_PR}.1"
>>   
>>   CLEANBROKEN = "1"
>>   
>> -COMPATIBLE_MACHINE = "j721s2-evm"
>> +COMPATIBLE_MACHINE = "j721s2-evm|j721s2-hs-evm"
>>   
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>> @@ -22,6 +22,7 @@ TARGET_WAVE521C = "wave521c_codec_fw.bin"
>>   
>>   SOURCE_WAVE521C = "wave521c_codec_fw.bin"
>>   SOURCE_WAVE521C_j721s2-evm = "wave521c_j721s2_codec_fw.bin"
>> +SOURCE_WAVE521C_j721s2-hs-evm = "wave521c_j721s2_codec_fw.bin"
> 
> Just curious..
> 
> Is the codec binary changing per board? if not, why not just plug it
> based on SoC?
> 


We didn't have a SoC name for j721s2, it used the same name "j7" for
all J7 like SoCs, so we had to add specifics on a per-board basis.

Don't worry, I fixed it in master branch[0], but it would have been too
much churn for a stable like dunfell, so we just have to live with adding
for each specific board instead of per SoC for a bit longer.

[0] https://git.ti.com/cgit/arago-project/meta-ti/commit/?id=531fd1af2333fe831c70a88e7f592a11a58bf94d

Andrew


>>   
>>   ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE521C}"
>>   ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE521C}"
>> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
>> index 17aee4c2..2ebf4948 100644
>> --- a/recipes-kernel/linux/kernel-rdepends.inc
>> +++ b/recipes-kernel/linux/kernel-rdepends.inc
>> @@ -45,6 +45,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
>>   
>>   # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
>>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cnm-wave-fw"
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cnm-wave-fw"
>>   
>>   # Add run-time dependency for TIFS Low Power Module stub
>>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
>> -- 
>> 2.17.1
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#14791): https://lists.yoctoproject.org/g/meta-ti/message/14791
>> Mute This Topic: https://lists.yoctoproject.org/mt/91597545/5513541
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [nm@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 


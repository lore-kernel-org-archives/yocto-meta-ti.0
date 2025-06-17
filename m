Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFC1C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 19:13:14 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.28174.1750187586390647672
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 12:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nYhWQWZt;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: praneeth@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55HJD38I096337;
	Tue, 17 Jun 2025 14:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750187583;
	bh=0QsTyNSqAvTwmvOVppbt5MDL8cwCG6NI6Pa3uM4mCYM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nYhWQWZtN3yJ1m1KAq8UDWNEf4VrTkdgsvxqDpPDrNPIboXBHzuum/Qlq3ZBqnKZ+
	 jbpI4LqTqd9V9pGOqtW1YcJp+jN2+UJg8G/KuPuzZoeHa48wG06cpR4TxaoshpB3Vm
	 8tAhiwH5eh0qOQzPuLONS8/Skc0PKZgjBO83ijro=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55HJD3dq2044892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 17 Jun 2025 14:13:03 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 17
 Jun 2025 14:13:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 17 Jun 2025 14:13:02 -0500
Received: from [10.247.26.101] (ltpw0eb5ja.dhcp.ti.com [10.247.26.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55HJD2jx2203096;
	Tue, 17 Jun 2025 14:13:02 -0500
Message-ID: <99e74a5a-c2df-4775-923b-3398679a8483@ti.com>
Date: Tue, 17 Jun 2025 14:13:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] recipes-bsp: Add TI TAD5212 DAC firmware
 recipe
To: Denys Dmytriyenko <denis@denix.org>
CC: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <reatmon@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>,
        <khasim@ti.com>, <afd@ti.com>
References: <20250617101904.3686160-1-p-bhagat@ti.com>
 <1cfb1871-ca94-4c7e-af20-f2f5c5889176@ti.com>
 <20250617173711.GG18383@denix.org> <20250617174159.GH18383@denix.org>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20250617174159.GH18383@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Jun 2025 19:13:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18649



On 6/17/2025 12:41 PM, Denys Dmytriyenko wrote:
> On Tue, Jun 17, 2025 at 01:37:11PM -0400, Denys Dmytriyenko wrote:
>> On Tue, Jun 17, 2025 at 12:10:37PM -0500, Bajjuri, Praneeth wrote:
>>>
>>>
>>> On 6/17/2025 5:19 AM, Paresh Bhagat wrote:
>>>> From: Vishnu Singh <v-singh1@ti.com>
>>>>
>>>> Add TAD5212 DAC firmware images for am62dxx-evm to support two DAC
>>>> configurations:
>>>> - TAD5212_01.bin: Configures 1 DAC with stereo channel in i2s mode.
>>>> - TAD5212_04.bin: Configures 4 DAC with each having stereo channel
>>>> 		  support in i2s mode.
>>>>
>>>> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
>>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>>> ---
>>>>
>>>> This patch depends on new DAC firmware patch on ti-linux-firmware.
>>>>
>>>> Boot logs
>>>> https://gist.github.com/paresh-bhagat12/e4e2a7a1291d0f2d7acd0971bf2ed539
>>>>
>>>>
>>>>   meta-ti-bsp/conf/machine/include/am62dxx.inc  |  2 ++
>>>>   .../recipes-bsp/ti-dac-fw/ti-dac-fw.bb        | 20 +++++++++++++++++++
>>>>   .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
>>>>   3 files changed, 23 insertions(+)
>>>>   create mode 100644 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bsp/conf/machine/include/am62dxx.inc
>>>> index ac4e8e17..3c60acb1 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/am62dxx.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
>>>> @@ -13,3 +13,5 @@ IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-evm.bin"
>>>>   TFA_BOARD = "lite"
>>>>   OPTEEMACHINE = "k3-am62x"
>>>> +
>>>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-dac-fw"
>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
>>>> new file mode 100644
>>>> index 00000000..7d333b9e
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
>>>> @@ -0,0 +1,20 @@
>>>> +DESCRIPTION = "TI DAC TAD5212 config prebuild binary firmware"
>>>> +
>>>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> +
>>>> +LICENSE = "TI-TFL"
>>>> +LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
>>>
>>> not the correct license file.
>>> update to match https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware-next&id=ef1e9d0dd2c3ba0af102cea0edb7044a12c8fb5b
>>>
>>> TI-TSPA
>>
>> Praneeth,
>>
>> TI-TSPA was replaced by TI-TFL back in 2014.
>>
>> And LICENSE.ti in ti-linux-firmware repo seems to be the TI-TFL license:
>> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/LICENSE.ti?h=ti-linux-firmware-next&id=ef1e9d0dd2c3ba0af102cea0edb7044a12c8fb5b
>>
>> Which matches the TI-TFL license in meta-ti:
>> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/licenses/TI-TFL
>>
>> For the reference, here's the old TI-TSPA license:
>> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/licenses/TI-TSPA
>>
>> And here's the commit that refers to deprecating TI-TSPA in favor of TI-TFL:
>> https://git.yoctoproject.org/meta-ti/commit/?id=0442fa03bc07bd70376522c290c1af254f7e77d4
> 
> Though, recipes-bsp/ti-linux-fw/ti-linux-fw.inc already specifies TI-TFL and
> points to LICENSE.ti file, so I guess Praneeth didn't mean TI-TSPA, but rather
> to use the LICENSE.ti file from ti-linux-firmware repo...

Thanks denys. Yes , thats correct.
Since LICENSE.ti already specifies TI-TFL .

I take back my previous comment.


> 
> 
>>>> +
>>>> +PV = "${TAD5212_FW_VERSION}"
>>>> +PR = "${INC_PR}.0"
>>>> +
>>>> +COMPATIBLE_MACHINE = "am62dxx"
>>>> +
>>>> +TAD5212_1DEV = "TAD5212_01.bin"
>>>> +TAD5212_4DEV = "TAD5212_04.bin"
>>>> +

Vishnu,
As discussed on the Kernel and firmware patch review.
Align the yocto patch naming with lower case letters , based on

https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware-next&id=50e46f2e36cfe28e54cb025184786e1ff9c38bca 


and

https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts?id=5789981be233cb651932ba7fe1a5d2d25b90a54e#n416


>>>> +do_install() {
>>>> +	install -d ${D}${nonarch_base_libdir}/firmware
>>>> +	install -m 0644 ${S}/ti/tad5212/${TAD5212_1DEV} ${D}${nonarch_base_libdir}/firmware/
>>>> +	install -m 0644 ${S}/ti/tad5212/${TAD5212_4DEV} ${D}${nonarch_base_libdir}/firmware/
>>>> +}
>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> index d1dd9df3..08cd0b30 100644
>>>> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> @@ -17,6 +17,7 @@ CNM_WAVE521_FW_VERSION = "1.0.8"
>>>>   TI_DM_FW_VERSION = "11.00.09"
>>>>   TI_SYSFW_VERSION = "11.01.00"
>>>>   TI_HSM_DEMO_FW_VERSION = "11.00.09"
>>>> +TAD5212_FW_VERSION = "1.0.0.0"
>>>>   TI_LINUX_FW_SRCREV ?= "a37c82f0e25e0e3c99fdf03f1d57f7b08314a2bc"
>>>>   SRCREV = "${TI_LINUX_FW_SRCREV}"


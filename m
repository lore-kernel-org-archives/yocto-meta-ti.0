Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEB9CAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 08:25:28 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.20315.1759220718520028956
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 01:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=F5PbEgCA;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58U8PHML2412164;
	Tue, 30 Sep 2025 03:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759220717;
	bh=6l6mnmfV5vbCCM5ct28RVrz2moq9HOq/8sVifCOHiHc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=F5PbEgCAa2TEjWBoAQqVUfUSBBatPo1HJcla0dKYeQaWFUf/4vZdThba6jvvcjCJU
	 FS/pGU6c0CbVgHWSOAAuVbqPNAZSpuvMRc+UOdh5L2XxlNjtkF1iEnkIUd0vrTcsLK
	 NhZl/8raxkLM6Gbrb0ySwpMUYbZDMw66CI5Qcr3Y=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58U8PHQq2968916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 30 Sep 2025 03:25:17 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 30
 Sep 2025 03:25:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 03:25:17 -0500
Received: from [10.24.72.162] (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58U8PDaH2621042;
	Tue, 30 Sep 2025 03:25:13 -0500
Message-ID: <b3b0f6dd-1d58-48f8-8fe1-d031c7307038@ti.com>
Date: Tue, 30 Sep 2025 13:55:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH 3/4 v2] meta-ti-bsp: wic: Add a new GRUB
 config for TI platforms
To: Andrew Davis <afd@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <a-limaye@ti.com>, <n-francis@ti.com>,
        <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>, <bb@ti.com>,
        <denys@konsulko.com>, <rs@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-4-m-shah@ti.com>
 <6e5d6135-9571-419d-8879-1626155c2a82@ti.com>
 <88e41345-a0a5-4897-afaf-ba1435be5758@ti.com>
 <a4c1ea7c-b3cb-4bae-86e6-6bd7f1b0f11a@ti.com>
 <382669c5-7104-4205-b8f2-79dc0bac01e1@ti.com>
 <4c6c3094-b6fe-4399-b9c5-8e5f385aac56@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <4c6c3094-b6fe-4399-b9c5-8e5f385aac56@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 58U8PHML2412164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 08:25:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19077

Hey Andrew,

On 29/09/25 20:03, Andrew Davis wrote:
> On 9/29/25 12:46 AM, Moteen Shah wrote:
>> Hey Vignesh and Andrew,
>>
>> On 29/09/25 09:36, Vignesh Raghavendra wrote:
>>>
>>> On 25/09/25 22:53, Andrew Davis wrote:
>>>> On 9/23/25 4:15 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>>
>>>>> On 9/19/2025 4:38 AM, Moteen Shah wrote:
>>>>>> Add a new grub config for TI specific platforms. While,
>>>>>> only supporting to boot linux from filesystem on MMCSD, it
>>>>>> will support booting linux and initrd image from eMMC, OSPI,
>>>>>> UFS later down the line. Hence, make a new config altogether
>>>>>> for easier development.
>>>>>>
>>>>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>>>>> ---
>>>>>> =C2=A0=C2=A0 meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
>>>>>> =C2=A0=C2=A0 meta-ti-bsp/wic/ti-grub.cfg=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>>>>>> =C2=A0=C2=A0 2 files changed, 10 insertions(+), 1 deletion(-)
>>>>>> =C2=A0=C2=A0 create mode 100644 meta-ti-bsp/wic/ti-grub.cfg
>>>>>>
>>>>>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bs=
p/
>>>>>> wic/sdimage-2part-efi.wks.in
>>>>>> index ae38daa7..11912606 100644
>>>>>> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>>>>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>>>>> @@ -3,6 +3,6 @@
>>>>>> =C2=A0=C2=A0 # supports EFI.=C2=A0 Boot files are located in the f=
irst vfat=20
>>>>>> partition
>>>>>> with extra
>>>>>> =C2=A0=C2=A0 # reserved space.=C2=A0 We cannot use a GPT here.
>>>>>> -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4
>>>>>> ${TI_WKS_BOOTLOADER_APPEND}"
>>>>>> +bootloader --configfile=3D"ti-grub.cfg"
>>>>> Your change dropped the ${TI_WKS_BOOTLOADER_APPEND} which is used f=
or
>>>>> am64 to specify the serial console.=C2=A0 This likely needs to be b=
etter
>>>>> tested before we just make blanket changes like that.
>>>>>
>>>> Just a side note on this, AM64 needs "console=3DttyS2,115200n8"=20
>>>> passed in
>>>> on the kernel
>>>> command line or you will not get kernel output. This is something=20
>>>> we can
>>>> pass to all
>>>> K3 boards (although not strictly needed for other boards, it is safe=
/
>>>> correct to do
>>>> for them all).
>>>> Non-K3 boards will want "console=3DttyS0,115200n8" (note
>>>> theS0). So
>>>> having this selectable per-SoC/family is still useful.
>>> AM62L would use=C2=A0 "console=3DttyS0,115200n8" as well.
>>
>> Don't we set console=3D property from the platform.env files in uboot?
>>
>
> Yes, but that is passed to the kernel when using the normal boot flow,
> for EFI boot the kernel command line is set here in the EFI config.
>
> Andrew

Currently, in my testing I am not passing any console=3D property in=20
grub.cfg, but the prints still go to the right UART.
I think here, we are directly picking up from the stdout-path defined in=20
the u-boot's device-tree. I will test on AM62l as well for the v3.

Regards,
Moteen

>
>> Regards,
>> Moteen
>>
>>>
>>>
>>>> Andrew
>>> [...]
>>>
>


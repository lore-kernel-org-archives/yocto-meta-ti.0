Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFBCE7716E
	for <webhook@archiver.kernel.org>; Sat,  7 Dec 2024 06:11:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.55896.1733551912821875148
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 22:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=YVomjdjG;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: u-kumar1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B76BqKM2463871
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-ti@lists.yoctoproject.org>; Sat, 7 Dec 2024 00:11:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733551912;
	bh=3s+IMFlDHikmo0Jr6eZEyh+I0QhCh7zHcTGdTgyRU7c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YVomjdjGfFKgWygIKJ/X/ysOYrSo+3jMLO8oRPUFpbJkKVIxv5y7HMYaQOuGqNOhj
	 Kv0Qc+4utZgeOqvXLcedNCTRU62MDx7QZ1kut+cpKy1SObWOdfoPgotUpZa9RYR22q
	 18ne1o/QbOH9n5WdhRHDrnxmxu9stjutpxSZS3I8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B76BpV6033047
	for <meta-ti@lists.yoctoproject.org>; Sat, 7 Dec 2024 00:11:51 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 7
 Dec 2024 00:11:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 7 Dec 2024 00:11:51 -0600
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B76BnWd097031;
	Sat, 7 Dec 2024 00:11:50 -0600
Message-ID: <e09d5840-917a-4bfb-bbf4-6c1dcc68d0e9@ti.com>
Date: Sat, 7 Dec 2024 11:41:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH 0/2] omap-a15: Add dra7-ipu1-fw to
 boot
To: "Limaye, Aniket" <a-limaye@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <b-padhi@ti.com>, <u-kumar1@ti.com>
References: <20241205183103.3411587-1-a-limaye@ti.com>
 <25709f42-f9bd-4033-b416-a2639ae1a5b6@ti.com>
 <71fa0573-a129-4b3b-888f-fc154f343e6c@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <71fa0573-a129-4b3b-888f-fc154f343e6c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 4B76BqKM2463871
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 07 Dec 2024 06:11:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18091


On 12/7/2024 10:48 AM, Limaye, Aniket wrote:
>
>
> On 12/6/2024 8:50 PM, Ryan Eatmon wrote:
>>
>> As this platform still exists in scarthgap and master, should this=20
>> patch also be applied to those branches as well?
>>
>
> Udit? Beleswar? Are we targeting the early boot feature in latest=20
> kernel, u-boot? (TI tree and upstream?)
>
Upstream kernel and u-boot will be part of plan. But at present kernel=20
patches are not in shape to be up streamed.


> Should I send this series for scarthgap/master wic images as well?


yes please send this patch for=C2=A0scarthgap/master as well

>
> Thanks,
> Aniket
>
>>
>> On 12/5/2024 12:05 PM, Aniket Limaye wrote:
>>> The firmware is required for early boot of the remoteproc from SPL=20
>>> stage
>>> of the bootloader. Copy the ipc firmware into the boot partition of t=
he
>>> wic images, where the bootloader expects it to be.
>>>
>>> For this, add a deploy task for the firmware binary and also include=20
>>> the
>>> file in IMAGE_BOOT_FILES for omap-a15.
>>>
>>> Aniket Limaye (2):
>>> =C2=A0=C2=A0 meta-ti-extras: ti-ipc-rtos: Deploy ipc firmware
>>> =C2=A0=C2=A0 conf: machine: omap-a15.inc: include ipu1 firmware in th=
e boot
>>> =C2=A0=C2=A0=C2=A0=C2=A0 partition
>>>
>>> =C2=A0 meta-ti-bsp/conf/machine/include/omap-a15.inc=C2=A0=C2=A0=C2=A0=
 |=C2=A0 3 ++-
>>> =C2=A0 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb | 14 ++++++++=
++++++
>>> =C2=A0 2 files changed, 16 insertions(+), 1 deletion(-)
>>>
>>
>


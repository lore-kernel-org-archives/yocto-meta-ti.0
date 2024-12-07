Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E568CE7716E
	for <webhook@archiver.kernel.org>; Sat,  7 Dec 2024 05:18:55 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.55015.1733548733944331096
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 21:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=p/CTltFw;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B75IrYn2202989
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Fri, 6 Dec 2024 23:18:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733548733;
	bh=D0ILmDnvoPlQeOqkPd0oTm2kW9MHACrpl700SjE2Y30=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=p/CTltFw//3/tCfi7f8eWnXt8Mo7E2MO13kKG3U3fFlAlmy5qVzT/hw4KP7GYqG89
	 Jenh8A/8uN8EVRUZ4TdYU2iwysGaj8ga7QnHFi6pnIVGDcIETUMX4E8XkSTLe8Nv1Q
	 x4pfzBE0nVswIONGkMvZ03YCxrEHmI5Q+Be4HSDs=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B75IrHe094999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 6 Dec 2024 23:18:53 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 23:18:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 23:18:53 -0600
Received: from [10.249.132.137] ([10.249.132.137])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B75IokJ041296;
	Fri, 6 Dec 2024 23:18:51 -0600
Message-ID: <71fa0573-a129-4b3b-888f-fc154f343e6c@ti.com>
Date: Sat, 7 Dec 2024 10:48:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH 0/2] omap-a15: Add dra7-ipu1-fw to
 boot
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <b-padhi@ti.com>, <u-kumar1@ti.com>
References: <20241205183103.3411587-1-a-limaye@ti.com>
 <25709f42-f9bd-4033-b416-a2639ae1a5b6@ti.com>
Content-Language: en-US
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <25709f42-f9bd-4033-b416-a2639ae1a5b6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 4B75IrYn2202989
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 07 Dec 2024 05:18:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18090



On 12/6/2024 8:50 PM, Ryan Eatmon wrote:
>=20
> As this platform still exists in scarthgap and master, should this patc=
h=20
> also be applied to those branches as well?
>=20

Udit? Beleswar? Are we targeting the early boot feature in latest=20
kernel, u-boot? (TI tree and upstream?)

Should I send this series for scarthgap/master wic images as well?

Thanks,
Aniket

>=20
> On 12/5/2024 12:05 PM, Aniket Limaye wrote:
>> The firmware is required for early boot of the remoteproc from SPL sta=
ge
>> of the bootloader. Copy the ipc firmware into the boot partition of th=
e
>> wic images, where the bootloader expects it to be.
>>
>> For this, add a deploy task for the firmware binary and also include t=
he
>> file in IMAGE_BOOT_FILES for omap-a15.
>>
>> Aniket Limaye (2):
>> =C2=A0=C2=A0 meta-ti-extras: ti-ipc-rtos: Deploy ipc firmware
>> =C2=A0=C2=A0 conf: machine: omap-a15.inc: include ipu1 firmware in the=
 boot
>> =C2=A0=C2=A0=C2=A0=C2=A0 partition
>>
>> =C2=A0 meta-ti-bsp/conf/machine/include/omap-a15.inc=C2=A0=C2=A0=C2=A0=
 |=C2=A0 3 ++-
>> =C2=A0 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb | 14 +++++++++=
+++++
>> =C2=A0 2 files changed, 16 insertions(+), 1 deletion(-)
>>
>=20



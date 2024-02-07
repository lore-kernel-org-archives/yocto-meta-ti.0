Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C31C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 07:21:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.15510.1707290497855479008
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 23:21:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=MhWyubuq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4177LaIt097222;
	Wed, 7 Feb 2024 01:21:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707290496;
	bh=T7lfYB754LIx1mp0c1tsvzBvuYgvmHTyHcjFe5Iw0eA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MhWyubuqtOodLKDz/AAGuPuPibqG6ICjyiRX6opb/o3om2DzGSzvcCv+am0l5P8Sy
	 dmc+GJcHZz/teALYHpuFTAdQWEprWMSPeA2HceglKsp3Mpshmi1GvDkapQ55K7ff9L
	 d4ten9lInCkFMw0iS1ns5VISIT5NVNIuqp4Ia/ao=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4177LapB113450
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Feb 2024 01:21:36 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Feb 2024 01:21:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Feb 2024 01:21:36 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4177LWXM009545;
	Wed, 7 Feb 2024 01:21:33 -0600
Message-ID: <e1ba92b5-434b-4a01-962f-70d82123a883@ti.com>
Date: Wed, 7 Feb 2024 12:51:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone] [PATCH v2] meta-ti-bsp: Add bootsplash
 image file for AM62P
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@konsulko.com>
CC: <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        Gyan Gupta
	<g-gupta@ti.com>, Khasim <khasim@ti.com>
References: <20240203070525.1728676-1-devarsht@ti.com>
 <6c7d7efe-7816-48f1-808c-7f3e686de8a2@ti.com>
 <a7da287c-c38e-8171-bbcd-42158d42e68e@ti.com>
 <13511ef8-4953-409c-aa30-522a934f54d3@ti.com>
 <3ece8988-7e18-4e0a-adbb-9de0897578cf@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <3ece8988-7e18-4e0a-adbb-9de0897578cf@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 4177LaIt097222
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Feb 2024 07:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17451


On 06/02/24 03:20, Bajjuri, Praneeth wrote:
>
>
> On 2/5/2024 10:06 AM, Chirag Shilwant wrote:
>>
>> On 05/02/24 21:13, Devarsh Thakkar wrote:
>>>
>>>
>>> On 05/02/24 20:44, Ryan Eatmon wrote:
>>>>
>>>>
>>>> On 2/3/2024 1:05 AM, Devarsh Thakkar wrote:
>>>>> Add TI logo image as bootsplash image file for AM62P and install=20
>>>>> it in
>>>>> boot directory from where u-boot can read from and display during
>>>>> boot-up time.
>>>>
>>>>
>>>> Thank you for the rebase.=C2=A0 Was the config fragment that Chirag=20
>>>> asked about ever sent to uboot to avoid an issue with the recipe in=20
>>>> the processor-sdk?
>>>>
>>>
>>> Yes, I had submitted a patch to ti-u-boot.=20
>
> pulled the patch in -next branch.
> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-boot-2023.=
04-next&id=3De7d2df2ecfb3591938087335d81ebf0498dc8ece=20
>
>
>

Thanks Praneeth.


Hi Ryan,

As the ti-u-boot config dependencies are pulled in next branches, we can=20
go ahead and integrate this patch.
I will send out a patch soon to update the am62pxx-evm.conf to include=20
the config fragment which is needed
for the tisdk-display-cluster wic image.


> I have sent you the link
>>> offline.
>>>
>>> Regards
>>> Devarsh
>>
>>
>> Thanks Devarsh for sending a v2. What's the status on the config=20
>> fragment patch in ti-u-boot as well as upstream?
>>
>
> Devarsh, can you comment on this one .
>
>
>>
>>>
>>>>
>>>>
>>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>


>>>>>
>>>>> ---
>>>>> V2: Rebase to updated uboot recipes
>>>>> ---
>>>>> =C2=A0 meta-ti-bsp/conf/machine/include/am62pxx.inc |=C2=A0 3 +++
>>>>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 10 ++++++++++
>>>>> =C2=A0 2 files changed, 13 insertions(+)
>>>>>
>>>>> diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc=20
>>>>> b/meta-ti-bsp/conf/machine/include/am62pxx.inc
>>>>> index bac68253..38e35851 100644
>>>>> --- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
>>>>> +++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
>>>>> @@ -17,3 +17,6 @@ OPTEEMACHINE =3D "k3-am62x"
>>>>> =C2=A0 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
>>>>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS2"
>>>>> +
>>>>> +# Bitmap image tarball for early splashscreen
>>>>> +IMAGE_BOOT_FILES +=3D "ti_logo_414x97_32bpp.bmp.gz"
>>>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>>>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>>>> index 493c1c31..42ddf40f 100644
>>>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>>>> @@ -341,4 +341,14 @@ do_deploy:append:am62xx() {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_=
logo_414x97_32bpp.bmp.gz=20
>>>>> ${DEPLOYDIR}
>>>>> =C2=A0 }
>>>>> +do_install:append:am62pxx() {
>>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97=
_32bpp.bmp.gz=20
>>>>> ${D}/boot
>>>>> +}
>>>>> +
>>>>> +do_deploy:append:am62pxx() {
>>>>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97=
_32bpp.bmp.gz=20
>>>>> ${DEPLOYDIR}
>>>>> +}
>>>>> +
>>>>> =C2=A0 TOOLCHAIN =3D "gcc"
>>>>


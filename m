Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41B7C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 16:06:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.66435.1707149198983891819
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 08:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=vCa32uFF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415G6bL3036050;
	Mon, 5 Feb 2024 10:06:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707149197;
	bh=7436dI79G+7C8UVVVwL/eQP6zM9SgwxxXoEbFog3Yug=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vCa32uFFyACoAdd9CROyR0K/F6DIFYyUJJ479ctgemNCVvfk0x31jQ1q7V8LKDM8z
	 tw+StwFpQypxc7JQLIH/i3Ho7xu0q08YAkSE7knr2nFyTMXKKYHcmrAhGgdZFNDQGO
	 tiiTzFhZ7w6NEH8pbswA9bAVeQkQDJzRawtKjUTY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415G6bhY094835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 10:06:37 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 10:06:37 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 10:06:37 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415G6YRQ104062;
	Mon, 5 Feb 2024 10:06:34 -0600
Message-ID: <13511ef8-4953-409c-aa30-522a934f54d3@ti.com>
Date: Mon, 5 Feb 2024 21:36:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone] [PATCH v2] meta-ti-bsp: Add bootsplash
 image file for AM62P
To: Devarsh Thakkar <devarsht@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, Gyan Gupta <g-gupta@ti.com>, Khasim <khasim@ti.com>
References: <20240203070525.1728676-1-devarsht@ti.com>
 <6c7d7efe-7816-48f1-808c-7f3e686de8a2@ti.com>
 <a7da287c-c38e-8171-bbcd-42158d42e68e@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <a7da287c-c38e-8171-bbcd-42158d42e68e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 415G6bL3036050
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Feb 2024 16:06:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17441


On 05/02/24 21:13, Devarsh Thakkar wrote:
>
>
> On 05/02/24 20:44, Ryan Eatmon wrote:
>>
>>
>> On 2/3/2024 1:05 AM, Devarsh Thakkar wrote:
>>> Add TI logo image as bootsplash image file for AM62P and install it i=
n
>>> boot directory from where u-boot can read from and display during
>>> boot-up time.
>>
>>
>> Thank you for the rebase.=C2=A0 Was the config fragment that Chirag as=
ked=20
>> about ever sent to uboot to avoid an issue with the recipe in the=20
>> processor-sdk?
>>
>
> Yes, I had submitted a patch to ti-u-boot. I have sent you the link=20
> offline.
>
> Regards
> Devarsh


Thanks Devarsh for sending a v2. What's the status on the config=20
fragment patch in ti-u-boot as well as upstream?


>
>>
>>
>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>> ---
>>> V2: Rebase to updated uboot recipes
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am62pxx.inc |=C2=A0 3 +++
>>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 10 ++++++++++
>>> =C2=A0 2 files changed, 13 insertions(+)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc=20
>>> b/meta-ti-bsp/conf/machine/include/am62pxx.inc
>>> index bac68253..38e35851 100644
>>> --- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
>>> @@ -17,3 +17,6 @@ OPTEEMACHINE =3D "k3-am62x"
>>> =C2=A0 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
>>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS2"
>>> +
>>> +# Bitmap image tarball for early splashscreen
>>> +IMAGE_BOOT_FILES +=3D "ti_logo_414x97_32bpp.bmp.gz"
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> index 493c1c31..42ddf40f 100644
>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> @@ -341,4 +341,14 @@ do_deploy:append:am62xx() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_lo=
go_414x97_32bpp.bmp.gz=20
>>> ${DEPLOYDIR}
>>> =C2=A0 }
>>> +do_install:append:am62pxx() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97_3=
2bpp.bmp.gz=20
>>> ${D}/boot
>>> +}
>>> +
>>> +do_deploy:append:am62pxx() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97_3=
2bpp.bmp.gz=20
>>> ${DEPLOYDIR}
>>> +}
>>> +
>>> =C2=A0 TOOLCHAIN =3D "gcc"
>>


Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F74C27C5F
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 15:22:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.628.1717860132936510677
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 08 Jun 2024 08:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=LQiWstSL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 458FM9hY004164;
	Sat, 8 Jun 2024 10:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717860129;
	bh=iU1L3wyhFTGp3X8uXxsD6iFRk5iqVxx0byOw6drrP0o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LQiWstSL2QyxwTS6SQiShaFoxK81+SwPkG/w2QHwIdYIWmd0Qtj+k1EvbLsWR4S7G
	 UBJH82ru+dWCkUmKf+RymeHtUsAYrkwadRJtnBYQ1NK1UH5ORJjFFSQ9H3b9CB58kq
	 /gUENqD8UcnSJdmxmiRuXWTRuLgnvKki9jhdy/U8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 458FM9BP072481
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 8 Jun 2024 10:22:09 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 8
 Jun 2024 10:22:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 8 Jun 2024 10:22:08 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 458FM6mZ018655;
	Sat, 8 Jun 2024 10:22:07 -0500
Message-ID: <0fea61d6-a4ef-4410-961f-266c60867469@ti.com>
Date: Sat, 8 Jun 2024 20:52:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: Switch
 beagleplay to TI baseline by default
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan Gupta
	<g-gupta@ti.com>, Khasim <khasim@ti.com>,
        Praneeth <praneeth@ti.com>, Dhruva
	<d-gole@ti.com>
References: <20240606060555.1544271-1-c-shilwant@ti.com>
 <20240607201542.GU21287@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240607201542.GU21287@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 458FM9hY004164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 08 Jun 2024 15:22:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17715

Hi Denys,

On 08/06/24 01:45, Denys Dmytriyenko wrote:
> On Thu, Jun 06, 2024 at 11:35:55AM +0530, Chirag Shilwant wrote:
>> - From LTS scarthgap, the beagleplay yocto machine will by
>> default build with TI baseline (i.e kernel 6.6 & U-Boot 2024.04 as of =
today).
>> Hence, remove all the references of bb.org from machine configuration =
file.
>>
>> - Users can still build with Beagle's baseline (i.e. linux-bb.org & u-=
boot-bb.org)
>> by adding the following in their local.conf,
>>
>> ```
>>     PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
>>     PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
>>     PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
>> ```
> This won't work as expected, as it can be seen in the code that defconf=
igs are
> different


Yeah, an update is needed in u-boot-bb.org to incorporate the defconfig=20
name as per U-Boot 2023.04
Hence, commented the same on your linux-bb.org re-org patch=C2=A0[1] :)

[1]: https://lists.yoctoproject.org/g/meta-ti/message/17714




>   and there are other differences between 6.1 and 6.6 LTSs...


Can you help me understand on what are the differences in 6.1 v/s 6.6=20
LTS for beagleplay
other than kernel device tree? As=C2=A0[2] already handles the device tre=
e=20
differences

[2]: https://lists.yoctoproject.org/g/meta-ti/message/17707


>
>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 10 +---------
>>   meta-ti-bsp/conf/machine/beagleplay.conf      | 12 +++---------
>>   2 files changed, 4 insertions(+), 18 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-b=
sp/conf/machine/beagleplay-k3r5.conf
>> index 601cbbf7..b597c702 100644
>> --- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
>> @@ -4,16 +4,8 @@
>>  =20
>>   require conf/machine/include/k3r5.inc
>>  =20
>> -PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
>> -PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
>> -
>>   SYSFW_SOC =3D "am62x"
>>   SYSFW_CONFIG =3D "evm"
>>   SYSFW_SUFFIX =3D "gp"
>>  =20
>> -UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
>> -
>> -# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments wh=
ich has to be build
>> -# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-b=
oot-mergeconfig.inc
>> -# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>> -UBOOT_CONFIG_FRAGMENTS =3D "am625_beagleplay_r5.config"
>> +UBOOT_MACHINE =3D "am62x_beagleplay_r5_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/co=
nf/machine/beagleplay.conf
>> index 65c14333..1420d439 100644
>> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
>> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
>> @@ -2,7 +2,6 @@
>>   #@NAME: BeaglePlay (A53)
>>   #@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 c=
ore)
>>  =20
>> -require conf/machine//include/beagle.inc
>>   require conf/machine/include/k3.inc
>>   SOC_FAMILY:append =3D ":am62xx"
>>  =20
>> @@ -18,15 +17,10 @@ TFA_K3_SYSTEM_SUSPEND =3D "1"
>>  =20
>>   OPTEEMACHINE =3D "k3-am62x"
>>  =20
>> -UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
>> +SPL_BINARY =3D "tispl.bin_unsigned"
>> +SPL_BINARYNAME =3D "tispl.bin"
>>  =20
>> -# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments wh=
ich has to be build
>> -# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-b=
oot-mergeconfig.inc
>> -# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>> -UBOOT_CONFIG_FRAGMENTS =3D "am625_beagleplay_a53.config"
>> -
>> -PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
>> -PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
>> +UBOOT_MACHINE =3D "am62x_beagleplay_a53_defconfig"
>>  =20
>>   KERNEL_DEVICETREE_PREFIX =3D " \
>>       ti/k3-am625 \
>> --=20
>> 2.34.1
>>


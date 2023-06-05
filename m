Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0F5C77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 20:25:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.875.1685996711644242945
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 13:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=t1l9ZKjc;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 355KPBdO038184
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Jun 2023 15:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685996711;
	bh=gJ9NZBdS6nr8Zla8YQxFHmzF/d68vOj9qjVwbY3xmm0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=t1l9ZKjccNRfWAQwj+Vhsv6LYbJg1qcfOuwRD+GejBaLUMNsCfdn5YnJgwRSF/Gz6
	 QfNcKxTsqlR5067Nz/yMQf+0MfhP7szpsI230LVWWPBRwBlTeVmUhYldXEhrPAMlkP
	 RzsFdxJG8PNu8ppr4vUjvdF8zy+xnZETz38uKuSU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 355KPAXP065767
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Jun 2023 15:25:10 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Jun 2023 15:25:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Jun 2023 15:25:10 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 355KPA8T037155;
	Mon, 5 Jun 2023 15:25:10 -0500
Message-ID: <4a980318-4b35-f2a8-c7cd-242f5a99ef57@ti.com>
Date: Mon, 5 Jun 2023 15:25:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-ti] [kirkstone][PATCH v2] meta-ti-bsp: Add recipe for
 u-boot-ti-jailhouse and linux-ti-jailhouse
Content-Language: en-US
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
References: <20230605131152.69991-1-p-bhagat@ti.com>
 <1765C66D190BA797.3349@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1765C66D190BA797.3349@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 355KPBdO038184
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 20:25:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16670



On 6/5/2023 8:30 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 6/5/2023 8:11 AM, Paresh Bhagat wrote:
>> Add new recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which wi=
ll
>> be used for jailhouse for am62xx-evm.
>>
>> Jailhouse support for am62xx-evm requires few patches for u-boot and=20
>> linux
>> which are hosted at processor-sdk/u-boot and processor/linux=20
>> respectively.
>> To build a image with jailhouse for am62xx-evm, these recipes
>> will be used instead of u-boot-ti-staging and linux-ti-staging by=20
>> changing
>> the preferred_provider.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>> =C2=A0 .../recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb=C2=A0=C2=A0=
=C2=A0 | 9 +++++++++
>> =C2=A0 .../recipes-kernel/linux/linux-ti-jailhouse_6.1.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>> =C2=A0 2 files changed, 18 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb=20
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>> new file mode 100644
>> index 00000000..079d55dd
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>> @@ -0,0 +1,9 @@
>> +require u-boot-ti-staging_2023.04.bb
>> +
>> +# This will have priority over generic uboot path
>> +
>> +BRANCH =3D "ti-u-boot-2023.04-jailhouse"
>> +
>> +UBOOT_GIT_URI =3D "git://git.ti.com/git/processor-sdk/u-boot.git"
>=20
> What is reasoning for not upstreaming these patches (both u-boot and=20
> kernel) even just into the TI repositories?
>=20
> My concern is the CICD process.=C2=A0 This is adding another recipe wit=
h a=20
> completely different linux/u-boot repository that we need to add suppor=
t=20
> for to keep the recipes up to date.
>=20
> And you guys will to keep rebasing these patches on top of the latest=20
> 6.1 prod branch when CICD promotes.
>=20
> This just feels like something that is going to turn into a lot of=20
> maintenance work in the future.


After discussing this with Praneeth, these recipes should not be called=20
jailhouse, but rather something more generic (maybe experiments).  We do=20
not want to explode the number of recipes in the directory with every=20
experiment we want to run in the future...  We can then configure which=20
branch under the experiments to pick based on something in the distro=20
features or via machine features.

And upon further reflection, do we want to create a new layer under the=20
meta-ti repo to house all of these new changes and not host them in=20
meta-ti-bsp?  Basically keep meta-ti-bsp as the production versions of=20
code?  Any thoughs Andrew, Denys, Randolph?


>=20
>> +SRCREV =3D "79615e1c99b9aa73948f811f5f866cff2e34dc37"
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>> new file mode 100644
>> index 00000000..8e1edb55
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>> @@ -0,0 +1,9 @@
>> +require linux-ti-staging_6.1.bb
>> +
>> +# Use different commit, repo and branch for jailhouse build
>> +
>> +BRANCH =3D "ti-linux-6.1.y-jailhouse"
>> +
>> +SRCREV =3D "0ed0dec2462b805b0188fe080895adc437871549"
>> +
>> +KERNEL_GIT_URI =3D "git://git.ti.com/git/processor-sdk/linux.git"
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16665): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/16665
> Mute This Topic: https://lists.yoctoproject.org/mt/99339809/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/65=
51054/1815494134/xyzzy [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC63ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 16:34:08 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.14609.1662050043833081356
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 09:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=azJklYER;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 281GXxmM058061;
	Thu, 1 Sep 2022 11:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662050039;
	bh=fOxMxQnANUcVqsdMzurUKOLPFTjrV9pMpxCHbfK/EnU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=azJklYER5p0pbDjAufSdPmVe5gPoKUo3ko7wpLSA1VFW66W+E9oSU8+M3jYLK/ct3
	 cMlh7QrOwIVnZlfgikgwAu2JChZGpu1FcLFT6nHbR+ENo1zIKVhsVlej7ZBdKnjEFB
	 ROtZ27sM3TmeDga0Lz3C7urL+Nuc/Reex3VvqcCU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 281GXx4W004020
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Sep 2022 11:33:59 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 1 Sep
 2022 11:33:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 1 Sep 2022 11:33:58 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 281GXwem037090;
	Thu, 1 Sep 2022 11:33:58 -0500
Message-ID: <d5b52906-4eba-2e72-7278-e8fb24618a9e@ti.com>
Date: Thu, 1 Sep 2022 11:33:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [meta-ti][dunfell][PATCH 1/3] meta-ti: Rename j7-evm to j721e-evm
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20220831175315.15942-1-afd@ti.com>
 <20220831175315.15942-2-afd@ti.com>
 <f5281106-4ac9-a76b-1a3c-44d87e46733b@ti.com>
 <20220901161027.GK18429@denix.org>
 <bf8ba451-7715-7837-1bb8-7dfc659b0f26@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <bf8ba451-7715-7837-1bb8-7dfc659b0f26@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id
 281GXxmM058061
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Sep 2022 16:34:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14987



On 9/1/2022 11:20, Andrew Davis wrote:
> On 9/1/22 11:10 AM, Denys Dmytriyenko wrote:
>> On Thu, Sep 01, 2022 at 10:31:42AM -0500, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>>
>>>
>>> On 8/31/2022 12:53, Andrew Davis wrote:
>>>> In many places we use "j7" (the family name) when we should be using=
 a
>>>> specific SoC or EVM and vice-versa. For instance when including=20
>>>> graphics
>>>> drivers we add for all the "j7" family, but what we really want is o=
nly
>>>> for some specific j7 SoCs.
>>>>
>>>> First step in untangling this is to make it clear that there is no S=
oC
>>>> called "j7". There is a SoC called j721e with a j721e-evm.
>>>>
>>>> Fix up this naming here.
>>>>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>> =C2=A0 .../{j7-evm-k3r5.conf =3D> j721e-evm-k3r5.conf}=C2=A0 |=C2=A0=
 4 ++--
>>>> =C2=A0 conf/machine/{j7-evm.conf =3D> j721e-evm.conf}=C2=A0=C2=A0 |=C2=
=A0 4 ++--
>>>> =C2=A0 ...sr1-1.conf =3D> j721e-hs-evm-k3r5-sr1-1.conf} |=C2=A0 6 ++=
+---
>>>> =C2=A0 ...hs-evm-k3r5.conf =3D> j721e-hs-evm-k3r5.conf} |=C2=A0 4 ++=
--
>>>> =C2=A0 .../{j7-hs-evm.conf =3D> j721e-hs-evm.conf}=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 6 +++---
>>>> =C2=A0 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>>>> =C2=A0 .../ti-img-rogue-driver_1.15.6133109.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 10 +++++-----
>>>> =C2=A0 recipes-bsp/sciclient/sciclient-rtos_git.bb=C2=A0=C2=A0=C2=A0=
 |=C2=A0 6 +++---
>>>> =C2=A0 .../viddec-test-app_1.0.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 +-
>>>> =C2=A0 .../videnc-test-app_1.0.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 +-
>>>> =C2=A0 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 18=20
>>>> +++++++++---------
>>>> =C2=A0 .../trusted-firmware-a_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>>> =C2=A0 .../ti-img-rogue-umlibs_1.15.6133109.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
>>>> =C2=A0 recipes-kernel/linux/kernel-rdepends.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
>>>> =C2=A0 recipes-security/optee/optee-os_%.bbappend=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>>>> =C2=A0 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>>>> =C2=A0 16 files changed, 40 insertions(+), 40 deletions(-)
>>>> =C2=A0 rename conf/machine/{j7-evm-k3r5.conf =3D> j721e-evm-k3r5.con=
f} (81%)
>>>> =C2=A0 rename conf/machine/{j7-evm.conf =3D> j721e-evm.conf} (87%)
>>>> =C2=A0 rename conf/machine/{j7-hs-evm-k3r5-sr1-1.conf =3D>=20
>>>> j721e-hs-evm-k3r5-sr1-1.conf} (53%)
>>>> =C2=A0 rename conf/machine/{j7-hs-evm-k3r5.conf =3D>=20
>>>> j721e-hs-evm-k3r5.conf} (81%)
>>>> =C2=A0 rename conf/machine/{j7-hs-evm.conf =3D> j721e-hs-evm.conf} (=
85%)
>>>>
>>>> diff --git a/conf/machine/j7-evm-k3r5.conf=20
>>>> b/conf/machine/j721e-evm-k3r5.conf
>>>> similarity index 81%
>>>> rename from conf/machine/j7-evm-k3r5.conf
>>>> rename to conf/machine/j721e-evm-k3r5.conf
>>>
>>>
>>> So this changes the name of the yocto build machine label...=C2=A0 Th=
is
>>> will be impactful to users used to building j7-evm and for our build
>>> and testing scripts.=C2=A0 I will need to test this and work with Min=
as
>>> to make changes on the testing side before I can merge it in.
>>
>> Right. This was a good and timely change for kirkstone, but is it=20
>> worth the
>> effort for dunfell? Supposed to be a stable release branch and avoid=20
>> breakages
>> like this...
>>
>=20
> I did consider that, but it seems we will be on dunfell for a little bi=
t
> longer than I expected. If we have plans to move to kirkstone in the
> near future I'd have been okay with this fix only on kirkstone/master.
>=20
> Holding off on valid fixes because we are waiting for a next version we
> don't plan to switch to for a month+ is not a good strategy.


Is it possible to change the name of MACHINE after the code starts?  So=20
that from the outside we call it j7-evm, but internally in the recipes=20
we drop the j7 and go to j721e?  For dunfell, but for kirkstone we can=20
change the conf file name too?



--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


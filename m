Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD87ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 16:45:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.14798.1662050746262073758
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 09:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=J4V+x51G;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 281Gjejs060181;
	Thu, 1 Sep 2022 11:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662050740;
	bh=Tmg+QlPfYEBoUaQgpmzy3dWjOnICzz2RNvhL1meJJo0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=J4V+x51GOoDSJRgQWdqhY3b1tdn4LiKnwYXk88/FDXgZBY987WNjnLTlYZsMP4gRw
	 OfICXGt6shVb1KLdzLiieRfm+JeGHUtyaBakbHmiFIspQNuGmZxM9TRLw9DAuy7AaA
	 RZez8GtUh03808x0JCtYrzy1RwLnaCiQETBd6oPU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 281GjeFD126681
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Sep 2022 11:45:40 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 1 Sep
 2022 11:45:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 1 Sep 2022 11:45:39 -0500
Received: from [10.250.34.212] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 281Gjd3L076024;
	Thu, 1 Sep 2022 11:45:39 -0500
Message-ID: <19773573-5467-252f-55b4-bde67add49ae@ti.com>
Date: Thu, 1 Sep 2022 11:45:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][dunfell][PATCH 1/3] meta-ti: Rename j7-evm to j721e-evm
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20220831175315.15942-1-afd@ti.com>
 <20220831175315.15942-2-afd@ti.com>
 <f5281106-4ac9-a76b-1a3c-44d87e46733b@ti.com>
 <20220901161027.GK18429@denix.org>
 <bf8ba451-7715-7837-1bb8-7dfc659b0f26@ti.com>
 <d5b52906-4eba-2e72-7278-e8fb24618a9e@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <d5b52906-4eba-2e72-7278-e8fb24618a9e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id
 281Gjejs060181
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Sep 2022 16:45:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14988

On 9/1/22 11:33 AM, Ryan Eatmon wrote:
>=20
>=20
> On 9/1/2022 11:20, Andrew Davis wrote:
>> On 9/1/22 11:10 AM, Denys Dmytriyenko wrote:
>>> On Thu, Sep 01, 2022 at 10:31:42AM -0500, Ryan Eatmon via lists.yocto=
project.org wrote:
>>>>
>>>>
>>>> On 8/31/2022 12:53, Andrew Davis wrote:
>>>>> In many places we use "j7" (the family name) when we should be usin=
g a
>>>>> specific SoC or EVM and vice-versa. For instance when including gra=
phics
>>>>> drivers we add for all the "j7" family, but what we really want is =
only
>>>>> for some specific j7 SoCs.
>>>>>
>>>>> First step in untangling this is to make it clear that there is no =
SoC
>>>>> called "j7". There is a SoC called j721e with a j721e-evm.
>>>>>
>>>>> Fix up this naming here.
>>>>>
>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> ---
>>>>> =C2=A0 .../{j7-evm-k3r5.conf =3D> j721e-evm-k3r5.conf}=C2=A0 |=C2=A0=
 4 ++--
>>>>> =C2=A0 conf/machine/{j7-evm.conf =3D> j721e-evm.conf}=C2=A0=C2=A0 |=
=C2=A0 4 ++--
>>>>> =C2=A0 ...sr1-1.conf =3D> j721e-hs-evm-k3r5-sr1-1.conf} |=C2=A0 6 +=
++---
>>>>> =C2=A0 ...hs-evm-k3r5.conf =3D> j721e-hs-evm-k3r5.conf} |=C2=A0 4 +=
+--
>>>>> =C2=A0 .../{j7-hs-evm.conf =3D> j721e-hs-evm.conf}=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 6 +++---
>>>>> =C2=A0 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
>>>>> =C2=A0 .../ti-img-rogue-driver_1.15.6133109.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 10 +++++-----
>>>>> =C2=A0 recipes-bsp/sciclient/sciclient-rtos_git.bb=C2=A0=C2=A0=C2=A0=
 |=C2=A0 6 +++---
>>>>> =C2=A0 .../viddec-test-app_1.0.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 +-
>>>>> =C2=A0 .../videnc-test-app_1.0.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 +-
>>>>> =C2=A0 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++++++---------
>>>>> =C2=A0 .../trusted-firmware-a_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>>>> =C2=A0 .../ti-img-rogue-umlibs_1.15.6133109.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
>>>>> =C2=A0 recipes-kernel/linux/kernel-rdepends.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
>>>>> =C2=A0 recipes-security/optee/optee-os_%.bbappend=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
>>>>> =C2=A0 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
>>>>> =C2=A0 16 files changed, 40 insertions(+), 40 deletions(-)
>>>>> =C2=A0 rename conf/machine/{j7-evm-k3r5.conf =3D> j721e-evm-k3r5.co=
nf} (81%)
>>>>> =C2=A0 rename conf/machine/{j7-evm.conf =3D> j721e-evm.conf} (87%)
>>>>> =C2=A0 rename conf/machine/{j7-hs-evm-k3r5-sr1-1.conf =3D> j721e-hs=
-evm-k3r5-sr1-1.conf} (53%)
>>>>> =C2=A0 rename conf/machine/{j7-hs-evm-k3r5.conf =3D> j721e-hs-evm-k=
3r5.conf} (81%)
>>>>> =C2=A0 rename conf/machine/{j7-hs-evm.conf =3D> j721e-hs-evm.conf} =
(85%)
>>>>>
>>>>> diff --git a/conf/machine/j7-evm-k3r5.conf b/conf/machine/j721e-evm=
-k3r5.conf
>>>>> similarity index 81%
>>>>> rename from conf/machine/j7-evm-k3r5.conf
>>>>> rename to conf/machine/j721e-evm-k3r5.conf
>>>>
>>>>
>>>> So this changes the name of the yocto build machine label...=C2=A0 T=
his
>>>> will be impactful to users used to building j7-evm and for our build
>>>> and testing scripts.=C2=A0 I will need to test this and work with Mi=
nas
>>>> to make changes on the testing side before I can merge it in.
>>>
>>> Right. This was a good and timely change for kirkstone, but is it wor=
th the
>>> effort for dunfell? Supposed to be a stable release branch and avoid =
breakages
>>> like this...
>>>
>>
>> I did consider that, but it seems we will be on dunfell for a little b=
it
>> longer than I expected. If we have plans to move to kirkstone in the
>> near future I'd have been okay with this fix only on kirkstone/master.
>>
>> Holding off on valid fixes because we are waiting for a next version w=
e
>> don't plan to switch to for a month+ is not a good strategy.
>=20
>=20
> Is it possible to change the name of MACHINE after the code starts?=C2=A0=
 So that from the outside we call it j7-evm, but internally in the recipe=
s we drop the j7 and go to j721e?=C2=A0 For dunfell, but for kirkstone we=
 can change the conf file name too?
>=20
>=20

Do we gain much from that outside of not needing to change the command in=
 the build/test farm?

We already made this change in kirkstone, this is basically a backport (I=
 didn't
call it such as it is a bit different due to how much has changed between=
 dunfell
and kirkstone).

We will need to update the processor docs in a couple spots but I can han=
dle that
before the next Jacinto targeting release.


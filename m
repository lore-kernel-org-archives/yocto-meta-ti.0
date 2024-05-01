Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E93C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 19:53:16 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6271.1714593190489364932
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 May 2024 12:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=PNAp/ftd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 441Jr5jf074879;
	Wed, 1 May 2024 14:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714593185;
	bh=tTTQ+FY/jRX73wnImUmFAubPWj64AiJdjVLk5Zs8v28=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PNAp/ftdWL+EwIHdS3gvRy1g2U2GXFDO/XdFIHCPOZ7K1wP7kgqW4zWksu9ZZ7k96
	 5m5qkBnCJSd09qlp6+CtNnXABVhjRTokxwqHSavfJwXDg0/U6lghFkmU6lOBx5F1IW
	 sGOJJrHOBMoj8HujRSLeRZJF6NtKGrO+NFBOVZIY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 441Jr4uA122801
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 May 2024 14:53:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 1
 May 2024 14:53:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 1 May 2024 14:53:04 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 441Jr442128615;
	Wed, 1 May 2024 14:53:04 -0500
Message-ID: <f961021c-eaba-4aad-bce5-9f63c9571349@ti.com>
Date: Wed, 1 May 2024 14:53:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] conf: machine: am69-sk:
 Create a new am69.inc file
To: <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20240430195811.2512-1-reatmon@ti.com>
 <20240430204730.GQ28791@denix.org>
 <0befc90e-4107-4a27-90c8-09caa961cce7@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <0befc90e-4107-4a27-90c8-09caa961cce7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 441Jr5jf074879
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 May 2024 19:53:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17622

On 4/30/24 4:03 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 4/30/2024 3:47 PM, Denys Dmytriyenko wrote:
>> On Tue, Apr 30, 2024 at 02:58:11PM -0500, Ryan Eatmon via lists.yoctop=
roject.org wrote:
>>> Reusing the j784s4.inc file presents problems as the am69-sk platform
>>> does not support GP.=C2=A0 So copy the j784s4.inc to am69.inc and upd=
ate
>>> accordingly.
>>
>> Any chance to get this as a diff against j784s4.inc to simplify the re=
view?
>> Maybe by playing with -C and -M options?
>=20
> Here is the diff:
>=20
>  > diff meta-ti-bsp/conf/machine/include/am69.inc meta-ti-bsp/conf/mach=
ine/include/j784s4.inc
> 9c9,12
> < # Default tiboot3.bin on AM69 is for SR1.0 HS-FS
> ---
>  > # Default tiboot3.bin on J784S4 is for GP
>  > IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-gp-evm.bin"

Could we include j784s4.inc from am69.inc, should be some way to remove t=
hat one
item from IMAGE_BOOT_FILES (maybe?).

Andrew

>  >
>  > # Since default tiboot3.bin on J784S4 is for GP, add a version for S=
R1.0 HS-FS
> 12c15
> < # Since default tiboot3.bin on AM69 is for HS-FS, add a version for S=
R1.0 HS-SE
> ---
>  > # Since default tiboot3.bin on J784S4 is for GP, add a version for S=
R1.0 HS-SE
>=20
>=20
> Effectively removing a line and changing some of the comments.
>=20
>=20
>=20
>=20
>=20
>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> v2: Fix commit message.
>>>
>>> =C2=A0 meta-ti-bsp/conf/machine/am69-sk.conf=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 2 +-
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am69.inc | 19 +++++++++++++++=
++++
>>> =C2=A0 2 files changed, 20 insertions(+), 1 deletion(-)
>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/include/am69.inc
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf=
/machine/am69-sk.conf
>>> index 233a4618..6341a6fa 100644
>>> --- a/meta-ti-bsp/conf/machine/am69-sk.conf
>>> +++ b/meta-ti-bsp/conf/machine/am69-sk.conf
>>> @@ -2,7 +2,7 @@
>>> =C2=A0 #@NAME: AM69 SK
>>> =C2=A0 #@DESCRIPTION: Machine configuration for the TI AM69 SK
>>> -require conf/machine/include/j784s4.inc
>>> +require conf/machine/include/am69.inc
>>> =C2=A0 TFA_K3_USART =3D "0x8"
>>> =C2=A0 OPTEE_K3_USART =3D "0x8"
>>> diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/=
conf/machine/include/am69.inc
>>> new file mode 100644
>>> index 00000000..81be1397
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/conf/machine/include/am69.inc
>>> @@ -0,0 +1,19 @@
>>> +require conf/machine/include/k3.inc
>>> +SOC_FAMILY:append =3D ":j784s4"
>>> +
>>> +MACHINE_FEATURES +=3D "screen gpu"
>>> +
>>> +require conf/machine/include/mesa-pvr.inc
>>> +PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
>>> +
>>> +# Default tiboot3.bin on AM69 is for SR1.0 HS-FS
>>> +IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-fs-evm.bin"
>>> +
>>> +# Since default tiboot3.bin on AM69 is for HS-FS, add a version for =
SR1.0 HS-SE
>>> +IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-evm.bin"
>>> +
>>> +TFA_BOARD =3D "j784s4"
>>> +
>>> +OPTEEMACHINE =3D "k3-j784s4"
>>> +
>>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw cnm-wave-f=
w ti-eth-fw"
>>> --=20
>>> 2.17.1
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17616): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17616
> Mute This Topic: https://lists.yoctoproject.org/mt/105828549/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


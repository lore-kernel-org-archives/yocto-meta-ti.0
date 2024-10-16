Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6E0D2F7C8
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 21:35:30 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.35424.1729114521221524058
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 14:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=nT/Kle/Z;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49GLZHOY122079;
	Wed, 16 Oct 2024 16:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729114517;
	bh=OJrkvipXkq15XY1R29wyzO0TKZodpEXwk3836GURs38=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nT/Kle/ZEUvPto4nXoqUCCGtFo3pQTbRyiKFsO0sTyHeKOqHUDpJRH+DEo90AWAmm
	 L0CALyA2fjZ2NceZIVYeBFDIFeLag+9P+do0Z4QYvk/Nn/KTKajZOzLI0azvfQWptc
	 Sb0KgQGjzhYQ8HPhmHBfL0kacVfGlXlmR5c4VxRY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49GLZHn8042425;
	Wed, 16 Oct 2024 16:35:17 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Oct 2024 16:35:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Oct 2024 16:35:17 -0500
Received: from [10.249.35.83] ([10.249.35.83])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49GLZHpa039974;
	Wed, 16 Oct 2024 16:35:17 -0500
Message-ID: <37ac5b62-3fcd-49b8-9320-bd50acc4df51@ti.com>
Date: Wed, 16 Oct 2024 16:35:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] conf: machine: k3: use weak
 assignment for FIT image variables
To: Sergio Prado <sergio.prado@e-labworks.com>,
        <meta-ti@lists.yoctoproject.org>,
        Denys Dmytriyenko <denys@konsulko.com>
CC: <rogerio.borin@toradex.com>
References: <20241014202746.1818435-1-sergio.prado@e-labworks.com>
 <17FF06D0FF79DF51.9153@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17FF06D0FF79DF51.9153@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 49GLZHOY122079
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 16 Oct 2024 21:35:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18008



On 10/16/2024 2:51 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 10/14/2024 3:27 PM, Sergio Prado wrote:
>> Use weak assignment to make it possible to override the default
>> value via classes parsed after the machine configuration file.
>>
>> This is the case when using the tdxref-signed class from
>> meta-toradex-security to generated signed images for AM6X.
>>
>> Additionally, explicitly set FIT_SIGN_NUMBITS to 4096 to align with th=
e
>> default rsa4096 algorithm, preventing potential mismatches between the
>> signing algorithm and key length.
>>
>> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>> Signed-off-by: Rogerio Borin <rogerio.borin@toradex.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/include/k3.inc | 9 +++++----
>> =C2=A0 1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc=20
>> b/meta-ti-bsp/conf/machine/include/k3.inc
>> index a296f64fa141..07f0bcb48bfc 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -26,10 +26,11 @@ UBOOT_SUFFIX =3D "img"
>> =C2=A0 UBOOT_SIGN_ENABLE =3D "1"
>> =C2=A0 UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
>> -UBOOT_SIGN_KEYNAME ?=3D "custMpk"
>> -UBOOT_SIGN_KEYDIR ?=3D "${TI_SECURE_DEV_PKG}/keys"
>> -FIT_HASH_ALG ?=3D "sha512"
>> -FIT_SIGN_ALG ?=3D "rsa4096"
>> +UBOOT_SIGN_KEYNAME ??=3D "custMpk"
>> +UBOOT_SIGN_KEYDIR ??=3D "${TI_SECURE_DEV_PKG}/keys"
>> +FIT_HASH_ALG ??=3D "sha512"
>> +FIT_SIGN_ALG ??=3D "rsa4096"
>> +FIT_SIGN_NUMBITS ??=3D "4096"
>=20
> These changes appear to break the build flow.=C2=A0 Since the the only =
real=20
> change is the addition of FIT_SIGN_NUMBITS, I'm going to assume that is=
=20
> the culprit.
>=20
> Signature written to=20
> '<snip>/build/arago-tmp-default-glibc/work/am62axx_evm-oe-linux/u-boot-=
ti-staging/2024.04+git/build/fitImage-linux', node '/configurations/conf-=
ti_k3-v3link-imx219-0-2.dtbo/signature-1'
> Public key written to 'u-boot.dtb', node '/signature/key-custMpk'
> Signature check bad (error 1)
> Verifying Hash Integrity for node 'conf-ti_k3-am62a7-sk.dtb'...=20
> sha256,rsa2048:custMpk-
>  =C2=A0error!
> Verification failed for '(null)' hash node in 'conf-ti_k3-am62a7-sk.dtb=
'=20
> config node
> Failed to verify required signature 'key-custMpk'

I think the issue is that the weak assignment happens at the very end of=20
parsing if there no other value for the variable.  But the various=20
classes (kernel-fitimage.bbclass, uboot-sign.bbclass, etc...) set the=20
variables using the ?=3D so that means the values we want for our stuff=20
never gets set correctly.

I can see how this works for you in your case, but doing this in=20
meta-ti-bsp breaks everyone not using meta-tordex-security.

I'm not really sure the best solution for this.  Should the tordex layer=20
be in final control of these variables and not allow overrides?  Should=20
it not be using the ?=3D assignment and instead use the =3D assignment to=
=20
force the issue?

Denys,
Any ideas?



>=20
>=20
>> =C2=A0 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
>>
>>
>>
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18007): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/18007
> Mute This Topic: https://lists.yoctoproject.org/mt/109009846/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


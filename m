Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034F7E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 15:05:12 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.38893.1733497504164036258
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 07:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jkfYzQsl;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6F53Ke1926486
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Fri, 6 Dec 2024 09:05:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733497503;
	bh=4cNQUL+d0fWthc2gp9zc4WhZuoFDTH7CVW2TPWKJm+c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jkfYzQslIbWdL0gJwRf+TOkAfGOEZlsXjIogCcKmVYRBTZNrCnTs8hDVH3gg8p/hW
	 EUq03VY1Qi4hnLx+zUxxjUFVhuD39scC+F3OSv6zFZlkkiw0mHQoA7Syp/dfv6CJ7B
	 9/BortzI35k40FdICd++942wPp3rI9jVjw1GM0ow=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6F52qU018485
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 6 Dec 2024 09:05:03 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 09:05:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 09:05:01 -0600
Received: from [10.249.33.166] ([10.249.33.166])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6F51pY044831;
	Fri, 6 Dec 2024 09:05:01 -0600
Message-ID: <7f9f806c-0616-4bf2-a9f7-b972945a0bb9@ti.com>
Date: Fri, 6 Dec 2024 09:05:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] am62p: PRNG: Remove
 software PRNG
To: Chirag Shilwant <c-shilwant@ti.com>, Aashvij Shenai <a-shenai@ti.com>
CC: <praneeth@ti.com>, <kamlesh@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20241206053521.1126544-1-a-shenai@ti.com>
 <379643c3-612f-4da3-8f0b-2d8f68934079@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <379643c3-612f-4da3-8f0b-2d8f68934079@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 4B6F53Ke1926486
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Dec 2024 15:05:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18087



On 12/6/2024 8:56 AM, Chirag Shilwant wrote:
> Hi,
>=20
> Based on the convention, commit message title should be=20
> recipes-security: optee: Remove software PRNG in am62pxx

We don't usually require the "recipes-security" part.  As that makes the=20
message get really long.  But the recipe name base should be part of it.

For non-recipes we tend to like a portion of the directory that the file=20
being updated is in.  For example for a machine conf file:

conf: am62xx-evm: do something
classes: Update foo.class

etc...

But we do like to see something a bit more descriptive so that if we=20
search through the logs it is more apparent about what area your change=20
is being made.

If you are ever unclear on what to put there, just to git.ti.com,=20
navigate to the file you are changing, then look at the log changes for=20
that file and see the history of changes to that file and try to be=20
consistent.


> On 06/12/24 11:05, Aashvij Shenai wrote:
>> With the latest TIFS fix [1], AM62P is able to leverage the hardware-T=
RNG
>> instead of having to fallback into the software-PRNG.
>>
>> [1] - commit: 98de0a4290ec200cc224d4a5a6f42d2126230e2f ("ti-sysfw:
>> am65x/am64x/am62x/am62ax/am62px: update to version v10.01.08")
>>
>> Repo: https://git.ti.com/git/processor-firmware/ti-linux-firmware.git
>> Branch: ti-linux-firmware
>=20
>=20
>=20
> This entire story could just have been,
>=20
> [1]:=20
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=3D=
ti-linux-firmware&id=3D98de0a4290ec200cc224d4a5a6f42d2126230e2f
>=20
>=20
>=20
>>
>> Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
>> ---
>>
>> Changelog:
>> v1 -> v2:
>> =C2=A0=C2=A0 - Updated commit message to include fix and moved test lo=
gs
>>
>> Testlogs:=20
>> https://gist.github.com/AashvijShenai/9ea3e128ab29f703c2b6d988cfd0b82a
>>
>> ---
>>
>> =C2=A0 meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | =
2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> index 43b8ce1c..f131f1ff 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> @@ -6,7 +6,7 @@ EXTRA_OEMAKE:remove =3D "CFG_MAP_EXT_DT_SECURE=3Dy"
>> =C2=A0 EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+=20
>> d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>> =C2=A0 EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> -EXTRA_OEMAKE:append:am62pxx =3D " CFG_WITH_SOFTWARE_PRNG=3Dy=20
>> CFG_TEE_CORE_LOG_LEVEL=3D1"
>> +EXTRA_OEMAKE:append:am62pxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> =C2=A0 EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> =C2=A0 EXTRA_OEMAKE:append:j722s =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


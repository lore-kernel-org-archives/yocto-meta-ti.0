Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD9EC369DC
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 14:12:59 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.49386.1745849570233443070
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Apr 2025 07:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ffoS2K/j;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEClYA2813004
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 09:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745849567;
	bh=QnxcC6nEI34Vh2TCbtDVu55JEzusNMiHY7Et8J/pOLo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ffoS2K/jvWBlXeCExVxUZHQA6nV8JvgvuQo9QQVWf57xI5F6RCzSOAd/28wbINmr8
	 PKviObQ5RvR5ZmX5lk2/sfrVnYGq7M0yjbiNUfd9eUAPNmWkER85bc6GxC7d8n7Mjh
	 rB/UunrrzYiJbvkE8tqrTIdaoxZcL4P/TASHaaPw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEClWK009830
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 09:12:47 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 09:12:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 09:12:47 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SECk2V044328;
	Mon, 28 Apr 2025 09:12:46 -0500
Message-ID: <bc65b9cf-eb4c-40a7-824c-1bf05efecdd0@ti.com>
Date: Mon, 28 Apr 2025 09:12:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] recipes-bsp: u-boot: Fix
 PACKAGECONFIG[dm] arguments
To: Chirag Shilwant <c-shilwant@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Neha
	<n-francis@ti.com>
References: <20250425204857.3271868-1-c-shilwant@ti.com>
 <20250426160457.GN13634@denix.org>
 <cfa1de82-add1-4791-bcdb-573159af20b8@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <cfa1de82-add1-4791-bcdb-573159af20b8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 53SEClYA2813004
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Apr 2025 14:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18521

On 4/28/25 3:48 AM, Chirag Shilwant wrote:
>=20
> On 26/04/25 21:34, Denys Dmytriyenko wrote:
>> On Sat, Apr 26, 2025 at 02:18:57AM +0530, Chirag Shilwant wrote:
>>> * As observed in the u-boot makefile [0][1], the argument
>>> anticipated by u-boot binman is "TI_DM" instead of "DM".
>>> Hence, fix the same in meta-ti-bsp.
>> Was it always "TI_DM", or was it "DM" initially in TI U-boot and later=
 got
>> changed tp "TI_DM" in upstream?
>=20
>=20
> As per [0] which added the TI_DM support in U-Boot, I see it was always=
 TI_DM.
> So, it was [1] where we added it as DM under meta-ti-bsp improperly
>=20
> [0]: https://github.com/u-boot/u-boot/commit/23d2ef91efa40d525a4a555770=
4184bcfd64ca16
>=20
> [1]: https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-bs=
p/u-boot/u-boot-ti.inc?id=3Db21d29d94694ac49b97a1f4ba428c7d8cd6fb64a
>=20

The original commit adding the line was here in 2020:

https://git.yoctoproject.org/meta-ti/commit/?id=3D4df0f89bb237c26118bdb23=
9e2aef974333cca58

I almost remember some early version of U-Boot taking "DM" and it was cha=
nged to "TI_DM"
for upstream.

Either way it has been wrong for a long time and we have only been saved =
by BINMAN_INDIRS
just happening to have the default file inside. This will change soon, he=
nce needing this
fix now.

Andrew

> --=20
> Chirag
>=20
>=20
>>
>>
>>> * The behavior went unnoticed until now because "ti-dm"
>>> was still being sourced from BINMAN_INDIRS, which referred
>>> to "ti-linux-firmware" and the PACKAGECONFIG[dm] feature
>>> was redundant.
>>>
>>> [0]: https://github.com/u-boot/u-boot/blob/v2025.01/Makefile#L1408
>>>
>>> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/Makefile?h=3Dti=
-u-boot-2025.01#n1409
>>>
>>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-b=
sp/recipes-bsp/u-boot/u-boot-ti.inc
>>> index 9a74b840..e337f84f 100644
>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> @@ -63,7 +63,7 @@ PLAT_SFX:am62pxx =3D "am62pxx"
>>> =C2=A0 PACKAGECONFIG[ap-trusted-rom] =3D "BL1=3D${STAGING_DIR_HOST}/f=
irmware/bl1.bin,,trusted-firmware-a"
>>> =C2=A0 PACKAGECONFIG[atf] =3D "BL31=3D${STAGING_DIR_HOST}/firmware/bl=
31.bin,,trusted-firmware-a"
>>> =C2=A0 PACKAGECONFIG[optee] =3D "TEE=3D${STAGING_DIR_HOST}${nonarch_b=
ase_libdir}/firmware/bl32.bin,,optee-os"
>>> -PACKAGECONFIG[dm] =3D "DM=3D${STAGING_DIR_HOST}${nonarch_base_libdir=
}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
>>> +PACKAGECONFIG[dm] =3D "TI_DM=3D${STAGING_DIR_HOST}${nonarch_base_lib=
dir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
>>> =C2=A0 PACKAGECONFIG:append:aarch64 =3D " atf optee"
>>> =C2=A0 PACKAGECONFIG:append:j721e =3D " dm"
>>> --=20
>>> 2.34.1


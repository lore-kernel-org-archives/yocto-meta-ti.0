Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0B0CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 16:23:02 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.15669.1761322981352458024
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 09:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=RtpvkmGf;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59OGMwQs1923451;
	Fri, 24 Oct 2025 11:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761322978;
	bh=KdSxG7Dp9ppr4Ms+KcY3EGrM0WNKI6/HTZo60rwRTP0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RtpvkmGfxte4nYDpPuytf+scxkUVBTGDmISGUd7nKtPKtKahXqj8/z6sZJZsP//zf
	 w/y4PwdgmcE0obZdbHl7ICHy3XAJEmGrZEv5u/kJKuHUiW+YT4AYiU+zEFCppwkVTL
	 RFKlySKwySSgoGssRlpCx7uoJAnogo1yetF+RxdQ=
Received: from DLEE205.ent.ti.com (dlee205.ent.ti.com [157.170.170.85])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59OGMw0V3996302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 11:22:58 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 11:22:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 11:22:58 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59OGMwFf603397;
	Fri, 24 Oct 2025 11:22:58 -0500
Message-ID: <ca17b8ec-20e6-4b45-965a-f89c6f7d016d@ti.com>
Date: Fri, 24 Oct 2025 11:22:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-ti] [master][PATCH]
 packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20251023181013.25365-1-denis@denix.org>
 <20251023181525.3536647-1-prc@list.ti.com> <20251023201625.GA3125@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251023201625.GA3125@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 59OGMwQs1923451
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 16:23:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19178



On 10/23/2025 3:16 PM, Denys Dmytriyenko wrote:
> Hey, Ryan, Something is wrong with PRC.=E2=80=8A.=E2=80=8A. On Thu, Oct=
 23, 2025 at 01:=20
> =E2=80=8A15:=E2=80=8A25PM -0500, PRC Automation via lists.=E2=80=8Ayoct=
oproject.=E2=80=8Aorg wrote: >=20
> meta-ti / na / 20251023181013.=E2=80=8A25365-1-denis > > PRC Results: F=
AIL > >=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uJdqXRfP1k0bamYkP=
PNDnBRijNbc-tnZWIKmvuQwEU3-lCPVdNywd9Z3mgF2f24Zn2T7Or4b$>
> ZjQcmQRYFpfptBannerEnd
>=20
> Hey, Ryan,
>=20
> Something is wrong with PRC...
>=20
>=20
> On Thu, Oct 23, 2025 at 01:15:25PM -0500, PRC Automation via lists.yoct=
oproject.org wrote:
>> meta-ti / na / 20251023181013.25365-1-denis
>>=20
>> PRC Results: FAIL
>>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>   check-yocto-patches: PASS
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> Patches
>> ----------------------------------------
>> WARN - [master][PATCH] packagegroup-ti-core-initramfs: ensure TI_INITR=
AMFS_KERNEL_MODULES is set
>>     WARN: Commit message does not include file/recipe name: packagegro=
up-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set. (COMMIT-=
MESSAGE-2)
>=20
> Well, packagegroup-ti-core-initramfs is actually the name of the recipe.

Yeah, it's on my list to fix.  Hoping today I can knock off the small=20
things like this (and hooking up check-layers) into PRC.

>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>   check-yocto-repo: FAIL
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> master
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> FAIL
>>     WARN: You might need a " " as the first character for the :append.=
 (APPEND-2)
>>         meta-ti-bsp/conf/machine/include/am62axx.inc:15
>>             TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  =3D "kern=
el-module-tps6594-i2c"
>>    =20
>>     WARN: You might need a " " as the first character for the :append.=
 (APPEND-2)
>>         meta-ti-bsp/conf/machine/include/am62axx.inc:16
>>             TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  =3D "kernel-m=
odule-tps6594-i2c"
>=20
> This is not in my patch, but is a valid concern - need to correct it fo=
r
> am62axx.inc, while other machines appending to this variable already us=
e a
> leading space...

Just sent the patch that fixes this.


>>    =20
>>    =20
>>     Code Summary
>>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>    =20
>>     APPEND-2
>>     -------------------------------------------
>>       :append simply takes the specified string and concatenates it
>>       directly to the variable.  Most of the time we want there to spa=
ces
>>       between entries.  This check flags us to check if the missing sp=
ace
>>       is actually needed.
>>=20
>>=20
>>=20
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


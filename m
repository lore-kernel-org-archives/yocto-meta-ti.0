Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0E2C54E68
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 13:43:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.7821.1711028615339930332
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Mar 2024 06:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=kGGy566X;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42LDhYga078866;
	Thu, 21 Mar 2024 08:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711028614;
	bh=DadVmSdtlHeE3uPp2a5yurRA6+zNIz1QUkzLPcICoHo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kGGy566XOhE3Qduht7JrdHd79HPErUf1RpimgANBkIjp06ferlLC/PNWR1T+rhIvl
	 wxBO5xNaP1U08udozs2MeWMV2WmGlsR+QAiwPY+nAhTMxMUMVuPDE77Shxj8wC6K3d
	 g3tXJXSjGqEAj9VNrIvtn72JOZyk9fpaRTcC+6b8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42LDhYUl097677
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Mar 2024 08:43:34 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Mar 2024 08:43:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Mar 2024 08:43:33 -0500
Received: from [10.249.33.218] ([10.249.33.218])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42LDgNvm060882;
	Thu, 21 Mar 2024 08:43:33 -0500
Message-ID: <1cbc062e-4c18-4a75-9983-e2a568aae94d@ti.com>
Date: Thu, 21 Mar 2024 08:43:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][scarthgap][PATCH] README: update with
 scarthgap specific info
Content-Language: en-US
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri <praneeth@ti.com>
References: <20240320200539.24116-1-reatmon@ti.com>
 <55c50dc9-1b6f-4d55-a2d5-713ed10a2219@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <55c50dc9-1b6f-4d55-a2d5-713ed10a2219@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 42LDhYga078866
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Mar 2024 13:43:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17545



On 3/20/2024 11:29 PM, Chirag Shilwant wrote:
>=20
> On 21/03/24 01:35, Ryan Eatmon via lists.yoctoproject.org wrote:
>> All READMEs were still mentioning master, update that. Signed-off-by:=20
>> Ryan Eatmon <reatmon@=E2=80=8Ati.=E2=80=8Acom> --- meta-ti-bsp/README =
| 4 ++--=20
>> meta-ti-extras/README | 6 +++--- 2 files changed, 5 insertions(+), 5=20
>> deletions(-) diff --git a/meta-ti-bsp/README
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source=
=20
>> of this email and know the content is safe.
>> ZjQcmQRYFpfptBannerEnd
>> All READMEs were still mentioning master, update that.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/README=C2=A0=C2=A0=C2=A0 | 4 ++--
>> =C2=A0 meta-ti-extras/README | 6 +++---
>> =C2=A0 2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README
>> index c5780531..70c40d4e 100644
>> --- a/meta-ti-bsp/README
>> +++ b/meta-ti-bsp/README
>> @@ -8,11 +8,11 @@ This layer depends on:
>> =C2=A0 URI: git://git.openembedded.org/openembedded-core
>> =C2=A0 layers: meta
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 URI: git://git.yoctoproject.org/meta-arm
>> =C2=A0 layers: meta-arm
>> -branch: master
>> +branch: scarthgap
>=20
>=20
> meta-arm:scratchgap is yet to be created -=20
> https://git.yoctoproject.org/meta-arm/log/?h=3Dscratchgap
> Maybe they are waiting for April to start :) -=20
> https://wiki.yoctoproject.org/wiki/Releases

Yes.  I'm just staging the commits so we can roll them out when ready=20
and so other folks don't feel the need to send patches that are already=20
in the queue.


>=20
>> =C2=A0 The base BSP part of meta-ti should work with different=20
>> OpenEmbedded/Yocto
>> diff --git a/meta-ti-extras/README b/meta-ti-extras/README
>> index 1b38921a..c6c058e0 100644
>> --- a/meta-ti-extras/README
>> +++ b/meta-ti-extras/README
>> @@ -8,14 +8,14 @@ This layer depends on:
>> =C2=A0 URI: git://git.openembedded.org/openembedded-core
>> =C2=A0 layers: meta
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 URI: git://git.yoctoproject.org/meta-arm
>> =C2=A0 layers: meta-arm
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 URI: git://git.yoctoproject.org/meta-ti
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-ti-bsp
>> --=20
>> 2.17.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17541):=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/m=
essage/17541__;!!G3vK!TLlNUd7I6GKmFoyFWQDpjEqfq0fdzq1haDDMGHUgFqHg-8wP1gx=
07t-gHXmZU56vssHGAhZx0SkT5-u3Wqr82qAQ799Alq8lSQ$
>> Mute This Topic:=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/10505243=
6/7030289__;!!G3vK!TLlNUd7I6GKmFoyFWQDpjEqfq0fdzq1haDDMGHUgFqHg-8wP1gx07t=
-gHXmZU56vssHGAhZx0SkT5-u3Wqr82qAQ79_YXsJPEA$
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe:=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/u=
nsub__;!!G3vK!TLlNUd7I6GKmFoyFWQDpjEqfq0fdzq1haDDMGHUgFqHg-8wP1gx07t-gHXm=
ZU56vssHGAhZx0SkT5-u3Wqr82qAQ79_lwXlpkg$=C2=A0 [c-shilwant@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


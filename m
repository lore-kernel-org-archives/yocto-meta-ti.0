Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0E8CDE022
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 16:24:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.48170.1727367896836415346
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 09:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=hJHRpLJR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48QGOoep064930;
	Thu, 26 Sep 2024 11:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727367890;
	bh=Z8nItZ+iVoS26QpH/FM9S8i7WIWx1I3/6gbywZGpA0U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hJHRpLJR/HtRJxOavmylQTZgz6PVDh5o4uQ47U0sZA04D+dEeN+/vQUHZ8QM1CNKq
	 4dz9Jl3qe2Jqa1UATbczJZiMbnlIOrrnaGhVnqGhG1p1rzwj+XcfyC3QOZGqsQK2OD
	 yUtfPZg7yC3TCkYTWtu0+ahDvnXCjCqy+Ldiv06o=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48QGOoeM073177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Sep 2024 11:24:50 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Sep 2024 11:24:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Sep 2024 11:24:50 -0500
Received: from [10.249.33.150] ([10.249.33.150])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48QGOnqZ076868;
	Thu, 26 Sep 2024 11:24:50 -0500
Message-ID: <aec8f2de-a49a-49ea-84f9-6c498535c3d5@ti.com>
Date: Thu, 26 Sep 2024 11:24:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] wic task unsuccessful finish in scarthgap branch
To: <c-shilwant@ti.com>, albrod <alberto.rodriguez3153@ctag.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        Gyan
 Gupta <g-gupta@ti.com>
References: <PAVPR10MB68407CC451C6CC143D5C95EC826A2@PAVPR10MB6840.EURPRD10.PROD.OUTLOOK.COM>
 <PAVPR10MB684097FB3D33B6731D878E55826A2@PAVPR10MB6840.EURPRD10.PROD.OUTLOOK.COM>
 <92989d8e-6afb-41e4-89dc-b006c6bc679a@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <92989d8e-6afb-41e4-89dc-b006c6bc679a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 48QGOoep064930
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Sep 2024 16:24:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17974



On 9/26/2024 5:03 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
> Hi,
>=20
> On 26/09/24 14:30, albrod wrote:
>> Hello, Any wic task is unsuccessfully finishing in scarthgap branch.=20
>> For example, for a beaglebone machine: It is happening because he=20
>> IMAGE_BOOT_FILES is unset since commit https:=E2=80=8A//git.=E2=80=8Ay=
octoproject.=20
>> =E2=80=8Aorg/meta-ti/commit/?h=3Dscarthgap&id=3Dcada5eb9a6e69e5548024d=
930945834c2ffc6ab2
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source=
=20
>> of this email and know the content is safe.
>> Report=C2=A0Suspicious
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!trdmEztDei07Jagk=
_dMD3Ra-DOTdzmfNUWkSROwDe8r6g5krh9nVNrrOzxmyDMI2N_HAEJhtwLVnQQ6j3pcS-3UyM=
zzeaXnM3vzzVzMzeRyHf0JsnnkpXtrX0gY7XMRhYtP5VIeiIw$>
>> ZjQcmQRYFpfptBannerEnd
>>
>> Hello,
>>
>> Any wic task is unsuccessfully finishing in scarthgap branch. For=20
>> example, for a beaglebone machine:
>>
>> It is happening because he IMAGE_BOOT_FILES is unset since commit=20
>> https://git.yoctoproject.org/meta-ti/commit/?h=3Dscarthgap&id=3Dcada5e=
b9a6e69e5548024d930945834c2ffc6ab2 <https://urldefense.com/v3/__https://g=
it.yoctoproject.org/meta-ti/commit/?h=3Dscarthgap&id=3Dcada5eb9a6e69e5548=
024d930945834c2ffc6ab2__;!!G3vK!SlFTjmdveO2FpZ35Me6gmVNYI8elyZdStcmKBtXj1=
x9TJvyEXZHdAwVlwRZBK0cOPAEnCZw1pCsGwizhfcYFJ3uN$>
>>
>=20
>=20
> The above commit is reverted & present in scarthgap-next branch [1]
> The commit will move to scarthgap after a successful cicd promotion
>=20
> [1]:=20
> https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=3Dscarthgap-nex=
t&id=3D07edb3156e9a4b0cf54951eb58357934b3977046
>=20

Thanks for pointing this out.  I have pushed the reverts onto scarthgap.=20
  Update and try it again.


>=20
>=20
>> And the poky script for building any wic file is trying to match it:=20
>> https://github.com/yoctoproject/poky/blob/scarthgap/scripts/lib/wic/pl=
ugins/source/bootimg-partition.py <https://urldefense.com/v3/__https://gi=
thub.com/yoctoproject/poky/blob/scarthgap/scripts/lib/wic/plugins/source/=
bootimg-partition.py__;!!G3vK!SlFTjmdveO2FpZ35Me6gmVNYI8elyZdStcmKBtXj1x9=
TJvyEXZHdAwVlwRZBK0cOPAEnCZw1pCsGwizhfVa7zhYx$>
>>
>> Thank you so much.
>>
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17972): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17972
> Mute This Topic: https://lists.yoctoproject.org/mt/108664212/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


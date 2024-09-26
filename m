Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB13FCCF9E9
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 10:03:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.39304.1727345027940943299
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 03:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=tUXXj9pJ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48QA3hxJ092547;
	Thu, 26 Sep 2024 05:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727345023;
	bh=S5h6C0t1m5XColxIJCGJ/u2IBWDUNNqoz0+kpqIOf1s=;
	h=Date:Subject:To:References:From:CC:In-Reply-To;
	b=tUXXj9pJWXLF4xphScvIqUcQx7S6sIdgVZFiykdXTRH9hfIaUhmgfBeMOWAXH8gti
	 9qKEdp+B0oM8hcw3piYiTidtq2cUDEHqgCO2BQcxA3OUmjq98A6q0avehF8pIfM/jb
	 C3xKbp4yCmj3Ua4e4oHLdBpPXzZNR4PzReiXX3dU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48QA3hN0004639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Sep 2024 05:03:43 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Sep 2024 05:03:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Sep 2024 05:03:43 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48QA3fG0050338;
	Thu, 26 Sep 2024 05:03:42 -0500
Message-ID: <92989d8e-6afb-41e4-89dc-b006c6bc679a@ti.com>
Date: Thu, 26 Sep 2024 15:33:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] wic task unsuccessful finish in scarthgap
 branch
To: albrod <alberto.rodriguez3153@ctag.com>
References: <PAVPR10MB68407CC451C6CC143D5C95EC826A2@PAVPR10MB6840.EURPRD10.PROD.OUTLOOK.COM>
 <PAVPR10MB684097FB3D33B6731D878E55826A2@PAVPR10MB6840.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        Gyan
 Gupta <g-gupta@ti.com>
In-Reply-To: <PAVPR10MB684097FB3D33B6731D878E55826A2@PAVPR10MB6840.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 48QA3hxJ092547
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Sep 2024 10:03:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17972

Hi,

On 26/09/24 14:30, albrod wrote:
> Hello, Any wic task is unsuccessfully finishing in scarthgap branch.=20
> For example, for a beaglebone machine: It is happening because he=20
> IMAGE_BOOT_FILES is unset since commit=20
> https:=E2=80=8A//git.=E2=80=8Ayoctoproject.=E2=80=8Aorg/meta-ti/commit/=
?h=3Dscarthgap&id=3Dcada5eb9a6e69e5548024d930945834c2ffc6ab2
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!trdmEztDei07Jagk_=
dMD3Ra-DOTdzmfNUWkSROwDe8r6g5krh9nVNrrOzxmyDMI2N_HAEJhtwLVnQQ6j3pcS-3UyMz=
zeaXnM3vzzVzMzeRyHf0JsnnkpXtrX0gY7XMRhYtP5VIeiIw$>=20
>
> ZjQcmQRYFpfptBannerEnd
>
> Hello,
>
> Any wic task is unsuccessfully finishing in scarthgap branch. For=20
> example, for a beaglebone machine:
>
> It is happening because he IMAGE_BOOT_FILES is unset since commit=20
> https://git.yoctoproject.org/meta-ti/commit/?h=3Dscarthgap&id=3Dcada5eb=
9a6e69e5548024d930945834c2ffc6ab2=20
> <https://urldefense.com/v3/__https://git.yoctoproject.org/meta-ti/commi=
t/?h=3Dscarthgap&id=3Dcada5eb9a6e69e5548024d930945834c2ffc6ab2__;!!G3vK!S=
lFTjmdveO2FpZ35Me6gmVNYI8elyZdStcmKBtXj1x9TJvyEXZHdAwVlwRZBK0cOPAEnCZw1pC=
sGwizhfcYFJ3uN$>
>


The above commit is reverted & present in scarthgap-next branch [1]
The commit will move to scarthgap after a successful cicd promotion

[1]:=20
https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=3Dscarthgap-next&=
id=3D07edb3156e9a4b0cf54951eb58357934b3977046

---
Chirag



> And the poky script for building any wic file is trying to match it:=20
> https://github.com/yoctoproject/poky/blob/scarthgap/scripts/lib/wic/plu=
gins/source/bootimg-partition.py=20
> <https://urldefense.com/v3/__https://github.com/yoctoproject/poky/blob/=
scarthgap/scripts/lib/wic/plugins/source/bootimg-partition.py__;!!G3vK!Sl=
FTjmdveO2FpZ35Me6gmVNYI8elyZdStcmKBtXj1x9TJvyEXZHdAwVlwRZBK0cOPAEnCZw1pCs=
GwizhfVa7zhYx$>
>
> Thank you so much.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17971): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17971__;!!G3vK!SlFTjmdveO2FpZ35Me6gmVNY=
I8elyZdStcmKBtXj1x9TJvyEXZHdAwVlwRZBK0cOPAEnCZw1pCsGwizhfZOAhLlH$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/108664212/7030289__;!!G3vK!SlFTjmdveO2FpZ35Me6gmVNYI8elyZdStcmKBt=
Xj1x9TJvyEXZHdAwVlwRZBK0cOPAEnCZw1pCsGwizhfWqi1krD$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!SlFTjmdveO2FpZ35Me6gmVNYI8elyZdStcmKBtXj1x9TJvy=
EXZHdAwVlwRZBK0cOPAEnCZw1pCsGwizhfSjJkATC$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


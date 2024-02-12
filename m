Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE601C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 11:43:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4728.1707738234517760218
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 03:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=hbyxg8YB;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CBhrYu110719
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 05:43:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707738233;
	bh=UgQ+dsn5v3KSaf+gQnXlbhYTJGx+bUWiROa/I4FTaB4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hbyxg8YBYUlLhY8UmbVn2XelC6A0mXeKTKoe98EgFOxGR7g6JEbKhfyEgyT2YdTXN
	 gCuVObQvrUPeuut42VLcNivtZb8gmDFnEyh0EVqxWNR9kSUpDH8zA3XHwLCF0Et8dc
	 oWnGSRtrxbYDafGVMsy1YZjeMdfxbgRacvx6E2AE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CBhrAh005404
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 05:43:53 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 05:43:53 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 05:43:53 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CBhorq059804;
	Mon, 12 Feb 2024 05:43:51 -0600
Message-ID: <495c7164-61a7-40b3-a1bf-c6c31561ed0c@ti.com>
Date: Mon, 12 Feb 2024 17:13:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][kirkstone][PATCH 0/2] ATF/OP-TEE Upgrade
Content-Language: en-US
To: <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon
	<reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Udit Kumar <u-kumar1@ti.com>
References: <20240212103737.4161809-1-m-chawdhry@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240212103737.4161809-1-m-chawdhry@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 41CBhrYu110719
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 11:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17472

Hi Manorit,

On 12/02/24 16:07, Manorit Chawdhry via lists.yoctoproject.org wrote:
> Forgot the prefixes last time so sending it again. Manorit Chawdhry=20
> (2): meta-ti-bsp: optee: Upgrade to 4.=E2=80=8A1 meta-ti-bsp:=20
> trusted-firmware-arm: Update to master=20
> ..=E2=80=8A.=E2=80=8A/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-ti.=E2=80=8Ainc | 4=20
> ++-- ..=E2=80=8A.=E2=80=8A/recipes-security/optee/optee-client-ti-versi=
on.=E2=80=8Ainc
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> Forgot the prefixes last time so sending it again.

Next time ensure that the commit message title clearly mentions it as v2.
This helps in discarding previous patch versions.

Thanks,
Chirag

>
> Manorit Chawdhry (2):
>    meta-ti-bsp: optee: Upgrade to 4.1
>    meta-ti-bsp: trusted-firmware-arm: Update to master
>
>   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 4 ++-=
-
>   .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++-=
-
>   meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++-=
-
>   meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++-=
-
>   4 files changed, 8 insertions(+), 8 deletions(-)
>
> --=20
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17469): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17469__;!!G3vK!Slr2xISVuwrD6gpWIXvYryFk=
zMsV9lPKRDMOqdVmo5zLs39cVfQ-ab9mgdEiWKuLDOABEqNUWnWfnb8J5tSG_UB-jkdB8FI_s=
cFo$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/104309030/7030289__;!!G3vK!Slr2xISVuwrD6gpWIXvYryFkzMsV9lPKRDMOqd=
Vmo5zLs39cVfQ-ab9mgdEiWKuLDOABEqNUWnWfnb8J5tSG_UB-jkdB8GXlaHWQ$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!Slr2xISVuwrD6gpWIXvYryFkzMsV9lPKRDMOqdVmo5zLs39=
cVfQ-ab9mgdEiWKuLDOABEqNUWnWfnb8J5tSG_UB-jkdB8HP2jYQc$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0520C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 12:30:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.61413.1710160215893243398
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 05:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=askxm1Px;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42BCUEWx046071;
	Mon, 11 Mar 2024 07:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710160214;
	bh=NwnnFu3qaL6XeerkbBRyoPRk1kV2vWHvTw9//NFBdPc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=askxm1Px+BJ5SEZZf/I4L1z0/Ump6aRVM2p7/W8lLKRe/hvahHzXAssNAhyu6GrVE
	 oVY9kG0KYWMTqMUcAxXwbvEHN6rn8yd9OOaDLepX5v+EHePaKMLfLgdLt0hyeI/7yW
	 e1XKOoWa9P1CdYjmIRCzssCDOkYaMHpwCVJ/ex8g=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42BCUEjL081037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Mar 2024 07:30:14 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Mar 2024 07:30:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Mar 2024 07:30:13 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42BCUBG2007746;
	Mon, 11 Mar 2024 07:30:12 -0500
Message-ID: <a558f2f7-f1e9-4422-ac1a-7504fefe1da9@ti.com>
Date: Mon, 11 Mar 2024 18:00:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [PATCH] export ov10635 camera device tree
 overlay
Content-Language: en-US
To: <meta-ti@lists.yoctoproject.org>
CC: <sbellary@baylibre.com>, <sinthu.raja@mistralsolutions.com>,
        <reatmon@ti.com>, <u-kumar1@ti.com>
References: <20240311111359.1556157-1-u-kumar1@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240311111359.1556157-1-u-kumar1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 42BCUEWx046071
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Mar 2024 12:30:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17506

Hi,

Let's ensure we follow the subject prefix format.
Target branch seems missing in subject.
FYR, the format is -=20
[meta-ti][list-of-branches-separated-by-slash][PATCH] title.

Regards,
Chirag
On 11/03/24 16:44, Udit Kumar via lists.yoctoproject.org wrote:
> Adding ov10635 camera overlay in default build Signed-off-by: Udit=20
> Kumar <u-kumar1@=E2=80=8Ati.=E2=80=8Acom> ---=20
> meta-ti-bsp/conf/machine/am57xx-evm.=E2=80=8Aconf | 1 + 1 file changed,=
 1=20
> insertion(+) diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.=E2=80=8A=
conf=20
> b/meta-ti-bsp/conf/machine/am57xx-evm.=E2=80=8Aconf
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> Adding ov10635 camera overlay in default build
>
>
> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am57xx-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/con=
f/machine/am57xx-evm.conf
> index 43a6a833..9a06e801 100644
> --- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
> @@ -29,6 +29,7 @@ KERNEL_DEVICETREE =3D " \
>       am57xx-beagle-x15-revc.dtb \
>       am5729-beagleboneai.dtb \
>       am571x-idk.dtb \
> +    ov10635.dtbo \
>       am572x-idk.dtb \
>       am574x-idk.dtb \
>   "
> --=20
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17505): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17505__;!!G3vK!TADdqMpn2H5YJ-b59xsqjJuI=
el2SjGihTSatWzdgi2cIolJLVgzxURY9OBbPxyLLX05uu4SgMUsQEbYY8DdTwTWIPXQD9qpXi=
fw$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/104860956/7030289__;!!G3vK!TADdqMpn2H5YJ-b59xsqjJuIel2SjGihTSatWz=
dgi2cIolJLVgzxURY9OBbPxyLLX05uu4SgMUsQEbYY8DdTwTWIPXQDmKciEdE$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!TADdqMpn2H5YJ-b59xsqjJuIel2SjGihTSatWzdgi2cIolJ=
LVgzxURY9OBbPxyLLX05uu4SgMUsQEbYY8DdTwTWIPXQDRlUJJP4$  [c-shilwant@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EEFD44D57
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 12:04:26 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.44315.1730894660814578307
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 04:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=qExpExiO;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A6C4Grh064941;
	Wed, 6 Nov 2024 06:04:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730894656;
	bh=I/b6qx386vCeGUmrJSSQletH56iYWza4/qP4q+ldKJ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qExpExiOSoFKJOUbaOutEXkvV+7V1IX71nMywO7z0+P35SSjS7Zwz+qe5xATBJvC+
	 2zBgvbnCZkIyotnukvHtJPUJS635FzUGmsWZVBCw7mDzcwC8BHPqzHsNzmIizEz7yy
	 N4xy+3fFwY0xDLWZi0vu13dxOHFkD4si8dEVTNCU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A6C4GMt029505
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 06:04:16 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 06:04:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 06:04:16 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6C4EUE115307;
	Wed, 6 Nov 2024 06:04:15 -0600
Message-ID: <668a0af2-7aa8-4336-bdce-3c82d3b0fd87@ti.com>
Date: Wed, 6 Nov 2024 17:34:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][RFC PATCH 1/6] conf/machine: rename beagleplay
 machine to beagleplay-ti
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20241105191100.532413-1-denis@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20241105191100.532413-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 4A6C4Grh064941
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Nov 2024 12:04:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18049

Hi Denys,

On 06/11/24 00:40, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom> BeaglePl=
ay is=20
> officially supported by TI "ti-6_6" BSP and is part of the TI-SDK=20
> releases. Switching BSP to BeagleBoard.=E2=80=8Aorg "bb_org" settings f=
or the=20
> same machine is possible within the same
> ZjQcmQRYFpfptBannerStart
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uZdqXRfP9k07KqZFH=
POj3DFYN5-MCGhQRn4XVQxYA21XJhOdaXkP5hLhMcH5N1PhQXx_-P68NVrtl3ufBrA_ew$>=20
>
> ZjQcmQRYFpfptBannerEnd
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> BeaglePlay is officially supported by TI "ti-6_6" BSP and is part
> of the TI-SDK releases. Switching BSP to BeagleBoard.org "bb_org"
> settings for the same machine is possible within the same layer.
>
> But having different machine configs for the same machine name in
> multiple layers can be confusing and prone to errors. Hence rename
> the config to indicate BeaglePlay with official TI support in order
> to re-use the canonical name in a separate layer.



Apart from [1], in general the entire series looks good to me!


[1]- https://lists.yoctoproject.org/g/meta-ti/message/18047



>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---



Reviewed-by: Chirag Shilwant <c-shilwant@ti.com>



>   .../machine/{beagleplay-k3r5.conf =3D> beagleplay-ti-k3r5.conf}     |=
 0
>   meta-ti-bsp/conf/machine/{beagleplay.conf =3D> beagleplay-ti.conf}  |=
 0
>   2 files changed, 0 insertions(+), 0 deletions(-)
>   rename meta-ti-bsp/conf/machine/{beagleplay-k3r5.conf =3D> beagleplay=
-ti-k3r5.conf} (100%)
>   rename meta-ti-bsp/conf/machine/{beagleplay.conf =3D> beagleplay-ti.c=
onf} (100%)
>
> diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bs=
p/conf/machine/beagleplay-ti-k3r5.conf
> similarity index 100%
> rename from meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
> rename to meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/con=
f/machine/beagleplay-ti.conf
> similarity index 100%
> rename from meta-ti-bsp/conf/machine/beagleplay.conf
> rename to meta-ti-bsp/conf/machine/beagleplay-ti.conf
> --=20
> 2.25.1


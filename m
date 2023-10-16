Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018BECDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 14:53:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.127940.1697468003396338350
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 07:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=c6cO7KbG;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39GErMiZ008250
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 09:53:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697468002;
	bh=QXP19KJKg9jDObFHVRpv/V04h7XQfJEx0Vwpj/U2zjg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c6cO7KbG4z6pX/kf5PgA+rW00eo8uTSUl1s6rq5XnnzhCdnoQUDZchahyR2IIhdbv
	 nmTG93P3t9N+GIVlgTzr1NvRTG8DEmEtXsaSrZ6HGMiPFLWC1cv+utYh5G8OkCRCkn
	 NPWfmv5pyscsxZxw/NTF2SIbl8DGFizvCYrIX1Jk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39GErMh3079033
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 09:53:22 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 09:53:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 09:53:22 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39GErM9N041939;
	Mon, 16 Oct 2023 09:53:22 -0500
Message-ID: <88612cdf-f452-42c2-9493-49bc05266fe2@ti.com>
Date: Mon, 16 Oct 2023 09:53:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 0/2] ti-eth-fw: Fix
 softlinks and lower the priority
Content-Language: en-US
To: <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <minas@ti.com>, <s-vadapalli@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
References: <178E9D8E4A4C671F.14388@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <178E9D8E4A4C671F.14388@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 39GErMiZ008250
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:53:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17120


Turns out Patchwork just sucks...  It is still not grouping these=20
patches into a series.  I'll manually apply them in the correct order.


On 10/16/2023 9:42 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> I am resending these because patchwork seems to have gotten confused=20
> with the series and the first patch is missing.
>=20
>=20
>=20
>=20
> Fix the softlinks for j784s4... Use main-r5f0_0 instead of mcu-r5f0_0
> Reduce priority of ti-eth-fw to update the softlinks to point to ti-ipc
> firmware binaries instead.
>=20
> Aniket Limaye (2):
>  =C2=A0 ti-eth-fw: Fix firmware alternative names for j784s4
>  =C2=A0 ti-eth-fw: Reduce priority for softlinks to 5.
>=20
> ---
> v1:
>  =C2=A0=C2=A0 https://lists.yoctoproject.org/g/meta-ti/message/17093
>  =C2=A0=C2=A0 https://lists.yoctoproject.org/g/meta-ti/message/17094
>=20
> Changes since v1:
>  =C2=A0=C2=A0 Do not remove eth-fw entirely. Just update defaults for s=
oftlinks
>=20
>  =C2=A0meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb | 14 +++++++-----=
--
>  =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17117): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17117
> Mute This Topic: https://lists.yoctoproject.org/mt/101996945/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/65=
51054/1815494134/xyzzy [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF01C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 23:10:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.854.1685488224468592954
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 16:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=fp+INYcF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UNAKDo007123;
	Tue, 30 May 2023 18:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685488220;
	bh=9rA5QNdJwNhUwX2gvj96D11i6uv6y3+jA2N7F4CdREI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fp+INYcFYTdRjI66tNcoH4Ix8+AyozjhFiXm1j948gxhHEErg7GqPaBlUB97IKso5
	 lomCVkIiCUqBD91B+dqoemuCm+WuF469lLMXsiREhz089Faw/iJpppzdD3SggTlkv4
	 B3+81PMNhllQQjWbQFeu85Vy7KpIInSHpO2JIt20=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UNAKdA043376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 18:10:20 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 18:10:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 18:10:19 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UNAJtY068351;
	Tue, 30 May 2023 18:10:19 -0500
Message-ID: <1f56b461-ad49-170c-cbe6-d9144223a8dd@ti.com>
Date: Tue, 30 May 2023 18:10:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-ti][master/kirkstone][PATCHv2 1/2] libgles: rename subdir
 to powervr-umlibs
Content-Language: en-US, en-US-large
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230530215827.3737116-1-rs@ti.com>
 <20230530215827.3737116-2-rs@ti.com>
 <7c873461-373d-df58-dba3-3aa15bd3059b@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <7c873461-373d-df58-dba3-3aa15bd3059b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 34UNAKDo007123
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 23:10:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16643

On 5/30/23 17:01, Andrew Davis wrote:
> On 5/30/23 4:58 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Move recipes to new subdir since we offer more than just libgles now.
>> Reusing the naming convention of the subdirectory used for the km
>> components for now.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>> =C2=A0 .../ti-img-rogue-umlibs_23.1.6404501.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> =C2=A0 .../{libgles =3D> powervr-umlibs}/ti-sgx-ddk-um/pvrsrvkm.rules=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> =C2=A0 .../{libgles =3D> powervr-umlibs}/ti-sgx-ddk-um_1.17.4948957.bb=
=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> =C2=A0 3 files changed, 0 insertions(+), 0 deletions(-)
>> =C2=A0 rename meta-ti-bsp/recipes-graphics/{libgles =3D>=20
>> powervr-umlibs}/ti-img-rogue-umlibs_23.1.6404501.bb (100%)
>> =C2=A0 rename meta-ti-bsp/recipes-graphics/{libgles =3D>=20
>> powervr-umlibs}/ti-sgx-ddk-um/pvrsrvkm.rules (100%)
>> =C2=A0 rename meta-ti-bsp/recipes-graphics/{libgles =3D>=20
>> powervr-umlibs}/ti-sgx-ddk-um_1.17.4948957.bb (100%)
>=20
> But these are not "powervr" cores anymore :) Oh well, better
> than "libgles"..
>=20
> Acked-by: Andrew Davis <afd@ti.com>

I mean, technically they still are considered part of the PowerVR=20
series: https://en.wikipedia.org/wiki/PowerVR#Series5_(SGX)

IMG still refers to their cross core SDK as the PowerVR SDK, the DDK to=20
build the UM components for SGX and rogue is still referred to as the=20
PowerVR Graphics DDK, and the kernel module still say pvr, so it's not=20
like this is a dead name.

Plus we can remind people of its legacy for the anniversary of GPU June:=20
https://youtu.be/XmcZsQXOKEA

:)

>=20
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.640450=
1.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23=
.1.6404501.bb
>> similarity index 100%
>> rename from=20
>> meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.=
bb
>> rename to=20
>> meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6=
404501.bb
>> diff --git=20
>> a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules=20
>> b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.r=
ules
>> similarity index 100%
>> rename from=20
>> meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
>> rename to=20
>> meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rul=
es
>> diff --git=20
>> a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb=20
>> b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.49489=
57.bb
>> similarity index 100%
>> rename from=20
>> meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> rename to=20
>> meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957=
.bb



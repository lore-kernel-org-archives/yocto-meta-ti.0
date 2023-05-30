Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF79C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 16:38:18 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2180.1685464688869355461
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 09:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=R9J8A8Ec;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UGc4X2075113;
	Tue, 30 May 2023 11:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685464684;
	bh=ONOVxg2WRoyKohbu6oK++OWAn2aTH/tMbnv7gY3k4G0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=R9J8A8Ecu4+lpZlpRTQ9KT2KgvMT5Vh965AjaEdf1Jzzjg+tYv0JNbgcGdbovcitB
	 tTAdleHunAnW60sdcfVZYby5QJUXvlzrmIPfbEH8+pur/ojfPIQq32GvyeztGwxI42
	 G6W/J5zNje50DbJJAsgjJ7Fof5SFEkP0RfZuZTVY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UGc4vq004365
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 11:38:04 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 11:38:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 11:38:04 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UGc4SM015797;
	Tue, 30 May 2023 11:38:04 -0500
Message-ID: <2cbefdef-f4a7-ad47-7533-7296f81d4d24@ti.com>
Date: Tue, 30 May 2023 11:38:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] ti-img-rouge-umlibs: move
 to new subdir
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230527015837.231817-1-rs@ti.com>
 <20230527015837.231817-2-rs@ti.com>
 <fefc4b3d-9ffa-c9b8-ad87-97fa9ef8edde@ti.com>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <fefc4b3d-9ffa-c9b8-ad87-97fa9ef8edde@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 34UGc4X2075113
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 16:38:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16625

On 5/30/23 10:51, Andrew Davis wrote:
> On 5/26/23 8:58 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Move recipe to new rogue subdir since we offer more than just libgles
>> now.
>>
>=20
> I did something like this as part of:=20
> https://lists.yoctoproject.org/g/meta-ti/message/16381
>=20
> ti-img-gpu-umlibs as the name feels more consistent to me.
>=20
> Andrew
>=20

Yeah, but even if it is more consistent, the current name matches the=20
git repo on git.ti.com. Unless I'm given explicit permission to rename=20
that I'd prefer those to match as opposed to introducing our own naming=20
convention for everything. We aren't marketing after all :)

>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>> =C2=A0 .../{libgles =3D> rogue}/ti-img-rogue-umlibs_23.1.6404501.bb=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> =C2=A0 1 file changed, 0 insertions(+), 0 deletions(-)
>> =C2=A0 rename meta-ti-bsp/recipes-graphics/{libgles =3D>=20
>> rogue}/ti-img-rogue-umlibs_23.1.6404501.bb (100%)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.640450=
1.bb b/meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1.640450=
1.bb
>> similarity index 100%
>> rename from=20
>> meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.=
bb
>> rename to=20
>> meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1.6404501.bb
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16615):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/16615
>> Mute This Topic: https://lists.yoctoproject.org/mt/99161819/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>



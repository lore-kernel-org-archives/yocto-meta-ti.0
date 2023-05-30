Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F2DC77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 16:48:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2534.1685465319446712026
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 09:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=YTJbuS4V;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UGmaEZ099179;
	Tue, 30 May 2023 11:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685465316;
	bh=5Q7Xr2vmlHdtX1bfrPdb1Cwenfg4Z+PBfezdWadLFlY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YTJbuS4VxHzZusyWwHPoh61jVJv9KQLxpFz4jvCJKT+pKbT2ScZHFLnsumndDWVPC
	 2b/WGxhRlXElM89MsUygwh8p+B4jOB5sfP8wQpo8WLjm1nS3ggSIAeyLJdVzFpIEwd
	 tCn/wd9Z6pVlAWsDU/tRpv7LV/EFMS/AOCJFIXj4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UGmaDr079966
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 11:48:36 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 11:48:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 11:48:36 -0500
Received: from [10.250.34.213] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UGmZTF026417;
	Tue, 30 May 2023 11:48:36 -0500
Message-ID: <5dae44a0-547b-a158-f261-4fceb5882718@ti.com>
Date: Tue, 30 May 2023 11:48:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] ti-img-rouge-umlibs: move
 to new subdir
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230527015837.231817-1-rs@ti.com>
 <20230527015837.231817-2-rs@ti.com>
 <fefc4b3d-9ffa-c9b8-ad87-97fa9ef8edde@ti.com>
 <2cbefdef-f4a7-ad47-7533-7296f81d4d24@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <2cbefdef-f4a7-ad47-7533-7296f81d4d24@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 34UGmaEZ099179
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 16:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16626

On 5/30/23 11:38 AM, Randolph Sapp wrote:
> On 5/30/23 10:51, Andrew Davis wrote:
>> On 5/26/23 8:58 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Move recipe to new rogue subdir since we offer more than just libgles
>>> now.
>>>
>>
>> I did something like this as part of: https://lists.yoctoproject.org/g=
/meta-ti/message/16381
>>
>> ti-img-gpu-umlibs as the name feels more consistent to me.
>>
>> Andrew
>>
>=20
> Yeah, but even if it is more consistent, the current name matches the g=
it repo on git.ti.com. Unless I'm given explicit permission to rename tha=
t I'd prefer those to match as opposed to introducing our own naming conv=
ention for everything. We aren't marketing after all :)
>=20

I mean just for the dir name, that way SGX can go in the same dir.

As for project repo names, yeah I know.. SGX is still named "omap5-sgx-dd=
k-um-linux",
it doesn't even support OMAP5 anymore :)

Andrew

>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>> =C2=A0 .../{libgles =3D> rogue}/ti-img-rogue-umlibs_23.1.6404501.bb=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>>> =C2=A0 1 file changed, 0 insertions(+), 0 deletions(-)
>>> =C2=A0 rename meta-ti-bsp/recipes-graphics/{libgles =3D> rogue}/ti-im=
g-rogue-umlibs_23.1.6404501.bb (100%)
>>>
>>> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs=
_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs=
_23.1.6404501.bb
>>> similarity index 100%
>>> rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_=
23.1.6404501.bb
>>> rename to meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1=
.6404501.bb
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#16615): https://lists.yoctoproject.org/g/meta-ti/=
message/16615
>>> Mute This Topic: https://lists.yoctoproject.org/mt/99161819/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.c=
om]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>=20


Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1310C76188
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 18:54:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.80305.1680548054261384114
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Apr 2023 11:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Mm9FtPxV;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 333Is38U119919;
	Mon, 3 Apr 2023 13:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680548044;
	bh=Ilt/bjJbcMb8yYGenPFWGTgVyje20h50dGHS81S9JPo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Mm9FtPxVqGICA/VB2fFf7/Qfc6gU+COxlMPqGKfkXYSYeUoj509hGsgYC3D16WcT5
	 DnDBHV8c57p6xD/zrGxA2qDoHfb2ozM/Cp7nYHwcYPdl6dh3qkgAJGx6lpPs2O0VUb
	 /ZTuxWIGe7++qekBqhLJk5SzgxsNQfA1mUpopuAo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 333Is3w6021179
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Apr 2023 13:54:03 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 3
 Apr 2023 13:54:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 3 Apr 2023 13:54:03 -0500
Received: from [10.249.32.16] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 333Is34X003832;
	Mon, 3 Apr 2023 13:54:03 -0500
Message-ID: <99b788fc-f141-bd7f-5b03-03bfbf31b6bf@ti.com>
Date: Mon, 3 Apr 2023 13:54:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH] ti-sgx-ddk-um: fix error in
 postinst with sysvinit+udev
Content-Language: en-US
To: <afd@ti.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <linux@ew.tq-group.com>, Denys Dmytriyenko <denis@denix.org>
References: <20230320142534.2542288-1-matthias.schiffer@ew.tq-group.com>
 <035e1d0c-5b57-3c38-cb37-8606f2d5d5c8@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <035e1d0c-5b57-3c38-cb37-8606f2d5d5c8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 333Is38U119919
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Apr 2023 18:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16286



On 4/3/2023 11:43, Andrew Davis via lists.yoctoproject.org wrote:
> On 3/20/23 9:25 AM, Matthias Schiffer wrote:
>> When sysvinit is in DISTRO_FEATURES, the update-rc.d class must only b=
e
>> inherited when the script referenced by INITSCRIPT_NAME actually exist=
s,
>> or the update-rc.d command in the generated postinst script will fail.
>>
>> Reported-by: Denys Dmytriyenko <denis@denix.org>
>> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>> ---
>=20
> Ryan, ping on this, no huge rush, just needed for some rework I have in=
=20
> my queue.
>=20
> Andrew

Looking at it now.


>>
>> I have omitted a Fixes tag, as this applies to both master and kirksto=
ne.
>> The tags would be:
>>
>> # kirkstone
>> Fixes: f50f55102f92 ("ti-sgx-ddk-um: use udev for userspace=20
>> initialization")
>>
>> # master
>> Fixes: 0b3fa09a5f0b ("ti-sgx-ddk-um: use udev for userspace=20
>> initialization")
>>
>> Let me know if I should send separate patches with the tags included.
>>
>>
>> =C2=A0 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++++---
>> =C2=A0 1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb=20
>> b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> index f1fbed15..73d7acb9 100644
>> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.=
bb
>> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.=
bb
>> @@ -24,11 +24,16 @@ TARGET_PRODUCT:am65xx =3D "ti654x"
>> =C2=A0 INITSCRIPT_NAME =3D "rc.pvr"
>> =C2=A0 INITSCRIPT_PARAMS =3D "defaults 8"
>> -inherit update-rc.d
>> -
>> =C2=A0 PACKAGECONFIG ??=3D "udev"
>> =C2=A0 PACKAGECONFIG[udev] =3D ",,,udev"
>> +def use_initscript(d):
>> +=C2=A0=C2=A0=C2=A0 sysvinit =3D bb.utils.contains('DISTRO_FEATURES', =
'sysvinit', True,=20
>> False, d)
>> +=C2=A0=C2=A0=C2=A0 udev =3D bb.utils.contains('PACKAGECONFIG', 'udev'=
, True, False, d)
>> +=C2=A0=C2=A0=C2=A0 return sysvinit and not udev
>> +
>> +inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
>> +
>> =C2=A0 RDEPENDS:${PN} +=3D "libdrm libdrm-omap"
>> =C2=A0 RRECOMMENDS:${PN} +=3D "ti-sgx-ddk-km"
>> @@ -42,7 +47,7 @@ do_install () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with_udev=3D${@bb.utils.contains('PACKA=
GECONFIG', 'udev', 'true',=20
>> 'false', d)}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Delete initscript if it is not needed=
 or would conflict with=20
>> the udev rules
>> -=C2=A0=C2=A0=C2=A0 if $without_sysvinit || $with_udev; then
>> +=C2=A0=C2=A0=C2=A0 if ${@oe.utils.ifelse(use_initscript(d), 'false', =
'true')}; then
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -rf ${D}${sy=
sconfdir}/init.d
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rmdir --ignore-=
fail-on-non-empty ${D}${sysconfdir}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>
>>
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16285): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/16285
> Mute This Topic: https://lists.yoctoproject.org/mt/97732105/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


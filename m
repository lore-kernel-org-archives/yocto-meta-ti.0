Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44C6CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 04:49:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.114435.1698036596413442024
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 22 Oct 2023 21:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=R22uURxY;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39N4noeJ092001;
	Sun, 22 Oct 2023 23:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698036590;
	bh=DQSQnhz/gQOqmqjZoWWeDXamXfmg6cgMsRW4NMrd7QQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=R22uURxYtrnjXvBHnhHw+5CXIMVr5NpFzsVWk6gYyN/KebWKNJ2sjjpSBwijWLg7c
	 +hvfOsuvuU3RBMXdq/UxWV9NzTL0AJCW1A9C2Dih/nLglUVXQUCuaUPoprVJatVtwB
	 aps9oGNquVpjykrI3SGDC6EPa9Ev0tQSze6Zc5bc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39N4noN8063175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Oct 2023 23:49:50 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 22
 Oct 2023 23:49:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 22 Oct 2023 23:49:50 -0500
Received: from [172.24.227.83] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39N4nlwI111199;
	Sun, 22 Oct 2023 23:49:48 -0500
Message-ID: <4d0b7f24-6473-5921-dc8a-841e3e64fa0e@ti.com>
Date: Mon, 23 Oct 2023 10:19:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] [kirkstone][PATCH v3 1/2] preuth-fw: Remove packaging
 of PRU-ICSSM firmwares
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <srk@ti.com>,
        <afd@ti.com>
References: <20231009070926.21629-1-r-gunasekaran@ti.com>
 <20231009070926.21629-2-r-gunasekaran@ti.com>
 <20231009202027.GD2408@denix.org>
 <2ddee779-2ede-4ff0-8c20-fe8675fc8206@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <2ddee779-2ede-4ff0-8c20-fe8675fc8206@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 39N4noeJ092001
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 04:49:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17164



On 10/21/23 3:50 AM, Ryan Eatmon wrote:
>=20
>=20
> On 10/9/2023 3:20 PM, Denys Dmytriyenko wrote:
>> On Mon, Oct 09, 2023 at 12:39:25PM +0530, Ravi Gunasekaran via lists.y=
octoproject.org wrote:
>>> PRU-ICSS on AM33x, AM43x, supports different ethernet modes such
>>> as Ethernet, HSR and PRP by means of different firmwares and the
>>> driver loads one of the these firmware. The PRU-ICSS linux driver
>>> may not be available for all kernel versions.
>>>
>>> So add an .inc file that avoids the packaging of such firmwares
>>> in the SDK, so that it can be referenced by kernel recipes that
>>> don't support PRU-ICSS.
>>>
>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc | 3 +++
>>> =C2=A0 1 file changed, 3 insertions(+)
>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-kernel/linux/prueth-fw.=
inc
>>>
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc b/meta-ti=
-bsp/recipes-kernel/linux/prueth-fw.inc
>>> new file mode 100644
>>> index 00000000..6698c9ed
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
>>> @@ -0,0 +1,3 @@
>>> +# Do not package firmwares for kernels that don't support PRUETH
>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti43x =3D " prueth-fw pr=
uhsr-fw pruprp-fw"
>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti33x =3D " prueth-fw pr=
uhsr-fw pruprp-fw"
>>
>> This is asking for trouble - there's no way to un-do :remove downstrea=
m (e.g.
>> any of the Distro, SDK, Product Line or Customer layers)
>>
>> It is not recommended to use :remove (and :append to a lesser degree) =
on a
>> regular basis when it can be done differently.
>>
>> Moreover, what is a difference from v2? It is a more convoluted way to=
 drop
>> those FW images from getting installed, but it is still done unconditi=
onally
>> here in meta-ti - are there any benefits of doing it this way?
>=20
>=20
> Ravi, I hate to ask this of you as most of the waffling is from me.
>=20
> But I agree with Denys.=C2=A0 I think what we need is the v2 patch, but=
 with better wording (like what you have in v3) that explains the situati=
on.
>=20
> Can you put together a new v4 that looks like that?
>=20
>=20

Thanks for revisiting this patch.=20

Based on Andrew's comment on installing the firmware unconditionally, I i=
nformed the
concerned parties that approach to selectively package firmwares is littl=
e messy.
It's been more than a week and haven't heard back anything.

So I would like to drop this patch, unless there is a strong request for =
it.

>=20
>=20

--=20
Regards,
Ravi


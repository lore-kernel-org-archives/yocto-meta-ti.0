Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE263EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 20:06:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.29.1687291567953129287
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 13:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=fJpIVQq7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KK62T8104513;
	Tue, 20 Jun 2023 15:06:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687291562;
	bh=Gd/lPp3q+uyDOeAJOvwzTAs1UnBEBVoiYy9ESMJZq6o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fJpIVQq7BVOIHgX072O5xQhvdEnIfKWdyJS9GwVWsSFBI7QkFDB1pNB2GTvwEP0GZ
	 ZGwvso0uuq0uPiEz+cnIx5Y0yXI6OkouuSxsuYL3RYpYfH4WOr/l8TkoulYqLQmtZk
	 y0Kj4DLg7vqiQ13Zv2xN5Cfv7x1Aw+VdJZLh32bQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KK620p103700
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 15:06:02 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 15:06:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 15:06:02 -0500
Received: from [10.250.36.99] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KK61g4057578;
	Tue, 20 Jun 2023 15:06:02 -0500
Message-ID: <68317d6f-8c87-a0db-12ab-232d2b7403c8@ti.com>
Date: Tue, 20 Jun 2023 15:06:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] kernel-rdepends: Add ti-eth-fw
 as an RDEPENDS
Content-Language: en-US
To: <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230620170925.19023-1-reatmon@ti.com>
 <20230620180537.GJ1518@denix.org>
 <9f070406-bc65-bfa1-b718-4fe935594183@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <9f070406-bc65-bfa1-b718-4fe935594183@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 35KK62T8104513
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Jun 2023 20:06:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16748

On 6/20/23 2:17 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 6/20/2023 1:05 PM, Denys Dmytriyenko wrote:
>> On Tue, Jun 20, 2023 at 12:09:25PM -0500, Ryan Eatmon via lists.yoctop=
roject.org wrote:
>>> When the ti-eth-fw recipe was split out from the ti-rtos-firmware rec=
ipe
>>> we forgot to add it as a dependency.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 +++
>>> =C2=A0 1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/m=
eta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>> index 18984e80..1f0c1ee8 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>> @@ -31,3 +31,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D=
 " vxd-dec-fw"
>>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cnm-w=
ave-fw"
>>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " cnm-w=
ave-fw"
>>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx =3D " cnm-=
wave-fw"
>>> +
>>> +# Add run-time dependency for TI ETH firmware to the rootfs
>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:k3 =3D " ti-eth-fw"
>>
>> Though, ETH FW is only enabled on j721e, j7200 and j784s4:
>>
>> https://git.yoctoproject.org/meta-ti/commit/?id=3D91e5a1ca6541012e3d42=
85479ecf5a9f353307f9
>>
>> ETH_FW_LIST =3D ""
>> ETH_FW_LIST:j721e =3D=C2=A0=C2=A0 "${ETH_FW}"
>> ETH_FW_LIST:j7200 =3D=C2=A0=C2=A0 "${ETH_FW}"
>> ETH_FW_LIST:j721s2 =3D=C2=A0 ""
>> ETH_FW_LIST:j784s4 =3D=C2=A0 "${ETH_FW}"
>> ETH_FW_LIST:am65xx =3D=C2=A0 ""
>> ETH_FW_LIST:am64xx =3D=C2=A0 ""
>> ETH_FW_LIST:am62xx =3D=C2=A0 ""
>> ETH_FW_LIST:am62axx =3D ""
>>
>> Other platforms generate an empty package w/o the binary in it. So I g=
uess for
>> simpler dependency pulling it for all K3 platforms is an option? On on=
e hand
>> it makes kernel dependencies simpler, but executes build/packaging pro=
cess for
>> the firmware that ends up being no-op and produce an empty output...
>=20
> Andrew and I talked about.=C2=A0 It seems annoying to have to update tw=
o files to add a platform, BUT doing it this way does mean we execute the=
 recipe when the recipe does nothing...
>=20
> This is sort of a holdover from the ti-rtos-firmware way of doing thing=
s.
>=20
> Let me think about it...
>=20

Another thing we may want to do is not have this recipe be device specifi=
c,
it is just a small firmware, no good reason to only deploy one per device.
I'd say we ship all unconditionally in this package, then it won't have t=
o
be re-built for each device either.

Andrew

>> Similar question for DM FW? E.g.:
>>
>> https://git.yoctoproject.org/meta-ti/commit/?id=3Db21d29d94694ac49b97a=
1f4ba428c7d8cd6fb64a
>>
>> DM_FW_LIST =3D ""
>> DM_FW_LIST:j721e =3D=C2=A0=C2=A0 "${DM_FIRMWARE}"
>> DM_FW_LIST:j7200 =3D=C2=A0=C2=A0 "${DM_FIRMWARE}"
>> DM_FW_LIST:j721s2 =3D=C2=A0 "${DM_FIRMWARE}"
>> DM_FW_LIST:j784s4 =3D=C2=A0 "${DM_FIRMWARE}"
>> DM_FW_LIST:am65xx =3D=C2=A0 ""
>> DM_FW_LIST:am64xx =3D=C2=A0 ""
>> DM_FW_LIST:am62xx =3D=C2=A0 "${DM_FIRMWARE}"
>> DM_FW_LIST:am62axx =3D "${DM_FIRMWARE}"
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16746): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/16746
> Mute This Topic: https://lists.yoctoproject.org/mt/99648797/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695306/361=
9733/2033773410/xyzzy [afd@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


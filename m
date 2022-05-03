Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F36C433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 15:53:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.846.1651593221380391220
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 08:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=se+ypP7G;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 243FrbcG067466;
	Tue, 3 May 2022 10:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651593217;
	bh=g6HRzjbEko6a++aEJ1EfsDzRKQDw9icWRlQ/3caq0Rc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=se+ypP7Gn0XDQk2TpiCUv2PJLDGS5IjNdgi2V2BCEQt6HUdC0S0GCOwZSJ5lX8JRw
	 A3NhZBwe5MbKE4yzjLgV+1wxn+ZZkCrzqGZ9Lo1QX6fuHIRnQsScHPG3F0dXQpQXLk
	 qSbWdFzf5DF7LyH7NIayOz6zXkg0o4TAHx0qZwC8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 243Frbim111205
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 May 2022 10:53:37 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 3
 May 2022 10:53:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 3 May 2022 10:53:37 -0500
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 243FrbPq012363;
	Tue, 3 May 2022 10:53:37 -0500
Message-ID: <ae342665-b362-5617-0876-24cd4d643603@ti.com>
Date: Tue, 3 May 2022 10:53:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [dunfell-next RFC PATCH] trusted-firmware-a: upgrade to v2.6+
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220503152428.25598-1-praneeth@ti.com>
 <c3609b45-fee6-d86d-9903-6deda8850dd0@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <c3609b45-fee6-d86d-9903-6deda8850dd0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id
 243FrbcG067466
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 May 2022 15:53:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14682



On 5/3/2022 10:31 AM, Ryan Eatmon wrote:
>=20
>=20
> On 5/3/2022 10:24, Praneeth Bajjuri wrote:
>> upgrade arm-trusted-firmare to master which is currently v2.6+
>>
>> This upgrade picks up am62x low power mode feature.
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>
>> AM62 low power mode support:
>> https://review.trustedfirmware.org/q/topic:%22ti-k3-system-suspend-bas=
e-support%22=20
>>
>>
>> =C2=A0 .../trusted-firmware-a/trusted-firmware-a_%.bbappend=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++---
>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git=20
>> a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend=20
>> b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> index b84da1f3..4476d23e 100644
>> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> @@ -1,8 +1,8 @@
>> -PV_k3 =3D "2.5"
>> +PV_k3 =3D "2.6"
>> =C2=A0 LIC_FILES_CHKSUM_k3 =3D=20
>> "file://license.rst;md5=3D1dd070c98a281d18d9eefd938729b031"
>> -BRANCH_k3 =3D "ti-atf"
>> +BRANCH_k3 =3D "ti-atf-next"
>=20
> Changing to the next branch seems like the only issue.=C2=A0 I know thi=
s is=20
> an RFC, but if you want it to become a real patch then that needs to be=
=20
> addressed.

I was hoping this patch to be merged to dunfell-next and run a build a=20
boot test cycle across platforms.

Yes i will merge ti-atf-next to ti-atf and update the patch to be=20
submitted to dunfell after that.

>=20
>=20
>> =C2=A0 SRC_URI_k3 =3D=20
>> "git://git.ti.com/atf/arm-trusted-firmware.git;branch=3D${BRANCH};name=
=3Dtfa"
>> -SRCREV_tfa_k3 =3D "0693f356eb2a25adf8758d98058120bed082cc73"
>> +SRCREV_tfa_k3 =3D "6541aa24f834daa80da701e0054dfe3a16cda0ce"
>> =C2=A0 COMPATIBLE_MACHINE_k3 =3D "k3"
>> =C2=A0 TFA_BUILD_TARGET_k3 =3D "all"
>> =C2=A0 TFA_INSTALL_TARGET_k3 =3D "bl31"
>=20


Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B17BC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 16:37:10 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.14.1660235822032120518
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 09:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=yge296sT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27BGb18I065944
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 11:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660235821;
	bh=7YCLIy82beGy0aZq15w6JNo/PwExA2A4o4jFEUolmxo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yge296sTrh/V6J1E8a/j1ig6/IwwptgaBf+FJZThhUJP7nJIipSl2klDdUKe8Sfhs
	 h/3fNjhjwhER1OX4Fy4sydEy4Mr1Lnazy5AFNpqYHZydRV810MR2ZfHzRVn84dYsmr
	 BEnaosT84mhUnRZAAtZrJSOkE0ofef3BsO0p8zlk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27BGb1OZ030574
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 11:37:01 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 11
 Aug 2022 11:37:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 11 Aug 2022 11:37:00 -0500
Received: from [10.250.34.173] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27BGb0o5015825;
	Thu, 11 Aug 2022 11:37:00 -0500
Message-ID: <d34cc6c1-6caa-2768-4581-b94c626aad19@ti.com>
Date: Thu, 11 Aug 2022 11:37:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti] [dunfell/master PATCHv2] trusted-firmware-a: upgrade to
 v2.7
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon <reatmon@ti.com>
CC: Judith Mendez <jm@ti.com>
References: <170A5585DD96E678.26714@lists.yoctoproject.org>
 <878caebd-9e3c-643d-03c0-e539b5dd358c@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <878caebd-9e3c-643d-03c0-e539b5dd358c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id
 27BGb18I065944
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 16:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14952

On 8/11/22 11:25 AM, Bajjuri, Praneeth wrote:
>=20
>=20
> On 8/11/2022 10:57 AM, praneeth via lists.yoctoproject.org wrote:
>> upgrade arm-trusted-firmare to v2.7
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> Tested-by: Judith Mendez <jm@ti.com>
>=20
> Sanity tested boot on AM64 HS and AM62 GP
>=20
>> ---

Acked-by: Andrew Davis <afd@ti.com>

>>
>> *Changes from v1: removed linux-fw recipe update, that was a mistake.
>>
>> =C2=A0 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | =
2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbapp=
end b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> index 9645137e..4dd13952 100644
>> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> @@ -1,6 +1,6 @@
>> =C2=A0 PV_k3 =3D "2.6"
>> =C2=A0 LIC_FILES_CHKSUM_k3 =3D "file://license.rst;md5=3D1dd070c98a281=
d18d9eefd938729b031"
>> -SRCREV_tfa_k3 =3D "453abc80b2eacbf2816c838e47e40f063227d934"
>> +SRCREV_tfa_k3 =3D "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
>> =C2=A0 COMPATIBLE_MACHINE_k3 =3D "k3"
>> =C2=A0 TFA_BUILD_TARGET_k3 =3D "all"
>> =C2=A0 TFA_INSTALL_TARGET_k3 =3D "bl31"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#14950): https://lists.yoctoproject.org/g/meta-ti/m=
essage/14950
>> Mute This Topic: https://lists.yoctoproject.org/mt/92961522/2167429
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@=
ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


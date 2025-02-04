Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086AAC02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 16:47:49 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.121373.1738687666235278343
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 08:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Sf1DXIU/;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514GliD73187686
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Feb 2025 10:47:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738687664;
	bh=/iGP5z/X9oq9Wzxq+UIaZXghtlmhEl860SuVDrvnwqw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Sf1DXIU/dz2zHH6eZvX7hOuYJ8Sk1kqNXZfrv9xIQZPjojY0ubOK4V0ZjDSkKvZF9
	 Lp/x0PYlM5XQk0UR451LBCuUo0OUMKcmK9Szj9PXsWlZvi6JGRdPfQto1bb0cifpyP
	 C5BPkxP9IDTm+Z3LozBZHoFL+TNdJfxLxsP7WtNQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514GliqG096532;
	Tue, 4 Feb 2025 10:47:44 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 10:47:44 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 10:47:44 -0600
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514Glica119763;
	Tue, 4 Feb 2025 10:47:44 -0600
Message-ID: <49c3e541-50e0-4880-bdc5-9fae553aac6f@ti.com>
Date: Tue, 4 Feb 2025 10:47:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/3] trusted-firmware-a: Switch
 TFA to TI fork
To: Andrew Davis <afd@ti.com>, <c-shilwant@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>
References: <20250204134925.968150-1-c-shilwant@ti.com>
 <20250204134925.968150-2-c-shilwant@ti.com>
 <11d39f7d-7b08-42e0-87a5-0b4380859706@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <11d39f7d-7b08-42e0-87a5-0b4380859706@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 514GliD73187686
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Feb 2025 16:47:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18265



On 2/4/2025 10:25 AM, Andrew Davis wrote:
> On 2/4/25 7:49 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
>> - While TFA patches for K3-based AM62L platform are under
>> review upstream, temporarily switch to TI's GitHub fork
>> for all K3 platforms to prevent disruptions and ensure timely bringup
>>
>> - Also update the PV & LIC_FILES_CHKSUM as well
>=20
> The license change isn't something we did as part of our fork ti-atf.
> Maybe you could split this into two to make that clear,
>=20
>  =C2=A0* Update to upstream 2.12 + license fix
>  =C2=A0* Patch that only deals with switching to ti-atf.
>=20
> Andrew

Agreed.


>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 .../trusted-firmware-a/trusted-firmware-a-ti.inc=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++----
>> =C2=A0 1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc=
=20
>> b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> index ebb13bbd..e4a9c49b 100644
>> ---=20
>> a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> +++=20
>> b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> @@ -1,7 +1,8 @@
>> -PV:k3 =3D "2.11+git"
>> -SRCREV_tfa:k3 =3D "58b25570c9ef91753b14c2103f45f4be9dddb696"
>> -LIC_FILES_CHKSUM:k3 =3D=20
>> "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58af8d19bee1"
>> -SRC_URI:k3 =3D=20
>> "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=3D=
https;name=3Dtfa;branch=3Dmaster"
>> +PV:k3 =3D "2.12+git"
>> +SRCREV_tfa:k3 =3D "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
>> +LIC_FILES_CHKSUM:k3 =3D=20
>> "file://docs/license.rst;md5=3D1118e32884721c0be33267bd7ae11130"
>> +SRC_URI:k3 =3D=20
>> "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=3D=
https;name=3Dtfa;branch=3Dti-master"
>> +
>> =C2=A0 COMPATIBLE_MACHINE:k3 =3D "k3"
>> =C2=A0 TFA_BUILD_TARGET:k3 =3D "all"
>> =C2=A0 TFA_INSTALL_TARGET:k3 =3D "bl31"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18256):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/18256
>> Mute This Topic: https://lists.yoctoproject.org/mt/110991529/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


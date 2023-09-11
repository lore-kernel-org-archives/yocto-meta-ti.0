Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC767EE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 04:28:36 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.51558.1694406508252869237
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 10 Sep 2023 21:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ozgvsg+W;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38B4SQsH003319
	for <meta-ti@lists.yoctoproject.org>; Sun, 10 Sep 2023 23:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694406506;
	bh=zW1+E2am2E/XcasixPEq+KHPBzNxBln4MsmjeDgIjPU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ozgvsg+WK67rV8hxqfiLDk1E97mTKHd42+XqXFgZabz0buUa8zqdlQIuhHX/nc64/
	 D1oFOjUBCVTtgmwyQn+fWaZQt1X8UlobBU93+/uv48UGG8TsCP7uhTf643mhSbuWgO
	 SGeSeN9LT1N/Ivsf7jWgcGgnJKPZzXe92ng9acz8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38B4SQoH050519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 10 Sep 2023 23:28:26 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 10
 Sep 2023 23:28:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 10 Sep 2023 23:28:26 -0500
Received: from [172.24.227.83] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38B4SOfQ009167;
	Sun, 10 Sep 2023 23:28:24 -0500
Message-ID: <c318dc95-5177-9bc1-645e-08feba12d7aa@ti.com>
Date: Mon, 11 Sep 2023 09:58:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][kirkstone][PATCH v2] kernel-rdepends: Remove PRU
 Ethernet firmwares for legacy devices
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <reatmon@ti.com>
CC: <praneeth@ti.com>, <srk@ti.com>, Ravi Gunasekaran <r-gunasekaran@ti.com>
References: <20230908114439.13213-1-r-gunasekaran@ti.com>
 <3bce9ebc-90ba-e525-67da-fda1b8ce95a4@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <3bce9ebc-90ba-e525-67da-fda1b8ce95a4@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 38B4SQsH003319
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Sep 2023 04:28:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16945

Andrew,

On 9/8/23 7:49 PM, Andrew Davis wrote:
> On 9/8/23 6:44 AM, Ravi Gunasekaran via lists.yoctoproject.org wrote:
>> Remove the PRU Ethernet firmwares from being packaged for
>> AM33x, AM43x and AM57x.
>>
>=20
> Commit messages should give the "why", we can read the code.

I will provide reasoning in the v2.

>=20
> Are we dropping support for PRUETH from these boards? I still
> use this, I'm sure others do too.
>=20

PRUETH drivers for these devices are not upstreamed and PRUTETH will not
be supported in SDK 9.1 as well. Plan to upstream and port to SDK is stil=
l
being worked on. So I wanted to remove these firmwares from being package=
d.


> Andrew
>=20
>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>> ---
>> Changes from v1:
>> --------------
>> * Corrected the commit message.
>>
>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 ---
>> =C2=A0 1 file changed, 3 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/me=
ta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>> index 266a7ef5..317ab1b1 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>> @@ -12,9 +12,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D=
 " vpdma-fw"
>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D " goodix=
-fw"
>> =C2=A0 =C2=A0 # Add run-time dependency for PRU Ethernet firmware to t=
he rootfs
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx =3D " prueth-fw pr=
usw-fw pruhsr-fw pruprp-fw"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " prueth-fw pru=
hsr-fw pruprp-fw"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " prueth-fw pru=
hsr-fw pruprp-fw"
>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx =3D " prueth=
-fw-am65x"
>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm =3D " pr=
ueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D " prueth=
-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>
>> base-commit: c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16932): https://lists.yoctoproject.org/g/meta-ti/m=
essage/16932
>> Mute This Topic: https://lists.yoctoproject.org/mt/101234600/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Regards,
Ravi


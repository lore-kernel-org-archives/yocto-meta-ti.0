Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFD7CA0ECF
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:28:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.24828.1694525283597710879
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 06:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=p1AkqDfr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38CDS3j9009090
	for <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 08:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694525283;
	bh=P15ccjQ8cKYOrbrFyUzvSdmIorCDma52hP3vPbIbzrY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=p1AkqDfre7dhavU5pCAracXcv2S1DoZ4A61sCvTh+RPwdPS6hCPb8ivAyP9iqKp/k
	 HoYNAnUx8b8VSsX2Pq59izRMoZRFUVQBMHGreJI7DaYpb5FOo1CyOQcrMUIzatoycO
	 VqawdxAQK6t/e3Ols+eAzRQqJIn4CYZk0/WVk/jk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38CDS3dB028994
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 08:28:03 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Sep 2023 08:28:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Sep 2023 08:28:02 -0500
Received: from [10.249.36.168] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38CDS2Cd044808;
	Tue, 12 Sep 2023 08:28:02 -0500
Message-ID: <8f45cc7e-e4d0-98f6-b58c-27554b752f06@ti.com>
Date: Tue, 12 Sep 2023 08:28:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-ti][kirkstone][PATCH v2] kernel-rdepends: Remove PRU
 Ethernet firmwares for legacy devices
Content-Language: en-US
To: Ravi Gunasekaran <r-gunasekaran@ti.com>, Andrew Davis <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <srk@ti.com>
References: <20230908114439.13213-1-r-gunasekaran@ti.com>
 <3bce9ebc-90ba-e525-67da-fda1b8ce95a4@ti.com>
 <c318dc95-5177-9bc1-645e-08feba12d7aa@ti.com>
 <c9ad8147-1d29-c288-3272-06973626eb78@ti.com>
 <627617d6-c35b-8dad-ea41-10959ae6cf99@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <627617d6-c35b-8dad-ea41-10959ae6cf99@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 38CDS3j9009090
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 13:28:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16953



On 9/11/2023 11:44 PM, Ravi Gunasekaran wrote:
>=20
>=20
> On 9/11/23 9:02 PM, Ryan Eatmon wrote:
>>
>>
>> On 9/10/2023 11:28 PM, Ravi Gunasekaran wrote:
>>> Andrew,
>>>
>>> On 9/8/23 7:49 PM, Andrew Davis wrote:
>>>> On 9/8/23 6:44 AM, Ravi Gunasekaran via lists.yoctoproject.org wrote=
:
>>>>> Remove the PRU Ethernet firmwares from being packaged for
>>>>> AM33x, AM43x and AM57x.
>>>>>
>>>>
>>>> Commit messages should give the "why", we can read the code.
>>>
>>> I will provide reasoning in the v2.
>>>
>>>>
>>>> Are we dropping support for PRUETH from these boards? I still
>>>> use this, I'm sure others do too.
>>>>
>>>
>>> PRUETH drivers for these devices are not upstreamed and PRUTETH will =
not
>>> be supported in SDK 9.1 as well. Plan to upstream and port to SDK is =
still
>>> being worked on. So I wanted to remove these firmwares from being pac=
kaged.
>>
>> What does upstreaming support have to do with this?=C2=A0 The drivers =
are available in what are we ship now.=C2=A0 And if people are currently =
using this software today then removing it seems like the wrong thing to =
do. What am I missing?
>=20
> By "what we ship now", do you mean in the SDK? The drivers will be not =
present in SDK 9.x refresh release for these devices.
> So I didn't want these firmwares to be packaged as it might give an imp=
ression that we somehow support the feature.
> If there is any other way to prevent the packaging of these firmwares i=
n the SDK, please let me know.

You should be able to add a bbappend file in the SDK layer and remove=20
the values you do not want.  Something like:

linux-ti-staging_%.bbappend
---------------------------

RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:am57xx =3D " prueth-fw=20
prusw-fw pruhsr-fw pruprp-fw"
RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti43x =3D " prueth-fw=20
pruhsr-fw pruprp-fw"
RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti33x =3D " prueth-fw=20
pruhsr-fw pruprp-fw"


That way you are not "breaking" the CoreSDK, but you are modifying what=20
is built and released for your installer.


>>
>>
>>>> Andrew
>>>>
>>>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>>>> ---
>>>>> Changes from v1:
>>>>> --------------
>>>>> * Corrected the commit message.
>>>>>
>>>>>  =C2=A0=C2=A0 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc =
| 3 ---
>>>>>  =C2=A0=C2=A0 1 file changed, 3 deletions(-)
>>>>>
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b=
/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>>> index 266a7ef5..317ab1b1 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>>> @@ -12,9 +12,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7x=
x =3D " vpdma-fw"
>>>>>  =C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D=
 " goodix-fw"
>>>>>  =C2=A0=C2=A0 =C2=A0 # Add run-time dependency for PRU Ethernet fir=
mware to the rootfs
>>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx =3D " prueth-fw=
 prusw-fw pruhsr-fw pruprp-fw"
>>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " prueth-fw =
pruhsr-fw pruprp-fw"
>>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " prueth-fw =
pruhsr-fw pruprp-fw"
>>>>>  =C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx =3D=
 " prueth-fw-am65x"
>>>>>  =C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-ev=
m =3D " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>>>  =C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D=
 " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>>>
>>>>> base-commit: c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f
>>>>>
>>>>>
>>>>>
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#16932): https://lists.yoctoproject.org/g/meta-t=
i/message/16932
>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/101234600/361973=
3
>>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti=
.com]
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>
>>>
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


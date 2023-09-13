Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AA5EEB593
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 05:20:31 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5207.1694582428144260035
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 22:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=k+4BlXju;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38D5KRLC057442
	for <meta-ti@lists.yoctoproject.org>; Wed, 13 Sep 2023 00:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694582427;
	bh=FZSYeOU0ZxfpOj3qOih116tGaKI5Za/1klfkabFKz7M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=k+4BlXjuwQ7YeIQEhA5X72xHa9CCbSSmbSQmCtNxlAAxVjeGg/n9ZqrXwyf2WAoF+
	 hB6+gx+GXsk8oMeBRoIG2X63ou+VaT0+o5WzfH/eHDSaYS3gay4avOh4ifWfUETDbU
	 Y+QTtunXi/8n1ql5qxyuRb8IIdeJM8wpo0gvv/u4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38D5KRve126277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 13 Sep 2023 00:20:27 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Sep 2023 00:20:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Sep 2023 00:20:27 -0500
Received: from [10.249.130.150] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38D5KOqW108034;
	Wed, 13 Sep 2023 00:20:25 -0500
Message-ID: <8386b73d-f08b-5690-3430-a64caec68ec7@ti.com>
Date: Wed, 13 Sep 2023 10:50:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-ti][kirkstone][PATCH v2] kernel-rdepends: Remove PRU
 Ethernet firmwares for legacy devices
To: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <srk@ti.com>
References: <20230908114439.13213-1-r-gunasekaran@ti.com>
 <3bce9ebc-90ba-e525-67da-fda1b8ce95a4@ti.com>
 <c318dc95-5177-9bc1-645e-08feba12d7aa@ti.com>
 <c9ad8147-1d29-c288-3272-06973626eb78@ti.com>
 <627617d6-c35b-8dad-ea41-10959ae6cf99@ti.com>
 <8f45cc7e-e4d0-98f6-b58c-27554b752f06@ti.com>
Content-Language: en-US
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <8f45cc7e-e4d0-98f6-b58c-27554b752f06@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 38D5KRLC057442
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 13 Sep 2023 05:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16961



On 9/12/2023 6:58 PM, Ryan Eatmon wrote:
>
>
> On 9/11/2023 11:44 PM, Ravi Gunasekaran wrote:
>>
>>
>> On 9/11/23 9:02 PM, Ryan Eatmon wrote:
>>>
>>>
>>> On 9/10/2023 11:28 PM, Ravi Gunasekaran wrote:
>>>> Andrew,
>>>>
>>>> On 9/8/23 7:49 PM, Andrew Davis wrote:
>>>>> On 9/8/23 6:44 AM, Ravi Gunasekaran via lists.yoctoproject.org wrot=
e:
>>>>>> Remove the PRU Ethernet firmwares from being packaged for
>>>>>> AM33x, AM43x and AM57x.
>>>>>>
>>>>>
>>>>> Commit messages should give the "why", we can read the code.
>>>>
>>>> I will provide reasoning in the v2.
>>>>
>>>>>
>>>>> Are we dropping support for PRUETH from these boards? I still
>>>>> use this, I'm sure others do too.
>>>>>
>>>>
>>>> PRUETH drivers for these devices are not upstreamed and PRUTETH will=
 not
>>>> be supported in SDK 9.1 as well. Plan to upstream and port to SDK is=
 still
>>>> being worked on. So I wanted to remove these firmwares from being pa=
ckaged.
>>>
>>> What does upstreaming support have to do with this?=C2=A0 The drivers=
 are
>>> available in what are we ship now.=C2=A0 And if people are currently =
using this
>>> software today then removing it seems like the wrong thing to do. Wha=
t am I
>>> missing?
>>
>> By "what we ship now", do you mean in the SDK? The drivers will be not
>> present in SDK 9.x refresh release for these devices.
>> So I didn't want these firmwares to be packaged as it might give an
>> impression that we somehow support the feature.
>> If there is any other way to prevent the packaging of these firmwares =
in the
>> SDK, please let me know.
>
> You should be able to add a bbappend file in the SDK layer and remove t=
he
> values you do not want.=C2=A0 Something like:
>
> linux-ti-staging_%.bbappend
> ---------------------------
>
> RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:am57xx =3D " prueth-fw prus=
w-fw
> pruhsr-fw pruprp-fw"
> RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti43x =3D " prueth-fw pruhs=
r-fw
> pruprp-fw"
> RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti33x =3D " prueth-fw pruhs=
r-fw
> pruprp-fw"
>
>
> That way you are not "breaking" the CoreSDK, but you are modifying what=
 is
> built and released for your installer.
>

Thanks for your suggestion. I will send out a patch to meta-processor-sdk.

>
>>>
>>>
>>>>> Andrew
>>>>>
>>>>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>>>>> ---
>>>>>> Changes from v1:
>>>>>> --------------
>>>>>> * Corrected the commit message.
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0 meta-ti-bsp/recipes-kernel/linux/kernel-rdepend=
s.inc | 3 ---
>>>>>> =C2=A0=C2=A0=C2=A0 1 file changed, 3 deletions(-)
>>>>>>
>>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>>>> b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>>>> index 266a7ef5..317ab1b1 100644
>>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>>>> @@ -12,9 +12,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7=
xx =3D "
>>>>>> vpdma-fw"
>>>>>> =C2=A0=C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra=
7xx =3D " goodix-fw"
>>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0 # Add run-time dependency for PRU Ethern=
et firmware to the rootfs
>>>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx =3D " prueth-f=
w
>>>>>> prusw-fw pruhsr-fw pruprp-fw"
>>>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " prueth-fw
>>>>>> pruhsr-fw pruprp-fw"
>>>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " prueth-fw
>>>>>> pruhsr-fw pruprp-fw"
>>>>>> =C2=A0=C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am6=
5xx =3D " prueth-fw-am65x"
>>>>>> =C2=A0=C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am6=
5xx-evm =3D "
>>>>>> prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>>>> =C2=A0=C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am6=
4xx =3D "
>>>>>> prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>>>>
>>>>>> base-commit: c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f
>>>>>>
>>>>>>
>>>>>>
>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>> Links: You receive all messages sent to this group.
>>>>>> View/Reply Online (#16932):
>>>>>> https://lists.yoctoproject.org/g/meta-ti/message/16932
>>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/101234600/36197=
33
>>>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@t=
i.com]
>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>
>>>>
>>>
>>
>



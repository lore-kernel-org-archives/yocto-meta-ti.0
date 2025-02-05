Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1059C02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 09:46:16 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.8272.1738748773116417893
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 01:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=gwM/HHyI;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5159kAUI2511255
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 03:46:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738748770;
	bh=vJjn3Qybe4CS+63OjRY27dyxB+Jggtc6gbWTDfRMRUI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gwM/HHyIae59O86gp9rr8ktxm2/rHtdzf6exPu5ZWtrBMCid+Kaph4lGJW3Mp5seT
	 m0BHUvpstxDTDMICbopMopB9b0VisGhjUNi8QjMEIMbnuJk8Zxj16pfxGIF7sazqsY
	 kzfRCvhP9xqT3ikeyO5cic8tLM8p3AkyD2gYhjII=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5159kASi027801
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 03:46:10 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 03:46:09 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 03:46:09 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5159k7Pq053470;
	Wed, 5 Feb 2025 03:46:08 -0600
Message-ID: <257ac030-2e69-40e9-9f5c-446fd04b8b5a@ti.com>
Date: Wed, 5 Feb 2025 15:16:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/3] trusted-firmware-a: Switch
 TFA to TI fork
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth
 Bajjuri <praneeth@ti.com>
References: <20250204134925.968150-1-c-shilwant@ti.com>
 <20250204134925.968150-2-c-shilwant@ti.com>
 <11d39f7d-7b08-42e0-87a5-0b4380859706@ti.com>
 <20250204191647.GJ21608@denix.org>
 <cfafd00a-5d37-473f-81e3-33a4705bda51@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <cfafd00a-5d37-473f-81e3-33a4705bda51@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 5159kAUI2511255
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Feb 2025 09:46:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18271

Hi Andrew & Ryan,

On 05/02/25 01:35, Andrew Davis wrote:
> On 2/4/25 1:16 PM, Denys Dmytriyenko wrote:
>> On Tue, Feb 04, 2025 at 10:25:14AM -0600, Andrew Davis via=20
>> lists.yoctoproject.org wrote:
>>> On 2/4/25 7:49 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
>>>> - While TFA patches for K3-based AM62L platform are under
>>>> review upstream, temporarily switch to TI's GitHub fork
>>>> for all K3 platforms to prevent disruptions and ensure timely bringu=
p
>>>>
>>>> - Also update the PV & LIC_FILES_CHKSUM as well
>>>
>>> The license change isn't something we did as part of our fork ti-atf.
>>> Maybe you could split this into two to make that clear,
>>>
>>> =C2=A0 * Update to upstream 2.12 + license fix
>>> =C2=A0 * Patch that only deals with switching to ti-atf.



I understand the intention of splitting the TFA changes into two commits
to avoid highlighting the fact that switching to GitHub fork isn't
updating the LICENSE file.

But this isn't possible because TFA 2.12 had a different LICENSE version
& the current TFA upstream master (eventually which was used to create
the TI fork) has a different LICENSE version. So, even if I go ahead & ma=
ke
it granular it would be something like,

* Update to upstream 2.12 + license SHA update
* Patch that switches to ti-atf + license SHA update


I had an offline syncup with Praneeth on the above split I mentioned & wi=
ll
eventually go ahead with the same in v2


--
Chirag



>>
>> Andrew,
>>
>> Any downside to switching from upstream tfa to ti-tfa?
>>
>> Is the only change to support non-R5 platform and won't affect other K=
3
>> devices?
>>
>
> Right, this fork should only be needed for AM62L, and there was
> some talk around only using the fork for that platform. But the
> thinking here is that if something in that fork accidentally does
> break the other K3 devices, it is best we find out about it early
> here by our SDK testing vs later when the patches end up in
> upstream.
>
> Hopefully this will not be a long running fork and we can switch
> back to upstream when the AM62L support patches are taken upstream.
>
> Andrew
>
>>
>>>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>>>> ---
>>>> =C2=A0 .../trusted-firmware-a/trusted-firmware-a-ti.inc=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9=20
>>>> +++++----
>>>> =C2=A0 1 file changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git=20
>>>> a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc=20
>>>> b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
>>>> index ebb13bbd..e4a9c49b 100644
>>>> ---=20
>>>> a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
>>>> +++=20
>>>> b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
>>>> @@ -1,7 +1,8 @@
>>>> -PV:k3 =3D "2.11+git"
>>>> -SRCREV_tfa:k3 =3D "58b25570c9ef91753b14c2103f45f4be9dddb696"
>>>> -LIC_FILES_CHKSUM:k3 =3D=20
>>>> "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58af8d19bee1"
>>>> -SRC_URI:k3 =3D=20
>>>> "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=3D=
https;name=3Dtfa;branch=3Dmaster"
>>>> +PV:k3 =3D "2.12+git"
>>>> +SRCREV_tfa:k3 =3D "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
>>>> +LIC_FILES_CHKSUM:k3 =3D=20
>>>> "file://docs/license.rst;md5=3D1118e32884721c0be33267bd7ae11130"
>>>> +SRC_URI:k3 =3D=20
>>>> "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=
=3Dhttps;name=3Dtfa;branch=3Dti-master"
>>>> +
>>>> =C2=A0 COMPATIBLE_MACHINE:k3 =3D "k3"
>>>> =C2=A0 TFA_BUILD_TARGET:k3 =3D "all"
>>>> =C2=A0 TFA_INSTALL_TARGET:k3 =3D "bl31"


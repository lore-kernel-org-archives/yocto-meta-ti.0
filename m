Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2315.1623372722461452117
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 17:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=L4dl241Y;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15B0q1W8072802;
	Thu, 10 Jun 2021 19:52:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623372721;
	bh=TYufwRXEvdFJxTH2wx2EaWKxITqTVDPQL9q96N0UZ2k=;
	h=Subject:From:To:CC:References:Date:In-Reply-To;
	b=L4dl241YgWoUTDLaTyEa02TXdCbIZCXvfniLdfxYWu4tQCYB6QGmC+E1LEsNPuqgM
	 Drm0/IGJ77mh+k6YwCd9OrS9y87xT/xLJMJrBK1dPBVoxpYrA4MVai7kZWVtlGnTDT
	 dKJJ+jrSZLn1uPNhzCMyBg5QYr/f2yHBBX7FnVLw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15B0q1KC049317
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Jun 2021 19:52:01 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 10
 Jun 2021 19:52:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 10 Jun 2021 19:52:01 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15B0q0Ro077304;
	Thu, 10 Jun 2021 19:52:01 -0500
Subject: Re: [dunfell/master PATCHv2 1/5] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
From: "praneeth" <praneeth@ti.com>
To: Lukas Wunner <lukas@wunner.de>
CC: Yogesh Siraswar <yogeshs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210609005055.7975-1-praneeth@ti.com>
 <20210609005055.7975-2-praneeth@ti.com> <20210610191655.GA9160@wunner.de>
 <1875b7da-b906-0faa-1ccd-5ab19bcbb516@ti.com>
Message-ID: <d9b46314-e0c1-e7d0-0399-180d929656f4@ti.com>
Date: Thu, 10 Jun 2021 19:52:00 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1875b7da-b906-0faa-1ccd-5ab19bcbb516@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 15B0q1W8072802
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 6/10/2021 4:58 PM, Bajjuri, Praneeth wrote:
>=20
>=20
> On 6/10/2021 2:16 PM, Lukas Wunner wrote:
>> On Tue, Jun 08, 2021 at 07:50:51PM -0500, Praneeth Bajjuri=20
>> <praneeth@ti.com> wrote:
>>> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>>> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>>> @@ -2,8 +2,8 @@ require u-boot-ti.inc
>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>> "file://Licenses/README;md5=3D5a7450c57ffe5ae63fd732446b988025"
>>> -PR =3D "r6"
>>> +PR =3D "r7"
>>> =C2=A0 BRANCH =3D "ti-u-boot-2021.01"
>>> -SRCREV =3D "a6e78929575b6969c15ced9685441fc430ee9510"
>>> +SRCREV =3D "c66dd9b8467472278803c2426098a2828c93ebcc"
>>
>> Unfortunately this change breaks booting on AM64 EVM.
>> No output whatsoever on the serial console (port 0 of the FTDI).
>> Reverting to SRCREV =3D "a6e78929575b..." made booting work again.
>>
>> Let me know if you want me to bisect or test anything specific.
>>
>> On the plus side, PRU Ethernet seems to work out of the box with
>> the latest changes on the dunfell branch, which is great.
>=20
> Thanks for the input Lukas, Will investigate the boot issue further

This should fix the boot issue. I just verified:
Ref: https://lists.yoctoproject.org/g/meta-ti/message/13831

>=20
>>
>> Thanks,
>>
>> Lukas
>>

Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1B7C636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 18:02:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1010.1676052140231323532
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 10:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=ZRxQIlia;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31AI2HAq129680;
	Fri, 10 Feb 2023 12:02:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676052137;
	bh=3LZRqsMGq26zqqcJE6bwH7I3anLK8SnKojdu0aRR+Jg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZRxQIliaAGHft1oxeZGky812bYzuIaCe3hUdXOU9vKZnJqC4/OpGJ0wF0iNARAVzz
	 Bi/dmUzjdFjK/AIAIHXpA+HfOBUAxD5lzgiAglGfZdjP7HSbupJNDyeU/CecF4QkRr
	 oyV4R8dELfh2Fk02VN146FNDVlYb1Cn1WGSGY1CM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31AI2HHO091474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Feb 2023 12:02:17 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Feb 2023 12:02:17 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Feb 2023 12:02:17 -0600
Received: from [10.247.29.106] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31AI2Hto000392;
	Fri, 10 Feb 2023 12:02:17 -0600
Message-ID: <9099add0-5aa8-bacb-31d4-ce26f5e7d2c9@ti.com>
Date: Fri, 10 Feb 2023 12:02:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [meta-ti] [dunfell][PATCH] conf: machine: am62xx-lp-evm: Add OLDI
 Panel overlay
Content-Language: en-US
To: <a-bhatia1@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: Meta-TI List <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
References: <20230210035401.21933-1-a-bhatia1@ti.com>
 <1742874450C62782.14601@lists.yoctoproject.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <1742874450C62782.14601@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 31AI2HAq129680
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 18:02:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15795



On 2/10/2023 11:38 AM, praneeth via lists.yoctoproject.org wrote:
>=20
>=20
> On 2/9/2023 9:54 PM, Aradhya Bhatia via lists.yoctoproject.org wrote:
>> Add the Microtips OLDI Panel DT overlay for AM62 LP SK.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>


>> ---
>> =C2=A0 conf/machine/am62xx-lp-evm.conf | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/conf/machine/am62xx-lp-evm.conf=20
>> b/conf/machine/am62xx-lp-evm.conf
>> index 3230b84df90e..5efca18d1af0 100644
>> --- a/conf/machine/am62xx-lp-evm.conf
>> +++ b/conf/machine/am62xx-lp-evm.conf
>> @@ -11,6 +11,7 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-skeleton.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk-lpmdemo.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk-csi2-ov5640.dtbo \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-lp-sk-oldi-panel.dtbo \
>=20
>=20
> how about conf/machine/am62xx-evm.conf ?any reason why this panel=20
> support cannot be added on AM62 SK board?

found the patch , looks already integrated.

>=20
>=20
>=20
>> =C2=A0 "
>> =C2=A0 SPL_BINARY =3D "tispl.bin_HS"
>>
>>
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15794): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/15794
> Mute This Topic: https://lists.yoctoproject.org/mt/96869927/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695566/216=
7429/1935739249/xyzzy [praneeth@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


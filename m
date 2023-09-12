Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71ACCA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 04:55:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.18559.1694494547144462471
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 21:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=TtihwkBX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38C4tfQM043974;
	Mon, 11 Sep 2023 23:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694494542;
	bh=JutTmgKaljz50Hgg8u6O7U3rTzTp8Qb0Wvsn1teoNcc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TtihwkBXJW6F21zNduJKEqnS8Wx5PqLuGWeTA1x6qE1b0IseOftF9EgHtysx+cCD9
	 m/TZEXf5gh53/8xw5jroe9gkCppjP9Tcekf7sIylQ/1q06as71aNvE6LXtJo0Gi+HE
	 udsLTQUI+iJh6x6rj/rpfo4W5QuoZfzgU+OdjAAg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38C4tfIV066666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Sep 2023 23:55:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Sep 2023 23:55:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Sep 2023 23:55:41 -0500
Received: from [172.24.227.83] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38C4tcMY035100;
	Mon, 11 Sep 2023 23:55:39 -0500
Message-ID: <a7a82135-4cee-12c5-3324-19e14c882519@ti.com>
Date: Tue, 12 Sep 2023 10:25:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][kirkstone][PATCH v2] kernel-rdepends: Remove PRU
 Ethernet firmwares for legacy devices
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Andrew Davis <afd@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <reatmon@ti.com>, <praneeth@ti.com>, <srk@ti.com>,
        Ravi Gunasekaran
	<r-gunasekaran@ti.com>
References: <20230908114439.13213-1-r-gunasekaran@ti.com>
 <3bce9ebc-90ba-e525-67da-fda1b8ce95a4@ti.com>
 <c318dc95-5177-9bc1-645e-08feba12d7aa@ti.com>
 <20230911170552.GC3359@denix.org>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20230911170552.GC3359@denix.org>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 38C4tfQM043974
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 04:55:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16952



On 9/11/23 10:35 PM, Denys Dmytriyenko wrote:
> On Mon, Sep 11, 2023 at 09:58:23AM +0530, Ravi Gunasekaran via lists.yo=
ctoproject.org wrote:
>> Andrew,
>>
>> On 9/8/23 7:49 PM, Andrew Davis wrote:
>>> On 9/8/23 6:44 AM, Ravi Gunasekaran via lists.yoctoproject.org wrote:
>>>> Remove the PRU Ethernet firmwares from being packaged for
>>>> AM33x, AM43x and AM57x.
>>>>
>>>
>>> Commit messages should give the "why", we can read the code.
>>
>> I will provide reasoning in the v2.
>>
>>>
>>> Are we dropping support for PRUETH from these boards? I still
>>> use this, I'm sure others do too.
>>>
>>
>> PRUETH drivers for these devices are not upstreamed and PRUTETH will n=
ot
>> be supported in SDK 9.1 as well. Plan to upstream and port to SDK is s=
till
>> being worked on. So I wanted to remove these firmwares from being pack=
aged.
>=20
> So, besides PRU ETH, what about SW, HSR and PRP firmwares that are bein=
g=20
> removed here?

Ah ok. I get your perspective.

SW, HSR and PRP are different ethernet modes and they have their respecti=
ve firmwares.
In driver space, it is just PRUETH driver and it loads different types of=
 ethernet
firmware based on the configuration. I used PRUETH as an umbrella term as=
 that's what
is used in our documentation.=20

Based on Ryan's feedback on the approach to remove these firmwares,
I will reword the commit message to give this view in v2


>=20
>=20
>>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>>> ---
>>>> Changes from v1:
>>>> --------------
>>>> * Corrected the commit message.
>>>>
>>>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 ---
>>>> =C2=A0 1 file changed, 3 deletions(-)
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/=
meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>> index 266a7ef5..317ab1b1 100644
>>>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>> @@ -12,9 +12,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx=
 =3D " vpdma-fw"
>>>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D " good=
ix-fw"
>>>> =C2=A0 =C2=A0 # Add run-time dependency for PRU Ethernet firmware to=
 the rootfs
>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx =3D " prueth-fw =
prusw-fw pruhsr-fw pruprp-fw"
>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " prueth-fw p=
ruhsr-fw pruprp-fw"
>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " prueth-fw p=
ruhsr-fw pruprp-fw"
>>>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx =3D " prue=
th-fw-am65x"
>>>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm =3D " =
prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D " prue=
th-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>>
>>>> base-commit: c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f

--=20
Regards,
Ravi


Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F49BC636D4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 18:11:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.24175.1675966289854824219
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 10:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=HIgZzqki;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 319IBRqg089460;
	Thu, 9 Feb 2023 12:11:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675966287;
	bh=aNQTHxl5Hqy2T623SZTSS2tqE7mM6rkw7ItYyJsCZ7U=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=HIgZzqkiv4GxD6hPaW1Z3Sc6coFAvZQfhS04sUEw0hEWL2MJMu9ly+GFuF0mPDXEr
	 ue6jWU5QTVns8NHnQSzGHUa9G9y/XIEur/yJbZwyAv9pbE7bk7+kUWDMt2ZFfSf/ZQ
	 72+Ts083M2It5wZIsIkiaJp5SeO/KqFIXcCtBduY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 319IBRFg041654
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Feb 2023 12:11:27 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 9
 Feb 2023 12:11:26 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 9 Feb 2023 12:11:27 -0600
Received: from [10.250.32.173] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 319IBQPB128951;
	Thu, 9 Feb 2023 12:11:26 -0600
Message-ID: <17efc687-0d8b-3ece-ee1c-bc42926d7bbd@ti.com>
Date: Thu, 9 Feb 2023 12:11:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][master/kirkstone][PATCH 6/8] ti-rtos-firmware: Use a
 table instead of a list of copy commands
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230207234239.30720-1-afd@ti.com>
 <20230207234239.30720-6-afd@ti.com>
 <4b7c58a4-6d44-5df9-1567-7f2e1061643c@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <4b7c58a4-6d44-5df9-1567-7f2e1061643c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 319IBRqg089460
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 18:11:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15774

On 2/9/23 7:29 AM, Ryan Eatmon wrote:
>=20
>=20
> On 2/7/2023 17:42, Andrew Davis wrote:
>> Using a table makes it easier to see what firmware is included with
>> each machine build. It also helps prevent errors here.
>=20
> I like the table.=C2=A0 It makes it clearer to see what is available on=
 which platform.=C2=A0 Nice change.
>=20
>> Since the same functions run across machines we now sign all the firmw=
are
>> without needing to add a new signing function for each new machine.
>>
>> Another fix is that we install the DM firmware to the deploy directory
>> for all machines that use need it. This was added for J7x machines
>> but missed for AM62x.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>=20
> *snip*
>=20
>> +
>> +ETH_FW_LIST =3D ""
>> +ETH_FW_LIST:am65xx =3D ""
>> +ETH_FW_LIST:j721e =3D=C2=A0 "${ETH_FW}"
>> +ETH_FW_LIST:j7200 =3D=C2=A0 "${ETH_FW}"
>> +ETH_FW_LIST:j721s2 =3D "${ETH_FW}"
>=20
> j721s2 does not have the ETH_FW, so this line is incorrect.=C2=A0 The l=
ines that likely made you think it did are commented out in the current v=
ersion of the file.
>=20

Ah, looks like the commented out line did get me here.

Better question is why my build testing didn't catch that,
have to check on that..

Anyway, could you fix this locally? Or I can send a delta
fix patch, or just respin the whole series, up to you.

Andrew

>=20
>> +ETH_FW_LIST:am64xx =3D ""
>> +ETH_FW_LIST:am62xx =3D ""
>> +ETH_FW_LIST:j784s4 =3D "${ETH_FW}"
>=20
>=20


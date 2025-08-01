Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882CCC87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:24:05 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.89018.1754058237119378425
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 07:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=FCWccgsS;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571ENuWa3290776;
	Fri, 1 Aug 2025 09:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754058236;
	bh=grkp7hQMC1wq4147OXury+FkQoGgzoU8cswahNRPIHg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FCWccgsSeHarzy0HHP0tzMjTV0+l/U3rltXGwtImvtnxc/qDTIllDvvfucVvy3AzU
	 3Bd4PQkNTXLXp5r9YISqLaqUVJVUTDGGOEjmchoDCP9z+7cjA3BUG+fn/KmRIDetMV
	 uhxcf4beHxav3IDB9TcRqUz/FmFg7AcdrvYtnMSw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571ENtdM601374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 09:23:55 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 09:23:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 09:23:55 -0500
Received: from [10.249.139.51] ([10.249.139.51])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571ENqjM208721;
	Fri, 1 Aug 2025 09:23:53 -0500
Message-ID: <f7d3899b-0dce-47a1-bc01-b021b5a4cdd4@ti.com>
Date: Fri, 1 Aug 2025 19:53:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH 2/2] ti-pka-fw: Update license to PKA-FW
To: Ryan Eatmon <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250801044441.1059527-1-b-padhi@ti.com>
 <20250801044441.1059527-3-b-padhi@ti.com>
 <efed6ef2-d85b-4915-a410-c313beb30641@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <efed6ef2-d85b-4915-a410-c313beb30641@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 571ENuWa3290776
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 14:24:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18873


On 8/1/2025 6:02 PM, Ryan Eatmon wrote:
>
>
> On 7/31/2025 11:44 PM, Beleswar Padhi wrote:
>> The PKA-FW license has been added to meta-ti. Point to that license in
>> the PKA firmware recipe.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb=20
>> b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
>> index 49ae0251..bd31726c 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
>> @@ -1,7 +1,7 @@
>> =C2=A0 SUMMARY =3D "PKA prebuilt binary firmware image"
>> =C2=A0 -LICENSE =3D "TI-TFL & INSIDE Secure"
>> -LIC_FILES_CHKSUM =3D=20
>> "file://LICENCE.pka_fw;md5=3Ddc20391b287874f0dce069cf87917206"
>> +LICENSE =3D "PKA-FW"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://${THISDIR}/../../licenses/PKA-FW;md5=3D251316268d8e7d1a546e5e6=
a08af6d9c"
>> =C2=A0 =C2=A0 COMPATIBLE_MACHINE =3D "k3"
>
> Don't we need BOTH TI_TFL and PKA-FW?=C2=A0 Or are you thinking that si=
nce=20
> the license file contains both that covers it?
>
>

Yes, the PKA-FW License contains both TFL and Inside secure copyrights.

Thanks,
Beleswar



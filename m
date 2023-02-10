Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794CBC61DA4
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 01:46:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3429.1675993573300376874
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 17:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Gs8jMHrD;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31A1kBLK129653;
	Thu, 9 Feb 2023 19:46:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675993572;
	bh=13nGve68qeM9SnJUKlQnblWYrwM05/BhKdXX8clL/K4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Gs8jMHrDkYd7MLW8tQyxa5nT2TX235eJK0aiV1cpYOoBKyksfhfYb7t0v/JDL33N/
	 w58/mb0Y5CWzet6OzgmrofIKWBmRJ305eVcKe/9s6FzGQZWQURDZ8nNH5JXtKYO7b4
	 MzbQzjSkAxxfOwxOM60l7ZRMyn4Mp4C0TTN++VMg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31A1kBPo028178
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Feb 2023 19:46:11 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 9
 Feb 2023 19:46:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 9 Feb 2023 19:46:11 -0600
Received: from [10.249.38.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31A1kBu5099057;
	Thu, 9 Feb 2023 19:46:11 -0600
Message-ID: <c4d159cd-bf60-9dc2-ddc0-3c632926d5a8@ti.com>
Date: Thu, 9 Feb 2023 19:46:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][master/kirkstone][PATCH 6/8] ti-rtos-firmware: Use a
 table instead of a list of copy commands
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230207234239.30720-1-afd@ti.com>
 <20230207234239.30720-6-afd@ti.com>
 <4b7c58a4-6d44-5df9-1567-7f2e1061643c@ti.com>
 <17efc687-0d8b-3ece-ee1c-bc42926d7bbd@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17efc687-0d8b-3ece-ee1c-bc42926d7bbd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 31A1kBLK129653
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 01:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15788



On 2/9/2023 12:11, Andrew Davis wrote:
> On 2/9/23 7:29 AM, Ryan Eatmon wrote:
>>
>>
>> On 2/7/2023 17:42, Andrew Davis wrote:
>>> Using a table makes it easier to see what firmware is included with
>>> each machine build. It also helps prevent errors here.
>>
>> I like the table.=C2=A0 It makes it clearer to see what is available o=
n=20
>> which platform.=C2=A0 Nice change.
>>
>>> Since the same functions run across machines we now sign all the=20
>>> firmware
>>> without needing to add a new signing function for each new machine.
>>>
>>> Another fix is that we install the DM firmware to the deploy director=
y
>>> for all machines that use need it. This was added for J7x machines
>>> but missed for AM62x.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>
>> *snip*
>>
>>> +
>>> +ETH_FW_LIST =3D ""
>>> +ETH_FW_LIST:am65xx =3D ""
>>> +ETH_FW_LIST:j721e =3D=C2=A0 "${ETH_FW}"
>>> +ETH_FW_LIST:j7200 =3D=C2=A0 "${ETH_FW}"
>>> +ETH_FW_LIST:j721s2 =3D "${ETH_FW}"
>>
>> j721s2 does not have the ETH_FW, so this line is incorrect.=C2=A0 The =
lines=20
>> that likely made you think it did are commented out in the current=20
>> version of the file.
>>
>=20
> Ah, looks like the commented out line did get me here.
>=20
> Better question is why my build testing didn't catch that,
> have to check on that..
>=20
> Anyway, could you fix this locally? Or I can send a delta
> fix patch, or just respin the whole series, up to you.

I can fix it locally.  If this is the only issue, then I have no=20
problems fixing it.

> Andrew
>=20
>>
>>> +ETH_FW_LIST:am64xx =3D ""
>>> +ETH_FW_LIST:am62xx =3D ""
>>> +ETH_FW_LIST:j784s4 =3D "${ETH_FW}"
>>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.4730.1608070575576940606
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 14:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=aamtgpOS;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFMGCZm124126;
	Tue, 15 Dec 2020 16:16:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608070572;
	bh=iuhkORCHopo/kUc9AsLhRQVlVJVPlZFcao9jdrSH5gw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=aamtgpOSVy1ICaIFMaNpsIwbtwB2aladO7fgiTLOF/JWHQ3f+CoJoci3LWedxlbr6
	 QNUtUG8FqK+oitge7FnodC8XstjRGuzUMI1hEh+ypHyeG72VHq0MA6EhKrq9ZTvyQ7
	 17jPD9gRI/7P/MHeubkBwj0K+25lioRUd7ivYWFU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFMGCk2024864
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Dec 2020 16:16:12 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 16:16:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 16:16:11 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFMGBRk091406;
	Tue, 15 Dec 2020 16:16:11 -0600
Subject: Re: [meta-ti] [dunfell/master PATCH V2] trusted-firmware-a: Update SRCREV to pick latest
To: "Bajjuri, Praneeth" <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Dave Gerlach
	<d-gerlach@ti.com>, Nishanth Menon <nm@ti.com>
References: <8c5b53d9-8c01-ff9e-12c6-03a7e2c13dc6@ti.com>
 <20201215205138.27986-1-praneeth@ti.com>
 <b5a69301-1b9b-c549-9426-f568bccff39d@ti.com>
 <bf4ed182-3c78-7c63-052d-014da1f4f680@ti.com>
 <cc97983c-848e-c8e2-4c23-17aee5df2f6d@ti.com>
 <20201215212931.GM24670@denix.org>
 <e2c68c41-ddb6-097f-7c90-9145afe77037@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <1ef38c0c-0a80-ebee-ff70-4081b01d5131@ti.com>
Date: Tue, 15 Dec 2020 16:16:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e2c68c41-ddb6-097f-7c90-9145afe77037@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 0BFMGCZm124126
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Praneeth

On 12/15/20 4:07 PM, Bajjuri, Praneeth wrote:
>
>
> On 12/15/2020 3:29 PM, Denys Dmytriyenko wrote:
>> On Tue, Dec 15, 2020 at 03:04:16PM -0600, Dan Murphy via=20
>> lists.yoctoproject.org wrote:
>>> Praneeth
>>>
>>> On 12/15/20 2:59 PM, Bajjuri, Praneeth wrote:
>>>>
>>>>
>>>> On 12/15/2020 2:53 PM, Dan Murphy wrote:
>>>>> Praneeth
>>>>>
>>>>> On 12/15/20 2:51 PM, praneeth@ti.com wrote:
>>>>>> From: Praneeth Bajjuri <praneeth@ti.com>
>>>>>>
>>>>>> Update SRCREV to pick latest that includes AM64 support
>>>>>
>>>>> You are doing just a bit more then this.=C2=A0 What is the "lite" f=
or now?
>>>>
>>>> Thats the new target name for AM64
>>>>
>>>> Ref:=20
>>>> https://git.ti.com/cgit/atf/arm-trusted-firmware/commit/?h=3Dti-atf&=
id=3D65dd16b4ea5032752af62e94ca64cff41733a123
>>>>
>>>>
>>>> TARGET_BOARD=3Dlite for AM64
>>>> TARGET_BOARD=3Dgeneric (default for other devices)
>>>> defined at conf/machine/include/k3.inc
>>>>
>>> Thanks.=C2=A0 Now if we can just get that in the commit message excep=
t
>>> for the URL target
>>
>> Probably better to set TFA_BOARD =3D "lite" in the corresponding=20
>> am64xx-evm.conf
>> machine config...
>
> Can i move it to conf/machine/include/am64xx.inc instead ? please advis=
e.
>
> Will submit v4 accordingly
>
If it is common for all/any am64 processors then it belong in that=20
include file

Dan


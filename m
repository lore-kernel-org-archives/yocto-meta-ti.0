Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4574.1608070071385920267
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 14:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=SuWg/6tH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFM7m56127845;
	Tue, 15 Dec 2020 16:07:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608070068;
	bh=keBDVAf6VBhcpg0y68FwuyioUscHqlsTSIg2S22QpoM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=SuWg/6tHMXz3Sc+VlJKACsPsiHKpygVIIQbeyJTIpWltlttq2TgXLvmGmhfMaJ8Y5
	 3HJA0jWMqk80KK0i5ViawVogTPbf0qiBIrwOYjiqpMpgER2b+wP5tvgvVhRBGzyAKB
	 t1b5+NYHRDFUohDkzt0jHbId7EEkDveTZSNsIaF0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFM7mEE095297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Dec 2020 16:07:48 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 16:07:47 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 16:07:47 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFM7lE5000420;
	Tue, 15 Dec 2020 16:07:47 -0600
Subject: Re: [meta-ti] [dunfell/master PATCH V2] trusted-firmware-a: Update SRCREV to pick latest
To: Denys Dmytriyenko <denis@denix.org>, <dmurphy@ti.com>
CC: Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Dave Gerlach
	<d-gerlach@ti.com>, Nishanth Menon <nm@ti.com>
References: <8c5b53d9-8c01-ff9e-12c6-03a7e2c13dc6@ti.com>
 <20201215205138.27986-1-praneeth@ti.com>
 <b5a69301-1b9b-c549-9426-f568bccff39d@ti.com>
 <bf4ed182-3c78-7c63-052d-014da1f4f680@ti.com>
 <cc97983c-848e-c8e2-4c23-17aee5df2f6d@ti.com>
 <20201215212931.GM24670@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <e2c68c41-ddb6-097f-7c90-9145afe77037@ti.com>
Date: Tue, 15 Dec 2020 16:07:47 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215212931.GM24670@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 0BFM7m56127845
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 12/15/2020 3:29 PM, Denys Dmytriyenko wrote:
> On Tue, Dec 15, 2020 at 03:04:16PM -0600, Dan Murphy via lists.yoctopro=
ject.org wrote:
>> Praneeth
>>
>> On 12/15/20 2:59 PM, Bajjuri, Praneeth wrote:
>>>
>>>
>>> On 12/15/2020 2:53 PM, Dan Murphy wrote:
>>>> Praneeth
>>>>
>>>> On 12/15/20 2:51 PM, praneeth@ti.com wrote:
>>>>> From: Praneeth Bajjuri <praneeth@ti.com>
>>>>>
>>>>> Update SRCREV to pick latest that includes AM64 support
>>>>
>>>> You are doing just a bit more then this.=C2=A0 What is the "lite" fo=
r now?
>>>
>>> Thats the new target name for AM64
>>>
>>> Ref: https://git.ti.com/cgit/atf/arm-trusted-firmware/commit/?h=3Dti-=
atf&id=3D65dd16b4ea5032752af62e94ca64cff41733a123
>>>
>>>
>>> TARGET_BOARD=3Dlite for AM64
>>> TARGET_BOARD=3Dgeneric (default for other devices)
>>> defined at conf/machine/include/k3.inc
>>>
>> Thanks.=C2=A0 Now if we can just get that in the commit message except
>> for the URL target
>=20
> Probably better to set TFA_BOARD =3D "lite" in the corresponding am64xx=
-evm.conf
> machine config...

Can i move it to conf/machine/include/am64xx.inc instead ? please advise.

Will submit v4 accordingly


>=20

Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3073.1608066259338238554
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 13:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=hecyMcQD;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFL4ICa106626
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Dec 2020 15:04:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608066258;
	bh=sAX29/xO0T2TS/Xb4PkUbk8HNTvg2AFHCX2LZ3gStls=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=hecyMcQDtCoK4KL6fZN1Fs6AMEolcsPCOtqH8sN1vt+yR01MDS3xY4pq/nO5iQZeg
	 STNUjLCJ0pGum56f0gRb9jQ7C4M+OQTG0w+g1CgltPfLIN8I+WD7ruY5gXez97qBa0
	 AZW5bzWNShNSJDKgreWRm2l/jsufgboeMiYNodaQ=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFL4IRS047630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Dec 2020 15:04:18 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 15:04:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 15:04:18 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFL4HDr091499;
	Tue, 15 Dec 2020 15:04:17 -0600
Subject: Re: [dunfell/master PATCH V2] trusted-firmware-a: Update SRCREV to pick latest
To: "Bajjuri, Praneeth" <praneeth@ti.com>
CC: Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Dave Gerlach
	<d-gerlach@ti.com>, Nishanth Menon <nm@ti.com>
References: <8c5b53d9-8c01-ff9e-12c6-03a7e2c13dc6@ti.com>
 <20201215205138.27986-1-praneeth@ti.com>
 <b5a69301-1b9b-c549-9426-f568bccff39d@ti.com>
 <bf4ed182-3c78-7c63-052d-014da1f4f680@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <cc97983c-848e-c8e2-4c23-17aee5df2f6d@ti.com>
Date: Tue, 15 Dec 2020 15:04:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bf4ed182-3c78-7c63-052d-014da1f4f680@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 0BFL4ICa106626
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Praneeth

On 12/15/20 2:59 PM, Bajjuri, Praneeth wrote:
>
>
> On 12/15/2020 2:53 PM, Dan Murphy wrote:
>> Praneeth
>>
>> On 12/15/20 2:51 PM, praneeth@ti.com wrote:
>>> From: Praneeth Bajjuri <praneeth@ti.com>
>>>
>>> Update SRCREV to pick latest that includes AM64 support
>>
>> You are doing just a bit more then this.=C2=A0 What is the "lite" for =
now?
>
> Thats the new target name for AM64
>
> Ref:=20
> https://git.ti.com/cgit/atf/arm-trusted-firmware/commit/?h=3Dti-atf&id=3D=
65dd16b4ea5032752af62e94ca64cff41733a123=20
>
>
> TARGET_BOARD=3Dlite for AM64
> TARGET_BOARD=3Dgeneric (default for other devices)
> defined at conf/machine/include/k3.inc
>
Thanks.=C2=A0 Now if we can just get that in the commit message except fo=
r=20
the URL target

Dan



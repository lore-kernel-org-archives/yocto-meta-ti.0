Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.11472.1607814391493329215
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 12 Dec 2020 15:06:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=ZURY6x/W;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BCN6UYU021276
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 17:06:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607814390;
	bh=qzFbF3VOWtb6xZ9QcTI2B5cfLRcahThKCTdaglNApLs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=ZURY6x/WAqmnYcJ8VAjXaVGBO4q+5Zsef2QjcyqWfUM9hYkEFVyoH+4Knjy+tUpOg
	 ZBV1S2901v3pTK26i/ZQp5VxSr6ldtEazh9icQjrnl2TWqafvUWNNsHTLb+05LSGoK
	 xaw73JlmPnJ0y52Q+ynOzpcy9ED+qfidtTRsrKRY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BCN6UZr080301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 17:06:30 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 12
 Dec 2020 17:06:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 12 Dec 2020 17:06:30 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BCN6TkX005540;
	Sat, 12 Dec 2020 17:06:30 -0600
Subject: Re: [dunfell/master PATCH] trusted-firmware-a: Update SRCREV to pick latest
To: Suman Anna <s-anna@ti.com>, <praneeth@ti.com>
CC: Nishanth Menon <nm@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20201212212332.11836-1-praneeth@ti.com>
 <007b11f6-f4eb-bd23-b60a-b970d3245002@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <8c5b53d9-8c01-ff9e-12c6-03a7e2c13dc6@ti.com>
Date: Sat, 12 Dec 2020 17:06:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <007b11f6-f4eb-bd23-b60a-b970d3245002@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 0BCN6UYU021276
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello

On 12/12/20 4:09 PM, Suman Anna wrote:
> Hi Praneeth,
>
> On 12/12/20 3:23 PM, praneeth@ti.com wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Update SRCREV to pick latest that includes AM64 support
> This by itself will not be enough for AM64, but that can be an add-on p=
atch.
> Need to account for TARGET_BOARD=3Dlite for AM64x.

Is this something that needs to be added to the recipe.=C2=A0 To be hones=
t I=20
have not yet reviewed the ATF patches to know

Dan


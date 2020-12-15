Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3083.1608065994317705386
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 12:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=X4UdaeJm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFKxrlO098167
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Dec 2020 14:59:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608065993;
	bh=vn+TQrRtiRoPMcVX4R/3owe4VmsLpjTSat2249di3NY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=X4UdaeJm0tpLLa8TieVhBW6UfraXWzcAMmIKYC5U1mhBd33ogqT8EboIPR3q4t833
	 B6aoEb7wTQ2iuYv9JAyc5r67lXIwCKq7b6J6pu+zp3IAi4NbnpR2pUQZJn4S5oGcHM
	 bEHGJ9kGEfUOZ9Fc9Rr+74wLgd/kj6gXzhXSjobE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFKxr0T129873
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Dec 2020 14:59:53 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 14:59:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 14:59:53 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFKxrcQ082055;
	Tue, 15 Dec 2020 14:59:53 -0600
Subject: Re: [dunfell/master PATCH V2] trusted-firmware-a: Update SRCREV to pick latest
To: Dan Murphy <dmurphy@ti.com>
CC: Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Dave Gerlach
	<d-gerlach@ti.com>, Nishanth Menon <nm@ti.com>
References: <8c5b53d9-8c01-ff9e-12c6-03a7e2c13dc6@ti.com>
 <20201215205138.27986-1-praneeth@ti.com>
 <b5a69301-1b9b-c549-9426-f568bccff39d@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <bf4ed182-3c78-7c63-052d-014da1f4f680@ti.com>
Date: Tue, 15 Dec 2020 14:59:52 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <b5a69301-1b9b-c549-9426-f568bccff39d@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 0BFKxrlO098167
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 12/15/2020 2:53 PM, Dan Murphy wrote:
> Praneeth
>=20
> On 12/15/20 2:51 PM, praneeth@ti.com wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Update SRCREV to pick latest that includes AM64 support
>=20
> You are doing just a bit more then this.=C2=A0 What is the "lite" for n=
ow?

Thats the new target name for AM64

Ref:=20
https://git.ti.com/cgit/atf/arm-trusted-firmware/commit/?h=3Dti-atf&id=3D=
65dd16b4ea5032752af62e94ca64cff41733a123=20


TARGET_BOARD=3Dlite for AM64
TARGET_BOARD=3Dgeneric (default for other devices)
defined at conf/machine/include/k3.inc


>=20
> Dan
>=20

Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1503.1601922993980212902
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 11:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=BLt5GhrP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095IaXDA064436
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601922993;
	bh=zwiNTrBNEHMjOBqgnfB4FJy68674G/odiYwVk0SNXNU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=BLt5GhrPFjTp7tA68U1r0fo7pxEXsRWKYj61UOXJsBWLzgO6KkNwg4lCnh3t864A/
	 B1wBJXLMyhsPFpwVwQUv2uPSNcfG96QdvvLJC7/eV7ZHRix99aGH94Q8/5bigReSfp
	 XNTjRr+99CYS7YFZmKKL+D2/gMe1ldnnfv67a9QM=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095IaXhA022630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:36:33 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 13:36:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 13:36:32 -0500
Received: from [10.250.37.2] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095IaWQe126732;
	Mon, 5 Oct 2020 13:36:32 -0500
Subject: Re: [PATCH] prueth-fw-am65x-sr2: Updating firmware to 02.02.07.02
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20201005182648.21308-1-dmurphy@ti.com>
 <20201005183409.GN7434@beryl>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <b863ba83-b520-08e4-7761-679fadd70391@ti.com>
Date: Mon, 5 Oct 2020 13:36:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005183409.GN7434@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 095IaXDA064436
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Denys

On 10/5/20 1:34 PM, Denys Dmytriyenko wrote:
> On Mon, Oct 05, 2020 at 01:26:48PM -0500, Dan Murphy wrote:
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipe=
s-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>> index 6e17c4aa5c7c..b4d7ae8b2576 100644
>> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>> @@ -3,7 +3,7 @@ SUMMARY =3D "PRU Ethernet firmware for AM65xx SR2.0"
>>   LICENSE =3D "TI-TFL"
>>   LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf956212592=
88c4a46d76"
>>  =20
>> -PV =3D "2.2.0.1+2.2.0.2-rc1"
>> +PV =3D "02.02.07.02+02.02.07.02-rc1"
> This is not an RC, I believe it is final 2.2.7.2 or 02.02.07.02:
>
> +PV =3D "02.02.07.02"

Yes this is 02.02.07.02 final.=C2=A0 Wasn't sure about the rc part.

I will send v2

Dan


Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.883.1602689961001082147
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 08:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=g5k89vkA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09EFdKH3031469;
	Wed, 14 Oct 2020 10:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602689960;
	bh=bXHVzhfSLNGdYxJ0mxW6F7g7AVKstTAEUVmYNKECeDM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=g5k89vkA0kbqUZAtgs//Lkm+WMgVMUHnBe+H/0k8UqhjAt2ePbzWaFyGJaSbihP2J
	 7aYtUy0O609NM0C+CYbtm5CmP65meMu1ubvAhJ7SDVr+s1A3YAMlZde2TRABuI8//h
	 DVJTJ04Hps0iGoiFmeaCmcP1ltPr1XRh3ohB0q58=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09EFdKV4021123
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Oct 2020 10:39:20 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 14
 Oct 2020 10:39:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 14 Oct 2020 10:39:19 -0500
Received: from [10.250.39.65] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09EFdJ3G082234;
	Wed, 14 Oct 2020 10:39:19 -0500
Subject: Re: [meta-ti] [PATCH v2] ti-pdk-fetch.bbclass: Do not emit trailing slash during S forming
To: Denys Dmytriyenko <denys@ti.com>
CC: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>
References: <20201013214911.339265-1-raj.khem@gmail.com>
 <871d4dcf-3429-16a4-e0b5-638d25404e38@ti.com> <20201014153723.GI14852@beryl>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <bb2cfb94-2756-4e46-b614-6a698b742179@ti.com>
Date: Wed, 14 Oct 2020 10:39:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014153723.GI14852@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 09EFdKH3031469
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Denys

On 10/14/20 10:37 AM, Denys Dmytriyenko wrote:
> On Wed, Oct 14, 2020 at 10:35:13AM -0500, Dan Murphy via lists.yoctopro=
ject.org wrote:
>> Khem
>>
>> On 10/13/20 4:49 PM, Khem Raj wrote:
>>> latest OE-core does not promote using trailing slash to make pseudo's
>>> life easier
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> v2: Strip slash from S if it exists
>> There were 2 patches submitted with v1.=C2=A0 Do we just drop the RTOS=
 patch now?
> Dan,
>
> I believe it is also needed.

Yes I believe it is needed as well just need Khem to confirm or resubmit=20
the series

Dan


> Denys

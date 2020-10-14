Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1302.1602690878991214373
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 08:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=CN+p9ncf;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09EFscRY049026;
	Wed, 14 Oct 2020 10:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602690878;
	bh=NEeJNcRURKVifPpSqtay0DCHp2Zr0eR3WTvOKi+qfvQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=CN+p9ncfbK44zH8x1Gpo0dIViF0GI4k7y8fU1xA+Dlf2y/4Kd1Wl/QhYfVMI2rWaa
	 Nh9Zx+oo6tvr61qcEluPOUD6yYIC6X5jOw5EdtkFjO2LE6e1NY7KOMtS0Bu2s92Hou
	 WgRtFjmthCgaRHIqkh0O5N7FjwgqFuoFkdZmdAY4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09EFsctp039485
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Oct 2020 10:54:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 14
 Oct 2020 10:54:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 14 Oct 2020 10:54:37 -0500
Received: from [10.250.39.65] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09EFsbRS009455;
	Wed, 14 Oct 2020 10:54:37 -0500
Subject: Re: [meta-ti] [PATCH v2] ti-pdk-fetch.bbclass: Do not emit trailing slash during S forming
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20201013214911.339265-1-raj.khem@gmail.com>
 <871d4dcf-3429-16a4-e0b5-638d25404e38@ti.com>
 <CAMKF1sowVNcMN+voQ03RMdKZoBMsjXygTa3c4FDoP6sg1FK+sw@mail.gmail.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <c9454ce1-1a07-8347-59e6-00cdd48fafd6@ti.com>
Date: Wed, 14 Oct 2020 10:54:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sowVNcMN+voQ03RMdKZoBMsjXygTa3c4FDoP6sg1FK+sw@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 09EFscRY049026
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Khem

On 10/14/20 10:51 AM, Khem Raj wrote:
> On Wed, Oct 14, 2020 at 8:35 AM Dan Murphy <dmurphy@ti.com> wrote:
>> Khem
>>
>> On 10/13/20 4:49 PM, Khem Raj wrote:
>>> latest OE-core does not promote using trailing slash to make pseudo's
>>> life easier
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> v2: Strip slash from S if it exists
>> There were 2 patches submitted with v1.  Do we just drop the RTOS patc=
h now?
>>
> right you need v1 of one patch and v2 of the other. I usually update
> the series with the resent patches. If you want whole series to be
> resent I can do that.

OK.=C2=A0 I will apply them.=C2=A0 Generally when you promote a patch ver=
sion in a=20
series the full series should be promoted and re-sent.

Otherwise patches might be missed.

Dan


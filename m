Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1160.1625773041744426168
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Jul 2021 12:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hzu3DW6X;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 168JbKIh117967;
	Thu, 8 Jul 2021 14:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625773040;
	bh=Dd6eCx8gyZ/PIbJHWzm5LAKv7aqEUVNs6212yDgsqI4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=hzu3DW6XDYP+c/b+PSddpXog82+8vL8a1rIoSk9XUtoA4xEj70hJuHJWHKsJW8678
	 g6QuYylp7TJKea6ydRDdh1GjWWoMsDE7JmIesH6xSmtatElBCUKTAHeCLI5s/OOqMd
	 uLJoaaEKXDDLBDGWpSVdN573hxbB9ApNr20YpvNQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 168JbK3s030191
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jul 2021 14:37:20 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 14:37:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Jul 2021 14:37:20 -0500
Received: from [10.250.32.9] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 168JbJeb032553;
	Thu, 8 Jul 2021 14:37:20 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH 4/4] ti-sci-fw: Update linux firmware repo to 08.00.00.002
To: Nishanth Menon <nm@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210708051232.10077-1-yogeshs@ti.com>
 <20210708051232.10077-5-yogeshs@ti.com>
 <20210708133249.pf7q5gy4bpeyly6e@straw>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <5fe7483f-cc7c-eb26-6096-1d372295fd0b@ti.com>
Date: Thu, 8 Jul 2021 14:37:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210708133249.pf7q5gy4bpeyly6e@straw>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/8/21 8:32 AM, Nishanth Menon wrote:
> On 05:12-20210708, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> Update linux firmware repo to 08.00.00.002
>>
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> index 96604282..acd5ce8f 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>>   
>>   PV = "2021.05"
>>   
>> -SRCREV = "1e73d9387980f4d425742738968e55395c19e26c"
>> +SRCREV = "b280fb4da1a200489b7bc5c1a23f74dd065a6f30"
>>   BRANCH ?= "ti-linux-firmware"
>>   SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
>>   SRCREV_FORMAT = "imggen"
> 
> 
> I am not sure I understand how
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=db51751356e9266b330f7a3246c0a8c0d3531757
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=b280fb4da1a200489b7bc5c1a23f74dd065a6f30

There are individual ti-eth and ti-ipc recipes to pick this up. Recipe 
owners needs to send the updated patch. This needs to be completely 
re-structured for 8.1. We are just updating the commit-id that is being 
tagged for 8.0.

> 
> will be picked up if we only update tisci-fw for
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=078be7fcea7e5a1f34c1cd7e6de244c89052aad6
> 
> 

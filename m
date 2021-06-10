Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.495.1623362284119371699
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 14:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oQlQVjrQ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15ALw2RW094932;
	Thu, 10 Jun 2021 16:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623362282;
	bh=yc8qqC/KZC8i++QUnmCRBMKh03oRu/nB1zNv0V8wHQM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=oQlQVjrQyP69c9WYhTjj9oIJPsD9J0PIgFFFV9pIfCwYoJVFS5jIWnvP6n4fDTgPk
	 LUGLE/kI/YmONFXxv49GBTujPDXIQK8sQdTuiZ7iD3CwjE8eTtCTmctIgIGNC1b8pT
	 b8aCkhQCxCIr/G8wfSectecHY2StPGWDk5DxEY28=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15ALw2et101520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Jun 2021 16:58:02 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 10
 Jun 2021 16:58:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 10 Jun 2021 16:58:01 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15ALw1sD095314;
	Thu, 10 Jun 2021 16:58:01 -0500
Subject: Re: [dunfell/master PATCHv2 1/5] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
To: Lukas Wunner <lukas@wunner.de>
CC: Yogesh Siraswar <yogeshs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210609005055.7975-1-praneeth@ti.com>
 <20210609005055.7975-2-praneeth@ti.com> <20210610191655.GA9160@wunner.de>
From: "praneeth" <praneeth@ti.com>
Message-ID: <1875b7da-b906-0faa-1ccd-5ab19bcbb516@ti.com>
Date: Thu, 10 Jun 2021 16:58:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610191655.GA9160@wunner.de>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/10/2021 2:16 PM, Lukas Wunner wrote:
> On Tue, Jun 08, 2021 at 07:50:51PM -0500, Praneeth Bajjuri <praneeth@ti.com> wrote:
>> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>> @@ -2,8 +2,8 @@ require u-boot-ti.inc
>>   
>>   LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>>   
>> -PR = "r6"
>> +PR = "r7"
>>   
>>   BRANCH = "ti-u-boot-2021.01"
>>   
>> -SRCREV = "a6e78929575b6969c15ced9685441fc430ee9510"
>> +SRCREV = "c66dd9b8467472278803c2426098a2828c93ebcc"
> 
> Unfortunately this change breaks booting on AM64 EVM.
> No output whatsoever on the serial console (port 0 of the FTDI).
> Reverting to SRCREV = "a6e78929575b..." made booting work again.
> 
> Let me know if you want me to bisect or test anything specific.
> 
> On the plus side, PRU Ethernet seems to work out of the box with
> the latest changes on the dunfell branch, which is great.

Thanks for the input Lukas, Will investigate the boot issue further

> 
> Thanks,
> 
> Lukas
> 

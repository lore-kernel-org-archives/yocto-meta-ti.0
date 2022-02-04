Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.14661.1644006056019087619
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 12:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EcO48i8o;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 214KKqQ0014698;
	Fri, 4 Feb 2022 14:20:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644006052;
	bh=Cllg/iUlslNQgVmNnvDVwCcxvcJ4krfgR7mKe25/Ht0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EcO48i8oScw1CUAxgaTokswCzq3/GWydvDpMrKU/rrnYUMRoEaoxxFsWzz3KcU4VJ
	 HvjCQKfwqWRlhd9gfVzGhglJKH4Ah3sQPKHaNAeZManiEToQm1vPGc633Yah6tQtbI
	 Nqm4QJLS5iqZ5Xw+3yhPE61/GXXx0X7xO2D5obt4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 214KKqwV031796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Feb 2022 14:20:52 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Feb 2022 14:20:51 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Feb 2022 14:20:51 -0600
Received: from [10.249.37.55] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 214KKpFq104828;
	Fri, 4 Feb 2022 14:20:51 -0600
Message-ID: <7ee94c1d-3263-bb76-25a2-5ca989cd5cba@ti.com>
Date: Fri, 4 Feb 2022 14:20:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [meta-ti][dunfell][PATCH] cnm-wave-fw: lock the compatiable machine to j721s2
To: Denys Dmytriyenko <denis@denix.org>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220203030842.20992-1-reatmon@ti.com>
 <20220203182709.GK26229@denix.org>
From: "Ryan Eatmon" <reatmon@ti.com>
In-Reply-To: <20220203182709.GK26229@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

I was trying to leave it open for a future j721s2-hs-evm.  I can make it 
more... verbose if required.

On 2/3/2022 12:27, Denys Dmytriyenko wrote:
> This patch is incorrect - see below.
> 
> 
> On Wed, Feb 02, 2022 at 09:08:42PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The orignal recipe listed the compatible platforms to
>> all of j7, but at this time it is limited to j721s2.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 2 +-
>>   recipes-kernel/linux/kernel-rdepends.inc   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> index 3dd0f4f4..0f09dbb6 100644
>> --- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> +++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> @@ -13,7 +13,7 @@ PR = "${INC_PR}.1"
>>   
>>   CLEANBROKEN = "1"
>>   
>> -COMPATIBLE_MACHINE = "j7"
>> +COMPATIBLE_MACHINE = "j721s2"
> 
> There were no j721s2 SoC family defined, only j721s2-evm and j721s2-evm-k3r5
> machines.
> 
> 
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
>> index 2a6302af..adcf967a 100644
>> --- a/recipes-kernel/linux/kernel-rdepends.inc
>> +++ b/recipes-kernel/linux/kernel-rdepends.inc
>> @@ -44,4 +44,4 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
>>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
>>   
>>   # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
>> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cnm-wave-fw"
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2 = " cnm-wave-fw"
> 
> Same here.
> 

-- 
Ryan Eatmon
reatmon@ti.com

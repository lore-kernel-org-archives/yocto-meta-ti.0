Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1697.1580499939158780823
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H19t6Kw4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJjcpC119543
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:45:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580499938;
	bh=sX4jAJeNGl4XihbaqSNwsnYmGSKJK5ynHGsHsmz/eTE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=H19t6Kw4fCPT5+i7dISZxHrYegFd/i94lg0aVu7sI89EZblgyKAhPsj154UMVbb37
	 QOm+0NI64vLyueCbTt2d1jtgawUYghDZFMM0mZvEeZ8PZ9O5v+8u+RdBkAWtmQUVdu
	 nNcLyHpfSQ8XCPYo74WqcDPUwpq0DQtjoJF83xiU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VJjcOX068327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:45:38 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:45:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:45:38 -0600
Received: from [10.250.70.160] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJjb45079862;
	Fri, 31 Jan 2020 13:45:37 -0600
Subject: Re: [meta-ti][master][RFC] recipes-graphics: Enable SGX drivers for Beagleboard and Pandaboard
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200131192520.29950-1-afd@ti.com> <20200131193941.GF23242@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <af0e006e-a7f8-8e1f-d4b6-81786b5f43ba@ti.com>
Date: Fri, 31 Jan 2020 14:45:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131193941.GF23242@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/31/20 2:39 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 31, 2020 at 02:25:20PM -0500, Andrew F. Davis wrote:
>> These boards have SGX GPUs but do not build as this recipe is not
>> compatible with them, add compatibles for these machines.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>
>> Currently and RFC until I can get these binaries pushed to the
>> git.ti.com/graphics/omap5-sgx-ddk repos.
>>
>> Tested working locally on latest with a Beagleboard and a Pandaboard.
> 
> Super! Thanks for doing it!
> 
> 
>>  recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb | 4 +++-
>>  recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb | 4 +++-
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
>> index 751dfc74..05bca918 100644
>> --- a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
>> +++ b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9
>>  
>>  inherit module
>>  
>> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
>> +COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
> 
> Can we use omap3 and omap4 SOC_FAMILY overrides instead of specific boards?
> 


Problem is omap3 and omap4 have different SGX version depending on the
exact chip, here is the current situation:

OMAP3430: sgx530-121
OMAP3530: sgx530-121
OMAP3630: sgx530-125
AM335x  : sgx530-125
AM43xx  : sgx530-125
OMAP4430: sgx540-120
OMAP4460: sgx540-120
OMAP4470: sgx544MP1-112
OMAP5432: sgx544MP2-105
AM57xx  : sgx544MP2-116
AM654x  : sgx544MP1-117

So for instance OMAP3530 has sgx530-121 but OMAP3630 has sgx530-125, so
they will need different UM binaries even though both are OMAP3. For now
it is easiest to partition based on the board as the board will give us
the exact chip: beagleboard = OMAP3530 = sgx530-121 = ti343x. Kinda
messy but the best I could come up with without changing the target
product names all around.

Andrew


> 
>>  MACHINE_KERNEL_PR_append = "s"
>>  PR = "${MACHINE_KERNEL_PR}"
>> @@ -30,6 +30,8 @@ TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>>  TARGET_PRODUCT_ti33x = "ti335x"
>>  TARGET_PRODUCT_ti43x = "ti437x"
>>  TARGET_PRODUCT_k3 = "ti654x"
>> +TARGET_PRODUCT_beagleboard = "ti343x"
>> +TARGET_PRODUCT_pandaboard = "ti443x"
>>  
>>  EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=nulldrmws'
>>  
>> diff --git a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
>> index ecf3ffcc..e3b9b4d1 100644
>> --- a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
>> +++ b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
>> @@ -4,7 +4,7 @@ LICENSE = "TI-TSPA"
>>  LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
>>  
>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
>> +COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
>>  
>>  PR = "r34"
>>  
>> @@ -17,6 +17,8 @@ TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>>  TARGET_PRODUCT_ti33x = "ti335x"
>>  TARGET_PRODUCT_ti43x = "ti437x"
>>  TARGET_PRODUCT_k3 = "ti654x"
>> +TARGET_PRODUCT_beagleboard = "ti343x"
>> +TARGET_PRODUCT_pandaboard = "ti443x"
>>  
>>  INITSCRIPT_NAME = "rc.pvr"
>>  INITSCRIPT_PARAMS = "defaults 8"
>> -- 
>> 2.17.1
>>

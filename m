Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.1749.1580500060474400035
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PXjZzQHQ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJldpl119851
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:47:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580500059;
	bh=xN6xIyMlln8zv16XyAHeCWXNn/QQtnHq1B4tTeA2wNM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=PXjZzQHQ7kQOxtLVeVc516vCwYG/gfKJXC52OS4vKpHvtgWXYZztcD2tQxZKhiJCG
	 7AKfMxwkNz4xn9gc7erGBGIlTgY2oeFtUFnumgbOwGQbOVot1lfznMtK4STjpEb2WN
	 YwtWSV03xZDAEvdSpn7ljormwLFEbJrEygssLSeM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VJldQ9039836
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:47:39 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:47:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:47:39 -0600
Received: from [10.250.70.160] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJldUI003541;
	Fri, 31 Jan 2020 13:47:39 -0600
Subject: Re: [meta-ti][master][PATCH 3/3] recipes-graphics: Use M for kernel build subdirectory over SUBDIRS
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200131192111.29813-1-afd@ti.com>
 <20200131192111.29813-3-afd@ti.com> <20200131193725.GE23242@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <2bb0927c-8fa8-9ed8-6af6-03a740ead23a@ti.com>
Date: Fri, 31 Jan 2020 14:47:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131193725.GE23242@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/31/20 2:37 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 31, 2020 at 02:21:11PM -0500, Andrew F. Davis wrote:
>> SUBDIRS has been deprecated for a while and as of k5.4 no longer works.
>> Use M= instead.
> 
> Thanks! Sorry, can you please swap this with patch #2, so I can merge it w/o 
> moving things around yet. Thanks.
> 


Sent as standalone patch.

Andrew


> 
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>  .../ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb          | 2 +-
>>  recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb     | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
>> index 2f4b7ac5..bc907263 100644
>> --- a/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
>> +++ b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
>> @@ -32,5 +32,5 @@ PVR_WS = "wayland"
>>  EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${PVR_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${PVR_SOC} WINDOW_SYSTEM=${PVR_WS}'
>>  
>>  do_install() {
>> -    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>> +    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>>  }
>> diff --git a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
>> index 5c1a50de..751dfc74 100644
>> --- a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
>> +++ b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
>> @@ -38,9 +38,9 @@ do_compile_prepend() {
>>  }
>>  
>>  do_install() {
>> -    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>> +    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>>  }
>>  
>>  do_install_k3() {
>> -    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>> +    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>>  }
>> -- 
>> 2.17.1
>>

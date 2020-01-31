Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1626.1580499593961217938
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SpMQm/Ax;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJdrhI107225
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:39:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580499593;
	bh=EgbjFLCy+3V68oBzQgSzEQ2ED5hteHdiZdxwyLSPpCU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=SpMQm/AxDxZVwQy34tvivsLNHYcpGaHED8eOWiRNPWnxQvOm2xBe2mSm/tNtHnXVm
	 56trs0JG4ENQlkauhMnFyJkd54N8evqnrmeIUqSNx7bWjolqYDOzmRmSq9AO7lZ67r
	 e2fRBE/dey/9uycA+zrDUKgOpr2my3BXw37uvtlw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VJdrCf029036
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:39:53 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:39:52 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:39:52 -0600
Received: from [10.250.70.160] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJdqMj017010;
	Fri, 31 Jan 2020 13:39:52 -0600
Subject: Re: [meta-ti][master][PATCH 2/3] Move Graphics and Multimedia drivers and apps out of recipes-bsp
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200131192111.29813-1-afd@ti.com>
 <20200131192111.29813-2-afd@ti.com> <20200131193318.GC23242@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <f871b691-2d2e-6d3c-4210-0e49b004a476@ti.com>
Date: Fri, 31 Jan 2020 14:39:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131193318.GC23242@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/31/20 2:33 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 31, 2020 at 02:21:10PM -0500, Andrew F. Davis wrote:
>> recipes-bsp is looking a bit random at the moment, lets move graphics
>> recipies into recipes-graphics and some multimedia related ones into
>> recipes-multimedia.
> 
> Yeah, let me sit on this one for a bit - I'm slightly torn here, as I like 
> some of the new names/locations, but not all them...
> 


Same, I wasn't sure if I even wanted to post this one, but some later
work I did depended on the new locations and I didn't feel like un-doing it.

Anyway here is another thing I was thinking:

recipes-bsp -> firmwares
recipes-kernel -> all kernel stuff including kernel modules
recipes-graphics -> just the UM side drivers and apps

Right now we have kernel module recipes in several places, usually
bundled either their assosiated firmware or UM drivers. If we split
things out like above we can keep everything in more consistent locations.

Let me know if you have a prefrence either way.

Andrew


> 
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>  .../{ti-img-encode-decode => vxd-dec-fw}/vxd-dec-fw_git.bb        | 0
>>  .../ti-img-rogue-driver/0001-km-support-general-toolchain.patch   | 0
>>  .../ti-img-rogue}/ti-img-rogue-driver_1.10.5371573.bb             | 0
>>  .../{libgles => ti-img-rogue}/ti-img-rogue-umlibs_1.10.5371573.bb | 0
>>  ...001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 0
>>  .../ti-img-sgx}/ti-sgx-ddk-km_1.17.4948957.bb                     | 0
>>  .../{libgles => ti-img-sgx}/ti-sgx-ddk-um_1.17.4948957.bb         | 0
>>  .../ti-vivante-gc320}/ti-gc320-driver_5.0.11.p7.bb                | 0
>>  .../{libgal => ti-vivante-gc320}/ti-gc320-libs_5.0.11.p7.bb       | 0
>>  .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb            | 0
>>  .../ti-img-encode-decode/viddec-test-app_1.0.0.bb                 | 0
>>  .../ti-img-encode-decode/videnc-test-app_1.0.0.bb                 | 0
>>  12 files changed, 0 insertions(+), 0 deletions(-)
>>  rename recipes-bsp/{ti-img-encode-decode => vxd-dec-fw}/vxd-dec-fw_git.bb (100%)
>>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-rogue}/ti-img-rogue-driver/0001-km-support-general-toolchain.patch (100%)
>>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-rogue}/ti-img-rogue-driver_1.10.5371573.bb (100%)
>>  rename recipes-graphics/{libgles => ti-img-rogue}/ti-img-rogue-umlibs_1.10.5371573.bb (100%)
>>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-sgx}/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch (100%)
>>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-sgx}/ti-sgx-ddk-km_1.17.4948957.bb (100%)
>>  rename recipes-graphics/{libgles => ti-img-sgx}/ti-sgx-ddk-um_1.17.4948957.bb (100%)
>>  rename {recipes-bsp/gc320-drivers => recipes-graphics/ti-vivante-gc320}/ti-gc320-driver_5.0.11.p7.bb (100%)
>>  rename recipes-graphics/{libgal => ti-vivante-gc320}/ti-gc320-libs_5.0.11.p7.bb (100%)
>>  rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb (100%)
>>  rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/viddec-test-app_1.0.0.bb (100%)
>>  rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/videnc-test-app_1.0.0.bb (100%)
>>
>> diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
>> similarity index 100%
>> rename from recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>> rename to recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
>> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
>> similarity index 100%
>> rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
>> rename to recipes-graphics/ti-img-rogue/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
>> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
>> similarity index 100%
>> rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
>> rename to recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
>> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/ti-img-rogue/ti-img-rogue-umlibs_1.10.5371573.bb
>> similarity index 100%
>> rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
>> rename to recipes-graphics/ti-img-rogue/ti-img-rogue-umlibs_1.10.5371573.bb
>> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>> similarity index 100%
>> rename from recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>> rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
>> similarity index 100%
>> rename from recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
>> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
>> similarity index 100%
>> rename from recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
>> diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-graphics/ti-vivante-gc320/ti-gc320-driver_5.0.11.p7.bb
>> similarity index 100%
>> rename from recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
>> rename to recipes-graphics/ti-vivante-gc320/ti-gc320-driver_5.0.11.p7.bb
>> diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/ti-vivante-gc320/ti-gc320-libs_5.0.11.p7.bb
>> similarity index 100%
>> rename from recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
>> rename to recipes-graphics/ti-vivante-gc320/ti-gc320-libs_5.0.11.p7.bb
>> diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
>> similarity index 100%
>> rename from recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
>> rename to recipes-multimedia/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
>> diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/viddec-test-app_1.0.0.bb
>> similarity index 100%
>> rename from recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
>> rename to recipes-multimedia/ti-img-encode-decode/viddec-test-app_1.0.0.bb
>> diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/videnc-test-app_1.0.0.bb
>> similarity index 100%
>> rename from recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
>> rename to recipes-multimedia/ti-img-encode-decode/videnc-test-app_1.0.0.bb
>> -- 
>> 2.17.1
>>

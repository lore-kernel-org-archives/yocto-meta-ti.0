Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.2064.1580501547334574860
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 12:12:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lYeMYz/9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VKCQWn076350
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 14:12:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580501546;
	bh=iSax0Sq9wy7be1C2fUvLyTnXCdCbAYrOW3rSHlEdQ4Y=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=lYeMYz/9IdAbGGw0mo3fzUe4cq8qN0nw5G9KMaInnOtWcrkIRUVv2P437r/TGLZJX
	 RJW39848vltFl73gBc/x+GjvVqIfqp8FH/Y/es6k7mTf5u7Sv6+O0P6W7lJ/fPp5Fw
	 z2JOHVJKIDGRJPZXJnw6dzDAlLpgGc3EPylP2bNk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VKCQxA104750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 14:12:26 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 14:12:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 14:12:26 -0600
Received: from [10.250.70.160] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VKCPa6087417;
	Fri, 31 Jan 2020 14:12:25 -0600
Subject: Re: [meta-ti][master][PATCH 2/3] Move Graphics and Multimedia drivers and apps out of recipes-bsp
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200131192111.29813-1-afd@ti.com>
 <20200131192111.29813-2-afd@ti.com> <20200131193318.GC23242@beryl>
 <f871b691-2d2e-6d3c-4210-0e49b004a476@ti.com> <20200131195611.GG23242@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <25d6a91e-c06b-23c6-9a4a-880e02dd1b1f@ti.com>
Date: Fri, 31 Jan 2020 15:12:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131195611.GG23242@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/31/20 2:56 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 31, 2020 at 02:39:52PM -0500, Andrew F. Davis wrote:
>> On 1/31/20 2:33 PM, Denys Dmytriyenko wrote:
>>> On Fri, Jan 31, 2020 at 02:21:10PM -0500, Andrew F. Davis wrote:
>>>> recipes-bsp is looking a bit random at the moment, lets move graphics
>>>> recipies into recipes-graphics and some multimedia related ones into
>>>> recipes-multimedia.
>>>
>>> Yeah, let me sit on this one for a bit - I'm slightly torn here, as I like 
>>> some of the new names/locations, but not all them...
>>>
>>
>>
>> Same, I wasn't sure if I even wanted to post this one, but some later
>> work I did depended on the new locations and I didn't feel like un-doing it.
>>
>> Anyway here is another thing I was thinking:
>>
>> recipes-bsp -> firmwares
>> recipes-kernel -> all kernel stuff including kernel modules
>> recipes-graphics -> just the UM side drivers and apps
>>
>> Right now we have kernel module recipes in several places, usually
>> bundled either their assosiated firmware or UM drivers. If we split
>> things out like above we can keep everything in more consistent locations.
>>
>> Let me know if you have a prefrence either way.
> 
> I've been noticing that recipes-bsp has been growing out of proportion.
> 
> Some old names are historic, but maybe even more correct, e.g.:
> https://en.wikipedia.org/wiki/PowerVR
> 
> I like "vivante" rename. Still thinking about "img" vs. powervr due to above.
> 


Personally, keeping the discrete solution's name they offered way back
when by VideoLogic, even after becoming IMG, was a confusing thing to do
on their part.

Now they are completely moving away from it at least, so "ti-img-sgx"
seems to be the most consistent name for the line of
"Imagination Technologies PowerVR Series5 SGX" GPUs in our chips.

Next after "SGX" they have "Rogue", "Furian", and "Albiorix" (according
to wikipedia) so we could probably stay consistent going forward as
ti-img-<family_name>. Which is what I do in this patch.


> Historically, out-of-tree kernel modules lived in recipes-bsp, while 
> user-space apps and libs in recipes-graphics/recipes-multimedia. But I 
> might agree to moving drivers away from recipes-bsp to leave that only 
> for firmwares and maybe LLDs...
> 


I was looking for how others handled the kernel modules and took a hint
from our friends over at NXP[0].

[0]
https://github.com/Freescale/meta-freescale/tree/master/recipes-kernel/kernel-modules

Andrew


> Denys
> 
> 
>>
>> Andrew
>>
>>
>>>
>>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>>> ---
>>>>  .../{ti-img-encode-decode => vxd-dec-fw}/vxd-dec-fw_git.bb        | 0
>>>>  .../ti-img-rogue-driver/0001-km-support-general-toolchain.patch   | 0
>>>>  .../ti-img-rogue}/ti-img-rogue-driver_1.10.5371573.bb             | 0
>>>>  .../{libgles => ti-img-rogue}/ti-img-rogue-umlibs_1.10.5371573.bb | 0
>>>>  ...001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 0
>>>>  .../ti-img-sgx}/ti-sgx-ddk-km_1.17.4948957.bb                     | 0
>>>>  .../{libgles => ti-img-sgx}/ti-sgx-ddk-um_1.17.4948957.bb         | 0
>>>>  .../ti-vivante-gc320}/ti-gc320-driver_5.0.11.p7.bb                | 0
>>>>  .../{libgal => ti-vivante-gc320}/ti-gc320-libs_5.0.11.p7.bb       | 0
>>>>  .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb            | 0
>>>>  .../ti-img-encode-decode/viddec-test-app_1.0.0.bb                 | 0
>>>>  .../ti-img-encode-decode/videnc-test-app_1.0.0.bb                 | 0
>>>>  12 files changed, 0 insertions(+), 0 deletions(-)
>>>>  rename recipes-bsp/{ti-img-encode-decode => vxd-dec-fw}/vxd-dec-fw_git.bb (100%)
>>>>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-rogue}/ti-img-rogue-driver/0001-km-support-general-toolchain.patch (100%)
>>>>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-rogue}/ti-img-rogue-driver_1.10.5371573.bb (100%)
>>>>  rename recipes-graphics/{libgles => ti-img-rogue}/ti-img-rogue-umlibs_1.10.5371573.bb (100%)
>>>>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-sgx}/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch (100%)
>>>>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-sgx}/ti-sgx-ddk-km_1.17.4948957.bb (100%)
>>>>  rename recipes-graphics/{libgles => ti-img-sgx}/ti-sgx-ddk-um_1.17.4948957.bb (100%)
>>>>  rename {recipes-bsp/gc320-drivers => recipes-graphics/ti-vivante-gc320}/ti-gc320-driver_5.0.11.p7.bb (100%)
>>>>  rename recipes-graphics/{libgal => ti-vivante-gc320}/ti-gc320-libs_5.0.11.p7.bb (100%)
>>>>  rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb (100%)
>>>>  rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/viddec-test-app_1.0.0.bb (100%)
>>>>  rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/videnc-test-app_1.0.0.bb (100%)
>>>>
>>>> diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
>>>> similarity index 100%
>>>> rename from recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>>>> rename to recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
>>>> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
>>>> similarity index 100%
>>>> rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
>>>> rename to recipes-graphics/ti-img-rogue/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
>>>> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
>>>> similarity index 100%
>>>> rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
>>>> rename to recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
>>>> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/ti-img-rogue/ti-img-rogue-umlibs_1.10.5371573.bb
>>>> similarity index 100%
>>>> rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
>>>> rename to recipes-graphics/ti-img-rogue/ti-img-rogue-umlibs_1.10.5371573.bb
>>>> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>>>> similarity index 100%
>>>> rename from recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>>>> rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>>>> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
>>>> similarity index 100%
>>>> rename from recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>>>> rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
>>>> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
>>>> similarity index 100%
>>>> rename from recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>> rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
>>>> diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-graphics/ti-vivante-gc320/ti-gc320-driver_5.0.11.p7.bb
>>>> similarity index 100%
>>>> rename from recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
>>>> rename to recipes-graphics/ti-vivante-gc320/ti-gc320-driver_5.0.11.p7.bb
>>>> diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/ti-vivante-gc320/ti-gc320-libs_5.0.11.p7.bb
>>>> similarity index 100%
>>>> rename from recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
>>>> rename to recipes-graphics/ti-vivante-gc320/ti-gc320-libs_5.0.11.p7.bb
>>>> diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
>>>> similarity index 100%
>>>> rename from recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
>>>> rename to recipes-multimedia/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
>>>> diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/viddec-test-app_1.0.0.bb
>>>> similarity index 100%
>>>> rename from recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
>>>> rename to recipes-multimedia/ti-img-encode-decode/viddec-test-app_1.0.0.bb
>>>> diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/videnc-test-app_1.0.0.bb
>>>> similarity index 100%
>>>> rename from recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
>>>> rename to recipes-multimedia/ti-img-encode-decode/videnc-test-app_1.0.0.bb
>>>> -- 
>>>> 2.17.1
>>>>

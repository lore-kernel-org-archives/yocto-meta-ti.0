Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C851C77B6E
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 20:58:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.170242.1680814728111032417
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 13:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EygifPpL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 336Kwgd7064086;
	Thu, 6 Apr 2023 15:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680814722;
	bh=QZiPNhLVH7soTaqj3y4qzjQFnzRKka50HCnyQKcCEpw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EygifPpLc4FRM4jJMZzXBRo4io8yXF9z036S32h0nGCg/f6nhw4/wBTHxKYFmIOvE
	 NafU+Puxnga6sBT6qBmDd1CzJGDPTKvR3l6IU5yhMp3hOwkDkPCb73mz0LNq+uE+8b
	 zsk6ZIPRt4h+YxwDWWx3BeAqT0Q+pzqRMYHdUSRQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 336Kwg7F017041
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Apr 2023 15:58:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 6
 Apr 2023 15:58:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 6 Apr 2023 15:58:41 -0500
Received: from [10.250.33.184] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 336KwfFw004183;
	Thu, 6 Apr 2023 15:58:41 -0500
Message-ID: <be1d8c94-1b46-5b26-399d-e0baa054e824@ti.com>
Date: Thu, 6 Apr 2023 15:58:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 5/5] meta-ti-bsp: graphics:
 Correct dependency chain
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230406192847.7934-1-afd@ti.com>
 <20230406192847.7934-5-afd@ti.com> <20230406194653.GN9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230406194653.GN9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Apr 2023 20:58:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16312

On 4/6/23 2:46 PM, Denys Dmytriyenko wrote:
> On Thu, Apr 06, 2023 at 02:28:47PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Previously the virtual/gpudriver provider would point to the kernel-mode
>> driver, which would cause Mesa libraries to depend on those and not the
>> user-mode driver. It is the user-mode driver that should depend on the
>> kernel-mode driver, not the other way around. The logical dependency
>> chain should be:
> 
> No, umlibs already has lots of virtual providers to choose from - virtual/egl,
> virtual/gles and even virtual/mesa. And virtual/gpudriver was specifically
> added to point to a kernel-mode driver - rogue-driver or sgx-km.
> 

But none of these virtual providers actually point to the umlibs anymore,
those all point to Mesa.

> So, flipping the dependency chain is probably the correct change, but changing
> what virtual/gpudriver means seems wrong.
> 

Not sure what the issue is with changing what this virtual provider means.
It is our creation that no one else uses, it exists today only as a flag to
tell our Mesa bbappend which backend to choose.

Andrew

> 
>> App -> virtual/libgl -> Mesa -> virtual/gpudriver -> IMG-UM -> IMG-KM
>>
>> Flip the dependency chain so it matches the above. While here make
>> the UM driver depend on, not just recommend, the KM driver as it is
>> not functional with out it.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/am62xx.inc                 | 2 +-
>>   meta-ti-bsp/conf/machine/include/j721e.inc                  | 2 +-
>>   meta-ti-bsp/conf/machine/include/j721s2.inc                 | 2 +-
>>   meta-ti-bsp/conf/machine/include/j784s4.inc                 | 2 +-
>>   .../powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb     | 2 --
>>   .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb           | 2 --
>>   .../libgles/ti-img-rogue-umlibs_1.18.6276027.bb             | 5 ++++-
>>   .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb  | 5 +++--
>>   meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend     | 2 +-
>>   meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend        | 2 +-
>>   meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc              | 6 +++---
>>   11 files changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> index af6a6db4..93151bcf 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> @@ -6,7 +6,7 @@ MACHINE_FEATURES += "screen gpu"
>>   SERIAL_CONSOLES = "115200;ttyS2"
>>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>   
>> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-umlibs"
>>   
>>   # Default tiboot3.bin on AM62x is for HS-FS
>>   BBMULTICONFIG = "k3r5-hs-fs"
>> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
>> index 8f9c24e6..05aa7515 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
>> @@ -3,7 +3,7 @@ SOC_FAMILY:append = ":j721e"
>>   
>>   MACHINE_FEATURES += "screen gpu"
>>   
>> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-umlibs"
>>   
>>   # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
>>   do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
>> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
>> index 70569a16..9a21df49 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
>> @@ -3,7 +3,7 @@ SOC_FAMILY:append = ":j721s2"
>>   
>>   MACHINE_FEATURES += "screen gpu"
>>   
>> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-umlibs"
>>   
>>   TFA_BOARD = "generic"
>>   
>> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> index d03ee4a4..74b64203 100644
>> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> @@ -3,7 +3,7 @@ SOC_FAMILY:append = ":j784s4"
>>   
>>   MACHINE_FEATURES += "screen gpu"
>>   
>> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-umlibs"
>>   
>>   TFA_BOARD = "j784s4"
>>   
>> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
>> index 96fb7484..2e2fe1ac 100644
>> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
>> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
>> @@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232
>>   
>>   inherit module
>>   
>> -PROVIDES = "virtual/gpudriver"
>> -
>>   MACHINE_KERNEL_PR:append = "b"
>>   PR = "${MACHINE_KERNEL_PR}"
>>   
>> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> index bf4fa98a..ed614038 100644
>> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> @@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9
>>   
>>   inherit module
>>   
>> -PROVIDES = "virtual/gpudriver"
>> -
>>   COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
>>   
>>   MACHINE_KERNEL_PR:append = "x"
>> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
>> index 94d14ded..f6f363b0 100644
>> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
>> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
>> @@ -3,6 +3,8 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
>>   LICENSE = "TI-TFL"
>>   LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>>   
>> +PROVIDES = "virtual/gpudriver"
>> +
>>   inherit bin_package
>>   
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>> @@ -22,7 +24,8 @@ TARGET_PRODUCT:am62xx = "am62_linux"
>>   PVR_BUILD = "release"
>>   PVR_WS = "lws-generic"
>>   
>> -RDEPENDS:${PN} += "mesa-megadriver libdrm ti-img-rogue-driver"
>> +RDEPENDS:${PN} += "libdrm"
>> +RDEPENDS:${PN} += "ti-img-rogue-driver"
>>   
>>   do_install:append() {
>>       if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
>> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> index 755cc4f5..3a91d9c3 100644
>> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> @@ -3,6 +3,8 @@ HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
>>   LICENSE = "TI-TSPA"
>>   LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
>>   
>> +PROVIDES = "virtual/gpudriver"
>> +
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
>>   
>> @@ -35,8 +37,7 @@ def use_initscript(d):
>>   inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
>>   
>>   RDEPENDS:${PN} += "libdrm"
>> -
>> -RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
>> +RDEPENDS:${PN} += "ti-sgx-ddk-km"
>>   
>>   S = "${WORKDIR}/git"
>>   
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
>> index 912e9e9d..f505a569 100644
>> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
>> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
>> @@ -1 +1 @@
>> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
>> +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-umlibs ti-sgx-ddk-um', 'pvr-mesa.inc', '', d)}
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
>> index 912e9e9d..f505a569 100644
>> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
>> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
>> @@ -1 +1 @@
>> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
>> +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-umlibs ti-sgx-ddk-um', 'pvr-mesa.inc', '', d)}
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
>> index 96c484a7..d9e56d84 100644
>> --- a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
>> +++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
>> @@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
>>   SRCREV = "44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba"
>>   
>>   PACKAGECONFIG:append = " \
>> -    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
>> -    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
>> +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-umlibs', 'pvr', '', d)} \
>> +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-um', 'sgx', '', d)} \
>>   "
>>   
>>   PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
>> @@ -45,4 +45,4 @@ do_install:append () {
>>       rm -rf ${D}${datadir}/pkgconfig
>>   }
>>   
>> -RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
>> +RDEPENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
>> -- 
>> 2.39.2


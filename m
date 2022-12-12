Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E32DC00145
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 19:24:42 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.53140.1670873075395776055
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 11:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VdFtVL8g;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BCJOUsa114349;
	Mon, 12 Dec 2022 13:24:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670873070;
	bh=iuR02jThQy1WiBxteygVfKvtm9PQK35VVR0RS0xGuCg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VdFtVL8gPXg3KHM+6vMenbesltAtHXlhzvg1e0PmYtFiF0qNd4xEWr/hGbAhSrlop
	 PNFeQWI29eYhgtcceux8+nVuRJ+0MkOmKMsHLXQM3c8GZA5GMN6vpqzg9DIYzI2fok
	 KLBX3BNqIKsnadabHMqPL8sOx+9Ms3NWVOpI1wVo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BCJOUXd034470
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Dec 2022 13:24:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 12
 Dec 2022 13:24:29 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 12 Dec 2022 13:24:30 -0600
Received: from [10.249.38.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BCJOTlD126122;
	Mon, 12 Dec 2022 13:24:29 -0600
Message-ID: <e318a600-c9f5-7969-d809-0748eaa786c7@ti.com>
Date: Mon, 12 Dec 2022 13:24:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: change from
 do_image_wic/tar to do_image
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20221211190240.7246-1-reatmon@ti.com>
 <20221212181520.GE22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221212181520.GE22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 19:24:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15452



On 12/12/2022 12:15, Denys Dmytriyenko wrote:
> On Sun, Dec 11, 2022 at 01:02:40PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> When trying to support OpenBMC we found that our use of do_image_wic
>> and do_image_tar for adding depends and mcdepends was too limiting.
>> Moving to do_image is a higher level in the tree that means for any
>> image type the dependencies will be correct.
> 
> There might be some unexpected side effects, since do_image is too broard. Not
> every image has a boot partition and should depend on the corresponding boot
> files being deployed. Things like ramdisks, initramfs and such have different
> flows and own dependencies. Also images that include other images, like guests
> for VMs or hypervisors or even bootstrapping. All those could potentially have
> issues due to a global do_image dependency - I've seen circular dependency
> breakages in the past in those areas. Not all use cases are being tested by
> default, so not easy to tell if this change is compltetely harmless...

I was worried something like that might be true.  But how are we 
supposed to know which images (present and future) that we need to add 
dependencies for in this case?


> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/am62xx.inc   | 3 +--
>>   meta-ti-bsp/conf/machine/include/am64xx.inc   | 9 +++------
>>   meta-ti-bsp/conf/machine/include/am65xx.inc   | 3 +--
>>   meta-ti-bsp/conf/machine/include/k3.inc       | 5 ++---
>>   meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
>>   meta-ti-bsp/conf/machine/include/ti33x.inc    | 2 +-
>>   meta-ti-bsp/conf/machine/include/ti43x.inc    | 2 +-
>>   meta-ti-bsp/conf/machine/j7200-evm.conf       | 3 +--
>>   meta-ti-bsp/conf/machine/j721e-hs-evm.conf    | 3 +--
>>   meta-ti-bsp/conf/machine/j721s2-evm.conf      | 3 +--
>>   meta-ti-bsp/conf/machine/j784s4-evm.conf      | 3 +--
>>   11 files changed, 14 insertions(+), 24 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> index a5aad994..3b6e5b4d 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> @@ -12,8 +12,7 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>>   
>> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>> +do_image[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>>   
>>   TFA_BOARD = "lite"
>>   TFA_K3_SYSTEM_SUSPEND = "1"
>> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> index 055f6036..2fca1ac0 100644
>> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> @@ -16,20 +16,17 @@ KERNEL_DEVICETREE = " \
>>   
>>   # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
>>   BBMULTICONFIG = "k3r5-sr2-hs-fs"
>> -do_image_wic[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
>> +do_image[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
>>   
>>   # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
>>   BBMULTICONFIG += "k3r5-gp"
>>   IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
>> -do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
>> +do_image[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
>>   
>>   # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
>>   BBMULTICONFIG += "k3r5-sr2-hs-se"
>>   IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
>> -do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>> +do_image[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>>   
>>   TFA_BOARD = "lite"
>>   OPTEEMACHINE = "k3-am64x"
>> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> index 80aa6d27..ef31ea52 100644
>> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> @@ -34,8 +34,7 @@ IMAGE_BOOT_FILES += "sysfw.itb"
>>   # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
>>   IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
>>   
>> -do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>> +do_image[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>>   
>>   OPTEEMACHINE = "k3-am65x"
>>   OPTEEOUTPUTMACHINE = "k3"
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
>> index 84afd2e2..e11b71b1 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -47,8 +47,7 @@ EFI_PROVIDER ?= "grub-efi"
>>   MACHINE_FEATURES += "efi"
>>   
>>   WKS_FILE ?= "sdimage-2part-efi.wks"
>> -do_image_wic[depends] += "virtual/bootloader:do_deploy"
>> -do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
>> +do_image[depends] += "virtual/bootloader:do_deploy"
>> +do_image[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
>>   
>>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
>> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> index f548f3fd..08f9d448 100644
>> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> @@ -50,4 +50,4 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
>>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>>   WKS_FILE ?= "sdimage-2part.wks"
>>   IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
>> -do_image_wic[depends] += "u-boot:do_deploy"
>> +do_image[depends] += "u-boot:do_deploy"
>> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
>> index cfacc30d..d9381555 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
>> @@ -60,4 +60,4 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet gpu"
>>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>>   WKS_FILE ?= "sdimage-2part.wks"
>>   IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
>> -do_image_wic[depends] += "virtual/bootloader:do_deploy"
>> +do_image[depends] += "virtual/bootloader:do_deploy"
>> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
>> index 5509a54d..ab57216f 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
>> @@ -59,4 +59,4 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
>>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>>   WKS_FILE ?= "sdimage-2part.wks"
>>   IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
>> -do_image_wic[depends] += "u-boot:do_deploy"
>> +do_image[depends] += "u-boot:do_deploy"
>> diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
>> index 303ec182..077d2f41 100644
>> --- a/meta-ti-bsp/conf/machine/j7200-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
>> @@ -13,5 +13,4 @@ KERNEL_DEVICETREE = " \
>>   
>>   UBOOT_MACHINE = "j7200_evm_a72_config"
>>   
>> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>> +do_image[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>> diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>> index 9ef7b86a..2eced539 100644
>> --- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>> @@ -23,5 +23,4 @@ BBMULTICONFIG += "k3r5-sr1-1"
>>   
>>   # Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
>>   IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
>> -do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
>> +do_image[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
>> diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
>> index 37353df4..d02c8258 100644
>> --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
>> @@ -17,5 +17,4 @@ KERNEL_DEVICETREE = " \
>>   
>>   UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
>>   
>> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>> +do_image[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>> index 96acca13..f88006c3 100644
>> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>> @@ -18,8 +18,7 @@ KERNEL_DEVICETREE = " \
>>   
>>   UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
>>   
>> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>> +do_image[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>>   
>>   TFA_BOARD = "j784s4"
>>   
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BFAC7EE37
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 21:07:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.732.1686085663238201245
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 14:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fQEspM8Z;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356L7cND058583;
	Tue, 6 Jun 2023 16:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686085658;
	bh=az946RAXmTdd2Rkam6CL7uQEBh1CweNWwtXMITU/zMU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fQEspM8ZVAPIiBqXAofUEvsOXPPSOzR77SR7kYVjXMwxXdp3DQ1w7umGkqx+7qX8S
	 T7Psf/FLG4To0iIptInVy6TU3RB/zMXFuZCAaIfFOi5CQpIckvSwPllh4x+vCIl3G0
	 DCSxXX+6qoH6RbLJapr1p3wcwV0R1x64QAuS1wag=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356L7bT2019183
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 16:07:37 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 16:07:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 16:07:37 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356L7b6x040819;
	Tue, 6 Jun 2023 16:07:37 -0500
Message-ID: <a9e6d77f-f098-05c8-d2a9-effd83fddac6@ti.com>
Date: Tue, 6 Jun 2023 16:07:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] Re: [meta-ti][meta-ti master][PATCH]
 ti-img-rogue-driver: add KERNEL_CC to make
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>, <xulin.sun@windriver.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20230606033706.32554-1-xulin.sun@windriver.com>
 <20230606210239.GS9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230606210239.GS9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 21:07:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16681

On 6/6/23 16:02, Denys Dmytriyenko wrote:
> On Tue, Jun 06, 2023 at 11:37:06AM +0800, Xulin Sun via lists.yoctoproject.org wrote:
>> Bring in KERNEL_CC variable to avoid below building issue:
>>
>> WARNING: ti-img-rogue-driver-23.1.6404501-b do_package_qa: QA Issue:
>> File /lib/modules/6.1.31-rt10-yocto-preempt-rt/extra/pvrsrvkm.ko in package
>> kernel-module-pvrsrvkm-6.1.31-rt10-yocto-preempt-rt contains reference to TMPDIR [buildpaths]
>>
>> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>> ---
>>   ...0001-kbuild-wrap-cc-in-double-quotes.patch | 47 +++++++++++++++++++
>>   .../ti-img-rogue-driver_23.1.6404501.bb       |  6 ++-
>>   2 files changed, 52 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch
>> new file mode 100644
>> index 00000000..6faf6fe2
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch
>> @@ -0,0 +1,47 @@
>> +From 48ac628f0c6e679c165f08fec18818f802b535d1 Mon Sep 17 00:00:00 2001
>> +From: Xulin Sun <xulin.sun@windriver.com>
>> +Date: Tue, 6 Jun 2023 01:28:31 +0000
>> +Subject: [PATCH] kbuild: wrap cc in double quotes
>> +
>> +Set the CC variable correctly, to avoid below building issue:
>> +make[1]: aarch64-wrs-linux-aarch64-wrs-linux-gcc: No such file or directory
> 
> Upstream-status?
> 
> Anyway, it seems quotation should be applied not just to CC, but to other vars
> like AR, LD, NM and OBJCOPY. And CROSS_COMPILE and EXTRA_CFLAGS are already
> doing it correctly just above...
> 
> 
> Randolph,
> 
> Can you take these changes to upstream repo so this patch is not needed in
> meta-ti? Thanks.
> 

Yeah, I'll be happy to take them.

> 
>> +Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>> +---
>> + build/linux/kbuild/kbuild.mk | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/build/linux/kbuild/kbuild.mk b/build/linux/kbuild/kbuild.mk
>> +index f65d6a4..2085766 100644
>> +--- a/build/linux/kbuild/kbuild.mk
>> ++++ b/build/linux/kbuild/kbuild.mk
>> +@@ -97,7 +97,7 @@ kbuild: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile bridges
>> + 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
>> + 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
>> + 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
>> +-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
>> ++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
>> + 		AR=$(if $(KERNEL_AR),$(KERNEL_AR),$(KERNEL_CROSS_COMPILE)ar) \
>> + 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
>> + 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
>> +@@ -133,7 +133,7 @@ kbuild_clean: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile
>> + 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
>> + 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
>> + 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
>> +-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
>> ++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
>> + 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
>> + 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
>> + 		OBJCOPY=$(if $(KERNEL_OBJCOPY),$(KERNEL_OBJCOPY),$(KERNEL_CROSS_COMPILE)objcopy) \
>> +@@ -160,7 +160,7 @@ kbuild_modules_install: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile
>> + 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
>> + 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
>> + 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
>> +-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
>> ++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
>> + 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
>> + 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
>> + 		OBJCOPY=$(if $(KERNEL_OBJCOPY),$(KERNEL_OBJCOPY),$(KERNEL_CROSS_COMPILE)objcopy) \
>> +--
>> +2.35.5
>> +
>> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
>> index 76e3d801..b3fba3c4 100644
>> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
>> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
>> @@ -20,6 +20,10 @@ BRANCH = "linuxws/kirkstone/k6.1/${PV}"
>>   
>>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
>>   
>> +SRC_URI += " \
>> +	file://0001-kbuild-wrap-cc-in-double-quotes.patch \
>> +"
>> +
>>   S = "${WORKDIR}/git"
>>   
>>   SRCREV = "93c66ec66136654849809132b86d3b880ee96ed6"
>> @@ -31,7 +35,7 @@ TARGET_PRODUCT:am62xx = "am62_linux"
>>   PVR_BUILD = "release"
>>   PVR_WS = "lws-generic"
>>   
>> -EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
>> +EXTRA_OEMAKE += 'KERNEL_CC="${KERNEL_CC}" KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
>>   
>>   do_install() {
>>       make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
>> -- 
>> 2.40.1



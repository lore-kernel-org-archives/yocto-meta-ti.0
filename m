Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C99C87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 19:31:12 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.70970.1753990269237118009
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 12:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VdSXwMLr;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56VJV5co3519548;
	Thu, 31 Jul 2025 14:31:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753990265;
	bh=nW/FVwSiUpP312trNsp/XfhATnIOxAANgSVO2PFLOR4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VdSXwMLrCQkdQWHjd4X4QQgC6HEFTcvMknt0UC6ZdEjSFJHZNGzdSVcqHPezYQS5a
	 t0YwwOuksAJScoKLx+XOidHs7/LeDbPwm84QAS1dK+ULpIV1z5ldrlIBYZVbuPL8fk
	 doD/5b0k9QYwO0H622hy6kQQvV/tiAdpXeTUiPLw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56VJV5cE3547356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 31 Jul 2025 14:31:05 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 31
 Jul 2025 14:31:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 31 Jul 2025 14:31:05 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56VJV5bc3117079;
	Thu, 31 Jul 2025 14:31:05 -0500
Message-ID: <1f348f40-d58f-4055-809c-702040d9eb1b@ti.com>
Date: Thu, 31 Jul 2025 14:31:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH v3] ti-pka-fw: Add a recipe to
 package prebuilt PKA firmware
To: Denys Dmytriyenko <denis@denix.org>, <b-padhi@ti.com>
CC: <denys@konsulko.com>, <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250731021744.1256347-1-b-padhi@ti.com>
 <20250731184534.GQ24899@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250731184534.GQ24899@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 31 Jul 2025 19:31:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18862



On 7/31/2025 1:45 PM, Denys Dmytriyenko wrote:
> On Thu, Jul 31, 2025 at 07:47:44AM +0530, Beleswar Padhi via lists.yoctoproject.org wrote:
>> Add a recipe to install the PKA firmware in root filesystem needed by
>> sa2_ul driver for PKA operations across all K3 platforms.
> 
> So, I see that this firmware is still in the "ti-linux-firmware-next" branch
> and haven't been merged to the main "ti-linux-firmware" branch. Since Ryan
> merged this to "master-wip" of meta-ti, it now breaks my builds...

Yeah sorry.  I'll remove it.



> Also, see below for more comments. >
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> v3: Changelog:
>> 1. Add '&' in Licence instead of '|'.
>> 2. Remove alternatives, directly install firmware in /lib/firmware
>>
>> Link to v2:
>> https://lore.kernel.org/all/20250730180302.7507-1-b-padhi@ti.com/
>>
>> v2: Changelog:
>> 1. Use MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS to package PKA firmware from
>> within meta-ti itself.
>> 2. Update LICENCE name and LIC_FILES_CHKSUM to appropriate licence from
>> ti-linux-firmware.
>>
>> Link to v1:
>> https://lore.kernel.org/all/20250730074831.2640806-1-b-padhi@ti.com/
>>
>>   meta-ti-bsp/conf/machine/include/k3.inc       |  1 +
>>   .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
>>   .../recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb    | 23 +++++++++++++++++++
>>   3 files changed, 25 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
>> index 7ec6b51e..fdcf193d 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -40,6 +40,7 @@ UBI_VOLNAME = "rootfs"
>>   
>>   # List common SoC features, may need to add touchscreen for specific machines
>>   MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci optee-ftpm"
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
>>   
>>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>>   
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> index 863d1a7e..7fe2c592 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -18,6 +18,7 @@ TI_DM_FW_VERSION = "11.01.09"
>>   TI_SYSFW_VERSION = "11.01.05"
>>   TI_HSM_DEMO_FW_VERSION = "11.00.09"
>>   TAD5212_FW_VERSION = "1.0.0.0"
>> +TI_PKA_FW_VERSION = "2.1.0"
>>   
>>   TI_LINUX_FW_SRCREV ?= "f59a711599249ecac75fea38b7a15ef9137d650d"
>>   SRCREV = "${TI_LINUX_FW_SRCREV}"
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
>> new file mode 100644
>> index 00000000..49ae0251
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
>> @@ -0,0 +1,23 @@
>> +SUMMARY = "PKA prebuilt binary firmware image"
>> +
>> +LICENSE = "TI-TFL & INSIDE Secure"
> 
> 1. No spaces in the license name allowed. Normally dash "-" is used instead.
> 
> 2. For every license listed in the LICENSE variable, there should be a
> corresponding file of the same name in one of the LICENSE_PATH. All common
> licenses are provided by OE-Core:
> https://git.openembedded.org/openembedded-core/tree/meta/files/common-licenses
> But any vendor-specific licenses should be provided by a corresponding layer.
> And meta-ti provides such licenses here:
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/licenses
> 
> So, if you need to refer "INSIDE-Secure" license, you should add a
> corresponding file with the license text in meta-ti-bsp/licenses.

We will need to do this in a follow on patch since we are already 
sucking this patch onto next for a CICD promotion.



> 
> 
>> +LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
>> +
>> +COMPATIBLE_MACHINE = "k3"
>> +
>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +
>> +PV = "${TI_PKA_FW_VERSION}"
>> +PR = "${INC_PR}.0"
>> +
>> +PKA_FW_DIR = "ti-pka"
>> +
>> +INSTALL_PKA_FW_DIR = "${nonarch_base_libdir}/firmware"
>> +
>> +PKA_FW_NAME = "eip29t2_2.1.0.bin"
>> +
>> +do_install() {
>> +    # Install Firmware
>> +    install -d ${D}${INSTALL_PKA_FW_DIR}
>> +    install -m 0644 ${S}/${PKA_FW_DIR}/${PKA_FW_NAME} ${D}/${INSTALL_PKA_FW_DIR}/${PKA_FW_NAME}
>> +}
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


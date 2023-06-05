Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29DDC7EE2A
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 11:01:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4686.1685962876305956457
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 04:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZrlKdRGG;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 355B1B6E007964;
	Mon, 5 Jun 2023 06:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685962871;
	bh=FUu1WIu5Sw7yenN23u09mV9AD7vYrX6KgvpnSATyksk=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=ZrlKdRGGWVLfR6kdqDtf1iBxZdd28hjci6g0ryPUI4RGy8fmzYr0bjJDj6QR+e1J1
	 uDNliigKjB5B4urfPHkHFhklu46yEtuUiMcA5FNWDBMkEUSzS1COe3w6HvuIL+lvwN
	 ERdFBvBKv2K/DGT0Tk1lFXoHFwdSfQ3/rvxvwKPA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 355B1Bdh111911
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Jun 2023 06:01:11 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Jun 2023 06:01:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Jun 2023 06:01:10 -0500
Received: from [172.24.145.229] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 355B19I2118826;
	Mon, 5 Jun 2023 06:01:10 -0500
Message-ID: <16f22465-e939-9e7e-f534-5c9b6a883f5a@ti.com>
Date: Mon, 5 Jun 2023 16:31:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone][PATCH] meta-ti-bsp: Add
 recipe for u-boot-ti-jailhouse and linux-ti-jailhouse
To: Denys Dmytriyenko <denis@denix.org>
References: <20230602092932.2576466-1-p-bhagat@ti.com>
 <20230602122130.GN9226@denix.org>
Content-Language: en-US
CC: <meta-ti@lists.yoctoproject.org>
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20230602122130.GN9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 11:01:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16662


On 02/06/23 17:51, Denys Dmytriyenko wrote:
> On Fri, Jun 02, 2023 at 02:59:32PM +0530, Paresh Bhagat via lists.yoctoproject.org wrote:
>> Add a recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which contains
>> patches used for jailhouse. These will be used to build jailhouse image.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   .../u-boot/u-boot-ti-jailhouse_2023.04.bb     | 11 ++++++
>>   .../linux/linux-ti-jailhouse-6.1/defconfig    |  2 +
>>   .../linux/linux-ti-jailhouse-6.1/k3/defconfig |  2 +
>>   .../linux-ti-jailhouse-6.1/omapl138/defconfig |  1 +
>>   .../linux/linux-ti-jailhouse_6.1.bb           | 37 +++++++++++++++++++
>>   5 files changed, 53 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>> new file mode 100644
>> index 00000000..be374108
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>> @@ -0,0 +1,11 @@
>> +require u-boot-ti.inc
>> +
>> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
>> +
>> +PR = "r0"
>> +
>> +BRANCH = "ti-u-boot-2023.04-jailhouse"
>> +
>> +UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
>> +
>> +SRCREV = "79615e1c99b9aa73948f811f5f866cff2e34dc37"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
>> new file mode 100644
>> index 00000000..24b53cf7
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=multi_v7_defconfig
>> +config-fragment=kernel/configs/ti_multi_v7_prune.config
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
>> new file mode 100644
>> index 00000000..ef1d3efd
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=defconfig
>> +config-fragment=kernel/configs/ti_arm64_prune.config
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig
>> new file mode 100644
>> index 00000000..099493af
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig
>> @@ -0,0 +1 @@
>> +use-kernel-config=davinci_all_defconfig
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>> new file mode 100644
>> index 00000000..85eaba25
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>> @@ -0,0 +1,37 @@
> Can you do it similarly to linux-ti-staging-rt recipe by not duplicating the
> entire base recipe?
>
> I will send v2 patch in sometime. Thanks
>> +SECTION = "kernel"
>> +SUMMARY = "Linux kernel for jailhouse for TI devices"
>> +LICENSE = "GPL-2.0-only"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>> +
>> +COMPATIBLE_MACHINE = "am62xx-evm"
>> +
>> +inherit kernel_vendor_dtb
>> +
>> +require recipes-kernel/linux/setup-defconfig.inc
>> +require recipes-kernel/linux/kernel-rdepends.inc
>> +require recipes-kernel/linux/ti-kernel.inc
>> +include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>> +
>> +DEPENDS += "gmp-native libmpc-native"
>> +
>> +# Look in the generic major.minor directory for files
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
>> +
>> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>> +		      ${EXTRA_DTC_ARGS}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +BRANCH = "ti-linux-6.1.y-jailhouse"
>> +
>> +SRCREV = "0ed0dec2462b805b0188fe080895adc437871549"
>> +PV = "6.1.26+git${SRCPV}"
>> +
>> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>> +MACHINE_KERNEL_PR:append = "b"
>> +PR = "${MACHINE_KERNEL_PR}"
>> +
>> +KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
>> +KERNEL_GIT_PROTOCOL = "https"
>> +SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>> +            file://defconfig"
>> -- 
>> 2.34.1


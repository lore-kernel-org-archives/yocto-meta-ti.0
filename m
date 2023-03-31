Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A14C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 14:15:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.56077.1680272144437752875
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 07:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aqsz5+kL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32VEFcJJ045749;
	Fri, 31 Mar 2023 09:15:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680272138;
	bh=/ATB4CA1RztVd/YBua3hYcvPFFbA2hsAEK4Rq5gLrrM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aqsz5+kLEmTGNXYVotdSUFpHMYSAntJb5sF5v5DDPlzhk54FKj4KF+freKDmiPj2N
	 EnA/gKln2u8o54N+f6owjo7aiv1ny62KIy+HduYbYVOBvOkx8ZNO9JYU8X2SF7CFhs
	 NEUWzLJYob+/nj0dyf1cVGZCg5K3e4JAVvz5cYVs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32VEFcOA085532
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Mar 2023 09:15:38 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 31
 Mar 2023 09:15:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 31 Mar 2023 09:15:38 -0500
Received: from [10.249.35.0] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32VEFbYC017205;
	Fri, 31 Mar 2023 09:15:37 -0500
Message-ID: <8d164bb4-5b67-e079-7d05-f020f96b3a2f@ti.com>
Date: Fri, 31 Mar 2023 09:15:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/4] u-boot-ti-staging: Fix
 u-boot configs to match oe-core fitImage
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230330212440.19437-1-reatmon@ti.com>
 <20230330212440.19437-2-reatmon@ti.com> <20230331000408.GA18050@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230331000408.GA18050@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Mar 2023 14:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16280



On 3/30/2023 19:04, Denys Dmytriyenko wrote:
> On Thu, Mar 30, 2023 at 04:24:37PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> After moving to the oe-core kernel-fitimage.bbclass we found that the
>> dtb names we were searching for did not match.  This was due to the
>> KERNEL_DEVICETREE entries including the vendor subdir in the section
>> names of the fitImage file.  This patch updates support in 2021 so that
>> we can temporarily get to a stable boot point before starting our LTS
>> migration and changing a lot of things in the recipes.
> 
> I'm assuming this will be merged to 2023.04 and this patch won't be needed in
> meta-ti then?

That is correct.  This patch will only be for 2021.  2023.04 will have 
these changes submitted to upstream and carried in our branch until that 
time.

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> 
> Acked-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> 
>> ---
>>   ...e-to-support-oe-core-fitImage-naming.patch | 144 ++++++++++++++++++
>>   .../u-boot/u-boot-ti-staging_2021.01.bb       |   8 +-
>>   2 files changed, 151 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
>> new file mode 100644
>> index 00000000..9a832312
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
>> @@ -0,0 +1,144 @@
>> +From 33c4b7335a39c48507a254505169df59c7a69c75 Mon Sep 17 00:00:00 2001
>> +From: Ryan Eatmon <reatmon@ti.com>
>> +Date: Thu, 23 Mar 2023 10:29:40 -0500
>> +Subject: [PATCH] configs: Update to support oe-core fitImage naming
>> +
>> +In kirkstone and forward, the values in the fitImage have been
>> +standardized to include both conf- and the vender subdir in the name of
>> +the dtbs.  This patch updates u-boot to support that.
>> +
>> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> +---
>> + include/configs/am62x_evm.h       | 6 +++---
>> + include/configs/am64x_evm.h       | 4 ++--
>> + include/configs/am65x_evm.h       | 2 +-
>> + include/configs/j721e_evm.h       | 8 ++++----
>> + include/configs/j721s2_evm.h      | 6 +++---
>> + include/configs/j784s4_evm.h      | 6 +++---
>> + include/configs/ti_armv7_common.h | 2 +-
>> + 7 files changed, 17 insertions(+), 17 deletions(-)
>> +
>> +diff --git a/include/configs/am62x_evm.h b/include/configs/am62x_evm.h
>> +index 97bd7c1fd7..6d957c906b 100644
>> +--- a/include/configs/am62x_evm.h
>> ++++ b/include/configs/am62x_evm.h
>> +@@ -122,11 +122,11 @@
>> + #define EXTRA_ENV_AM625_BOARD_SETTINGS					\
>> + 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
>> + 	"findfdt="							\
>> +-		"setenv name_fdt ${default_device_tree};"		\
>> ++		"setenv name_fdt ti_${default_device_tree};"		\
>> + 		"if test $board_name = am62x_skevm; then "		\
>> +-			"setenv name_fdt k3-am625-sk.dtb; fi;"		\
>> ++			"setenv name_fdt ti_k3-am625-sk.dtb; fi;"		\
>> + 		"if test $board_name = am62x_lp_skevm; then "		\
>> +-			"setenv name_fdt k3-am62x-lp-sk.dtb; fi;"	\
>> ++			"setenv name_fdt ti_k3-am62x-lp-sk.dtb; fi;"	\
>> + 		"setenv fdtfile ${name_fdt}\0"				\
>> + 	"name_kern=Image\0"						\
>> + 	"console=ttyS2,115200n8\0"					\
>> +diff --git a/include/configs/am64x_evm.h b/include/configs/am64x_evm.h
>> +index 33ba5da31f..d32b488b58 100644
>> +--- a/include/configs/am64x_evm.h
>> ++++ b/include/configs/am64x_evm.h
>> +@@ -107,9 +107,9 @@
>> + #define EXTRA_ENV_AM642_BOARD_SETTINGS					\
>> + 	"findfdt="							\
>> + 		"if test $board_name = am64x_gpevm; then " \
>> +-			"setenv fdtfile k3-am642-evm.dtb; fi; " \
>> ++			"setenv fdtfile ti_k3-am642-evm.dtb; fi; " \
>> + 		"if test $board_name = am64x_skevm; then " \
>> +-			"setenv fdtfile k3-am642-sk.dtb; fi;" \
>> ++			"setenv fdtfile ti_k3-am642-sk.dtb; fi;" \
>> + 		"if test $fdtfile = undefined; then " \
>> + 			"echo WARNING: Could not determine device tree to use; fi; \0" \
>> + 	"name_kern=Image\0"						\
>> +diff --git a/include/configs/am65x_evm.h b/include/configs/am65x_evm.h
>> +index c78e4c4493..07d234d5d3 100644
>> +--- a/include/configs/am65x_evm.h
>> ++++ b/include/configs/am65x_evm.h
>> +@@ -64,7 +64,7 @@
>> + /* U-Boot general configuration */
>> + #define EXTRA_ENV_AM65X_BOARD_SETTINGS					\
>> + 	"findfdt="							\
>> +-		"setenv name_fdt k3-am654-base-board.dtb;"		\
>> ++		"setenv name_fdt ti_k3-am654-base-board.dtb;"		\
>> + 		"setenv fdtfile ${name_fdt}\0"				\
>> + 	"name_kern=Image\0"						\
>> + 	"console=ttyS2,115200n8\0"					\
>> +diff --git a/include/configs/j721e_evm.h b/include/configs/j721e_evm.h
>> +index 50b018b6ed..ad11494bd0 100644
>> +--- a/include/configs/j721e_evm.h
>> ++++ b/include/configs/j721e_evm.h
>> +@@ -77,13 +77,13 @@
>> + #define EXTRA_ENV_J721E_BOARD_SETTINGS					\
>> + 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
>> + 	"findfdt="							\
>> +-		"setenv name_fdt ${default_device_tree};"		\
>> ++		"setenv name_fdt ti_${default_device_tree};"		\
>> + 		"if test $board_name = J721EX-PM1-SOM; then "		\
>> +-			"setenv name_fdt k3-j721e-proc-board-tps65917.dtb; fi;" \
>> ++			"setenv name_fdt ti_k3-j721e-proc-board-tps65917.dtb; fi;" \
>> + 		"if test $board_name = j721e; then "			\
>> +-			"setenv name_fdt k3-j721e-common-proc-board.dtb; fi;" \
>> ++			"setenv name_fdt ti_k3-j721e-common-proc-board.dtb; fi;" \
>> + 		"if test $board_name = j721e-eaik || test $board_name = j721e-sk; then " \
>> +-			"setenv name_fdt k3-j721e-sk.dtb; fi;"	\
>> ++			"setenv name_fdt ti_k3-j721e-sk.dtb; fi;"	\
>> + 		"setenv fdtfile ${name_fdt}\0"				\
>> + 	"name_kern=Image\0"						\
>> + 	"console=ttyS2,115200n8\0"					\
>> +diff --git a/include/configs/j721s2_evm.h b/include/configs/j721s2_evm.h
>> +index 2d26eb544d..4b4d4a6e37 100644
>> +--- a/include/configs/j721s2_evm.h
>> ++++ b/include/configs/j721s2_evm.h
>> +@@ -66,11 +66,11 @@
>> + #define EXTRA_ENV_J721S2_BOARD_SETTINGS					\
>> + 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
>> + 	"findfdt="							\
>> +-		"setenv name_fdt ${default_device_tree};"		\
>> ++		"setenv name_fdt ti_${default_device_tree};"		\
>> + 		"if test $board_name = j721s2; then "			\
>> +-			"setenv name_fdt k3-j721s2-common-proc-board.dtb; fi;" \
>> ++			"setenv name_fdt ti_k3-j721s2-common-proc-board.dtb; fi;" \
>> + 		"if test $board_name = am68-sk; then "			\
>> +-			"setenv name_fdt k3-am68-sk-base-board.dtb; fi;"\
>> ++			"setenv name_fdt ti_k3-am68-sk-base-board.dtb; fi;"\
>> + 		"setenv fdtfile ${name_fdt}\0"				\
>> + 	"name_kern=Image\0"						\
>> + 	"console=ttyS2,115200n8\0"					\
>> +diff --git a/include/configs/j784s4_evm.h b/include/configs/j784s4_evm.h
>> +index eb609100b0..30820ea1c6 100644
>> +--- a/include/configs/j784s4_evm.h
>> ++++ b/include/configs/j784s4_evm.h
>> +@@ -67,11 +67,11 @@
>> + #define EXTRA_ENV_J784S4_BOARD_SETTINGS					\
>> + 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
>> + 	"findfdt="                                                      \
>> +-		"setenv name_fdt ${default_device_tree};"               \
>> ++		"setenv name_fdt ti_${default_device_tree};"               \
>> + 		"if test $board_name = am69-sk; then "           \
>> +-			"setenv name_fdt k3-am69-sk.dtb; fi;" \
>> ++			"setenv name_fdt ti_k3-am69-sk.dtb; fi;" \
>> + 		"if test $board_name = j784s4; then "                    \
>> +-			"setenv name_fdt k3-j784s4-evm.dtb; fi;" \
>> ++			"setenv name_fdt ti_k3-j784s4-evm.dtb; fi;" \
>> + 		"setenv fdtfile ${name_fdt}\0"				\
>> + 	"name_kern=Image\0"						\
>> + 	"console=ttyS2,115200n8\0"					\
>> +diff --git a/include/configs/ti_armv7_common.h b/include/configs/ti_armv7_common.h
>> +index c48c4c2398..29de095729 100644
>> +--- a/include/configs/ti_armv7_common.h
>> ++++ b/include/configs/ti_armv7_common.h
>> +@@ -68,7 +68,7 @@
>> + 		"do;" \
>> + 		"setenv overlaystring ${overlaystring}'#'${overlay};" \
>> + 		"done;\0" \
>> +-	"run_fit=bootm ${addr_fit}#${fdtfile}${overlaystring}\0" \
>> ++	"run_fit=bootm ${addr_fit}#conf-${fdtfile}${overlaystring}\0" \
>> +
>> + /*
>> +  * DDR information.  If the CONFIG_NR_DRAM_BANKS is not defined,
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>> index 7763d8b1..7529ce6c 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>> @@ -1,9 +1,15 @@
>> +
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
>> +
>>   require u-boot-ti.inc
>>   
>>   LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>>   
>> -PR = "r33"
>> +PR = "r34"
>>   
>>   BRANCH = "ti-u-boot-2021.01"
>>   
>>   SRCREV = "2ee8efd6543648c6b8a14d93d52a6038854035c8"
>> +
>> +SRC_URI += "file://0001-configs-Update-to-support-oe-core-fitImage-naming.patch"
>> +
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


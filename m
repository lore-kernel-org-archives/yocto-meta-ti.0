Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672E6C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 21:13:25 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.6342.1676063601753860753
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 13:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gX6ygnwr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31ALDGrU109489;
	Fri, 10 Feb 2023 15:13:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676063596;
	bh=Vvt1z7zJyhRcTm0mJFz2I1qN06ft1K5qgbJFyozNx5M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gX6ygnwrk1GzOH2Bkhk7VxhINN5W4h4P/8ePop6Wu9xo/R5PKWhMRJgDn0JcK0ygV
	 GORqE2dB/ctr21NZMqYsDQ5W4XChXSUi4ZcsusbXrGrZqA9+rdwx1WbKwPbcbfdTfI
	 r4d60yISu526nPKN8xEH+2/CHo2LuEDIbOknK0Ag=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31ALDGFk080674
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Feb 2023 15:13:16 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Feb 2023 15:13:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Feb 2023 15:13:16 -0600
Received: from [10.250.33.40] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31ALDFqM020880;
	Fri, 10 Feb 2023 15:13:16 -0600
Message-ID: <75bfdf24-ad9c-f778-0eb0-ea119c8c6917@ti.com>
Date: Fri, 10 Feb 2023 15:13:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/8] ti-rtos-firmware: Use
 ti-k3-secdev if TI_SECURE_DEV_PKG_K3 not defined
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230207234239.30720-1-afd@ti.com>
 <20230210210203.GC22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230210210203.GC22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 21:13:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15806

On 2/10/23 3:02 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 07, 2023 at 05:42:32PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> Use ti-k3-secdev native package to provide secure-binary-image.sh script
>> when it is not passed on as an environment variable. This fixes and issue
> 
> Fixes *an* issue
> 

ACK

> 
>> with AM64xx which is always HS but should not require TI_SECURE_DEV_PKG
>> when building for HS-FS platforms.
> 
> And GP?
> 

AM64 is HS-FS only :)

But yes, this fixes GP building too. Will add to the message.

> 
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> index 9a6da088..6c59b8ab 100644
>> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> @@ -31,9 +31,11 @@ CLEANBROKEN = "1"
>>   PR = "${INC_PR}.0"
>>   
>>   # Secure Build
>> +include recipes-ti/includes/ti-paths.inc
> 
> Set TI_K3_SECDEV_INSTALL_DIR here instead of including ti-paths.inc?
> 

Sure, and if we really do not like this include I can drop it everywhere
in the next spin.

> 
>>   DEPENDS += "openssl-native"
>> -
>> -TI_SECURE_DEV_PKG ?= ""
>> +DEPENDS:append = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
> 
> Should probably use DEPENDS += here instead of a generic :append override.
> As :append and :remove are almost impossible to fight/override downstream,
> it is recommended to use += whenever possible, like in this case...
> 

I'm never really sure which is right, the docs all seem to say to use
:append/:remove when possible, but I can see it being a pain to override later..

Andrew

> 
>> +TI_SECURE_DEV_PKG = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
>> +export TI_SECURE_DEV_PKG
>>   
>>   RTOS_ETH_FW_DIR = "${S}/ti-eth/${PLAT_SFX}"
>>   RTOS_DM_FW_DIR = "${S}/ti-dm/${PLAT_SFX}"
>> @@ -49,7 +51,6 @@ DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>>   
>>   # J721e HS support
>>   do_install:prepend:j721e-hs-evm() {
>> -        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>>           ( cd ${RTOS_DM_FW_DIR}; \
>>                   mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>>                   ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
>> @@ -80,7 +81,6 @@ do_install:prepend:j721e-hs-evm() {
>>   
>>   # J7200 HS support
>>   do_install:prepend:j7200-hs-evm() {
>> -        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>>           ( cd ${RTOS_DM_FW_DIR}; \
>>                   mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>>                   ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
>> @@ -101,7 +101,6 @@ do_install:prepend:j7200-hs-evm() {
>>   
>>   # J721s2 HS support
>>   do_install:prepend:j721s2-hs-evm() {
>> -        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>>           ( cd ${RTOS_DM_FW_DIR}; \
>>                   mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>>                   ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
>> -- 
>> 2.39.1


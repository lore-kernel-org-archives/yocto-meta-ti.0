Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635E4C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 21:15:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6377.1676063702570959115
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 13:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tTJSym1y;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31ALEwfd112985;
	Fri, 10 Feb 2023 15:14:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676063698;
	bh=nbgJNy59ova2c4hZPPvAFPr6wDLdCAQE+heNWG62zhw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tTJSym1yoELERbAqUTiREIL1GXR4vO9GyvZ2zgS+vajjenbUVgB0Q0+csKG5kT0tp
	 vZKSBWN6fmSu6qk0ysH8bNWsa0HJXYgKOjPwgA0q5lyeEoPgrg7T/SROUfOfGh/Tpz
	 UdmXs/0QOhvN4nP7RPf1G0WK2U6GbkgDzoGryaKA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31ALEwFq081426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Feb 2023 15:14:58 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Feb 2023 15:14:58 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Feb 2023 15:14:58 -0600
Received: from [10.250.33.40] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31ALEvFe041250;
	Fri, 10 Feb 2023 15:14:58 -0600
Message-ID: <e0bee17c-d4e7-8f10-4b6f-36e97d473ccd@ti.com>
Date: Fri, 10 Feb 2023 15:14:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][master/kirkstone][PATCH 4/8] ti-rtos-firmware: Do not
 break the source directory by renaming files
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230207234239.30720-1-afd@ti.com>
 <20230207234239.30720-4-afd@ti.com> <20230210210740.GD22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230210210740.GD22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 21:15:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15807

On 2/10/23 3:07 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 07, 2023 at 05:42:35PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> If we rename files in the source directory the next time we need to rebuild
>> the original files will be gone and build will fail. Use symlinks instead.
> 
> Just a question - will the install/deploy steps later dereference that symlink
> and install the file content or just a now broken symlink? Would a hardlink be
> better here and avoid uncertainty/confusion?
> 

I was thinking that also, in my testing the install dereferences the symlink
correctly, but a hardlink would work just the same.

Real fix is to just go into the firmware repo and fix these mixed names..

Andrew

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb       | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> index c09f67b5..3c372b32 100644
>> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> @@ -125,18 +125,18 @@ do_install:prepend:j721s2-hs-evm() {
>>   # Update the am64xx ipc binaries to be consistent with other platforms
>>   do_install:prepend:am64xx() {
>>           ( cd ${RTOS_IPC_FW_DIR}; \
>> -                mv am64-main-r5f0_0-fw ipc_echo_test_mcu1_0_release_strip.xer5f; \
>> -                mv am64-main-r5f0_1-fw ipc_echo_test_mcu1_1_release_strip.xer5f; \
>> -                mv am64-main-r5f1_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
>> -                mv am64-main-r5f1_1-fw ipc_echo_test_mcu2_1_release_strip.xer5f; \
>> -                mv am64-mcu-m4f0_0-fw ipc_echo_test_mcu3_0_release_strip.xer5f; \
>> +                ln -s am64-main-r5f0_0-fw ipc_echo_test_mcu1_0_release_strip.xer5f; \
>> +                ln -s am64-main-r5f0_1-fw ipc_echo_test_mcu1_1_release_strip.xer5f; \
>> +                ln -s am64-main-r5f1_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
>> +                ln -s am64-main-r5f1_1-fw ipc_echo_test_mcu2_1_release_strip.xer5f; \
>> +                ln -s am64-mcu-m4f0_0-fw ipc_echo_test_mcu3_0_release_strip.xer5f; \
>>           )
>>   }
>>   
>>   # Update the am62xx ipc binaries to be consistent with other platforms
>>   do_install:prepend:am62xx() {
>>           ( cd ${RTOS_IPC_FW_DIR}; \
>> -                mv am62-mcu-m4f0_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
>> +                ln -s am62-mcu-m4f0_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
>>           )
>>   }
>>   
>> -- 
>> 2.39.1
>>


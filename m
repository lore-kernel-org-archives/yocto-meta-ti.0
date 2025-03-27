Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB735C36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 16:51:47 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1318.1743094301590021242
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 09:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Y6bCVbpj;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52RGpeRT2547909
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 11:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743094300;
	bh=F3zspYK8ya6cMRdQ7lB57/o2hCOA08nu7N1Vi93dDSI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Y6bCVbpjmGDuIsGRV9Vg1J+0zkOEs4MOMFnseUkfIJ6wYZupfrqjZjaG6qN9ZE50B
	 Kx+EY+zb0LNi95b4QaojbOThAKnpIPm5QXrcbR2WZMF2w0LcjP97BuLn7Wi5W03l+1
	 Iy31Y4JulFr0jLoXE9IyhoQyIkJaqvBFmg6cInjA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52RGpeUA013866
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Mar 2025 11:51:40 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Mar 2025 11:51:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Mar 2025 11:51:39 -0500
Received: from [10.249.33.140] ([10.249.33.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52RGpdA4086182;
	Thu, 27 Mar 2025 11:51:39 -0500
Message-ID: <ce0a6833-e63f-4629-a0fe-265275f37a98@ti.com>
Date: Thu, 27 Mar 2025 11:51:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] ti-hsm-fw: Add a recipe to
 export prebuilt HSM firmware
To: Suman Anna <s-anna@ti.com>, <b-padhi@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250327092323.1726839-1-b-padhi@ti.com>
 <850d2bdc-6bfb-a27d-b9d9-d609f401df93@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <850d2bdc-6bfb-a27d-b9d9-d609f401df93@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Mar 2025 16:51:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18426



On 3/27/2025 11:45 AM, Suman Anna wrote:
> Hi Beleswar,
> 
> On 3/27/25 04:23, Beleswar Padhi via lists.yoctoproject.org wrote:
>> Add a recipe to deploy the HSM firmware to the DEPLOYDIR, to be picked
>> up by the tisdk-core-bundle for the prebuilt binaries directory.
> 
> The HSM firmware is only an example/demo firmware, and not a production HSM
> firmware.

Should the recipe name reflect the demo nature?  ti-hsm-demo-fw ?


> This is not clear when looking at this commit. Please revise your patch
> description and the SUMMARY to better reflect this.
> 
> Hopefully, the same is captured as well in the commit that added this to the
> ti-linux-firmware repo.
> 
> regards
> Suman
> 
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>   .../recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb    | 28 +++++++++++++++++++
>>   .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  4 +++
>>   3 files changed, 33 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
>> new file mode 100644
>> index 00000000..8b225421
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
>> @@ -0,0 +1,28 @@
>> +SUMMARY = "TI HSM Firmware"
>> +
>> +inherit deploy
>> +
>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +PV = "${TI_HSM_FW_VERSION}"
>> +PR = "${INC_PR}.0"
>> +
>> +SYSFW_SOC ?= "*"
>> +SYSFW_SOC:j721s2 = "j721s2"
>> +SYSFW_SOC:j784s4 = "j784s4"
>> +
>> +HSM_BINARY = "hsm-demo-firmware-${SYSFW_SOC}*.bin"
>> +
>> +do_install() {
>> +	install -d ${D}${nonarch_base_libdir}/firmware/ti-hsm
>> +	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${D}${nonarch_base_libdir}/firmware/ti-hsm
>> +}
>> +
>> +do_deploy() {
>> +	install -d ${DEPLOYDIR}/ti-hsm
>> +	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${DEPLOYDIR}/ti-hsm
>> +}
>> +
>> +addtask deploy before do_build after do_compile
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> index 0d912625..4e9c385c 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -16,6 +16,7 @@ IMG_DEC_FW_VERSION = "1.0"
>>   CNM_WAVE521_FW_VERSION = "1.0.7"
>>   TI_DM_FW_VERSION = "11.00.09"
>>   TI_SYSFW_VERSION = "11.00.07"
>> +TI_HSM_FW_VERSION = "11.00.09"
>>   
>>   TI_LINUX_FW_SRCREV ?= "27003b6bff61a55dd1fff2cc777e5e07b092b1f7"
>>   SRCREV = "${TI_LINUX_FW_SRCREV}"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index 41d4abdd..8a800193 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -40,6 +40,10 @@ DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-n
>>   DEPENDS:append:k3 = " ti-sci-fw"
>>   DEPENDS:append:k3r5 = " ti-sci-fw"
>>   
>> +# HSM Firmware is only applicable for J721S2 & J784S4 devices
>> +DEPENDS:append:j721s2 = " ti-hsm-fw"
>> +DEPENDS:append:j784s4 = " ti-hsm-fw"
>> +
>>   DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>>   
>>   PLAT_SFX = ""
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18422): https://lists.yoctoproject.org/g/meta-ti/message/18422
>> Mute This Topic: https://lists.yoctoproject.org/mt/111933183/4594561
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [s-anna@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


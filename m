Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E1DC433FE
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 21:49:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.3528.1651700968607259965
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 14:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sKfu1l/1;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 244LnOlP042108;
	Wed, 4 May 2022 16:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651700964;
	bh=cTUG9N/3xU6bqlBYMJBdiIn/agRkTYENUqjFIaS1JiA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sKfu1l/1jmzhLZ4s9wYNbgJBoFJ7suoUW4bmPj1B1t9WnQALvgwymls7d+R2l74lC
	 xp2/OGGaZYwKdMNMLTypqgeo6yX1HY3rz8+gNMI1ZYHmnqZ4Hk7ekijYXORHLT351p
	 lakwxeuvp75B6RGB3U2HiphvyHpPoa2hHzMMhYNI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 244LnOH3009255
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 16:49:24 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 16:49:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 16:49:23 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 244LnN8A037284;
	Wed, 4 May 2022 16:49:23 -0500
Message-ID: <c850f667-597e-ff43-c84a-17dde1afb0bb@ti.com>
Date: Wed, 4 May 2022 16:49:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-ti][dunfell][PATCH] recipes-bsp: tifs-lpm-stub: Introduce
 new recipe
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220504213844.20764-1-reatmon@ti.com>
 <20220504214333.GG9834@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220504214333.GG9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 May 2022 21:49:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14694



On 5/4/2022 16:43, Denys Dmytriyenko wrote:
> On Wed, May 04, 2022 at 04:38:44PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> This firmware stub is required by the TI foundational security
>> software while transitioning to low power mode.
>>
>> Add a recipe for this compatible with am62xx-evm
> 
> Is it GP only FW?

Not sure how to answer that.  I was just told to pick up this change for 
the release and I cleaned it up to match a more consistent style.

> 
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  1 +
>>   .../tifs-lpm-stub/tifs-lpm-stub_git.bb        | 24 +++++++++++++++++++
>>   recipes-kernel/linux/kernel-rdepends.inc      |  4 ++++
>>   3 files changed, 29 insertions(+)
>>   create mode 100644 recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
>>
>> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> index 3ebdae30..47e76347 100644
>> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -18,6 +18,7 @@ GOODIX_FW_VERSION = "1.0.0.0"
>>   CADENCE_MHDP_FW_VERSION = "1.2.17"
>>   IMG_DEC_FW_VERSION = "1.0"
>>   CNM_WAVE521_FW_VERSION = "1.0.00"
>> +TIFS_LPM_STUB_FW_VERSION = "08.03.02"
>>   
>>   TI_LINUX_FW_SRCREV ?= "917625c2721eef8677df9e47d919005b0d4f93aa"
>>   SRCREV = "${TI_LINUX_FW_SRCREV}"
>> diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
>> new file mode 100644
>> index 00000000..642a8d3a
>> --- /dev/null
>> +++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY = "TI Foundational security Low Power Management Stub"
>> +
>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +
>> +PV = "${TIFS_LPM_STUB_FW_VERSION}"
>> +PR = "${INC_PR}.0"
>> +
>> +CLEANBROKEN = "1"
>> +
>> +COMPATIBLE_MACHINE = "am62xx-evm"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +TARGET = "ti-fs-stub-firmware-am62x-gp-signed.bin"
>> +
>> +do_install() {
>> +	install -d ${D}${base_libdir}/firmware/ti-sysfw/
>> +	install -m 0644 ${S}/ti-sysfw/${TARGET} ${D}${base_libdir}/firmware/ti-sysfw/${TARGET}
>> +}
>> +
>> +FILES_${PN} = "${base_libdir}/firmware"
>> +
>> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
>> index 522d9674..17aee4c2 100644
>> --- a/recipes-kernel/linux/kernel-rdepends.inc
>> +++ b/recipes-kernel/linux/kernel-rdepends.inc
>> @@ -45,3 +45,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
>>   
>>   # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
>>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cnm-wave-fw"
>> +
>> +# Add run-time dependency for TIFS Low Power Module stub
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
>> +
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


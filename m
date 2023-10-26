Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5777FC25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 14:00:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.71305.1698328824999758362
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 07:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BGoeLGi9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39QE0I06129200;
	Thu, 26 Oct 2023 09:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698328818;
	bh=4b9I4YQA7ehJ9Alz8M8vg5y9onIMcXvf6Sm7/RB0D+w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BGoeLGi9+fAV1+pQ9SY/bLpisMsPqH0u/gZe4Ct6CUxKx0ypnIsgpcMko2KUGRzig
	 0bf51H6iHNCq6rS5ZWAuIHjRqFydHstM8cA4AjJA5Vd2Ixycf9ruKTYbxUZCTxnGye
	 pVVDnCGDtPug/VRnI+i+kYF0tna+654P8ec6JNis=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39QE0Iug004961
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Oct 2023 09:00:18 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Oct 2023 09:00:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Oct 2023 09:00:18 -0500
Received: from [10.250.38.120] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39QE0HHh017444;
	Thu, 26 Oct 2023 09:00:17 -0500
Message-ID: <eed601f5-9a84-48c8-80a7-ac03bf48ed72@ti.com>
Date: Thu, 26 Oct 2023 09:00:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH 8/8] recipes-bsp: Do not use
 MACHINE_ARCH when package is not machine specific
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20231025165630.2274889-1-afd@ti.com>
 <20231025165630.2274889-8-afd@ti.com> <20231026032740.GD2408@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231026032740.GD2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Oct 2023 14:00:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17197

On 10/25/23 10:27 PM, Denys Dmytriyenko wrote:
> On Wed, Oct 25, 2023 at 11:56:30AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 2 --
>>   meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb         | 2 --
>>   meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb     | 1 -
>>   meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb             | 2 --
>>   meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb   | 2 --
>>   meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb       | 2 --
>>   meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb   | 2 --
>>   meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb     | 2 --
>>   meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb | 2 --
>>   meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb              | 1 -
>>   meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb           | 1 -
>>   11 files changed, 19 deletions(-)
> 
> Overall I agree and fully support the first 7 patches in this series.
> 
> But for this last one I wanted to open a discussion.
> 

I try to sort my series in least-to-most likely to be controversial, I was
just wondering how far we would get down the list, glad we got to 8 :)

> On one hand I understand the desire to make components as generic as possible
> and reduce the number of machine-specific components to a bare minimum.
> 
> But on another hand, marking the resulting package as machine-specific when it
> has a short list of compatible machines is a standard practice. The reason is
> that the list of compatible machines controls only compile time filtering, but
> doesn't have any effect on run time. And marking packages as machine specific
> helps with that. That closes the loophole of installing incompatible packages.
> 
> For example, first recipe below specifies that Cadence MHDP firmware is
> compatible with 3 J7 platforms only (or their SoC families, to be exact).
> But w/o marking resulting binary package as machine-specific (therefore
> producing separate packages for those platforms), there will be a single
> generic Aarch64 package made. And there's no protection from installing
> this generic package on non-compatible platforms, like J7200 or AM65xx,
> either manullay or by pulling it into a rootfs for those incompatible
> platforms.
> 
> And you normally want to prevent this for regular components. But I guess
> this doesn't fully apply to FW images that are loaded by corresponding
> drivers anyway. Moreover, there's no compilation involved, just packaging
> the binary blob.
> 
> In that case, should we also remove COMPATIBLE_MACHINE from these firmware
> recipes?
> 

That is exactly where I was going to go next. These firmware packages are
not technically incompatible with the other machines.

We just use COMPATIBLE_MACHINE checks here to keep us from accidentily bundling
them with images where they wouldn't add any value (which you did with prusw-fw
which is what stated me thinking on all this). But since they don't break
anything either, forcing them to be machine specific seemed like overkill also.

Only place where we still need this is firmware recipes that only ship some of
the firmware based on machine (see prueth-fw for instance). I'd like to get
that cleaned up next. If we only want some of the firmware then we should split
it into different packages (prueth-fw-am57xx, etc.) and only install the one
we want for that platform.

Andrew

> 
> 
>> diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
>> index d88bca6e..ed1c7817 100644
>> --- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
>> @@ -10,8 +10,6 @@ PR = "${INC_PR}.0"
>>   
>>   COMPATIBLE_MACHINE = "j721e|j721s2|j784s4"
>>   
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>>   TARGET = "mhdp8546.bin"
>>   
>>   do_install() {
>> diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> index 5b1d8be1..ef7bc2ad 100644
>> --- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> @@ -12,8 +12,6 @@ PR = "${INC_PR}.1"
>>   
>>   COMPATIBLE_MACHINE = "j721s2|j784s4|am62axx"
>>   
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>>   TARGET_WAVE521C = "wave521c_codec_fw.bin"
>>   
>>   SOURCE_WAVE521C = "wave521c_k3_codec_fw.bin"
>> diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
>> index 6e2996ce..e333d212 100755
>> --- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
>> @@ -4,7 +4,6 @@ LICENSE = "TI-TFL"
>>   LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"
>>   
>>   PV = "6.2+git${SRCPV}"
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>>   inherit update-alternatives
>>   
>> diff --git a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
>> index e58f2d58..ee3a94dc 100644
>> --- a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
>> @@ -10,8 +10,6 @@ PR = "${INC_PR}.0"
>>   
>>   COMPATIBLE_MACHINE = "dra7xx"
>>   
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>>   ORIGIN = "DRA71x-RevA-GT9271_SpecDig_Config.bin"
>>   TARGET = "goodix_9271_cfg.bin"
>>   
>> diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>> index 2c0736ed..4b6ef75d 100644
>> --- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>>   
>>   COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
>>   
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>>   TARGET = " \
>>       am65x-sr2-pru0-prueth-fw.elf \
>>       am65x-sr2-pru1-prueth-fw.elf \
>> diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>> index 8b15ab7f..20b2bfb9 100644
>> --- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>>   
>>   COMPATIBLE_MACHINE = "am65xx"
>>   
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>>   TARGET = " \
>>       am65x-pru0-prueth-fw.elf \
>>       am65x-pru1-prueth-fw.elf \
>> diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
>> index ea39d73d..bc731094 100644
>> --- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
>> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>>   
>>   COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
>>   
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>>   TARGET = " \
>>       am65x-sr2-pru0-pruhsr-fw.elf \
>>       am65x-sr2-pru1-pruhsr-fw.elf \
>> diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
>> index 63c2d311..6e296e7c 100644
>> --- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
>> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>>   
>>   COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
>>   
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>>   TARGET = " \
>>       am65x-sr2-pru0-prusw-fw.elf \
>>       am65x-sr2-pru1-prusw-fw.elf \
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>> index d295a1c1..74729c16 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>> @@ -9,8 +9,6 @@ PR = "${INC_PR}.0"
>>   
>>   COMPATIBLE_MACHINE = "j721e"
>>   
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>>   TARGET = "pvdec_full_bin.fw"
>>   
>>   do_install() {
>> diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
>> index 7d16ae39..4ec09a70 100644
>> --- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
>> +++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
>> @@ -3,7 +3,6 @@ LICENSE = "TI-TSPA"
>>   LIC_FILES_CHKSUM = "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.html;md5=a59aa54b9470f555cf086b91dca0afa3"
>>   
>>   COMPATIBLE_MACHINE = "dra7xx"
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>>   PR = "r1"
>>   
>> diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
>> index 2452d111..8af49577 100644
>> --- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
>> +++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
>> @@ -4,7 +4,6 @@ LICENSE = "TI-TSPA"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=fd463c9500441ed91d07a0331baa635c"
>>   
>>   COMPATIBLE_MACHINE = "dra7xx"
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>>   SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vpdma-fw/03-2012/exports/vpdma-fw_03-2012.tar.gz;protocol=http;name=dra7xx-evm"
>>   SRC_URI[dra7xx-evm.md5sum] = "80176df1350c21d9efa90171789c546e"
>> -- 
>> 2.39.2


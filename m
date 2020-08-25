Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.221.1598372593815456767
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2020 09:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=C7/qX0+Z;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: lokeshvutla@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PGNCYV002994
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2020 11:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598372592;
	bh=TrRCdVPdP5sdMkP48K5THwy8GwvRm+ym5BXYb++vJZE=;
	h=Subject:From:To:CC:References:Date:In-Reply-To;
	b=C7/qX0+ZP5sFQWTEMLuvzZey+CdxYVPqnoCgVuZR9xXPwrs4O3fevkh3JIvzgKz8u
	 jRAHx/bOPHN9zuT4caablYLLKNQ5VVQ87q0Uq2i755z1oOdpFNIbiS2sG8z7O01+F3
	 3Vh52X6jHt8LLXXqrmAKgO5ZE9aB4dlBhwi6jUDg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PGNCWd127547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2020 11:23:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 11:23:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 11:23:12 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PGN9Yt079152;
	Tue, 25 Aug 2020 11:23:10 -0500
Subject: Re: [PATCH 3/3] prusw-fw: Package the firmware images from ti-linux-firmware
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sekhar Nori <nsekhar@ti.com>,
        <m-erdahl@ti.com>, <m-karicheri2@ti.com>
References: <20200821073238.18926-1-lokeshvutla@ti.com>
 <20200821073238.18926-4-lokeshvutla@ti.com> <20200821185455.GL29812@beryl>
 <8ec67b9d-b63e-1bfd-2e94-fd4323e98a8d@ti.com>
Message-ID: <048a92da-58ae-eaee-9440-908d34221039@ti.com>
Date: Tue, 25 Aug 2020 21:53:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8ec67b9d-b63e-1bfd-2e94-fd4323e98a8d@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Denys,

On 23/08/20 3:24 pm, Lokesh Vutla wrote:
> 
> 
> On 22/08/20 12:24 am, Denys Dmytriyenko wrote:
>> On Fri, Aug 21, 2020 at 01:02:38PM +0530, Lokesh Vutla wrote:
>>> Directly take the images from ti-linux-firmware instead of using pdk
>>>
>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>> ---
>>>  recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb | 38 ++++++++++++++++++++++++
>>>  recipes-bsp/prusw-fw/prusw-fw_git.bb   | 40 --------------------------
>>>  2 files changed, 38 insertions(+), 40 deletions(-)
>>>  create mode 100644 recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb
>>>  delete mode 100644 recipes-bsp/prusw-fw/prusw-fw_git.bb
>>>
>>> diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb b/recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb
>>> new file mode 100644
>>> index 00000000..514237eb
>>> --- /dev/null
>>> +++ b/recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb
>>> @@ -0,0 +1,38 @@
>>> +DESCRIPTION = "PRU Switch firmware for AM57xx, AM437x and AM335x"
>>
>> Use SUMMARY here
> 
> Sure
> 
>>
>>
>>> +LICENSE = "TI-TFL"
>>> +LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>>> +
>>> +PV = "3.0.3"
>>
>> So, the filename sets PV to 3.0.0, but here it's 3.0.3?
> 
> 3.0.3 will fix the file name.
> 
>>
>>
>>> +PR = "r1"
>>
>> Drop PR
> 
> If PR is not added, the below error occurs. What could be wrong?
> 
> ERROR: prusw-fw-3.0.3-r0 do_packagedata: QA Issue: Package version for package prusw-fw-src went backwards which would break package feeds (from 0:3.0.3-r1.0 to 0:3.0.3-r0.1) [version-going-backwards]
> ERROR: prusw-fw-3.0.3-r0 do_packagedata: QA Issue: Package version for package prusw-fw-dbg went backwards which would break package feeds (from 0:3.0.3-r1.0 to 0:3.0.3-r0.1) [version-going-backwards

Any idea why this could happen?

Thanks and regards,
Lokesh


> 
> Thanks and regards,
> Lokesh
> 
>>
>>
>>> +CLEANBROKEN = "1"
>>> +
>>> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>>> +
>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>> +
>>> +SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
>>> +BRANCH ?= "ti-linux-firmware"
>>> +
>>> +SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +TARGET = ""
>>> +TARGET_ti33x = "am335x-pru0-prusw-fw.elf am335x-pru1-prusw-fw.elf"
>>> +TARGET_ti43x = "am437x-pru0-prusw-fw.elf am437x-pru1-prusw-fw.elf"
>>> +TARGET_am57xx-evm = "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.elf"
>>> +TARGET_am57xx-hs-evm = "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.elf"
>>> +
>>> +do_install() {
>>> +	install -d ${D}${base_libdir}/firmware/ti-pruss
>>> +	for f in ${TARGET}; do
>>> +		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
>>> +	done
>>> +}
>>> +
>>> +
>>> +FILES_${PN} = "${base_libdir}/firmware"
>>> +
>>> +INSANE_SKIP_${PN} = "arch"
>>> diff --git a/recipes-bsp/prusw-fw/prusw-fw_git.bb b/recipes-bsp/prusw-fw/prusw-fw_git.bb
>>> deleted file mode 100644
>>> index 2921fb1d..00000000
>>> --- a/recipes-bsp/prusw-fw/prusw-fw_git.bb
>>> +++ /dev/null
>>> @@ -1,40 +0,0 @@
>>> -DESCRIPTION = "PRU Switch firmware for AM57xx"
>>> -
>>> -require recipes-ti/includes/ti-paths.inc
>>> -require recipes-bsp/icss-emac-lld/icss-emac-lld.inc
>>> -
>>> -LICENSE = "TI-TFL"
>>> -LIC_FILES_CHKSUM = "file://icss_dualemac/src/firmware_version.h;beginline=6;endline=53;md5=1f0a640a261059cdcbbcf01e6a739ff3"
>>> -
>>> -PR = "${INC_PR}.0"
>>> -
>>> -TI_PDK_COMP = "ti.drv.icss_emac.firmware"
>>> -
>>> -B = "${S}/icss_switch"
>>> -
>>> -COMPATIBLE_MACHINE = "dra7xx"
>>> -
>>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>>> -
>>> -DEPENDS = "ti-cgt-pru-native"
>>> -
>>> -PRU_VERSION = ""
>>> -PRU_VERSION_dra7xx = "REV2"
>>> -
>>> -FW_PREFIX = ""
>>> -FW_PREFIX_dra7xx = "am57xx"
>>> -
>>> -
>>> -EXTRA_OEMAKE += "CL_PRU_INSTALL_PATH="${TI_CGT_PRU_INSTALL_DIR}" PRU_VERSION_LIST="${PRU_VERSION}""
>>> -
>>> -do_install() {
>>> -	install -d ${D}${base_libdir}/firmware/ti-pruss
>>> -	install -m 0644 ./elf/${PRU_VERSION}/icss_stp_switch_PRU0.elf \
>>> -		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru0-prusw-fw.elf
>>> -	install -m 0644 ./elf/${PRU_VERSION}/icss_stp_switch_PRU1.elf \
>>> -		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru1-prusw-fw.elf
>>> -}
>>> -
>>> -FILES_${PN} = "${base_libdir}/firmware"
>>> -
>>> -INSANE_SKIP_${PN} = "arch"
>>> -- 
>>> 2.23.0
>>>

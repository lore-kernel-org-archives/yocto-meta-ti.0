Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.197413.1598282982344717532
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 08:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CjFYxr+X;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07OFTf7H079834
	for <meta-ti@lists.yoctoproject.org>; Mon, 24 Aug 2020 10:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598282981;
	bh=7jmfqC3+bSohFPwlmMCkm2ePEKA1jIgrGTgGzBBJX7I=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=CjFYxr+XTZqq9fFoZavMADJ+Zq1/FWuPBmTX2aoK4LHpF3aOZWI9M69bw9Pe2xYm1
	 UvxspwYbBMa0ezs1BYcqmdg4gd+fLzrqho53J4/DD/DN5mWc0fVr3zYHyolqEzhPOz
	 7uOkiKjxdX/RFg88YGiyJjzvC/Zs7r5T2zF5QKX0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07OFTfeN028444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 24 Aug 2020 10:29:41 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 24
 Aug 2020 10:29:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 24 Aug 2020 10:29:40 -0500
Received: from [10.250.32.171] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07OFTeVm045422;
	Mon, 24 Aug 2020 10:29:40 -0500
Subject: Re: [PATCH 2/3] prueth-fw: Package the firmware images from ti-linux-firmware
To: Denys Dmytriyenko <denys@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sekhar Nori <nsekhar@ti.com>,
        <m-erdahl@ti.com>, <m-karicheri2@ti.com>
References: <20200821073238.18926-1-lokeshvutla@ti.com>
 <20200821073238.18926-3-lokeshvutla@ti.com> <20200821185314.GK29812@beryl>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <99a37ab2-9c6f-bfb9-6174-907901bdd819@ti.com>
Date: Mon, 24 Aug 2020 10:29:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821185314.GK29812@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Denys,

On 8/21/20 1:53 PM, Denys Dmytriyenko wrote:
> On Fri, Aug 21, 2020 at 01:02:37PM +0530, Lokesh Vutla wrote:
>> Directly take the images from ti-linux-firmware instead of using pdk
>> Aldo drop build for k2g as firmwares are not yet available.
> 
> Same comment for the version/PV use.
> 
> Also, are there any alternatives that need to be setup with symlinks for these 
> firmware images and PRU in general? E.g. pru-icss sets symlinks am335x-pru0-fw 
> and am57xx-pru1_0-fw to point to Halt vs. Echo images. Is this needed for 
> prueth, pruhsr, pruprp or prusw images? Suman?

PRU firmwares follow a mixed-style. The PRU remoteproc drivers do not support
remoteproc auto-boot and can let the PRU client drivers set the firmware name
(either through DT or coded up in the driver) before booting the corresponding
remoteprocs. PRU Ethernet follows the latter option, and chooses the right
firmware depending on the protocol it is configured for. The firmware names used
by the PRU remoteproc driver is therefore less relevant when compared to the
other remoteproc drivers.

regards
Suman

> 
> 
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>>  recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb     | 38 ++++++++++++++++
>>  recipes-bsp/prueth-fw/prueth-fw_git.bb       | 47 --------------------
>>  recipes-kernel/linux/linux-ti-staging_5.4.bb |  1 -
>>  3 files changed, 38 insertions(+), 48 deletions(-)
>>  create mode 100644 recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb
>>  delete mode 100644 recipes-bsp/prueth-fw/prueth-fw_git.bb
>>
>> diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb b/recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb
>> new file mode 100644
>> index 00000000..1847c221
>> --- /dev/null
>> +++ b/recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb
>> @@ -0,0 +1,38 @@
>> +DESCRIPTION = "PRU Ethernet firmware for AM57xx, AM437x and AM335x"
> 
> Use SUMMARY instead.
> 
> 
>> +LICENSE = "TI-TFL"
>> +LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>> +
>> +PV = "5.2.7"
>> +PR = "r1"
> 
> Please drop PR for the new recipe.
> 
> 
>> +CLEANBROKEN = "1"
>> +
>> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
>> +BRANCH ?= "ti-linux-firmware"
>> +
>> +SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +TARGET = ""
>> +TARGET_ti33x = "am335x-pru0-prueth-fw.elf am335x-pru1-prueth-fw.elf"
>> +TARGET_ti43x = "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
>> +TARGET_am57xx-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
>> +TARGET_am57xx-hs-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
>> +
>> +do_install() {
>> +	install -d ${D}${base_libdir}/firmware/ti-pruss
>> +	for f in ${TARGET}; do
>> +		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
>> +	done
>> +}
>> +
>> +
>> +FILES_${PN} = "${base_libdir}/firmware"
>> +
>> +INSANE_SKIP_${PN} = "arch"
>> diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
>> deleted file mode 100644
>> index f7718ad2..00000000
>> --- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
>> +++ /dev/null
>> @@ -1,47 +0,0 @@
>> -DESCRIPTION = "PRU Ethernet firmware for AM57xx, AM437x, AM335x and K2G"
>> -
>> -require recipes-ti/includes/ti-paths.inc
>> -require recipes-bsp/icss-emac-lld/icss-emac-lld.inc
>> -
>> -LICENSE = "TI-TFL"
>> -LIC_FILES_CHKSUM = "file://icss_dualemac/src/firmware_version.h;beginline=6;endline=53;md5=1f0a640a261059cdcbbcf01e6a739ff3"
>> -
>> -PR = "${INC_PR}.0"
>> -
>> -TI_PDK_COMP = "ti.drv.icss_emac.firmware"
>> -
>> -B = "${S}/icss_dualemac"
>> -
>> -COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm|ti43x|ti33x|k2g"
>> -
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>> -DEPENDS = "ti-cgt-pru-native"
>> -
>> -PRU_VERSION = ""
>> -PRU_VERSION_ti33x = "REV1"
>> -PRU_VERSION_ti43x = "REV1"
>> -PRU_VERSION_am57xx-evm = "REV2"
>> -PRU_VERSION_am57xx-hs-evm = "REV2"
>> -PRU_VERSION_k2g = "REV2"
>> -
>> -FW_PREFIX = ""
>> -FW_PREFIX_ti33x = "am335x"
>> -FW_PREFIX_ti43x = "am437x"
>> -FW_PREFIX_am57xx-evm = "am57xx"
>> -FW_PREFIX_am57xx-hs-evm = "am57xx"
>> -FW_PREFIX_k2g = "k2g"
>> -
>> -EXTRA_OEMAKE += "CL_PRU_INSTALL_PATH="${TI_CGT_PRU_INSTALL_DIR}" PRU_VERSION_LIST="${PRU_VERSION}""
>> -
>> -do_install() {
>> -	install -d ${D}${base_libdir}/firmware/ti-pruss
>> -	install -m 0644 ./elf/${PRU_VERSION}/icss_dualemac_PRU0.elf \
>> -		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru0-prueth-fw.elf
>> -	install -m 0644 ./elf/${PRU_VERSION}/icss_dualemac_PRU1.elf \
>> -		${D}${base_libdir}/firmware/ti-pruss/${FW_PREFIX}-pru1-prueth-fw.elf
>> -}
>> -
>> -FILES_${PN} = "${base_libdir}/firmware"
>> -
>> -INSANE_SKIP_${PN} = "arch"
>> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> index 3a4fdd86..2a35bf1d 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> @@ -48,7 +48,6 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " prueth-fw prusw-fw pr
>>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
>>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp-fw"
>>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
>> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " prueth-fw"
>>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
>>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
>>  
>> -- 
>> 2.23.0
>>


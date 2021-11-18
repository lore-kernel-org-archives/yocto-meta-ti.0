Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1178.1637265106532515313
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 11:51:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xzgxlZfc;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AIJpgp2088075;
	Thu, 18 Nov 2021 13:51:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637265102;
	bh=3pOw7U1A4g66/kPC9CifCkwYc0Uz79R5safMnI4dV4c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xzgxlZfca6MBqd+GHAVU88CqhqOVbCXsFiEFCdtVyfSG9N8UU1cDdNLq4s77xwqv1
	 awwjyqkH4cGXJr/JYje2baq4SmmJqqN1acxwgx3k9xCayYTp42v2HeqICYJdftg1PN
	 M5eDzRp53ZsuJsFD8BM3FNE7JuqKx5iGJQqHtfpw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AIJpgms006500
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 13:51:42 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 13:51:42 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 13:51:42 -0600
Received: from [10.249.32.113] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AIJpgHq063817;
	Thu, 18 Nov 2021 13:51:42 -0600
Message-ID: <56ceb613-f5e7-a2dd-cf16-1f583531ab4c@ti.com>
Date: Thu, 18 Nov 2021 13:51:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [dunfell/master PATCHv2] vxd-dec-fw: Add the recipe for vxd-dec-fw
To: Denys Dmytriyenko <denis@denix.org>, <praneeth@ti.com>
CC: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, <prashanth.ka@pathpartnertech.com>
References: <20211118003005.25238-1-praneeth@ti.com>
 <20211118025643.GA18191@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20211118025643.GA18191@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

I have tried to address your comment in v3.

On 11/17/2021 8:56 PM, Denys Dmytriyenko wrote:
> On Wed, Nov 17, 2021 at 06:30:05PM -0600, praneeth@ti.com wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Add the firmware packaging recipe for the video decoder
>> for j721e.
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>> Changes in v2: Update subject dunfell/master
>>
>>   .../ti-img-encode-decode/vxd-dec-fw_git.bb    | 24 +++++++++++++++++++
>>   recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  1 +
>>   2 files changed, 25 insertions(+)
>>   create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>>
>> diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>> new file mode 100644
>> index 00000000..55673b53
>> --- /dev/null
>> +++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY = "Video Decoding Firmware Packaging recipe"
> 
> Well, the SUMMARY and the DESCRIPTION are for the resulting ipk/deb/rpm
> package, not the recipe.
> 
> E.g. on Ubuntu - the last 2 lines are the SUMMARY and DESCRIPTION accordingly:
> 
> $ dpkg -s linux-firmware
> Package: linux-firmware
> Status: install ok installed
> Priority: optional
> Section: misc
> Installed-Size: 233791
> Maintainer: Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>
> Architecture: all
> Multi-Arch: foreign
> Version: 1.157.23
> Replaces: atmel-firmware, linux-firmware-snapdragon (<= 1.2-0ubuntu1), linux-restricted-common
> Provides: atmel-firmware
> Breaks: linux-firmware-snapdragon (<= 1.2-0ubuntu1)
> Conflicts: atmel-firmware
> Description: Firmware for Linux kernel drivers
>   This package provides firmware used by Linux kernel drivers.
> 
> 
> 
>> +LICENSE = "TI-IMG"
>> +LIC_FILES_CHKSUM = "file://LICENSE.ti-img;md5=84ca7278930db001870686ad997d6bb1"
>> +
>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +
>> +PV = "${IMG_DEC_FW_VERSION}"
>> +PR = "${INC_PR}.0"
>> +
>> +CLEANBROKEN = "1"
>> +
>> +COMPATIBLE_MACHINE = "j7"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +S = "${WORKDIR}/git"
>> +TARGET = "pvdec_full_bin.fw"
>> +
>> +do_install() {
>> +        install -d ${D}${base_libdir}/firmware/ti-img
>> +        install -m 0644 ${S}/ti-img/${TARGET} ${D}${base_libdir}/firmware/ti-img/${TARGET}
>> +}
>> +
>> +FILES_${PN} = "${base_libdir}/firmware"
>> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> index c59120b8..ebf133be 100644
>> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -16,6 +16,7 @@ PRUETH_FW_AM65X_VERSION = "08.00.00.20"
>>   PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.06"
>>   GOODIX_FW_VERSION = "1.0.0.0"
>>   CADENCE_MHDP_FW_VERSION = "1.2.17"
>> +IMG_DEC_FW_VERSION = "1.0"
>>   
>>   TI_LINUX_FW_SRCREV ?= "95232a584175a8ac872adf477b2dbb9ca68ba063"
>>   SRCREV = "${TI_LINUX_FW_SRCREV}"
>> -- 
>> 2.17.1
>>
> 

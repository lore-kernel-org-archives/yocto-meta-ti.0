Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.133.1637269100774811969
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 12:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GM2olTUO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AIKwGL6107293;
	Thu, 18 Nov 2021 14:58:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637269096;
	bh=QFaUN3IsnEDVoJp4IYZrfZrxOUBB/HsFWC5tOdiHSG0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GM2olTUO+aCpoT1uWVN54U8pD83JnmQGZzpentxxZ+3+wBRNVeX70EKtD4pFZ6lqP
	 E/7NrMnWm0RHlgoolqFuWtGor87kqq/sI06cLaP/rwpLY7SZhyw3Wf7EbBYDrSJ5pT
	 XUEB80hlM9JIBrMN6ltlWeMxPzej3I5lXuNZSXlI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AIKwF5L098115
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 14:58:15 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 14:58:15 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 14:58:15 -0600
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AIKwFxT048021;
	Thu, 18 Nov 2021 14:58:15 -0600
Message-ID: <0d0cbfba-8765-afa0-41e1-30bef192730b@ti.com>
Date: Thu, 18 Nov 2021 14:58:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [meta-ti][dunfell][PATCH v4] vxd-dec-fw: Add the recipe for vxd-dec-fw
To: Denys Dmytriyenko <denis@denix.org>, <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20211118195750.4658-1-yogeshs@ti.com>
 <20211118200517.GH18191@denix.org>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20211118200517.GH18191@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/2021 2:05 PM, Denys Dmytriyenko wrote:
> On Thu, Nov 18, 2021 at 07:57:50PM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Add the firmware packaging recipe for the video decoder
>> for j721e.
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>
>> resend v3 as v4
>>
>> Changes from v2:
>> 1) Fixed the summary
>> 2) Bumped the ti-linux-fw to pick the video decoder binary
>> 3) Added the kernel dependency to build this recipe

Thanks for fixing the recipe.


>>
>>   .../ti-img-encode-decode/vxd-dec-fw_git.bb    | 24 +++++++++++++++++++
>>   recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  5 ++--
>>   recipes-kernel/linux/kernel-rdepends.inc      |  3 +++
>>   3 files changed, 30 insertions(+), 2 deletions(-)
>>   create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>>
>> diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>> new file mode 100644
>> index 00000000..cccda6bb
>> --- /dev/null
>> +++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY = "Video Decoding Firmware"
>> +LICENSE = "TI-IMG"
> 
> And meta-ti does not define such license:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/licenses

This is based on similar patch that we have in thud, lets use the same 
license.
Ref: 
https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb?h=thud&id=5d174a34a9d468fa11505c3b8d0ad9eda5fd0ba0

> 
> 
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
>> index c59120b8..f6d5b8d1 100644
>> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -13,11 +13,12 @@ NETCP_SA_FW_VERSION = "1.0.0"
>>   NETCP_PA_FW_VERSION = "3.0.2.3"
>>   QMSS_PDSP_FW_VERSION = "1.0.0.9"
>>   PRUETH_FW_AM65X_VERSION = "08.00.00.20"
>> -PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.06"
>> +PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.07"
>>   GOODIX_FW_VERSION = "1.0.0.0"
>>   CADENCE_MHDP_FW_VERSION = "1.2.17"
>> +IMG_DEC_FW_VERSION = "1.0"
>>   
>> -TI_LINUX_FW_SRCREV ?= "95232a584175a8ac872adf477b2dbb9ca68ba063"
>> +TI_LINUX_FW_SRCREV ?= "c96a734a059889e571dcf30c0638157c690a6e6e"
>>   SRCREV = "${TI_LINUX_FW_SRCREV}"
>>   
>>   BRANCH ?= "ti-linux-firmware"
>> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
>> index 5e5241c9..76b7a508 100644
>> --- a/recipes-kernel/linux/kernel-rdepends.inc
>> +++ b/recipes-kernel/linux/kernel-rdepends.inc
>> @@ -39,3 +39,6 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm = " prueth-fw-am65x-sr2"
>>   
>>   # Add run-time dependency for Cadence MHDP firmware to the rootfs
>>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
>> +
>> +# Add run-time dependency for Video Decoding firmware to the rootfs
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
>> -- 
>> 2.17.1
>>

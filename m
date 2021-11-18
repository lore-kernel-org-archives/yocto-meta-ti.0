Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1488.1637266148398122566
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 12:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IFVSu9pQ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AIK94X3069351;
	Thu, 18 Nov 2021 14:09:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637266144;
	bh=9Qf1Peg0GP+MugfzDZoG4dySYVeybXbledSkVgkzlg0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IFVSu9pQg9J/sFO3LwPmObBUPD2UGOwqQB1f+q8g+ROupWJX5dt9bhVeD6/tsa3ix
	 GyC+deP0m1M9x4gmfIe/V5idJnLlfnFhdrSPmb8nsGXzjLBGCMWb0NreucruTxL2Ob
	 VGsvoQWZ08c9fx6sOC5hXUT8gtgDazve5uVGc7tE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AIK92Il028326
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 14:09:04 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 14:09:03 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 14:09:03 -0600
Received: from [10.249.32.113] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AIK93NN095102;
	Thu, 18 Nov 2021 14:09:03 -0600
Message-ID: <2a36330b-8151-5f56-7847-22b70a38fed8@ti.com>
Date: Thu, 18 Nov 2021 14:09:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [meta-ti][dunfell][PATCH] j721e-sr1_1: Add j721e sr1.1 HS support
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20211117114611.47729-1-yogeshs@ti.com>
 <20211118163819.GB18191@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20211118163819.GB18191@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/2021 10:38 AM, Denys Dmytriyenko wrote:
> On Wed, Nov 17, 2021 at 11:46:11AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> This patch adds support for J721e HS SR1.1
>> HS SR1.1 requires updated sysfw binary. Both SR1.0 and SR1.1 sysfw
>> binary will be generated. sysfw.itb will point to SR1.1
>>
>> This patch requires J7 SR 1.1 support in K3 Image gen.
>>
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>   conf/machine/j7-hs-evm-k3r5-sr1-1.conf | 11 +++++++++++
>>   conf/machine/j7-hs-evm.conf            |  8 ++++++++
>>   conf/multiconfig/k3r5-sr1-1.conf       |  3 +++
>>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |  1 +
>>   4 files changed, 23 insertions(+)
>>   create mode 100644 conf/machine/j7-hs-evm-k3r5-sr1-1.conf
>>   create mode 100644 conf/multiconfig/k3r5-sr1-1.conf
>>
>> diff --git a/conf/machine/j7-hs-evm-k3r5-sr1-1.conf b/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
>> new file mode 100644
>> index 00000000..e05b5c9d
>> --- /dev/null
>> +++ b/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
>> @@ -0,0 +1,11 @@
>> +#@TYPE: Machine
>> +#@NAME: J7 SR1.1 HS EVM (R5F)
>> +#@DESCRIPTION: Machine configuration for the TI J7 SR1.1 HS EVM (R5F core)
>> +
>> +# Booting SR1.1 requires different SYSFW, the rest is handled at runtime
>> +
>> +require conf/machine/am65xx-hs-evm-k3r5.conf
> 
> Copy/paste error here ^ - it's j7 not am65xx

Thanks for catching this. Will address in v2

> 
>> +SOC_FAMILY_append = ":k3r5-sr1-1"
>> +
>> +SYSFW_SOC = "j721e_sr1_1"
>> +SYSFW_SYMLINK = "sysfw.itb"
>> diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
>> index 70e14754..ab0fa474 100644
>> --- a/conf/machine/j7-hs-evm.conf
>> +++ b/conf/machine/j7-hs-evm.conf
>> @@ -19,4 +19,12 @@ SPL_BINARYNAME = "tispl.bin"
>>   UBOOT_BINARY = "u-boot.img_HS"
>>   IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
>>   
>> +BBMULTICONFIG += "k3r5-sr1-1"
>> +
>> +# Use default IMAGE_BOOT_FILES_LEGACY files
>> +# Since default sysfw.itb on J7 is for SR1.1, add a version for SR1.0
>> +IMAGE_BOOT_FILES += "sysfw-j7-hs-evm.itb"
>> +do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
>> +do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
>> +
>>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
>> diff --git a/conf/multiconfig/k3r5-sr1-1.conf b/conf/multiconfig/k3r5-sr1-1.conf
>> new file mode 100644
>> index 00000000..2dc93b2f
>> --- /dev/null
>> +++ b/conf/multiconfig/k3r5-sr1-1.conf
>> @@ -0,0 +1,3 @@
>> +require k3r5.conf
>> +
>> +MACHINE_append = "-sr1-1"
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index 4f1dd145..6d48bf23 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -25,6 +25,7 @@ SYSFW_PREFIX = "ti-sci-firmware"
>>   SYSFW_PREFIX_j7-evm-k3r5 = "ti-fs-firmware"
>>   SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
>>   SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
>> +SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
>>   SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
>>   
>>   SYSFW_SUFFIX ?= "unknown"
>> -- 
>> 2.17.1
>>
> 
>>
>> 
>>
> 
> 

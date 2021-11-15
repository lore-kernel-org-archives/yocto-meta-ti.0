Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.467.1637009614578001679
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 12:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rW3SP89O;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AFKrUfT075369;
	Mon, 15 Nov 2021 14:53:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637009610;
	bh=CeIMTNJFEeoCXT1nUxl4K1P3gNTHB4mavR6UFSB5cx0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rW3SP89Orf5SyfxNgzFXMqALK2ZSyS1oNdMhOuVEkDH2t/QpUPUeVqXB97QeM44mW
	 M9I2lkr/QSZ3KJD8lpPjqwwnEiKzKhl+4cJ+RghPZjqjUfYBbefwQ6YFBRgRcODV6z
	 9K+NvQ11cQZC1GjI26NjmGCPlvG3QWF8qMwQ5xlY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AFKrUFn032766
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Nov 2021 14:53:30 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 15
 Nov 2021 14:53:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 15 Nov 2021 14:53:30 -0600
Received: from [10.250.38.249] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AFKrTht013947;
	Mon, 15 Nov 2021 14:53:30 -0600
Message-ID: <ab973ee0-c885-bedd-7d9c-4b02cfa72301@ti.com>
Date: Mon, 15 Nov 2021 14:53:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [meta-ti][dunfell][PATCH 1/3] conf: machine: add new am64x hs platform
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20211112231800.64167-1-yogeshs@ti.com>
 <20211112231800.64167-2-yogeshs@ti.com> <20211112232630.GS10132@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20211112232630.GS10132@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2021 5:26 PM, Denys Dmytriyenko wrote:
> On Fri, Nov 12, 2021 at 11:17:58PM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> Add new am64x hs platform. This requires two files to be created.
>> Used am65x and j7  hs platform for reference.
>>
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>   conf/machine/am64xx-hs-evm-k3r5.conf | 14 ++++++++++++++
>>   conf/machine/am64xx-hs-evm.conf      | 22 ++++++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>   create mode 100644 conf/machine/am64xx-hs-evm-k3r5.conf
>>   create mode 100644 conf/machine/am64xx-hs-evm.conf
>>
>> diff --git a/conf/machine/am64xx-hs-evm-k3r5.conf b/conf/machine/am64xx-hs-evm-k3r5.conf
>> new file mode 100644
>> index 00000000..69c6cada
>> --- /dev/null
>> +++ b/conf/machine/am64xx-hs-evm-k3r5.conf
>> @@ -0,0 +1,14 @@
>> +#@TYPE: Machine
>> +#@NAME: AM65xx HS EVM (R5F)
> 
> AM64?

Will fix it while merging

> 
>> +#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)
> 
> AM64?

Same will fix while merging

> 
> Both are just comments, so not a functional issue.
> 
> 
>> +require conf/machine/include/k3r5.inc
>> +
>> +SYSFW_SOC = "am64x"
>> +SYSFW_CONFIG = "evm"
>> +SYSFW_SUFFIX = "hs"
>> +SYSFW_SYMLINK = ""
>> +
>> +UBOOT_MACHINE = "am64x_hs_evm_r5_defconfig"
>> +
>> +TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
>> diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
>> new file mode 100644
>> index 00000000..44e81463
>> --- /dev/null
>> +++ b/conf/machine/am64xx-hs-evm.conf
>> @@ -0,0 +1,22 @@
>> +#@TYPE: Machine
>> +#@NAME: AM64xx HS EVM
>> +#@DESCRIPTION: Machine configuration for the TI AM64xx HS EVM
>> +
>> +require conf/machine/include/am64xx.inc
>> +
>> +UBOOT_MACHINE = "am64x_hs_evm_a53_defconfig"
>> +
>> +UBOOT_ENTRYPOINT =       "0x80080000"
>> +UBOOT_LOADADDRESS =      "0x80080000"
>> +UBOOT_RD_LOADADDRESS =   "0x84000000"
>> +UBOOT_RD_ENTRYPOINT =    "0x84000000"
>> +UBOOT_DTB_LOADADDRESS =  "0x83000000"
>> +UBOOT_DTBO_LOADADDRESS = "0x83080000"
>> +UBOOT_DTBO_OFFSET =      "0x00010000"
>> +
>> +SPL_BINARY = "tispl.bin_HS"
>> +SPL_BINARYNAME = "tispl.bin"
>> +UBOOT_BINARY = "u-boot.img_HS"
>> +IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
>> +
>> +TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
>> -- 
>> 2.17.1
>>
> 
>>
>> 
>>
> 
> 

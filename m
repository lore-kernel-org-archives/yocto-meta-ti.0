Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4724.1634613252050675922
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 20:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mC2DOhxy;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19J3E89X067917;
	Mon, 18 Oct 2021 22:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634613248;
	bh=oGoX6LWr1RxI1u2V9MusUhXnZQtILX40WqY6mLpwq4E=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=mC2DOhxy9xyLjVqd7JrrCUKT0kXYnOEHRwRDYQe1s6ANTutdCTyxxGZFyTOekLQow
	 DqH3n3HrQKxnP9grG7junXfJu7vkFq3P1gOuvr0JRsh5I8CxmR6/gwIIzLKUyoivH7
	 5v1CmOVWjvztaU5Fsa2t1Ufvs/oBafuk2NUZC+7k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19J3E7L3072436
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Oct 2021 22:14:08 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Oct 2021 22:14:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Oct 2021 22:14:07 -0500
Received: from [10.250.38.160] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19J3E6QV048243;
	Mon, 18 Oct 2021 22:14:07 -0500
Subject: Re: [meta-ti][master/dunfell][PATCH v3 3/3] conf: omap-a15: fix the dtb file path for extlinux boot
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20211018221034.11092-1-yogeshs@ti.com>
 <20211018221034.11092-4-yogeshs@ti.com> <20211018221745.GK10132@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <43442d85-8076-a9ec-1468-35c2c7504e94@ti.com>
Date: Mon, 18 Oct 2021 22:14:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211018221745.GK10132@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/18/21 5:17 PM, Denys Dmytriyenko wrote:
> On Mon, Oct 18, 2021 at 10:10:34PM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> The uboot extlinux is using kernel device tree variable to populate the
>> dtb files. The error occurs if the device tree files are in ti folder
>> since there is no ti folder in deploy directory. Fix the kernel device
>> tree path before using in the uboot extlinux.
> 
> Looks reasonable, but should probably be the first patch in the series for
> bisectability.
> 

Will apply in the right order.

> Also, what's with 2 extra empty lines?
> 

Will fix it while applying,

> 
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>   conf/machine/include/omap-a15.inc | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
>> index c95b0ccc..8356c920 100644
>> --- a/conf/machine/include/omap-a15.inc
>> +++ b/conf/machine/include/omap-a15.inc
>> @@ -19,15 +19,19 @@ UBOOT_ARCH = "arm"
>>   UBOOT_ENTRYPOINT = "0x80008000"
>>   UBOOT_LOADADDRESS = "0x80008000"
>>   
>> +DEVICETREE_FILE = "${@d.getVar('KERNEL_DEVICETREE').replace("ti/","")}"
>> +
>>   # Generate an extlinux.conf file
>>   UBOOT_EXTLINUX = "1"
>>   UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
>>   UBOOT_EXTLINUX_BOOT_FILES = " \
>>       extlinux.conf;extlinux/extlinux.conf \
>>       ${KERNEL_IMAGETYPE} \
>> -    ${KERNEL_DEVICETREE} \
>> +    ${DEVICETREE_FILE} \
>>   "
>>   
>> +
>> +
>>   SPL_BINARY = "MLO"
>>   UBOOT_SUFFIX = "img"
>>   
>> -- 
>> 2.17.1
>>
> 

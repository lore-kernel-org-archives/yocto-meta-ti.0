Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.6985.1575652957925233062
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Dec 2019 09:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uhxAr0bs;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: j-stiffler@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E576E01156; Fri,  6 Dec 2019 09:22:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CE6CE00A07
	for <meta-ti@yoctoproject.org>; Fri,  6 Dec 2019 09:22:33 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB6HMXmY021834
	for <meta-ti@yoctoproject.org>; Fri, 6 Dec 2019 11:22:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575652953;
	bh=MO4lEfmk9tdUaAy3c6baTwGT2IsU+RcmPqnt+teYG/Y=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=uhxAr0bsyvFY6/qqgnbxxW95QKo9pIhUwD0CoIAEONOuQm9Zxp3WhqRXQLjdH0KAH
	 gC7ItMBlWF/3aCIHHJF03XkCTjHOIvGyAW+zZjZYqvks+WPLmY2/86wPEIXAPI4lQa
	 OLUjut+Rfv+QBd1OtoEwuGq+aQGHq3L/Tpd6dnJE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB6HMXp3091481
	for <meta-ti@yoctoproject.org>; Fri, 6 Dec 2019 11:22:33 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 6 Dec
 2019 11:22:33 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 6 Dec 2019 11:22:33 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB6HMWq2034005;
	Fri, 6 Dec 2019 11:22:33 -0600
Subject: Re: [meta-ti] [master/thud][PATCH 24/42] pru: migrate to ti-pdk-fetch.bbclass
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@yoctoproject.org>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
 <1573830902-17409-25-git-send-email-j-stiffler@ti.com>
 <20191206162913.GU24609@beryl>
From: "Jacob Stiffler" <j-stiffler@ti.com>
Message-ID: <a5cf7ee7-fb1d-5002-b07f-99ba9ab4230d@ti.com>
Date: Fri, 6 Dec 2019 12:22:32 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191206162913.GU24609@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12/6/2019 11:29 AM, Denys Dmytriyenko wrote:
> On Fri, Nov 15, 2019 at 10:14:44AM -0500, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   recipes-bsp/pru/pru-pwm-fw_git.bb    | 11 +++++------
>>   recipes-bsp/pru/pru-swuart-fw_git.bb | 12 ++++++------
>>   2 files changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/recipes-bsp/pru/pru-pwm-fw_git.bb b/recipes-bsp/pru/pru-pwm-fw_git.bb
> This seems to break pru-pwm-fw on am65xx:
>
> "iepPwm.c", line 594: error #20: identifier "CSL_ICSS_IEP0_CFG_BASE" is undefined
> "iepPwm.c", line 600: error #20: identifier "CSL_ICSS_IEP1_CFG_BASE" is undefined
>
> Jake, do you know if this can be fixed quickly, so I don't have to drop 42
> patches from next branch? Thanks!


This depends on some CSL updates which are not quite ready yet. We 
should be able to revert to an older commit 
("38857bc991494e8662d3ab7624b8ac5f026477c8"). Shall I submit a v2 with 
this commit?


> Denys
>
>
>> index 0fe7987..a8c7103 100644
>> --- a/recipes-bsp/pru/pru-pwm-fw_git.bb
>> +++ b/recipes-bsp/pru/pru-pwm-fw_git.bb
>> @@ -8,17 +8,16 @@ require recipes-ti/includes/ti-paths.inc
>>   COMPATIBLE_MACHINE = "am65xx"
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>> -# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.15B"
>> -SRCREV = "989f802266d52f50a6db8f2be6967eacd9d2b409"
>>   
>> -PV = "01.00.00.15B"
>>   
>> -BRANCH = "master"
>> -SRC_URI = "git://git.ti.com/keystone-rtos/pruss-lld.git;protocol=git;branch=${BRANCH}"
>> +inherit ti-pdk-fetch
>> +
>> +TI_PDK_COMP = "ti.drv.pruss.example.apps.icssg_pwm.firmware.src"
>> +
>> +PE = "1"
>>   
>>   DEPENDS = "ti-cgt-pru-native pru-icss common-csl-ip-rtos"
>>   
>> -S = "${WORKDIR}/git/example/apps/icssg_pwm/firmware/src"
>>   
>>   EXTRA_OEMAKE += " \
>>       PRU_CGT="${TI_CGT_PRU_INSTALL_DIR}" \
>> diff --git a/recipes-bsp/pru/pru-swuart-fw_git.bb b/recipes-bsp/pru/pru-swuart-fw_git.bb
>> index e22b3be..1cb51f3 100644
>> --- a/recipes-bsp/pru/pru-swuart-fw_git.bb
>> +++ b/recipes-bsp/pru/pru-swuart-fw_git.bb
>> @@ -8,20 +8,20 @@ require recipes-ti/includes/ti-paths.inc
>>   COMPATIBLE_MACHINE = "ti33x"
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>> -# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.15"
>> -SRCREV = "4493f456549c85749a05b1f46bf0b75d23976db1"
>>   
>> -PV = "01.00.00.15"
>> +inherit ti-pdk-fetch
>>   
>> -BRANCH = "master"
>> -SRC_URI = "git://git.ti.com/keystone-rtos/uart-lld.git;protocol=git;branch=${BRANCH} \
>> +TI_PDK_COMP = "ti.drv.uart"
>> +
>> +PE = "1"
>> +
>> +SRC_URI_append = " \
>>   	file://0001-icss_uart-add-Makefile-for-building-firmware.patch \
>>   	file://0001-icss_uart-remove-dependency-on-PDK-CSL.patch \
>>   "
>>   
>>   DEPENDS = "ti-cgt-pru-native pru-icss"
>>   
>> -S = "${WORKDIR}/git"
>>   
>>   export PRU_CGT = "${TI_CGT_PRU_INSTALL_DIR}"
>>   export PRU_SSP = "${STAGING_DIR_TARGET}/usr"
>> -- 
>> 2.7.4
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

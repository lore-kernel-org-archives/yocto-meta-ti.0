Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69371C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 18:50:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3346.1707418218518888821
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 10:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=o6gr2gze;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418IoEOR080564;
	Thu, 8 Feb 2024 12:50:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707418214;
	bh=AxtHx4hqrpySFVYszFRcFH65u3nvI7E6dxedhLt9M3E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=o6gr2gzeqWa854TjtQVL+0UJQauNXDD0hP6V0xuHpVX9xoJH31LDTZGgL5znJW0K6
	 MQ4RTP+xpTJXaQBU5OeZoX9qyYoV7SEa/RNHevMQHPXh73lXE7x/StoIzRaQnYmkko
	 DoXq/sOUQj+X0Cs3+rQtyRVnTkvQ1wMwI5G1CUO0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418IoERC034218
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 12:50:14 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 12:50:14 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 12:50:14 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418IoEXJ119425;
	Thu, 8 Feb 2024 12:50:14 -0600
Message-ID: <189a5279-b932-45d5-9ea4-d8e6f9d917aa@ti.com>
Date: Thu, 8 Feb 2024 12:50:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] gdbc6x: Fix kernel module to work on
 6.6+
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240208175525.31373-1-reatmon@ti.com>
 <20240208181148.GH15614@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240208181148.GH15614@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Feb 2024 18:50:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17456



On 2/8/2024 12:11 PM, Denys Dmytriyenko wrote:
> On Thu, Feb 08, 2024 at 11:55:25AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The "upstream" is not maintained, but this is an easy patch to get this
>> working again.  Still need to watch this for big breakages and rethink
>> supporting this recipe at that time.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../0002-Support-Linux-kernels-v6.6.patch     | 31 +++++++++++++++++++
>>   .../gdbc6x/gdbserverproxy-module-drv_git.bb   |  5 ++-
>>   2 files changed, 35 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch
>>
>> diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch
>> new file mode 100644
>> index 00000000..dab4e26b
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch
>> @@ -0,0 +1,31 @@
>> +From: Ryan Eatmon <reatmon@ti.com>
>> +Date: Wed, 08 Feb 2024 10:43:00 -0500
>> +Subject: [PATCH] Support Linux kernels v6.6+
>> +
>> +gdb_write arg changed from int to unsigned int
>> +
>> +Upstream-Status: Pending
> 
> FWIW, there's also Inactive-Upstream status, if needed:
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status

So noted.  I'll update the two patches with that.


>> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> +---
>> + kernel_module/gdbproxy-mod/gdbserverproxy.c | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/kernel_module/gdbproxy-mod/gdbserverproxy.c b/kernel_module/gdbproxy-mod/gdbserverproxy.c
>> +index 418b6db..4b1c676 100644
>> +--- a/kernel_module/gdbproxy-mod/gdbserverproxy.c
>> ++++ b/kernel_module/gdbproxy-mod/gdbserverproxy.c
>> +@@ -496,8 +496,13 @@ static void gdb_close(struct tty_struct *tty, struct file *filp)
>> +  *
>> +  *
>> +  */
>> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,6,0))
>> ++static int gdb_write(struct tty_struct *tty,
>> ++        const unsigned char *buf, unsigned int count)
>> ++#else
>> + static int gdb_write(struct tty_struct *tty,
>> +         const unsigned char *buf, int count)
>> ++#endif
>> + {
>> +      struct dsp_session *dsp = tty->driver_data;
>> +      int ret = 0;
>> diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
>> index 60492f81..b68c4463 100644
>> --- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
>> +++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
>> @@ -7,7 +7,10 @@ MACHINE_KERNEL_PR:append = "b"
>>   PR = "${MACHINE_KERNEL_PR}"
>>   PV:append = "+git${SRCPV}"
>>   
>> -SRC_URI:append = " file://0001-Support-Linux-kernels-v5.15.patch;patchdir=../.."
>> +SRC_URI:append = "\
>> +    file://0001-Support-Linux-kernels-v5.15.patch;patchdir=../.. \
>> +    file://0002-Support-Linux-kernels-v6.6.patch;patchdir=../.. \
>> +"
>>   
>>   S = "${WORKDIR}/git/kernel_module/gdbproxy-mod"
>>   
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


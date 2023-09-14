Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58009EEAA6F
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 19:57:53 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.4540.1694721471388395955
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 12:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZJ05+kQU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38EJvi28023931;
	Thu, 14 Sep 2023 14:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694721464;
	bh=WrdH8gxm516OnLq6bRaTkI//FlguaTDYbHIxA+HGoYg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZJ05+kQUlF52i/ISJj9jTA3t4D5EnUQFkqQaEw4yJ5dWRvRLzECkDqbYpRIEJzMjV
	 G4Kt5ga2xDUcrEP1wSyvwEgatZhQk4A9KhBn5klVWq4Qj9Kj69ApdTOcJxP+OMaCi7
	 jTl2oA8XslOe163ycQ0G8y9+38711DruAw5vaIfY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38EJvivc074222
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Sep 2023 14:57:44 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Sep 2023 14:57:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Sep 2023 14:57:43 -0500
Received: from [10.247.18.57] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38EJvhfG018093;
	Thu, 14 Sep 2023 14:57:43 -0500
Message-ID: <504b1edc-efeb-bd30-4003-930bde1c5795@ti.com>
Date: Thu, 14 Sep 2023 14:57:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add config preempt
 for am335x and am437x
To: Denys Dmytriyenko <denis@denix.org>, <anandb@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <s-adivi@ti.com>,
        <g-gupta@ti.com>, <khasim@ti.com>, <vijayp@ti.com>
References: <20230914171026.3014887-1-anandb@ti.com>
 <20230914193618.GM3359@denix.org>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230914193618.GM3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 19:57:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16978



On 9/14/2023 2:36 PM, Denys Dmytriyenko wrote:
> On Thu, Sep 14, 2023 at 10:40:26PM +0530, Anand Balagopalakrishnan via lists.yoctoproject.org wrote:
>> SGX needs a preemptible kernel. CONFIG_PREEMPT has always been enabled
>> on TI Linux kernels upto K5.1.
>>
>> This is enabled on AM65x by default but missed out AM335x and AM437x.
>> Add a kernel config fragment to enable config preempt.
> 
> Hi, Anand,
> 
> Is this only needed for am335x and am437x, as the subject suggests? If so, why
> the code adds the config fragment to all platforms?
> 
> Second question - historically this has been enabled in the TI kernel itself.
> Why not do it like that again, why add the fragment to the OE metadata instead
> of keeping it in-tree? How the distro-agnostic approach would be handled?

Anand,

We use arm default defconfig
for v8 platforms: 
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-6.1.y&id=dab7ea360967f26337be1f26f56b12771da8c731 
This enables CONFIG_PREEMPT

For v7 platforms like am335x , am437x , dra7xx and am57xx:
we use multi_v7_defconfig
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm/configs/multi_v7_defconfig?h=ti-linux-6.1.y 


This would be the right place to enable the config.(so that all 
platforms gets this fix)

More than the what part, would like to understand "why".
Can you provide more details on why SGX IP needs preemptible kernel ?


> 
> 
>> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
>> ---
>>   .../linux/files/configs/config-preempt.cfg           | 12 ++++++++++++
>>   .../recipes-kernel/linux/linux-ti-staging_6.1.bb     |  1 +
>>   2 files changed, 13 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
>> new file mode 100644
>> index 00000000..c1e5ad7d
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
> 
> This is not the right location for the file. You want to add to the
> linux-ti-staging-rt-6.1/ directory, since you are only using it from
> the corresponding linux-ti-staging_6.1.bb recipe.
> 
> 
>> @@ -0,0 +1,12 @@
>> +CONFIG_PREEMPT_BUILD=y
>> +# CONFIG_PREEMPT_NONE is not set
>> +CONFIG_PREEMPT=y
>> +CONFIG_PREEMPT_COUNT=y
>> +CONFIG_PREEMPTION=y
>> +CONFIG_PREEMPT_RCU=y
>> +CONFIG_TASKS_RCU_GENERIC=y
>> +CONFIG_TASKS_RCU=y
>> +CONFIG_UNINLINE_SPIN_UNLOCK=y
>> +# CONFIG_CEC_GPIO is not set
>> +CONFIG_DEBUG_PREEMPT=y
>> +# CONFIG_PREEMPT_TRACER is not set
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> index 8a883878..0ee63358 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> @@ -33,6 +33,7 @@ PR = "${MACHINE_KERNEL_PR}"
>>   
>>   KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>>   KERNEL_GIT_PROTOCOL = "https"
>> +KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/config-preempt.cfg"
> 
> Since this file is out-of-tree and in the OE metadata, it would also require
> listing it in SRC_URI.
> 
> 
>>   SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>>               file://defconfig"
>>   
>> -- 
>> 2.34.1


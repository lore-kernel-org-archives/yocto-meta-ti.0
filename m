Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCC2EEAA68
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 19:31:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3783.1694719858747090959
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 12:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d5bQop98;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38EJUvwZ070022
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 14:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694719857;
	bh=o8vkC8oxJck0bU+Vhqd/yGDgTcIpf50tEymNxF39hHc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=d5bQop98JJCgJyomNqUJoskFtOLrd/dFCF806EcynDziJtPt6OQXc69E20v7LKIAR
	 RE/5XrNPTJIxMlY7bM899uoQEOcQBvUYjXpPLlkxO1gFXQ3NNI2xjwGoI1Ey9twi89
	 +7lSHRoqFz0OQVczlcZRAEAkYPgWaAKmV235qh3g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38EJUv71016017
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 14:30:57 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Sep 2023 14:30:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Sep 2023 14:30:57 -0500
Received: from [10.249.36.233] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38EJUvHR016461;
	Thu, 14 Sep 2023 14:30:57 -0500
Message-ID: <73039b8b-2a2f-5dd7-afbf-be3066ef3387@ti.com>
Date: Thu, 14 Sep 2023 14:30:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC|kirkstone] linux-ti-staging: add config preempt for am335x
 and am437x
Content-Language: en-US
To: Anand Balagopalakrishnan <anandb@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <s-adivi@ti.com>, <g-gupta@ti.com>, <khasim@ti.com>, <vijayp@ti.com>,
        <praneeth@ti.com>
References: <20230914171026.3014887-1-anandb@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230914171026.3014887-1-anandb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 19:31:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16973



On 9/14/2023 12:10 PM, Anand Balagopalakrishnan wrote:
> SGX needs a preemptible kernel. CONFIG_PREEMPT has always been enabled
> on TI Linux kernels upto K5.1.
> 
> This is enabled on AM65x by default but missed out AM335x and AM437x.
> Add a kernel config fragment to enable config preempt.
> 
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>   .../linux/files/configs/config-preempt.cfg           | 12 ++++++++++++
>   .../recipes-kernel/linux/linux-ti-staging_6.1.bb     |  1 +
>   2 files changed, 13 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
> new file mode 100644
> index 00000000..c1e5ad7d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
> @@ -0,0 +1,12 @@
> +CONFIG_PREEMPT_BUILD=y
> +# CONFIG_PREEMPT_NONE is not set
> +CONFIG_PREEMPT=y
> +CONFIG_PREEMPT_COUNT=y
> +CONFIG_PREEMPTION=y
> +CONFIG_PREEMPT_RCU=y
> +CONFIG_TASKS_RCU_GENERIC=y
> +CONFIG_TASKS_RCU=y
> +CONFIG_UNINLINE_SPIN_UNLOCK=y
> +# CONFIG_CEC_GPIO is not set
> +CONFIG_DEBUG_PREEMPT=y
> +# CONFIG_PREEMPT_TRACER is not set
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> index 8a883878..0ee63358 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> @@ -33,6 +33,7 @@ PR = "${MACHINE_KERNEL_PR}"
>   
>   KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>   KERNEL_GIT_PROTOCOL = "https"
> +KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/config-preempt.cfg"
>   SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>               file://defconfig"
>   

I'm going to provide comments just as a learning moment for those paying 
attention.

1) The location of where you stuck KERNEL_CONFIG_FRAGMENTS is out of 
place.  It just there in the middle of the SRC_URI variables.

2) We do not need to add this for ALL platforms, just the ones that you 
identified (am3, am4, am57, etc...)  So you should use the SOC_FAMILY 
override syntax to limit the change to just those families:

KERNEL_CONFIG_FRAGMENTS:append:ti33x = " ${WORKDIR}/config-preempt.cfg"
KERNEL_CONFIG_FRAGMENTS:append:ti43x = " ${WORKDIR}/config-preempt.cfg"
KERNEL_CONFIG_FRAGMENTS:append:dra7x = " ${WORKDIR}/config-preempt.cfg"

3) As this patch is adding the RT prempt stuff, it does not need to be 
present for building the RT kernel.  But the RT recipe includes this 
recipe and just changes the branch and SRCREV.  So this change would 
conflict with what the RT kernel recipe is doing.

4) All of the RT stuff is done with config fragments.  You can look in 
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig:

use-kernel-config=multi_v7_defconfig
config-fragment=kernel/configs/ti_multi_v7_prune.config 
kernel/configs/ti_rt.config

So this patch should be done using the existing method fragments, not 
just setting the variable.  A new config fragment needs to be added to 
the kernel that sets CONFIG_PREMPT=y (maybe 
kernel/configs/ti_preempt.config).

And then create three new files:

meta-ti-bsp/recipes-linux/linux/linux-ti-staging-6.1/ti33x/defconfig
--------------------------------------------------------------------
use-kernel-config=multi_v7_defconfig
config-fragment=kernel/configs/ti_multi_v7_prune.config 
kernel/configs/ti_preempt.config

meta-ti-bsp/recipes-linux/linux/linux-ti-staging-6.1/ti43x/defconfig
--------------------------------------------------------------------
use-kernel-config=multi_v7_defconfig
config-fragment=kernel/configs/ti_multi_v7_prune.config 
kernel/configs/ti_preempt.config

meta-ti-bsp/recipes-linux/linux/linux-ti-staging-6.1/dra7x/defconfig
--------------------------------------------------------------------
use-kernel-config=multi_v7_defconfig
config-fragment=kernel/configs/ti_multi_v7_prune.config 
kernel/configs/ti_preempt.config


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


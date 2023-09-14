Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26C2EEAA68
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 19:09:12 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3186.1694718543229452482
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 12:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Jffh0DjW;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38EJ92rp124449
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 14:09:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694718542;
	bh=2wdDN6foWhlD4t/UwfVdUY3W8xbSYTgvQIGawAm2yGQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Jffh0DjWG48JdW7I40lgQWOtZYEsywXIBYyTyuDBSHaYoHR3JOVspHC4WZWNPljNz
	 zR2bzCCOG540HMgSxzGiMnmhgKvmEqwblCWIxMyuk/yVfrGIdPX0ueAr4l9JIvnG/y
	 lD41iRAbqdQZfMPtbXwUWI4gijoKAPdjc+cJV+VU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38EJ92ut111428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 14:09:02 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Sep 2023 14:09:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Sep 2023 14:09:02 -0500
Received: from [10.250.38.120] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38EJ91s7038779;
	Thu, 14 Sep 2023 14:09:02 -0500
Message-ID: <28250f86-bf86-2629-f96d-2442acac6c10@ti.com>
Date: Thu, 14 Sep 2023 14:09:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add config preempt
 for am335x and am437x
To: <anandb@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>, <khasim@ti.com>,
        <vijayp@ti.com>, <praneeth@ti.com>
References: <20230914171026.3014887-1-anandb@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230914171026.3014887-1-anandb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 19:09:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16972

On 9/14/23 12:10 PM, Anand Balagopalakrishnan via lists.yoctoproject.org wrote:
> SGX needs a preemptible kernel. CONFIG_PREEMPT has always been enabled
> on TI Linux kernels upto K5.1.
> 
> This is enabled on AM65x by default but missed out AM335x and AM437x.
> Add a kernel config fragment to enable config preempt.
> 
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---

Do not add configs to Yocto, add them to the kernel as normal patches using LPR
like everyone else.

Andrew

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
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16968): https://lists.yoctoproject.org/g/meta-ti/message/16968
> Mute This Topic: https://lists.yoctoproject.org/mt/101362535/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


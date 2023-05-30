Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076F7C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 18:11:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1457.1685470304232214833
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 11:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fQanXQzO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UIBh8k115888;
	Tue, 30 May 2023 13:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685470303;
	bh=lGsI6+qw6FRDvlPpmagkgYbLbNZNuaTTW6hKc+X63Dk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fQanXQzOC+ZlUazDsF75UCapSMst2DX8jCKEDPjw7ysKL2WYL/L5BVrGdoDeJ5mPN
	 PGx7UDJRHtCCgpcHP9WfHtKPdkZ/USefp/7Nlll4cG+WxC9MzQhrGDFGqS58Pi5NoS
	 mAVM4oLq29JBHO7EXCbzc1/TMvq8MmmF/sjGCW90=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UIBhMX027862
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 13:11:43 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 13:11:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 13:11:42 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UIBgM6108852;
	Tue, 30 May 2023 13:11:42 -0500
Message-ID: <5aa81aac-3f6e-38de-890e-eadf8779d96b@ti.com>
Date: Tue, 30 May 2023 13:11:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-ti] [meta-ti-bsp] [PATCH] ti-localversion.bbclass:
 introduce bbclass
To: Ming Liu <liu.ming50@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <max.krummenacher@toradex.com>, <francesco.dolcini@toradex.com>
References: <20230530180926.265920-1-liu.ming50@gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230530180926.265920-1-liu.ming50@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 18:11:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16630



On 5/30/2023 1:09 PM, Ming Liu wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> An error was observed as follows:
> ERROR: ExpansionError during parsing .../meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
> Traceback (most recent call last):
>    File "Var <KERNEL_LOCALVERSION>", line 1, in <module>
>    File ".../openembedded-core/bitbake/lib/bb/fetch2/__init__.py", line 788, in get_srcrev(d=<bb.data_smart.DataSmart object at 0x7fe9da2f0c70>, method_name='sortable_revision'):
>           if not scms:
>      >        raise FetchError("SRCREV was used yet no valid SCM was found in SRC_URI")
> 
> with the latest bitbake on commit: 893f3b116b6
> [ fetch2/npm: evaluate PATH before patching HOME ]
> 
> the root cause is the variable SRCPV could not be expanded during
> recipe parsing stage due to some uri variables in bitbake being unset.
> 
> Insteadly, it has to be expanded in recipe finializing stage, let's
> introduce a RecipeParsed event handler to set it.
> 
> We need set UBOOT_LOCALVERSION in this handler as well, because that
> has the same problem.
> 
> Meanwhile, I have sent a patch to OE:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230530170949.12045-1-liu.ming50@gmail.com/
> 
> to make KERNEL_LOCALVERSION to be a standard OE variable, just like how
> UBOOT_LOCALVERSION being handled in OE.

Sadly, UBOOT_LOCALVERSION has the same error.  It's just random which 
one presents itself as the parser error.  We already have a patch from 
Denys that addresses this, I'm looking at it now.


> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>   meta-ti-bsp/classes/ti-localversion.bbclass       | 15 +++++++++++++++
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc      |  8 +++-----
>   .../recipes-kernel/linux/setup-defconfig.inc      |  4 +---
>   3 files changed, 19 insertions(+), 8 deletions(-)
>   create mode 100644 meta-ti-bsp/classes/ti-localversion.bbclass
> 
> diff --git a/meta-ti-bsp/classes/ti-localversion.bbclass b/meta-ti-bsp/classes/ti-localversion.bbclass
> new file mode 100644
> index 00000000..6e7246af
> --- /dev/null
> +++ b/meta-ti-bsp/classes/ti-localversion.bbclass
> @@ -0,0 +1,15 @@
> +# Helper class to append a string to the name of the local version of kernel/uboot images.
> +
> +# Take 'KERNEL', 'UBOOT', set 'KERNEL_LOCALVERSION' and 'UBOOT_LOCALVERSION' accordingly
> +LOCALVERSION_VAR ??= "KERNEL"
> +
> +python localversion_handler () {
> +    import bb.event
> +
> +    if isinstance(e, bb.event.RecipeParsed):
> +        srcpv = bb.fetch2.get_srcrev(e.data)
> +        e.data.setVar('%s_LOCALVERSION' % e.data.getVar('LOCALVERSION_VAR'), "-g%s" % srcpv.replace('AUTOINC+','')[:10])
> +}
> +
> +addhandler localversion_handler
> +localversion_handler[eventmask] = "bb.event.RecipeParsed"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 8e236dfe..2f461ad4 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -1,7 +1,3 @@
> -# UBOOT_LOCALVERSION can be set to add a tag to the end of the
> -# U-boot version string.  such as the commit id
> -UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
> -
>   UBOOT_SUFFIX ?= "img"
>   SPL_BINARY ?= "MLO"
>   
> @@ -61,7 +57,9 @@ PKG:${PN}-dbg = "u-boot-dbg"
>   S = "${WORKDIR}/git"
>   
>   # Support for secure devices - detailed info is in doc/README.ti-secure
> -inherit ti-secdev
> +inherit ti-secdev ti-localversion
> +
> +LOCALVERSION_VAR = "UBOOT"
>   
>   SYSROOT_DIRS += "/boot"
>   
> diff --git a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
> index df7d9ac8..2db2bb84 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
> @@ -1,6 +1,4 @@
> -# KERNEL_LOCALVERSION can be set to add a tag to the end of the
> -# kernel version string.  such as the commit id
> -KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
> +inherit ti-localversion
>   
>   # Check the defconfig file and see if it points to an in kernel
>   # defconfig that should be used, or if it is a complete config file
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16628): https://lists.yoctoproject.org/g/meta-ti/message/16628
> Mute This Topic: https://lists.yoctoproject.org/mt/99225679/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


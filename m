Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3275CA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 18:57:53 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.897.1755543468683450010
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Aug 2025 11:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=b0ZxiTNj;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IIvhvW2779477;
	Mon, 18 Aug 2025 13:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755543463;
	bh=ksGk7WwrOV1IIsrCkNwWGT0c/PwJcYhej6rqA/YIsFs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=b0ZxiTNjmWYpzNd90TmKzm2zIXy+rtSZuerRxAoGHlliWKXY5FDHvFBROxSgbqAZS
	 6FLXuOBVH76pvhY1NGDv/O46dODe5FTK/krzAXu86WaX27AkpfjJFMm+NjKQOSFpcH
	 yQ9v2ZW+SwfFycr6F0be0thVcgjwB8ZL6O1qD77c=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IIvhNI493942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 13:57:43 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 13:57:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.1748.24; Mon, 18 Aug
 2025 13:57:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 13:57:42 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IIvgri1493102;
	Mon, 18 Aug 2025 13:57:42 -0500
Message-ID: <bc88e2a0-99c6-4ba3-96a8-f192aedc9b31@ti.com>
Date: Mon, 18 Aug 2025 13:57:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [scarthgap][PATCH 3/3] meta-ti-bsp: convert DTB prefix
 matching into class
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20250725204908.2549495-1-denis@denix.org>
 <20250725204908.2549495-3-denis@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250725204908.2549495-3-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 18 Aug 2025 18:57:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18932

On 7/25/25 3:49 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Convert devicetree prefix matching functionality into a generic
> class that can be used by the kernel and wic images. That way
> dynamically generated KERNEL_DEVICETREE list will be the same
> when populating /boot dir of rootfs and/or FAT boot partition
> of a wic image.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../ti-devicetree-prefix.bbclass}                         | 7 +++++--
>   meta-ti-bsp/conf/machine/include/ti-soc.inc               | 8 ++++++++
>   meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb     | 2 --
>   meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 1 -
>   meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb  | 1 -
>   5 files changed, 13 insertions(+), 6 deletions(-)
>   rename meta-ti-bsp/{recipes-kernel/linux/ti-kernel-devicetree-prefix.inc => classes/ti-devicetree-prefix.bbclass} (87%)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc b/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
> similarity index 87%
> rename from meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
> rename to meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
> index 2d7be280..5858cc65 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
> +++ b/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
> @@ -1,3 +1,4 @@
> +# Generate list of DTBs from the kernel source
>   def get_dtbs_from_kernel(dts_dir, dts_prefix):
>       import os
>       import glob
> @@ -17,6 +18,8 @@ def get_dtbs_from_kernel(dts_dir, dts_prefix):
>               matches.append(filename)
>       return ' '.join(matches)
>   
> +# Generate list of "merged" DTBs from the kernel source
> +# It is TI custom feature to merge DTB overlays into a single DTB
>   def get_merge_dtbs_from_kernel(dts_dir, dts_pattern):
>       import os
>       matches = []
> @@ -32,9 +35,9 @@ def get_merge_dtbs_from_kernel(dts_dir, dts_pattern):
>                       matches.append(pattern)
>       return ' '.join(matches)
>   
> -KERNEL_DEVICETREE_DTBMERGE ?= ""
> -
>   KERNEL_DEVICETREE = " \
>       ${@get_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_PREFIX}')} \
>       ${@get_merge_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_DTBMERGE}')} \
>   "
> +
> +do_image_wic[depends] += "virtual/kernel:do_shared_workdir"
> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> index 85f6f338..018e9bfb 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc

With this now part of ti-soc.inc, it seems we should get this feature with any kernel when
building for a TI based board, not just when building with TI kernels. Does that mean we
can drop all the KERNEL_DEVICETREE lines from the Beagle .conf files? I just tried it and
it seems to work correctly.

Andrew

> @@ -19,3 +19,11 @@ KERNEL_DTBVENDORED = "1"
>   
>   # Also build a non-vendored list w/o dir structure
>   DEVICETREE_FILES = "${@' '.join([os.path.basename(f) for f in d.getVar("KERNEL_DEVICETREE").split()])}"
> +
> +KERNEL_DEVICETREE_DTBMERGE ?= ""
> +
> +# Dynamically build DTBs list based on prefix matching
> +CLASS_DEVICETREE_PREFIX = "${@ 'ti-devicetree-prefix' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}"
> +
> +KERNEL_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
> +IMAGE_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> index 1feb7564..60b647f1 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> @@ -2,8 +2,6 @@ require linux-ti-mainline_git.bb
>   
>   SUMMARY = "Linux-next kernel for TI devices"
>   
> -include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
> -
>   # 6.6.0-rc3+ version
>   SRCREV = "6465e260f48790807eef06b583b38ca9789b6072"
>   PV = "6.6.0-rc3+git"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> index 9235cbc5..aa677cb2 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> @@ -8,7 +8,6 @@ inherit kernel
>   
>   require recipes-kernel/linux/setup-defconfig.inc
>   require recipes-kernel/linux/ti-kernel.inc
> -include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>   include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>   
>   DEPENDS += "gmp-native libmpc-native"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> index 17bcd300..d6985b27 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> @@ -8,7 +8,6 @@ inherit kernel
>   
>   require recipes-kernel/linux/setup-defconfig.inc
>   require recipes-kernel/linux/ti-kernel.inc
> -include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>   include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>   
>   DEPENDS += "gmp-native libmpc-native"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18834): https://lists.yoctoproject.org/g/meta-ti/message/18834
> Mute This Topic: https://lists.yoctoproject.org/mt/114344340/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



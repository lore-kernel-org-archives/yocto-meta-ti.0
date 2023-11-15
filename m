Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4FCC2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 17:39:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.19716.1700069969174028532
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 09:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=huke6IcE;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AFHdNjT011415;
	Wed, 15 Nov 2023 11:39:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700069963;
	bh=WOGbk1taLT+DeuXCFmt3Leg2MMXLI5mC/z8Xx9dih6w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=huke6IcEZtf2kDBspALuTmQJmGUy4LUl54oXPpfoJz6CAzTRrq96p6CKoRc2Q+PPw
	 VGEG4NHGxQl5CGaSEQWQ7Mpzt91t7ic/wsmmXclGgTVQmjhlDPlY//BoDrnmcA+Uhc
	 TL7w5YlUGarVKZZz/SlS3LIe7Mm6ElbHpMw/ABaY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AFHdNgx026534
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Nov 2023 11:39:23 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 15
 Nov 2023 11:39:22 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 15 Nov 2023 11:39:23 -0600
Received: from [10.247.22.64] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AFHdM6N121613;
	Wed, 15 Nov 2023 11:39:22 -0600
Message-ID: <e5d72429-1930-427f-95fb-1f15a47b0ad5@ti.com>
Date: Wed, 15 Nov 2023 11:39:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH] ti-gc320-driver: fix stdarg header
 file compilation issues
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denis@denix.org>
CC: Sinthu Raja <sinthu.raja@ti.com>, "Pothukuchi, Vijay" <vijayp@ti.com>,
        "Kumar, Udit" <u-kumar1@ti.com>
References: <20231115105842.4629-1-sinthu.raja@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20231115105842.4629-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Nov 2023 17:39:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17301

updating denys email id

On 11/15/2023 4:58 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The stdarg header file location is changed to linux/stdarg.h. Add patch
> to fix the compilation issue and also add fix to import DMA_BUF namspace
> to load the dma_buf modules
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   ...tdarg-header-file-compilation-issues.patch | 43 +++++++++++++++++++
>   ...F-namespace-to-load-the-dma_buf-modu.patch | 28 ++++++++++++
>   .../ti-gc320-driver_5.0.11.p7.bb              |  4 +-

Why not patch it at
https://git.ti.com/cgit/graphics/ti-gc320-driver/

and have a branch ti-5.0.11.p7-k6.1 ?

and only do SRCREV update and rename the bb recipe?


>   3 files changed, 74 insertions(+), 1 deletion(-)
>   create mode 100644 meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-header-file-compilation-issues.patch
>   create mode 100644 meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch
> 
> diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-header-file-compilation-issues.patch b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-header-file-compilation-issues.patch
> new file mode 100644
> index 00000000..9262fe6a
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-header-file-compilation-issues.patch
> @@ -0,0 +1,43 @@
> +From 466a0f62d4ca9fd8eeea3fc060f4f1a9584f4af5 Mon Sep 17 00:00:00 2001
> +From: Sinthu Raja <sinthu.raja@ti.com>
> +Date: Tue, 14 Nov 2023 12:45:29 +0530
> +Subject: [PATCH 1/2] km: Fix stdarg header file compilation issues
> +
> +The location of the stdarg.h is changed to linux/stdarg.h. Fix the same
> +by updating the stdarg header location.
> +
> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> +---
> + hal/os/linux/kernel/gc_hal_kernel_debug.h   | 2 +-
> + hal/os/linux/kernel/gc_hal_kernel_debugfs.h | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/hal/os/linux/kernel/gc_hal_kernel_debug.h b/hal/os/linux/kernel/gc_hal_kernel_debug.h
> +index 54782fd..cac5528 100755
> +--- a/hal/os/linux/kernel/gc_hal_kernel_debug.h
> ++++ b/hal/os/linux/kernel/gc_hal_kernel_debug.h
> +@@ -59,7 +59,7 @@
> + #include <gc_hal_kernel_linux.h>
> + #include <linux/spinlock.h>
> + #include <linux/time.h>
> +-#include <stdarg.h>
> ++#include <linux/stdarg.h>
> +
> + #ifdef __cplusplus
> + extern "C" {
> +diff --git a/hal/os/linux/kernel/gc_hal_kernel_debugfs.h b/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
> +index 9a15d77..a960272 100755
> +--- a/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
> ++++ b/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
> +@@ -53,7 +53,7 @@
> + *****************************************************************************/
> +
> +
> +-#include <stdarg.h>
> ++#include <linux/stdarg.h>
> +
> + #ifndef __gc_hal_kernel_debugfs_h_
> + #define __gc_hal_kernel_debugfs_h_
> +--
> +2.36.1
> +
> diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch
> new file mode 100644
> index 00000000..f95599ef
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch
> @@ -0,0 +1,28 @@
> +From e7d20324dcfed1b57e09d9e1498fad666e91665e Mon Sep 17 00:00:00 2001
> +From: Sinthu Raja <sinthu.raja@ti.com>
> +Date: Tue, 14 Nov 2023 12:53:00 +0530
> +Subject: [PATCH 2/2] km: import DMA_BUF namespace to load the dma_buf modules
> +
> +The DMA BUF module is added to the namespace. To load the graphics
> +driver with dma_buf module import the DAM_BUF namespace
> +
> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> +---
> + hal/os/linux/kernel/gc_hal_kernel_probe.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/hal/os/linux/kernel/gc_hal_kernel_probe.c b/hal/os/linux/kernel/gc_hal_kernel_probe.c
> +index 877b5a2..430c67e 100755
> +--- a/hal/os/linux/kernel/gc_hal_kernel_probe.c
> ++++ b/hal/os/linux/kernel/gc_hal_kernel_probe.c
> +@@ -73,6 +73,7 @@
> + #define _GC_OBJ_ZONE    gcvZONE_DRIVER
> +
> + MODULE_DESCRIPTION("Vivante Graphics Driver");
> ++MODULE_IMPORT_NS(DMA_BUF);
> + MODULE_LICENSE("GPL");
> +
> + static struct class* gpuClass;
> +--
> +2.36.1
> +
> diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> index a56810d4..e38d9f49 100644
> --- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> +++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> @@ -15,7 +15,9 @@ BRANCH = "ti-${PV}-k5.10"
>   
>   SRCREV = "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
>   
> -SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=https;branch=${BRANCH}"
> +SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=https;branch=${BRANCH} \
> +	   file://0001-km-Fix-stdarg-header-file-compilation-issues.patch \
> +	   file://0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch"
>   
>   S = "${WORKDIR}/git/src"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17299): https://lists.yoctoproject.org/g/meta-ti/message/17299
> Mute This Topic: https://lists.yoctoproject.org/mt/102602692/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


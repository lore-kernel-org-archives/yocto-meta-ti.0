Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740E3C28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 04:59:26 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.4588.1742014765681432644
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Mar 2025 21:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Fy/MAV/v;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52F4xLhP2320170
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 23:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742014761;
	bh=2wKi/V9ytx1hD/F/GHAESVR0dosvKsuod74Q54HMekg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Fy/MAV/vkGCE3Fd3FzqUjHu3XxRlUp2pikyTSznCXNxWztPEBLlhmb89G59RI9gPW
	 LmTl0mpoc+VUPmIQOkH/b3+p/lTG31kZUramiIdjifdBNznDdDW/vteCOg8WDVq/xw
	 NOAn2Tt78cKNqx/2n5PkW3XwMF2vFwx91m7iLgYs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52F4xLYB096057
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Mar 2025 23:59:21 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Mar 2025 23:59:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Mar 2025 23:59:21 -0500
Received: from [10.249.132.137] ([10.249.132.137])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52F4xI0Z073166;
	Fri, 14 Mar 2025 23:59:19 -0500
Message-ID: <b7de1d68-1947-4ec3-b690-3cbafb84a8e8@ti.com>
Date: Sat, 15 Mar 2025 10:29:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH] omap-a15.inc: don't include ipu1
 firmware in the boot partition
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, "Kumar, Udit" <u-kumar1@ti.com>,
        "Padhi, Beleswar" <b-padhi@ti.com>, "CHAVDA, ANKIT" <a-chavda@ti.com>
References: <20250315020224.3100249-1-denis@denix.org>
Content-Language: en-US
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <20250315020224.3100249-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 15 Mar 2025 04:59:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18389


On 3/15/2025 7:32 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> This reverts commit c58af0b172660ef1248a3454af06251d872770b1.
>
> This adds an undesired dependency on meta-ti-extras - more details:
> https://lists.yoctoproject.org/g/meta-ti/topic/110003435
>
> Cc: Aniket Limaye <a-limaye@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com
> ---

The fw binary is actually a requirement for AM57x boards to boot now. 
U-Boot expects
the firmware to be present in the boot partition, and fails if not found.
(Beleswar can correct me if I'm mistaken).

If we don't want to break this board, we need to maybe migrate the 
ti-ipc-rtos recipe from
meta-ti-extras to meta-ti-bsp, since it is anyway a requirement for 
AM57X u-boot recipe.
Denys, I also see that you mentioned that the ti-ipc-rtos recipe 
currently resides in extras
due to the legacy recipes built from sources using old tools like XDC, 
SYS/BIOS and CGT...
which cannot be easily moved to meta-ti-bsp.

A temporary fix might be to somehow add these inside of 
meta-ti-extras/conf/layer.conf?

However, I Ack the revert in case it is needed for now:

Acked-by: Aniket Limaye <a-limaye@ti.com>


>   meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> index a258decd..be086936 100644
> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> @@ -48,6 +48,5 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu mmip dsp gc3
>   
>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>   WKS_FILE ?= "sdimage-2part.wks"
> -IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
> +IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
>   do_image_wic[depends] += "virtual/bootloader:do_deploy"
> -do_image_wic[depends] += "ti-ipc-rtos:do_deploy"


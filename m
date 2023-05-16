Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75C6C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 22:32:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.36327.1684276324762873974
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 May 2023 15:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Q8ff6RXr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GMW4PH125418
	for <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 17:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684276324;
	bh=YEuyM+3UvmHfKcrHY6ARMCf5A/hIMLsp4WmbgzKrRAA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Q8ff6RXrSZ5lDXHYT3b+Sxv4fv8ZaEHsqTwNuKFptMkAZcIIQH5ALRcg7Pb0AdnWN
	 Hcj2BD247tKffTTQtz2ELodbCjtvWvONTj/Cl+45XGJheO6vUkwGmJc+vElrlbtd07
	 PbK+mma3BUun9yOl8dbATgVMnz2fJ7X60tLmJ854=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GMW4q0002677
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 17:32:04 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 17:32:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 17:32:03 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GMW3m0083191
	for <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 17:32:03 -0500
Message-ID: <69c83e5d-9533-78a6-e9b9-be0c0758cd91@ti.com>
Date: Tue, 16 May 2023 17:32:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] [meta-ti][kirkstone][PATCH] meta-ti-bsp:
 sdimage-2part-efi: rename to load variables
To: <meta-ti@lists.yoctoproject.org>
References: <175FC03ED139B7C3.20583@lists.yoctoproject.org>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <175FC03ED139B7C3.20583@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 22:32:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16547

On 5/16/23 17:29, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Rename the .wks to .wks.in so the EFI_PROVIDER variable is expanded
> properly. We only ever set a soft recommendation for GRUB. If anyone
> attempted to change that previously it was ignored (for more than just
> the reason here, but that's out of my control).
> 
> Add a timeout for the bootloader menu. Currently setting it to 3
> seconds.
> 
> Remove the read only flag on the rootfs. Not sure why that was there.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/k3.inc                       | 2 +-
>   .../wic/{sdimage-2part-efi.wks => sdimage-2part-efi.wks.in}   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta-ti-bsp/wic/{sdimage-2part-efi.wks => sdimage-2part-efi.wks.in} (63%)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index fff15505..c6b55239 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -50,7 +50,7 @@ IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
>   EFI_PROVIDER ?= "grub-efi"
>   MACHINE_FEATURES += "efi"
>   
> -WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks", "sdimage-2part.wks", d)}"
> +WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks.in", "sdimage-2part.wks", d)}"
>   
>   do_image_wic[depends] += "virtual/bootloader:do_deploy"
>   do_image_complete[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> similarity index 63%
> rename from meta-ti-bsp/wic/sdimage-2part-efi.wks
> rename to meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> index ffb8d24b..2213a348 100644
> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks
> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> @@ -2,6 +2,6 @@
>   # long-description: Creates a partitioned SD card image for TI platforms that
>   # supports EFI.  Boot files are located in the first vfat partition with extra
>   # reserved space.  We cannot use a GPT here.
> -bootloader --append="rootfstype=ext4 ro"
> -part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
> +bootloader --timeout=3 --append="rootfstype=ext4"
> +part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
>   part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16546): https://lists.yoctoproject.org/g/meta-ti/message/16546
> Mute This Topic: https://lists.yoctoproject.org/mt/98937316/7094281
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [rs@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


Aah. Improper tags again. Applies to master as well.


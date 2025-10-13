Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B22CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 22:09:34 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1442.1760393367303520060
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 15:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=p2JVtIWN;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DM9PeV916867;
	Mon, 13 Oct 2025 17:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760393365;
	bh=cTCWqM31WfKccKw8SR0QUVWcQvm5IfSMvzywt4gse34=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=p2JVtIWNSWR2RP56GJNko0QsJUuv9ynMX8eFyTkwccelnEEWfotDolD7wetfuFCWC
	 KUFMKGrF/zd/0kVStpLPPv8ch5naZZaFUQvAW5OgedZu0kSaLXBxh2kM9T0qy+UwiF
	 ewb86DQqHlNVQMcl3rO/3EvmwM2tKt0XOwDA/yLk=
Received: from DFLE212.ent.ti.com (dfle212.ent.ti.com [10.64.6.70])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DM9PKv4117322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 17:09:25 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 17:09:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 17:09:25 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DM9Pal2518899;
	Mon, 13 Oct 2025 17:09:25 -0500
Message-ID: <bb91d7f3-2b32-483f-bef0-559edfe7508c@ti.com>
Date: Mon, 13 Oct 2025 17:09:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH v4 3/4] meta-ti-bsp: wic: Add initramfs path to to
 grub config
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20251006115010.1530509-1-m-shah@ti.com>
 <20251006115010.1530509-4-m-shah@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251006115010.1530509-4-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Oct 2025 22:09:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19119



On 10/6/2025 6:50 AM, Moteen Shah wrote:
> Add initrd path to grub.cfg config so that it picks up
> the initramfs image from the boot partition and includes
> it in the boot process.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> index ae38daa7..6a7046a4 100644
> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> @@ -4,5 +4,5 @@
>   # reserved space.  We cannot use a GPT here.
>   
>   bootloader --timeout=3 --append="rootfstype=ext4 ${TI_WKS_BOOTLOADER_APPEND}"
> -part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
> +part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER},initrd=ti-core-initramfs.cpio.xz" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M

After some initial build testing we need to change one more thing, we 
cannot hard code the initrd in the above.  When building NOT on 
bsp-mainline, or bsp-next the builds were failing because this w.ks file 
is hard-coded to always need the initramfs file to exist.

Change it to:

--sourceparams="loader=${EFI_PROVIDER}${TI_WKS_INITRAMFS}"

That way we can set the TI_WKS_INITRAMFS variable to either "", or 
",initrd=ti-core-initramfs.cpio.xz" in the ti-soc.inc based on if we are 
needing it or not.


>   part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D07BCAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 21:15:23 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.221.1758662119571464964
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 14:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OBdu9143;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NLFIiW1534044;
	Tue, 23 Sep 2025 16:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758662118;
	bh=pn7jfZJAIwEAW8op7PJ9+JP/H6LCvaHO8Uid3cHzf8g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OBdu9143EWEGpSGaYgh2EqWYsSbtmill3ljbBqS6l4opJX4x3ZH7WgBFYXKJUVYgj
	 JIlbZHighnfNQKb4faS8f7OQGRQ7qvoIYAMJKLX+7y2zasnoVBIPA+GTtpzSDtXjLq
	 waGApyYARN7UJXsgAVJbu0t5ruujPSBafeUx08YQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NLFIol1359907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 16:15:18 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 16:15:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 16:15:17 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NLFHSl653400;
	Tue, 23 Sep 2025 16:15:17 -0500
Message-ID: <6e5d6135-9571-419d-8879-1626155c2a82@ti.com>
Date: Tue, 23 Sep 2025 16:15:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH 3/4 v2] meta-ti-bsp: wic: Add a new GRUB config
 for TI platforms
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-4-m-shah@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250919093831.20609-4-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Sep 2025 21:15:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19057



On 9/19/2025 4:38 AM, Moteen Shah wrote:
> Add a new grub config for TI specific platforms. While,
> only supporting to boot linux from filesystem on MMCSD, it
> will support booting linux and initrd image from eMMC, OSPI,
> UFS later down the line. Hence, make a new config altogether
> for easier development.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
>   meta-ti-bsp/wic/ti-grub.cfg              | 9 +++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
>   create mode 100644 meta-ti-bsp/wic/ti-grub.cfg
> 
> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> index ae38daa7..11912606 100644
> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> @@ -3,6 +3,6 @@
>   # supports EFI.  Boot files are located in the first vfat partition with extra
>   # reserved space.  We cannot use a GPT here.
>   
> -bootloader --timeout=3 --append="rootfstype=ext4 ${TI_WKS_BOOTLOADER_APPEND}"
> +bootloader --configfile="ti-grub.cfg"

Your change dropped the ${TI_WKS_BOOTLOADER_APPEND} which is used for 
am64 to specify the serial console.  This likely needs to be better 
tested before we just make blanket changes like that.


>   part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
>   part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
> diff --git a/meta-ti-bsp/wic/ti-grub.cfg b/meta-ti-bsp/wic/ti-grub.cfg
> new file mode 100644
> index 00000000..b32b378f
> --- /dev/null
> +++ b/meta-ti-bsp/wic/ti-grub.cfg
> @@ -0,0 +1,9 @@
> +# Set timeout and default options
> +set timeout=3
> +set default=0
> +
> +# Main boot entry
> +menuentry "Boot Linux" {
> +    linux /Image root=/dev/disk/by-label/root rootwait rootfstype=ext4
> +    initrd /initrd.cpio.xz

Change the name to ti-core-initramfs.cpio.xz to match the other changes 
from patch #2.

> +}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


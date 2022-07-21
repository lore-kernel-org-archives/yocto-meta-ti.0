Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B79FC43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 22:57:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1775.1658444253725473491
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Jul 2022 15:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E3FA640CF8;
	Thu, 21 Jul 2022 22:57:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ebMiOsJU6FK7; Thu, 21 Jul 2022 22:57:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A08FD40CE7;
	Thu, 21 Jul 2022 22:57:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2E1881749BA; Thu, 21 Jul 2022 18:57:26 -0400 (EDT)
Date: Thu, 21 Jul 2022 18:57:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Bryan Brattlof <bb@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Meta-TI <meta-ti@lists.yoctoproject.org>,
	Nishanth Menon <nm@ti.com>, Res Sapp <rs@ti.com>,
	Anand Gadiyar <gadiyar@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [dunfell PATCH] wic: move uboot/spls mountpoint to
 /boot/firmware
Message-ID: <20220721225726.GP18692@denix.org>
References: <20220721210152.28223-1-bb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721210152.28223-1-bb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Jul 2022 22:57:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14895

I don't think this is a correct solution, or maybe I'm not understanding the 
problem. Can you please elaborate a bit more on the problem?


On Thu, Jul 21, 2022 at 04:01:52PM -0500, Bryan Brattlof wrote:
> Currently out boards will auto-mount the sd-card's boot partition into
> the /boot folder, effectively hiding the kernel image and dtb files that
> are already there.
> 
> Move the boot partition mount point to /boot/firmware allowing access to
> both the bootloader binares and kernel images.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  wic/sdimage-2part.wks | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/wic/sdimage-2part.wks b/wic/sdimage-2part.wks
> index 77d6f7b576aef..7567c4429a2eb 100644
> --- a/wic/sdimage-2part.wks
> +++ b/wic/sdimage-2part.wks
> @@ -2,5 +2,5 @@
>  # long-description: Creates a partitioned SD card image for TI platforms.
>  # Boot files are located in the first vfat partition with extra reserved space.
>  
> -part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --extra-space 100M --use-uuid
> +part /boot/firmware --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --extra-space 100M --use-uuid
>  part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 1024 --use-uuid
> -- 
> 2.17.1


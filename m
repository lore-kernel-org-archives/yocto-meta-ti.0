Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4702.1627343450203127516
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 16:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9283240C22;
	Mon, 26 Jul 2021 23:50:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tvO4vuf9N5sX; Mon, 26 Jul 2021 23:50:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 757A940A47;
	Mon, 26 Jul 2021 23:50:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 37A77174647; Mon, 26 Jul 2021 19:50:48 -0400 (EDT)
Date: Mon, 26 Jul 2021 19:50:48 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Theodore A. Roth" <troth@openavr.org>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][hardknott/master][PATCH] wic: Set a fixed size for boot partition in wic image
Message-ID: <20210726235048.GY1528@denix.org>
References: <20210726142925.2724723-1-troth@openavr.org>
MIME-Version: 1.0
In-Reply-To: <20210726142925.2724723-1-troth@openavr.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 26, 2021 at 08:29:25AM -0600, Theodore A. Roth wrote:
> The beagleboneai is not loading the MLO without this change.
> 
> A similar change was needed in meta-yocto-bsp for the beaglebone black
> due to the updating of dosfstools to 4.2 in Hardknott.
> 
> [Yocto #14306]
> 
> (See also meta-yocto rev: 0c679ac53b52e631a7c961872ce58f5cf74b8629)

Thanks, this does make sense and aligns with the change discussed for EFI:
https://lists.yoctoproject.org/g/meta-ti/topic/83851299


> Signed-off-by: Theodore A. Roth <troth@openavr.org>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>

BTW, meta-ti doesn't have hardknott branch, so this is only for master.


> ---
>  wic/sdimage-2part.wks | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/wic/sdimage-2part.wks b/wic/sdimage-2part.wks
> index 77d6f7b5..3eab9407 100644
> --- a/wic/sdimage-2part.wks
> +++ b/wic/sdimage-2part.wks
> @@ -2,5 +2,5 @@
>  # long-description: Creates a partitioned SD card image for TI platforms.
>  # Boot files are located in the first vfat partition with extra reserved space.
>  
> -part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --extra-space 100M --use-uuid
> +part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --fixed-size 128 --use-uuid
>  part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 1024 --use-uuid
> -- 
> 2.25.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.974.1617230103533927626
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 15:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0A3A340C3A;
	Wed, 31 Mar 2021 22:35:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPbnar3A-sdg; Wed, 31 Mar 2021 22:35:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E01CD40BA9;
	Wed, 31 Mar 2021 22:35:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B10AC174567; Wed, 31 Mar 2021 18:35:00 -0400 (EDT)
Date: Wed, 31 Mar 2021 18:35:00 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell/master][PATCH 6/7] conf/machine: am64xx: Switch to multi-certificate boot images
Message-ID: <20210331223500.GJ23013@denix.org>
References: <20210331165133.3746-1-nm@ti.com>
 <20210331165133.3746-7-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210331165133.3746-7-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 31, 2021 at 11:51:32AM -0500, Nishanth Menon wrote:
> Switch to using all of multi-certificate boot images. This allows us
> to create bootable images - in this case, we are missing tiboot3.bin
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  conf/machine/include/am64xx.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> index 3173319df354..9d40b066a03a 100644
> --- a/conf/machine/include/am64xx.inc
> +++ b/conf/machine/include/am64xx.inc
> @@ -10,7 +10,8 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am642-evm.dtb \
>  "
>  
> -IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
> +# AM64 supports multi-certificate images, use the same
> +IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
>  do_image_wic[depends] += "trusted-firmware-a:do_deploy"
>  do_image_tar[depends] += "trusted-firmware-a:do_deploy"

Same comment - TF-A is not needed here.


>  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -- 
> 2.31.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

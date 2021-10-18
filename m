Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1296.1634595468305766399
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 15:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A907B40C2C;
	Mon, 18 Oct 2021 22:17:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nBl9t4pBtBn; Mon, 18 Oct 2021 22:17:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 89D2840BE6;
	Mon, 18 Oct 2021 22:17:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 533A2174695; Mon, 18 Oct 2021 18:17:45 -0400 (EDT)
Date: Mon, 18 Oct 2021 18:17:45 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/dunfell][PATCH v3 3/3] conf: omap-a15: fix the dtb file path for extlinux boot
Message-ID: <20211018221745.GK10132@denix.org>
References: <20211018221034.11092-1-yogeshs@ti.com>
 <20211018221034.11092-4-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211018221034.11092-4-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 18, 2021 at 10:10:34PM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> The uboot extlinux is using kernel device tree variable to populate the
> dtb files. The error occurs if the device tree files are in ti folder
> since there is no ti folder in deploy directory. Fix the kernel device
> tree path before using in the uboot extlinux.

Looks reasonable, but should probably be the first patch in the series for 
bisectability.

Also, what's with 2 extra empty lines?


> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  conf/machine/include/omap-a15.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
> index c95b0ccc..8356c920 100644
> --- a/conf/machine/include/omap-a15.inc
> +++ b/conf/machine/include/omap-a15.inc
> @@ -19,15 +19,19 @@ UBOOT_ARCH = "arm"
>  UBOOT_ENTRYPOINT = "0x80008000"
>  UBOOT_LOADADDRESS = "0x80008000"
>  
> +DEVICETREE_FILE = "${@d.getVar('KERNEL_DEVICETREE').replace("ti/","")}"
> +
>  # Generate an extlinux.conf file
>  UBOOT_EXTLINUX = "1"
>  UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
>  UBOOT_EXTLINUX_BOOT_FILES = " \
>      extlinux.conf;extlinux/extlinux.conf \
>      ${KERNEL_IMAGETYPE} \
> -    ${KERNEL_DEVICETREE} \
> +    ${DEVICETREE_FILE} \
>  "
>  
> +
> +
>  SPL_BINARY = "MLO"
>  UBOOT_SUFFIX = "img"
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

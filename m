Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2199.1644876922397923888
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Feb 2022 14:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5E1E440C52;
	Mon, 14 Feb 2022 22:15:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2wcbeAUqB6DC; Mon, 14 Feb 2022 22:15:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 31AF440BEB;
	Mon, 14 Feb 2022 22:15:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E605C17474A; Mon, 14 Feb 2022 17:15:16 -0500 (EST)
Date: Mon, 14 Feb 2022 17:15:16 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Vivien Didelot <vivien.didelot@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Vivien Didelot <vdidelot@pbsc.com>
Subject: Re: [meta-ti][RESEND 1/2] beaglebone: make kernel machine-specific package
Message-ID: <20220214221516.GI26229@denix.org>
References: <20220129193320.2945618-1-vdidelot@pbsc.com>
MIME-Version: 1.0
In-Reply-To: <20220129193320.2945618-1-vdidelot@pbsc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

"make kernel machine-specific package" doesn't reflect the actual change, plus 
kernel is already a machine-specific package - PACKAGE_ARCH = "${MACHINE_ARCH}"

Your original commit for beaglebone-yocto in meta-yocto-bsp is correct though.

I can take these patches into my new WIP master tree with this minor update.


On Sat, Jan 29, 2022 at 02:33:19PM -0500, Vivien Didelot wrote:
> Require kernel image and device tree as machine-specific packages with
> MACHINE_ESSENTIAL_EXTRA_RDEPENDS instead of appending IMAGE_INSTALL.
> 
> This binds the packages to the packagegroup-core-boot package group,
> allowing one to skip their installation, e.g. for container trees.
> 
> This patch reflects commit d4cbe0e43393 [1] from meta-yocto-bsp
> ("beaglebone-yocto: move kernel and dtb to packagegroup-core-boot").
> 
> [1] https://git.yoctoproject.org/meta-yocto/commit/?id=d4cbe0e43393ec70e98caf006372b5311597d377
> 
> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> ---
>  conf/machine/beaglebone.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> index dcb14cc9..fe3127bb 100644
> --- a/conf/machine/beaglebone.conf
> +++ b/conf/machine/beaglebone.conf
> @@ -13,7 +13,7 @@ MACHINE_GUI_CLASS = "bigscreen"
>  
>  SERIAL_CONSOLES = "115200;ttyS0"
>  
> -IMAGE_INSTALL:append = " kernel-devicetree kernel-image-zimage"
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-zimage"
>  
>  # Refine the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_BOARDS = "bbbAM335x"
> -- 
> 2.35.0
> 

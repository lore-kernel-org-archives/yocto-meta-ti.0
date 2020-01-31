Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1495.1580498944670204518
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HirGcLNH;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJT4mb115734
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:29:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580498944;
	bh=PmbsYRoDyABxKoBoyRYcOdAxCFswFi5468fQohJIQtc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HirGcLNHw4I2P8BD9/BmUsBTzuVs99gnpZhXaxLfsfDIPt+kAhjw8MO3jvnCghu/N
	 HoVkHgK4hhQNGpRm28oxMs6NFZrCj/vK2bmO1/9Cu+s0ON5IaO6ReKuXNGFdd/Vec9
	 nYx8ahQRfUYeDY8zZW+p9W/u5TZzIxlmRD/ElTmI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VJT3BI074134
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:29:03 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:29:03 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:29:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJT38x101848;
	Fri, 31 Jan 2020 13:29:03 -0600
Date: Fri, 31 Jan 2020 14:29:03 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/3] conf/machine: use xz over gz for images
Message-ID: <20200131192903.GB23242@beryl>
References: <20200131192111.29813-1-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200131192111.29813-1-afd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 31, 2020 at 02:21:09PM -0500, Andrew F. Davis wrote:
> The current meta-arago later assumes there will be a .tar.gz for
> the machines build into tisdk-rootfs-images. This compresses better
> anyway so lets switch these remaining machines over.

I'm fine with the code change, but I'm not fine with the message above.
Need to come up with a more generic/neutral message - meta-ti should not refer 
to meta-arago or any specific Distro, as it's meant to be distro-agnostic. 
Moreover, meta-ti is being used in other distros and environment. So, just 
mentioning better compression ratio should be fine here. Thanks.

Denys


> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  conf/machine/am3517-evm.conf  | 2 +-
>  conf/machine/am37x-evm.conf   | 2 +-
>  conf/machine/beagleboard.conf | 2 +-
>  conf/machine/omap3evm.conf    | 2 +-
>  conf/machine/omap5-evm.conf   | 2 +-
>  conf/machine/pandaboard.conf  | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
> index 87e3f1e0..c20e2f6a 100644
> --- a/conf/machine/am3517-evm.conf
> +++ b/conf/machine/am3517-evm.conf
> @@ -7,7 +7,7 @@ require conf/machine/include/omap3.inc
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_FEATURES += "touchscreen ethernet"
>  
> -IMAGE_FSTYPES += "ubi tar.gz"
> +IMAGE_FSTYPES += "ubi tar.xz"
>  EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
>  
>  SERIAL_CONSOLES = "115200;ttyS2"
> diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
> index e9d1838a..a512c8d0 100644
> --- a/conf/machine/am37x-evm.conf
> +++ b/conf/machine/am37x-evm.conf
> @@ -7,7 +7,7 @@ require conf/machine/include/omap3.inc
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_FEATURES += "touchscreen ethernet"
>  
> -IMAGE_FSTYPES += "ubi tar.gz"
> +IMAGE_FSTYPES += "ubi tar.xz"
>  EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
>  
>  KERNEL_DEVICETREE = "omap3-evm-37xx.dtb"
> diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
> index 37d23aa7..ee51fd66 100644
> --- a/conf/machine/beagleboard.conf
> +++ b/conf/machine/beagleboard.conf
> @@ -7,7 +7,7 @@ require conf/machine/include/omap3.inc
>  # Only has DVI connector for external screen
>  MACHINE_GUI_CLASS = "bigscreen"
>  
> -IMAGE_FSTYPES += "tar.gz ubi"
> +IMAGE_FSTYPES += "tar.xz ubi"
>  EXTRA_IMAGECMD_jffs2 = "-lnp"
>  
>  KERNEL_DEVICETREE = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb"
> diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
> index a7457c04..01808b68 100644
> --- a/conf/machine/omap3evm.conf
> +++ b/conf/machine/omap3evm.conf
> @@ -7,7 +7,7 @@ require conf/machine/include/omap3.inc
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_FEATURES += "touchscreen ethernet"
>  
> -IMAGE_FSTYPES += "jffs2 tar.gz"
> +IMAGE_FSTYPES += "jffs2 tar.xz"
>  EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
>  
>  SERIAL_CONSOLES = "115200;ttyS0"
> diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
> index 28044cb9..b4cec1a2 100644
> --- a/conf/machine/omap5-evm.conf
> +++ b/conf/machine/omap5-evm.conf
> @@ -4,7 +4,7 @@
>  
>  require conf/machine/include/omap-a15.inc
>  
> -IMAGE_FSTYPES += "ubi tar.gz"
> +IMAGE_FSTYPES += "ubi tar.xz"
>  
>  KERNEL_DEVICETREE = "omap5-uevm.dtb"
>  
> diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
> index edfc612b..4dd6fa29 100644
> --- a/conf/machine/pandaboard.conf
> +++ b/conf/machine/pandaboard.conf
> @@ -6,7 +6,7 @@ require conf/machine/include/omap4.inc
>  
>  MACHINE_GUI_CLASS = "bigscreen"
>  
> -IMAGE_FSTYPES += "tar.gz"
> +IMAGE_FSTYPES += "tar.xz"
>  
>  KERNEL_DEVICETREE = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
>  
> -- 
> 2.17.1
> 

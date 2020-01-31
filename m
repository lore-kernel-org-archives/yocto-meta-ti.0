Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1584.1580499341770962647
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FrfnbP2C;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJZfCB077870
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:35:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580499341;
	bh=7pZqBpeiasYnphCXZt9v5nGYe89AY1XBYT1Z591TOS4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FrfnbP2CDq90TOidZPuiLq235VmCAa+ABLMjYd6/ZlCYS1cwhWgWqHd2TnsJTyRqr
	 Vb0Yg1l98+QGKzs9tgLCvbGwrX3I2QwK0T8YNMrpNyZZ7tcsOZzGp8NevfL9c6yu8Y
	 TxQemMdva0TgZ+mCNMHZxkkQqT4hQW8i0CNzTIJI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJZfvq054924
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:35:41 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:35:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:35:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJZeQ4009742;
	Fri, 31 Jan 2020 13:35:40 -0600
Date: Fri, 31 Jan 2020 14:35:40 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] conf/machine: use xz over gz for images
Message-ID: <20200131193540.GD23242@beryl>
References: <20200131193426.30634-1-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200131193426.30634-1-afd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 31, 2020 at 02:34:26PM -0500, Andrew F. Davis wrote:
> This compresses better and most machines use this now, lets switch these
> remaining machines over.

Perfect, thanks! Will merge this shortly.


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

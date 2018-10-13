Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52800E00B9F; Fri, 12 Oct 2018 20:06:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEC29E00B92
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 20:06:15 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9D36EYH105341;
	Fri, 12 Oct 2018 22:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539399974;
	bh=EDLoSlxDWA9vjVebWLkJ4uYpFcEQ8n7IWNdEKVr5Dek=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JXTT7YQm+o5TFUDFMgD/WDMllxYQH8us5uuzJ/XJ4rE34ELXjG6jT1s7g2N6Zt6zK
	q3U/rUz/+nzZRx9IwVwin1/2dZZYlaZ7rSUYSg2isCqiYpdaZZhlj7rfglVWgug4dR
	h+k6/dkwvQAGCAujT9v96BrJS97fX6vC/qWSe2M0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9D36EcP023409;
	Fri, 12 Oct 2018 22:06:14 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 12 Oct 2018 22:06:15 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 12 Oct 2018 22:06:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9D36ET7003165;
	Fri, 12 Oct 2018 22:06:14 -0500
Date: Fri, 12 Oct 2018 23:06:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181013030614.GA13833@beryl>
References: <20181013015721.33162-1-raj.khem@gmail.com>
	<20181013015721.33162-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181013015721.33162-2-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] beaglebone.conf: Switch u-boot provider to mainline from oe-core
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Oct 2018 03:06:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This is should be a less dramatic workaround for now :)
https://lists.yoctoproject.org/pipermail/meta-ti/2018-October/011363.html

Thanks for confirming SPL breakage with am335x_beaglebone_config


On Fri, Oct 12, 2018 at 06:57:21PM -0700, Khem Raj wrote:
> use beaglebone specific wic template
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/machine/beaglebone.conf | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> index 49edfd61..25b9998a 100644
> --- a/conf/machine/beaglebone.conf
> +++ b/conf/machine/beaglebone.conf
> @@ -1,6 +1,6 @@
>  #@TYPE: Machine
>  #@NAME: BeagleBone machine
> -#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
> +#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
>  
>  require conf/machine/include/ti33x.inc
>  
> @@ -11,15 +11,25 @@ KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblue.dtb \
>  # Only has DVI connector for external screen
>  MACHINE_GUI_CLASS = "bigscreen"
>  
> -SERIAL_CONSOLE = "115200 ttyS0"
> +SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
>  
>  UBOOT_MACHINE = "am335x_boneblack_config"
>  
> -WKS_FILE = "sdimage-bootpart.wks"
> -IMAGE_BOOT_FILES = "MLO u-boot.img"
> -IMAGE_FSTYPES += "tar.xz wic.xz"
> +WKS_FILE = "beaglebone.wks"
>  
> -do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
> +IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} MLO zImage am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
> +
> +IMAGE_FSTYPES += "tar.xz wic.xz"
>  
>  # Refine the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_BOARDS = "bbbAM335x"
> +
> +SPL_BINARY = "MLO"
> +UBOOT_SUFFIX = "img"
> +
> +IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
> +do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
> +
> +PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> +PREFERRED_PROVIDER_u-boot = "u-boot"
> +
> -- 
> 2.19.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


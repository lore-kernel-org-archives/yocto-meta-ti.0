Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1820FE006AD
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 10:12:52 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JHCqYC023676
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 12:12:52 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JHCqk4018250
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 12:12:52 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Mar 2013 12:12:52 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2JHCpMp007010;
	Tue, 19 Mar 2013 12:12:51 -0500
Date: Tue, 19 Mar 2013 13:12:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20130319171251.GP32759@edge>
References: <1363705841-9610-1-git-send-email-Chase.Maupin@ti.com>
	<1363705841-9610-2-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1363705841-9610-2-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] omap5-evm: Add OMAP5 EVM configuration
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
X-List-Received-Date: Tue, 19 Mar 2013 17:12:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 19, 2013 at 10:10:41AM -0500, Chase Maupin wrote:
> * Add the machine configuration for the OMAP5 EVM device.

Overall looks good. 

> * Create the omap-a15.inc file to be shared with all Cortex-A15
>   derivative devices.

Is the omap-a15 a preferred name? I didn't see it used internally anywhere. 
It's not like I object specifically to this name, but was wondering if there 
was something else other people are more familiar with? Another option would 
be just simple "omap5", but I guess you are planning for few of those new 
derivative platforms that don't really have omap5 in the name... :)

Moreover, the comment above implies omap-a15 SoC file will be used for all 
Cortex-A15 devices, which is not exactly correct, as Keystone has nothing to 
do with omap5 and shouldn't share that SoC file.

-- 
Denys


> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  conf/machine/include/omap-a15.inc                |   18 ++++++++++++++++++
>  conf/machine/{am335x-evm.conf => omap5-evm.conf} |   20 ++++++++++++++------
>  2 files changed, 32 insertions(+), 6 deletions(-)
>  create mode 100644 conf/machine/include/omap-a15.inc
>  copy conf/machine/{am335x-evm.conf => omap5-evm.conf} (65%)
> 
> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
> new file mode 100644
> index 0000000..3ea1a05
> --- /dev/null
> +++ b/conf/machine/include/omap-a15.inc
> @@ -0,0 +1,18 @@
> +SOC_FAMILY = "omap-a15"
> +require conf/machine/include/soc-family.inc
> +
> +require conf/machine/include/tune-cortexa15.inc
> +
> +# Increase this everytime you change something in the kernel
> +MACHINE_KERNEL_PR = "r0"
> +
> +PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
> +PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
> +
> +KERNEL_IMAGETYPE = "uImage"
> +
> +UBOOT_ARCH = "arm"
> +UBOOT_ENTRYPOINT = "0x80008000"
> +UBOOT_LOADADDRESS = "0x80008000"
> +
> +EXTRA_IMAGEDEPENDS += "virtual/bootloader"
> diff --git a/conf/machine/am335x-evm.conf b/conf/machine/omap5-evm.conf
> similarity index 65%
> copy from conf/machine/am335x-evm.conf
> copy to conf/machine/omap5-evm.conf
> index 21e79a2..daa5f58 100644
> --- a/conf/machine/am335x-evm.conf
> +++ b/conf/machine/omap5-evm.conf
> @@ -1,13 +1,15 @@
>  #@TYPE: Machine
> -#@NAME: AM335x EVM
> -#@DESCRIPTION: Machine configuration for the TI AM335x EVM
> +#@NAME: OMAP5 EVM
> +#@DESCRIPTION: Machine configuration for the TI OMAP5 uEVM
>  
> -require conf/machine/include/ti33x.inc
> +PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> +XSERVER = "xserver-xorg \
> +           xf86-input-evdev \
> +           xf86-video-fbdev"
>  
> -# Use built-in LCD by default
> -XSERVER += "xf86-input-tslib"
>  GUI_MACHINE_CLASS = "smallscreen"
> -MACHINE_FEATURES += "touchscreen"
> +
> +require conf/machine/include/omap-a15.inc
>  
>  IMAGE_FSTYPES += "ubi tar.gz"
>  
> @@ -33,3 +35,9 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
>  # UBI: sub-page size:              512
>  # UBI: VID header offset:          2048 (aligned 2048)
>  UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
> +
> +UBOOT_MACHINE = "omap5_evm_config"
> +
> +# Currently removing the sgx machine feature because there is no SGX package
> +# available for omap5
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


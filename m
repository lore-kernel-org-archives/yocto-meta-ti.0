Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 688D8E0088B; Wed, 27 Jan 2016 10:32:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF15CE0079A
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 10:31:59 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RIVuMs016939;
	Wed, 27 Jan 2016 12:31:57 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RIVuRg009266;
	Wed, 27 Jan 2016 12:31:56 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 12:31:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RIVutB016886;
	Wed, 27 Jan 2016 12:31:56 -0600
Date: Wed, 27 Jan 2016 13:31:41 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Message-ID: <20160127183141.GO11314@edge>
References: <1453916765-5504-1-git-send-email-thomas.perrot@tupi.fr>
MIME-Version: 1.0
In-Reply-To: <1453916765-5504-1-git-send-email-thomas.perrot@tupi.fr>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] Correct the name of the variable used to define the size of the logo: GUI_MACHINE_CLASS renamed MACHINE_GUI_CLASS.
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
X-List-Received-Date: Wed, 27 Jan 2016 18:32:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! Can you please split the subject into shortlog and the rest of the 
commit message? Otherwise it's too long to fit in one line.

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


On Wed, Jan 27, 2016 at 06:46:05PM +0100, Thomas Perrot wrote:
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  conf/machine/am335x-evm.conf      | 2 +-
>  conf/machine/am3517-evm.conf      | 2 +-
>  conf/machine/am37x-evm.conf       | 2 +-
>  conf/machine/am437x-evm.conf      | 2 +-
>  conf/machine/beagleboard.conf     | 2 +-
>  conf/machine/beaglebone.conf      | 2 +-
>  conf/machine/include/omap-a15.inc | 2 +-
>  conf/machine/include/omap3.inc    | 2 +-
>  conf/machine/include/ti33x.inc    | 2 +-
>  conf/machine/include/ti43x.inc    | 2 +-
>  conf/machine/omap3evm.conf        | 2 +-
>  conf/machine/pandaboard.conf      | 2 +-
>  12 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
> index 08daa8e..55bbf95 100644
> --- a/conf/machine/am335x-evm.conf
> +++ b/conf/machine/am335x-evm.conf
> @@ -6,7 +6,7 @@ require conf/machine/include/ti33x.inc
>  
>  # Use built-in LCD by default
>  XSERVER += "xf86-input-tslib"
> -GUI_MACHINE_CLASS = "smallscreen"
> +MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_FEATURES += "touchscreen"
>  
>  IMAGE_FSTYPES += "ubi tar.gz"
> diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
> index 7295c1f..4fef634 100644
> --- a/conf/machine/am3517-evm.conf
> +++ b/conf/machine/am3517-evm.conf
> @@ -6,7 +6,7 @@ require conf/machine/include/omap3.inc
>  
>  # Use built-in LCD by default
>  XSERVER += "xf86-input-tslib"
> -GUI_MACHINE_CLASS = "smallscreen"
> +MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_FEATURES += "touchscreen ethernet"
>  
>  IMAGE_FSTYPES += "ubi tar.gz"
> diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
> index 16ce73c..99adb08 100644
> --- a/conf/machine/am37x-evm.conf
> +++ b/conf/machine/am37x-evm.conf
> @@ -6,7 +6,7 @@ require conf/machine/include/omap3.inc
>  
>  # Use built-in LCD by default
>  XSERVER += "xf86-input-tslib"
> -GUI_MACHINE_CLASS = "smallscreen"
> +MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_FEATURES += "touchscreen ethernet"
>  
>  IMAGE_FSTYPES += "ubi tar.gz"
> diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
> index 9ff8944..7d40aec 100644
> --- a/conf/machine/am437x-evm.conf
> +++ b/conf/machine/am437x-evm.conf
> @@ -6,7 +6,7 @@ require conf/machine/include/ti43x.inc
>  
>  # Use built-in LCD by default
>  XSERVER += "xf86-input-tslib"
> -GUI_MACHINE_CLASS = "smallscreen"
> +MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_FEATURES += "touchscreen"
>  
>  IMAGE_FSTYPES += "ubi tar.gz"
> diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
> index 32985b3..955961f 100644
> --- a/conf/machine/beagleboard.conf
> +++ b/conf/machine/beagleboard.conf
> @@ -5,7 +5,7 @@
>  require conf/machine/include/omap3.inc
>  
>  # Only has DVI connector for external screen
> -GUI_MACHINE_CLASS = "bigscreen"
> +MACHINE_GUI_CLASS = "bigscreen"
>  
>  IMAGE_FSTYPES += "tar.gz ubi"
>  EXTRA_IMAGECMD_jffs2 = "-lnp"
> diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> index 8a7e52a..bf3d91e 100644
> --- a/conf/machine/beaglebone.conf
> +++ b/conf/machine/beaglebone.conf
> @@ -5,7 +5,7 @@
>  require conf/machine/include/ti33x.inc
>  
>  # Only has DVI connector for external screen
> -GUI_MACHINE_CLASS = "bigscreen"
> +MACHINE_GUI_CLASS = "bigscreen"
>  
>  IMAGE_FSTYPES += "tar.gz"
>  
> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
> index 41a2f19..9316998 100644
> --- a/conf/machine/include/omap-a15.inc
> +++ b/conf/machine/include/omap-a15.inc
> @@ -24,7 +24,7 @@ XSERVER = "xserver-xorg \
>             xf86-input-evdev \
>             xf86-video-fbdev"
>  
> -GUI_MACHINE_CLASS = "smallscreen"
> +MACHINE_GUI_CLASS = "smallscreen"
>  
>  # Use the expected value of the ubifs filesystem's volume name in the kernel
>  # and u-boot.
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
> index 0757b43..f83bfa2 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -14,7 +14,7 @@ XSERVER = "xserver-xorg \
>             xf86-input-keyboard"
>  
>  # Default to external video, change to smallscreen for built-in LCD
> -GUI_MACHINE_CLASS = "bigscreen"
> +MACHINE_GUI_CLASS = "bigscreen"
>  
>  # Increase this everytime you change something in the kernel
>  MACHINE_KERNEL_PR = "r126"
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index 53f38c9..fa2ead5 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -14,7 +14,7 @@ XSERVER = "xserver-xorg \
>             xf86-input-keyboard"
>  
>  # Default to external video, change to smallscreen for built-in LCD
> -GUI_MACHINE_CLASS = "bigscreen"
> +MACHINE_GUI_CLASS = "bigscreen"
>  
>  # Increase this everytime you change something in the kernel
>  MACHINE_KERNEL_PR = "r22"
> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
> index 8c5fa2d..a603059 100644
> --- a/conf/machine/include/ti43x.inc
> +++ b/conf/machine/include/ti43x.inc
> @@ -14,7 +14,7 @@ XSERVER = "xserver-xorg \
>             xf86-input-keyboard"
>  
>  # Default to external video, change to smallscreen for built-in LCD
> -GUI_MACHINE_CLASS = "bigscreen"
> +MACHINE_GUI_CLASS = "bigscreen"
>  
>  # Increase this everytime you change something in the kernel
>  MACHINE_KERNEL_PR = "r3"
> diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
> index 6bfd808..7051d88 100644
> --- a/conf/machine/omap3evm.conf
> +++ b/conf/machine/omap3evm.conf
> @@ -6,7 +6,7 @@ require conf/machine/include/omap3.inc
>  
>  # Use built-in LCD by default
>  XSERVER += "xf86-input-tslib"
> -GUI_MACHINE_CLASS = "smallscreen"
> +MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_FEATURES += "touchscreen ethernet"
>  
>  IMAGE_FSTYPES += "jffs2 tar.gz"
> diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
> index 1707f80..99497c1 100644
> --- a/conf/machine/pandaboard.conf
> +++ b/conf/machine/pandaboard.conf
> @@ -4,7 +4,7 @@
>  
>  require conf/machine/include/omap4.inc
>  
> -GUI_MACHINE_CLASS = "bigscreen"
> +MACHINE_GUI_CLASS = "bigscreen"
>  
>  IMAGE_FSTYPES += "tar.gz"
>  
> -- 
> 2.1.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


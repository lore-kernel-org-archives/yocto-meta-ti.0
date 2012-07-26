Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85237E01304
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 17:33:36 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6Q0XYwu026318;
	Wed, 25 Jul 2012 19:33:34 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6Q0XYbY027629;
	Wed, 25 Jul 2012 19:33:34 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 25 Jul 2012 19:33:34 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6Q0XYLk020711;
	Wed, 25 Jul 2012 19:33:34 -0500
Date: Wed, 25 Jul 2012 20:33:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120726003333.GC6804@edge>
References: <1342000711-18346-1-git-send-email-koen@dominion.thruhere.net>
	<1342000711-18346-6-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1342000711-18346-6-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 6/8] linux-ti33x-psp 3.2: add camera driver for beaglebone
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 00:33:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 11, 2012 at 11:58:29AM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |   43 +++++++++++++-------
>  recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
>  2 files changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> index 692d71a..8e8a1c5 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> @@ -1,6 +1,6 @@
>  #
>  # Automatically generated file; DO NOT EDIT.
> -# Linux/arm 3.2.18 Kernel Configuration
> +# Linux/arm 3.2.21 Kernel Configuration
>  #
>  CONFIG_ARM=y
>  CONFIG_HAVE_PWM=y
> @@ -1408,6 +1408,7 @@ CONFIG_TOUCHSCREEN_ADS7846=y
>  # CONFIG_TOUCHSCREEN_INEXIO is not set
>  # CONFIG_TOUCHSCREEN_MK712 is not set
>  # CONFIG_TOUCHSCREEN_PENMOUNT is not set
> +CONFIG_TOUCHSCREEN_EDT_FT5X06=y
>  # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
>  # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
>  CONFIG_TOUCHSCREEN_TI_TSCADC=y
> @@ -1971,13 +1972,14 @@ CONFIG_MEDIA_TUNER_MAX2165=m
>  CONFIG_MEDIA_TUNER_TDA18218=m
>  CONFIG_MEDIA_TUNER_TDA18212=m
>  CONFIG_VIDEO_V4L2=y
> -CONFIG_VIDEOBUF_GEN=m
> +CONFIG_VIDEOBUF_GEN=y
>  CONFIG_VIDEOBUF_VMALLOC=m
>  CONFIG_VIDEOBUF_DVB=m
>  CONFIG_VIDEO_TVEEPROM=m
>  CONFIG_VIDEO_TUNER=m
> -CONFIG_VIDEOBUF2_CORE=m
> -CONFIG_VIDEOBUF2_MEMOPS=m
> +CONFIG_VIDEOBUF2_CORE=y
> +CONFIG_VIDEOBUF2_MEMOPS=y
> +CONFIG_VIDEOBUF2_DMA_CONTIG=y
>  CONFIG_VIDEOBUF2_VMALLOC=m
>  CONFIG_VIDEO_CAPTURE_DRIVERS=y
>  # CONFIG_VIDEO_ADV_DEBUG is not set
> @@ -2079,7 +2081,25 @@ CONFIG_VIDEO_VIVI=m
>  # CONFIG_VIDEO_W9966 is not set
>  # CONFIG_VIDEO_CPIA2 is not set
>  # CONFIG_VIDEO_AU0828 is not set
> -# CONFIG_SOC_CAMERA is not set
> +CONFIG_SOC_CAMERA=y
> +# CONFIG_SOC_CAMERA_IMX074 is not set
> +# CONFIG_SOC_CAMERA_MT9M001 is not set
> +# CONFIG_SOC_CAMERA_MT9M111 is not set
> +# CONFIG_SOC_CAMERA_MT9T031 is not set
> +CONFIG_SOC_CAMERA_MT9T112=y
> +# CONFIG_SOC_CAMERA_MT9V022 is not set
> +# CONFIG_SOC_CAMERA_RJ54N1 is not set
> +# CONFIG_SOC_CAMERA_TW9910 is not set
> +# CONFIG_SOC_CAMERA_PLATFORM is not set
> +# CONFIG_SOC_CAMERA_OV2640 is not set
> +# CONFIG_SOC_CAMERA_OV5642 is not set
> +# CONFIG_SOC_CAMERA_OV6650 is not set
> +# CONFIG_SOC_CAMERA_OV772X is not set
> +# CONFIG_SOC_CAMERA_OV9640 is not set
> +# CONFIG_SOC_CAMERA_OV9740 is not set
> +# CONFIG_VIDEO_SH_MOBILE_CSI2 is not set
> +# CONFIG_VIDEO_SH_MOBILE_CEU is not set
> +CONFIG_VIDEO_QL_CAMIF=y
>  CONFIG_V4L_USB_DRIVERS=y
>  CONFIG_USB_VIDEO_CLASS=m
>  CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
> @@ -2425,19 +2445,11 @@ CONFIG_DISPLAY_SUPPORT=y
>  #
>  CONFIG_DUMMY_CONSOLE=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
> -# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
> +CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
>  CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
> -CONFIG_FONTS=y
> +# CONFIG_FONTS is not set
>  CONFIG_FONT_8x8=y
>  CONFIG_FONT_8x16=y
> -# CONFIG_FONT_6x11 is not set
> -# CONFIG_FONT_7x14 is not set
> -# CONFIG_FONT_PEARL_8x8 is not set
> -# CONFIG_FONT_ACORN_8x8 is not set
> -# CONFIG_FONT_MINI_4x6 is not set
> -# CONFIG_FONT_SUN8x16 is not set
> -# CONFIG_FONT_SUN12x22 is not set
> -# CONFIG_FONT_10x18 is not set
>  CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_MONO is not set
>  # CONFIG_LOGO_LINUX_VGA16 is not set
> @@ -2570,6 +2582,7 @@ CONFIG_USB_DEVICEFS=y
>  CONFIG_USB_DEVICE_CLASS=y
>  # CONFIG_USB_DYNAMIC_MINORS is not set
>  CONFIG_USB_SUSPEND=y
> +# CONFIG_USB_OTG is not set
>  # CONFIG_USB_OTG_WHITELIST is not set
>  # CONFIG_USB_OTG_BLACKLIST_HUB is not set
>  # CONFIG_USB_DWC3 is not set
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> index ab42c44..95175cb 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> @@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.21", d)}"
>  
>  BRANCH = "v3.2-staging"
>  SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
> -MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
> +MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
>  
>  COMPATIBLE_MACHINE = "(ti33x)"
>  
> @@ -1537,4 +1537,5 @@ PATCHES_OVER_PSP = " \
>  	file://beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch \
>  	file://beaglebone/0071-beaglebone-fix-LCD3-led-key-overlap.patch \
>  	file://beaglebone/0072-beaglebone-fix-audio-spi-clash.patch \
> +	file://beaglebone/0073-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch \

This patch is missing ^^^

But I see you pushed it later as part of another fix... I guess neither of us 
have time right now to correct this properly.

-- 
Denys


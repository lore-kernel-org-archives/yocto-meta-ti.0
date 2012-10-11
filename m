Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E11DE0027E
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 01:08:11 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so2144810vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 01:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4MLEBO4k0CAnx2n1OLGUOKb/Z1GKFSdDI7uz1Ki4Ngs=;
	b=avYiOPtHmmKS9cz3Ipe6KFqm4gh5RahKM/7+vCngY1KOh4Aiv5PUhflOLWwb50EWNn
	SVcxFCrTlCzkCnecizorBPEk2j1FPstgqJyNo0Mnh5g6vMDOSyuDcqsQ7fweRO8JHVZt
	Mte57HrBFCnQa9QCVO1NBc9DPulJ3C9+97i+dRQ9TW+NKLFVIFyvG2uiDMM02SzRgQLo
	vBW8uOWi2V6KdS9LyZmeRPbMXuHQBIkCeGiaRJiEFtFjD24XutOx5d4eGNH9oWstaj2R
	jKPcSx0Hz95rHCMAdD4PdmplVlcymb/VTpLOm0S8eqqptluREyzN6enIdZGT+AbOX0LJ
	nIqA==
Received: by 10.52.173.34 with SMTP id bh2mr22943vdc.73.1349942890186; Thu, 11
	Oct 2012 01:08:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Thu, 11 Oct 2012 01:07:47 -0700 (PDT)
In-Reply-To: <1349912433-21880-2-git-send-email-ebutera@users.berlios.de>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-2-git-send-email-ebutera@users.berlios.de>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 11 Oct 2012 10:07:47 +0200
Message-ID: <CAOT3mi+4RSMhPhXP5KwuzE1C9eGorJXp=N=NnsxahxbWeS7Cvg@mail.gmail.com>
To: Enrico Butera <ebutera@users.berlios.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/6] libdrm: enable omap experimental api support
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
X-List-Received-Date: Thu, 11 Oct 2012 08:08:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

thanks for sending... i have the very same recipe in my local tree ,
so it's all good timing!


On Thu, Oct 11, 2012 at 1:40 AM, Enrico Butera <ebutera@users.berlios.de> wrote:
> This is needed to build gst-plugin-ducati.
>
> Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
> ---
>  recipes-graphics/drm/libdrm_2.4.39.bbappend |    3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 recipes-graphics/drm/libdrm_2.4.39.bbappend
>
> diff --git a/recipes-graphics/drm/libdrm_2.4.39.bbappend b/recipes-graphics/drm/libdrm_2.4.39.bbappend
> new file mode 100644
> index 0000000..5842556
> --- /dev/null
> +++ b/recipes-graphics/drm/libdrm_2.4.39.bbappend
> @@ -0,0 +1,3 @@
> +COMPATIBLE_MACHINE = "pandaboard"

i am not familiar too much with all the features of bitbake... but it
seems that 'omap4' should be better for the compatibility. our current
position is to request all OMAP4 boards/customers to use libdrm with
OMAP experiemental support, that the only config we (TI) actually
support.

at some point, I would be interested to see libdrm-omap +
xf-video-omap being used on omap3 too.. but that's outside the scope
of *this* patch!

and if you want to be proactive, you can add "omap4,omap5", as that's
what we support on omap5 too.

having 'omap4' means that anyone that is making an omap4 board/machine
will benefit from your recipe.

> +
> +EXTRA_OECONF += "--enable-omap-experimental-api"
> --
> 1.7.9.5
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 200E0E0027E
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 01:24:13 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so2158519vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 01:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2TNOPJdDXC4FCMz0nanMStLfjndSbKsMR85ql9Ifces=;
	b=kWW+qrk9gkMUE4vKB7jBnAZcUxP6IsoGs8t6SOeYCRsOJUDvck3MSv2pGVIKjKhGBU
	4fdsXEXhYWwkqeQiUj2P799xSnH9jYmAYMOmY82gGiImz3fRwSUtgRS1ul7KQNP8QTVX
	K7FOvYoL5liQoTJUnfMZzB1VquUYwXdyWj1I/0QUpX0+J1uFtl6nHosSErvVgPZTjwUa
	v+LYsctQqj/55JMM4MfAD4b4C5f8UnsRSXvjsr4L4SoyW8BDYVMFMCONYk78zUqqRrs/
	Kkz93eekMVgT8FdVQLqdDCteVGAOla4K6+dgs/ZoKaLpFSUG2qZfEIhk4oo6Uau5SphQ
	Soag==
Received: by 10.52.173.34 with SMTP id bh2mr38730vdc.73.1349943852641; Thu, 11
	Oct 2012 01:24:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Thu, 11 Oct 2012 01:23:52 -0700 (PDT)
In-Reply-To: <1349912433-21880-6-git-send-email-ebutera@users.berlios.de>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-6-git-send-email-ebutera@users.berlios.de>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 11 Oct 2012 10:23:52 +0200
Message-ID: <CAOT3miLcmE603hHDu=Muky0cT1pxhqh0daDw-MufQTuGE+24tA@mail.gmail.com>
To: Enrico Butera <ebutera@users.berlios.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 6/6] gst-plugin-ducati: add latest git version
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
X-List-Received-Date: Thu, 11 Oct 2012 08:24:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 1:40 AM, Enrico Butera <ebutera@users.berlios.de> wrote:
> Tested h264 and mpeg4 1080p encoding on pandaboard ES.
>
> Note: the bootloader must be configured WITHOUT memory holes
> (mem=... mem=...), just use all 1GB.

yeah ;-) better late than never...

>
> Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
> ---
>  .../gstreamer/gst-plugin-ducati_git.bb             |   30 ++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb
>
> diff --git a/recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb b/recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb
> new file mode 100644
> index 0000000..93ea08c
> --- /dev/null
> +++ b/recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "GStreamer plugins for omap4 using libdce"
> +HOMEPAGE = "http://gitorious.org/gstreamer-omap/gst-ducati"
> +SECTION = "multimedia"
> +LICENSE = "TI"
> +
> +COMPATIBLE_MACHINE = "pandaboard"

s/pandaboard/omap4/

> +
> +require recipes-multimedia/gstreamer/gst-plugins.inc
> +
> +PR = "r1"
> +PV = "gitr${SRCPV}"
> +
> +# 2012/09/25: ducatividenc: log extended error info, and use the correct one from _process
> +SRCREV = "9f29c17f8dcbd8cf59c8ad3b00d87534b6fc4579"
> +
> +SRC_URI = "git://gitorious.org/gstreamer-omap/gst-ducati.git;protocol=git"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "gstreamer gst-plugins-base gst-plugins-bad libdrm libdce"
> +RDEPENDS = "gstreamer gst-plugins-base gst-plugins-bad libdrm libdce"

here, too, i expect RDEPENDS to rely on shdeplibs.

> +
> +inherit autotools gettext pkgconfig
> +
> +do_configure_prepend() {
> +       git submodule init && git submodule update
> +       autopoint
> +}
> --
> 1.7.9.5
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


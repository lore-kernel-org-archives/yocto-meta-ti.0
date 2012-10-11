Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11656E0027E
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 01:22:31 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so2157128vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=i8WT3QpLb5gQ1BI1MCrOSsffSOKdxVK1y0gM1ADCLa0=;
	b=Qxzxsc/sq9FcjrnlRgspJuOpaAH8jIDO/k1iI+aV4R1VhHP5bhZxpE90HNEk24NHlg
	xVfiCjN6RGYtAphcULctIfHjSX7UDm+nZaTwGcY+avMbX1cdS+2jLpJ4IZTwyszWZ5yj
	1E/sDbzCMrX8SEbCqdBQ+ajdNVh/zmCdrIKWJykD0XcNha7WTkAySvaDY4/tBUNZA/47
	eYj8gpEmn4jnDALvg4VVcLm8ke8daksTYOxz2sSalA1eRf7jCON4quMUBAF7xAc0+Miu
	IQAfc7YIEIwGzcrkvoalE5uO4ZZHGzugYjN7tdWIHEIWQeYNSNbV3rq24v3bVgby15Ru
	Uzbg==
Received: by 10.220.119.196 with SMTP id a4mr67064vcr.19.1349943751468; Thu,
	11 Oct 2012 01:22:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Thu, 11 Oct 2012 01:22:11 -0700 (PDT)
In-Reply-To: <1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 11 Oct 2012 10:22:11 +0200
Message-ID: <CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
To: Enrico Butera <ebutera@users.berlios.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 5/6] gstreamer: bbappend to use TI-patched versions needed for gst-plugin-ducati
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
X-List-Received-Date: Thu, 11 Oct 2012 08:22:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 1:40 AM, Enrico Butera <ebutera@users.berlios.de> wrote:
> Note: pvrvideosink is disabled because it needs pvr driver.
>
> Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
> ---
>  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   17 +++++++++++++++++
>  .../gstreamer/gst-plugins-base_0.10.36.bbappend    |   16 ++++++++++++++++
>  .../gstreamer/gstreamer_0.10.36.bbappend           |   13 +++++++++++++
>  3 files changed, 46 insertions(+)
>  create mode 100644 recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
>  create mode 100644 recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
>  create mode 100644 recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
>
> diff --git a/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> new file mode 100644
> index 0000000..06f62f9
> --- /dev/null
> +++ b/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> @@ -0,0 +1,17 @@
> +
> +COMPATIBLE_MACHINE = "pandaboard"

s/pandaboard/omap4/

> +
> +# 2012/09/26: pvrvideosink: Limit size to 1080p as it is a hardware limitation
> +SRCREV = "3eb68bf5bcd79d490e35d29f262a0a9d84da36ff"
> +
> +SRC_URI = "git://gitorious.org/gstreamer-omap/gst-plugins-bad.git;protocol=git;branch=v0.10.23+ti"
> +

i would expect that it might be cleaner to archive the patch series,
than changing the SCR_URI... that's just my guess.

> +S = "${WORKDIR}/git"
> +
> +# TODO: add pvr drivers to enable the pvr plugin
> +EXTRA_OECONF += " --disable-pvr"
> +
> +do_configure_prepend() {
> +       git submodule init && git submodule update
> +       autopoint
> +}
> diff --git a/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend b/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
> new file mode 100644
> index 0000000..f8b5742
> --- /dev/null
> +++ b/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
> @@ -0,0 +1,16 @@
> +
> +COMPATIBLE_MACHINE = "pandaboard"
> +
> +# 2012/09/20: typefind: give less weight to H.263 streams when few blocks are found
> +SRCREV = "fad32193a79b394c8e7e630b0aa739462a424fa4"
> +
> +SRC_URI = "git://gitorious.org/gstreamer-omap/gst-plugins-base.git;protocol=git;branch=v0.10.36+ti \
> +           file://gst-plugins-base-tremor.patch \
> +           file://configure.ac-fix-subparse-plugin.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure_prepend() {
> +       git submodule init && git submodule update
> +       autopoint
> +}
> diff --git a/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend b/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
> new file mode 100644
> index 0000000..aba1664
> --- /dev/null
> +++ b/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
> @@ -0,0 +1,13 @@
> +
> +COMPATIBLE_MACHINE = "pandaboard"
> +
> +SRCREV = "2096b1022ad513f90639aa7a04445a2da8bc5363"
> +
> +SRC_URI = "git://gitorious.org/gstreamer-omap/gstreamer.git;protocol=git;branch=v0.10.36+ti"
> +
> +S = "${WORKDIR}/git"
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


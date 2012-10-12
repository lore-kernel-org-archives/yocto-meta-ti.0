Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56572E0027E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 13:39:34 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so4714570vcb.35
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 13:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cYHCT6i4BQmDqNvhrM+uGYRgRScHI1aD7pZV1PhHN7E=;
	b=ny4Bqv3kcI05BHT5rOi53pEczIbESqsch3ktgaaDs8Ierd0lZm1UrIxVzkD1ZBGZFA
	LnKt3xMNOYASX1WQ31KJRce9hx3CBGxwV6o0qkveSMixpZ0DEwXvM84mZhssYsQPX5Qf
	3m1Ad5rzxUMT8OOhw+ohc8b9lfMN2oouaRmzd4OJaqb1tvJTY/ilO4wTEZQKx7DUQqrU
	VafU0h1xFSnTJ9wXdkOMG3Wi2H3lVbLtOQOc+l2YqjzXZ5c08U6aPpcD5CsX9p+5ssFq
	mx1RjLNX5iVMk79K0lg48NGpegtvHH3kF455ZkKf+AWudheVt6VFHJsi3qghFFTMC/op
	RcBg==
Received: by 10.52.173.34 with SMTP id bh2mr2561480vdc.73.1350074373578; Fri,
	12 Oct 2012 13:39:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Fri, 12 Oct 2012 13:39:13 -0700 (PDT)
In-Reply-To: <1350069972-21318-2-git-send-email-ebutera@users.berlios.de>
References: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
	<1350069972-21318-2-git-send-email-ebutera@users.berlios.de>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Fri, 12 Oct 2012 22:39:13 +0200
Message-ID: <CAOT3miLJbHQptJs8qnSSydrDd=PctG11jFLVKxCYqbh-LcED=A@mail.gmail.com>
To: Enrico Butera <ebutera@users.berlios.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 2/6] libdrm: enable omap experimental api support
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
X-List-Received-Date: Fri, 12 Oct 2012 20:39:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 12, 2012 at 9:26 PM, Enrico Butera <ebutera@users.berlios.de> wrote:
> This is needed to build gst-plugin-ducati.
>
> Signed-off-by: Enrico Butera <ebutera@users.berlios.de>

Acked-by: Nicolas Dechesne <n-dechesne@ti.com>

> ---
>  recipes-graphics/drm/libdrm_2.4.39.bbappend |    3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 recipes-graphics/drm/libdrm_2.4.39.bbappend
>
> diff --git a/recipes-graphics/drm/libdrm_2.4.39.bbappend b/recipes-graphics/drm/libdrm_2.4.39.bbappend
> new file mode 100644
> index 0000000..d0c1a77
> --- /dev/null
> +++ b/recipes-graphics/drm/libdrm_2.4.39.bbappend
> @@ -0,0 +1,3 @@
> +COMPATIBLE_MACHINE = "omap4|omap5"
> +
> +EXTRA_OECONF += "--enable-omap-experimental-api"
> --
> 1.7.9.5
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


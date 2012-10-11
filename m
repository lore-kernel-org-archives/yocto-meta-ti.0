Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2C88E0027E
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 01:17:57 -0700 (PDT)
Received: by mail-vb0-f48.google.com with SMTP id e21so1711588vbm.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=upgPHyC/XhLPRb7+I9bl2UrvKTJYCTd3obLagrd/ls4=;
	b=ZRATzTWF4aJUsrMcqau5EqmahkRJALMp3zGvrrNF9bMMNmzIsKwxl0YicBe+k9c2wo
	pewEdJWm4JOYVE+SGlnfrlByu1cAexe+CB9yFMiPn779r/cfhnswr7a9g68LlgrYQyJ6
	fqalDbXXCcwOtcJW19kZFzeEqCzYHx6cvZPgwZdgL+FeD5jv2DRYO1sIGZcZtx9EtIyI
	l3ZPhX4sS0DpqgbcZQ+pAfDgJVvWGp7mcqjbLrGaI1cknuVbfNVZd1zGRcC7i2aOoYOG
	rvhJl1fdypJLIqtCyl9XBHIHSWh8JwV1aHXAYmkuAM4XgRQRjPIpO8NQ5qwXORz8kABg
	Iq4Q==
Received: by 10.52.100.5 with SMTP id eu5mr50305vdb.34.1349943458849; Thu, 11
	Oct 2012 01:17:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Thu, 11 Oct 2012 01:17:18 -0700 (PDT)
In-Reply-To: <1349912433-21880-4-git-send-email-ebutera@users.berlios.de>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-4-git-send-email-ebutera@users.berlios.de>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 11 Oct 2012 10:17:18 +0200
Message-ID: <CAOT3miJo3tMK8nAc0x3o=cFBOuoMrUjvSYR61LbH9oGDsa2fvg@mail.gmail.com>
To: Enrico Butera <ebutera@users.berlios.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 4/6] libdce: add version 1.6.5.3
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
X-List-Received-Date: Thu, 11 Oct 2012 08:17:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 1:40 AM, Enrico Butera <ebutera@users.berlios.de> wrote:
> Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
> ---
>  recipes-ti/dce/libdce.inc        |   14 ++++++++++++++
>  recipes-ti/dce/libdce_1.6.5.3.bb |   12 ++++++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 recipes-ti/dce/libdce.inc
>  create mode 100644 recipes-ti/dce/libdce_1.6.5.3.bb
>
> diff --git a/recipes-ti/dce/libdce.inc b/recipes-ti/dce/libdce.inc
> new file mode 100644
> index 0000000..1caa337
> --- /dev/null
> +++ b/recipes-ti/dce/libdce.inc
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "TI Ducati IVA-HD hardware codec acceleration API"
> +HOMEPAGE = "http://gitorious.org/ubuntu-omap/dce"

our real 'upstream' tree for libdce is here:
http://gitorious.org/gstreamer-omap/libdce/

the one you are using is our 'ubuntu package' tree where the
'upstream' is merged along with debian/ubuntu meta data (./debian
folder).

sometimes we maintain some patches in ubuntu tree in debian/patches,
but for libdce since we are also the real upstream, we tend to push
all patches in upstream.

so you should use the upstream tree instead, branch master. in fact
the 'upstream' branch in the tree you use is the same as the 'master'
branch of the upstream tree ;-)

libdce tree contains both the linux side lib, and the ducati side DCE
code for now (which can't be rebuild completely for now, as we aren't
releasing all the bits/pieces for ducati side).

we have been discussing about spliting this tree into 2 for better
clarity, so that might happen at some point..


> +SECTION = "multimedia"
> +LICENSE = "TI"
> +
> +COMPATIBLE_MACHINE = "pandaboard"

s/pandaboard/omap4/ as on the other patch.

> +
> +require ../includes/ti-paths.inc
> +require ../includes/ti-staging.inc

what is this for?

> +
> +inherit autotools
> +
> +DEPENDS = "libdrm"
> +RDEPENDS = "libdrm ti-firmware-ipu-dce"

i would hope that libdrm is not needed in RDEPENDS, as it should be
handled automagically by shlibdeps.

> diff --git a/recipes-ti/dce/libdce_1.6.5.3.bb b/recipes-ti/dce/libdce_1.6.5.3.bb
> new file mode 100644
> index 0000000..ab721ca
> --- /dev/null
> +++ b/recipes-ti/dce/libdce_1.6.5.3.bb
> @@ -0,0 +1,12 @@
> +require libdce.inc
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=483f94bdaf5d31cd94aa2317f9ad2684"
> +
> +PV = "1.6.5.3+gitr${SRCPV}"
> +
> +# 2012/09/19: Merge remote-tracking branch 'remotes/ti/master' into upstream
> +SRCREV = "c0cf50d4dece4b8d3606f7a1e065958941b4a672"
> +
> +SRC_URI = "git://gitorious.org/ubuntu-omap/dce.git;protocol=git"

please use the upstream tree.

> +
> +S = "${WORKDIR}/git"
> --
> 1.7.9.5
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


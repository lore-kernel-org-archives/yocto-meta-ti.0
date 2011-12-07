Return-Path: <tom.rini@gmail.com>
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 621EBE0030C
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Dec 2011 07:38:22 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qcsf13 with SMTP id f13so525166qcs.26
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Dec 2011 07:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=A+VPEXoLaABzIoo/j09b5B5MlNpng0gtZdvYAfRTvys=;
	b=NK9XOiuHWOwM7IvhwJ6ZW3B3x3mQL4+nmij9GC4fsDP/QzWe54IsdaOCx2mdfdc5jx
	hyTuuTChix0ohZ2/yX02DuavVmIn1GGNVY506uczKckuGTk9PYxuhFYYxcDkEmctAMXn
	zFNLuxSuOuWIy8pUw1BSQXIDoaTRgzvD5qfyI=
MIME-Version: 1.0
Received: by 10.229.46.4 with SMTP id h4mr4227858qcf.188.1323272301540; Wed,
	07 Dec 2011 07:38:21 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Wed, 7 Dec 2011 07:38:21 -0800 (PST)
In-Reply-To: <1323268934-11949-1-git-send-email-koen@dominion.thruhere.net>
References: <1323268934-11949-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 7 Dec 2011 08:38:21 -0700
Message-ID: <CA+M6bXkeKBdeEjdQ8K6pEv0SNp_QdT+gemvBkujY7TRbFCFAvQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] u-boot 2011.09: add pandaboard support
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
X-List-Received-Date: Wed, 07 Dec 2011 15:38:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 7, 2011 at 7:42 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> =A0recipes-bsp/u-boot/u-boot_2011.09.bb | =A0 =A09 ++++++---
> =A01 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-bsp/u-boot/u-=
boot_2011.09.bb
> index 74c8518..955bd5e 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.09.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.09.bb
> @@ -8,9 +8,9 @@ UBOOT_IMAGE =3D "u-boot-${MACHINE}-${PV}-${PR}.img"
> =A0UBOOT_SYMLINK =3D "u-boot-${MACHINE}.img"
>
> =A0# No patches for other machines yet
> -COMPATIBLE_MACHINE =3D "(beagleboard)"
> +COMPATIBLE_MACHINE =3D "(beagleboard|omap4430-panda)"
>
> -SRC_URI =3D "git://www.denx.de/git/u-boot.git;protocol=3Dgit \
> +SRC_URI_pn-${PN}_beagleboard =3D "git://www.denx.de/git/u-boot.git;proto=
col=3Dgit \
> =A0 =A0 =A0 =A0 =A0 =A0file://2011.09/0001-omap3-mem-Comment-enable_gpmc_=
cs_config-more.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://2011.09/0002-OMAP3-Update-SDRC-dram_init-to=
-always-call-make_cs1_.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://2011.09/0003-OMAP3-Add-a-helper-function-to=
-set-timings-in-SDRC.patch \
> @@ -35,7 +35,10 @@ SRC_URI =3D "git://www.denx.de/git/u-boot.git;protocol=
=3Dgit \
> =A0 =A0 =A0 =A0 =A0 =A0file://fw_env.config \
> =A0 =A0 =A0 =A0 =A0 "
>
> -SRCREV =3D "fdbe8b9a2d1858ba35dd6214315563ad44d4a0e3"
> +SRCREV_pn-${PN}_beagleboard =3D "fdbe8b9a2d1858ba35dd6214315563ad44d4a0e=
3"
> +
> +SRC_URI_pn-${PN}_omap4430-panda =3D "git://git.linaro.org/boot/u-boot-li=
naro-stable.git"
> +SRCREV_pn-${PN}_omap4430-panda =3D "3d343a62b8240100d6ce76b9126ff1e97be1=
eb5f"
>
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a56=
51ecb"

On the beagle rev, what doesn't work for pandaboard?  And/or, what
doesn't work on pandaboard on u-boot git mainline?  2011.12 is near
and that will have the Beagle SPL patches and I'd like to say it's
safe for pandas too.

--=20
Tom


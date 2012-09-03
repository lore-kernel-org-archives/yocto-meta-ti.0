Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56E5EE013A6
	for <meta-ti@yoctoproject.org>; Mon,  3 Sep 2012 02:55:55 -0700 (PDT)
Received: by wgx1 with SMTP id 1so3068567wgx.11
	for <meta-ti@yoctoproject.org>; Mon, 03 Sep 2012 02:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=nZyoUGu7cYHmbxW9DWFUD6klumNM7m+AlXdQLpGr1K8=;
	b=Da28RQO7/brx9J+vXNXU+2p4HMeLwb6FVLHe3+RWllZq4T9eD+RVf2rwXf21336MWj
	tKmYa/MW2tvYZVpz8Qt0SCqFY6tgS7EKRId+x8QvZNUhCiPZiVVeJhdxZUvXSfpDsFnE
	KS6rOXe7VbtT+TfPczrJtH3Zo4KwO4RuqaCZbFbQILG3tmVrlOhVggBV1Gmx1DIwdXen
	bTk4dKW9VrFlb3nXTHbhpL+9u/VdRFoOXKmZPvQrXu0dRCH2sc6cnrZYf9CYWxCyxNqN
	HFfCp2UoPn+3rZJgGkx4pEIyKysY+FuZ9FMGX0CXQyg9M5MMhuun8QvK3n/VcLDdcnlo
	xoWg==
Received: by 10.216.133.200 with SMTP id q50mr8478539wei.166.1346666154158;
	Mon, 03 Sep 2012 02:55:54 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id o2sm26904870wiz.11.2012.09.03.02.55.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 02:55:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346665309-10837-1-git-send-email-fcooper27jr@gmail.com>
Date: Mon, 3 Sep 2012 11:55:50 +0200
Message-Id: <C65364BD-A83A-4A63-AEC3-3DAC96A979B3@dominion.thruhere.net>
References: <1346665309-10837-1-git-send-email-fcooper27jr@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQl+3CVIbmTCBoASa8NpVMWuW6T+CpW8Ns3evP/UaL2BTi8x96yq41nYvg/xeCBTWVptDBqU
Subject: Re: [PATCH] libgles-omap3: Add new 4.06.00.02 version.
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
X-List-Received-Date: Mon, 03 Sep 2012 09:55:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 sep. 2012, om 11:41 heeft Franklin S. Cooper Jr =
<fcooperjr27@gmail.com> het volgende geschreven:

> * Add a new version of the Graphics SDK. There are a few changes in =
the
>  Graphics SDK that need to be investigated to determine if it impacts
>  someone who is trying to use X11. This recipe should work fine
>  for non X11 users. Therefore, the DEFAULT_PREFERENCE will be -1 until
>  it is clear that X11 users arent negatively impacted and any needed
>  changes in libgles-omap3.inc are made.

What's the timeframe for such tests?

>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> ---
> .../libgles/libgles-omap3_4.06.00.02.bb            |   32 =
++++++++++++++++++++
> 1 files changed, 32 insertions(+), 0 deletions(-)
> create mode 100644 =
recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb
>=20
> diff --git a/recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb =
b/recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb
> new file mode 100644
> index 0000000..6c450a3
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb
> @@ -0,0 +1,32 @@
> +require libgles-omap3.inc
> +
> +# Xsgx and the OpenGL *X11WS* non longer exist. Graphcis team stated =
that X11WS is deprecated and DRIWSEGL should be used instead.
> +# Setting the DEFAULT_PREFERENCE to -1 until it is determined if this =
change affects X11 base distros.
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
> +BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
> +BINLOCATION_ti814x =3D "${S}/gfx_rel_es6.x"
> +BINLOCATION_ti33x =3D "${S}/gfx_rel_es8.x"
> +
> +PLATFORM =3D "LinuxARMV7"
> +
> +# download required binary distribution from:
> +# =
http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/=
latest/index_FDS.html
> +# see libgles-omap3.inc for detailed installation instructions
> +
> +SGXPV =3D "4_06_00_02"
> +IMGPV =3D "1.7.867897"
> +BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
> +TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
> +SRC_URI =3D =
"http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk=
/latest//exports/${BINFILE} \
> +		   file://cputype \
> +		   file://rc.pvr \
> +		   file://sample.desktop \
> +		   file://99-bufferclass.rules  \

You're mixing tabs and spaces, the preferred format is spaces only.=


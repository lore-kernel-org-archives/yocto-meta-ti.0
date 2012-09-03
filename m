Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 570B7E013A6
	for <meta-ti@yoctoproject.org>; Mon,  3 Sep 2012 03:13:27 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q83ADCUY026728;
	Mon, 3 Sep 2012 05:13:12 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q83ADCDl022211;
	Mon, 3 Sep 2012 05:13:12 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 3 Sep 2012 05:13:12 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] libgles-omap3: Add new 4.06.00.02 version.
Thread-Index: AQHNibYfzJBNf4dGrEu8S+UEYAw/SJd4tP0A//+sdEA=
Date: Mon, 3 Sep 2012 10:13:11 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B3E93@DFLE09.ent.ti.com>
References: <1346665309-10837-1-git-send-email-fcooper27jr@gmail.com>
	<C65364BD-A83A-4A63-AEC3-3DAC96A979B3@dominion.thruhere.net>
In-Reply-To: <C65364BD-A83A-4A63-AEC3-3DAC96A979B3@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 03 Sep 2012 10:13:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Koen Kooi
Sent: Monday, September 03, 2012 4:56 AM
To: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] libgles-omap3: Add new 4.06.00.02 version.


Op 3 sep. 2012, om 11:41 heeft Franklin S. Cooper Jr <fcooperjr27@gmail.com=
> het volgende geschreven:

> * Add a new version of the Graphics SDK. There are a few changes in=20
> the  Graphics SDK that need to be investigated to determine if it=20
> impacts  someone who is trying to use X11. This recipe should work=20
> fine  for non X11 users. Therefore, the DEFAULT_PREFERENCE will be -1=20
> until  it is clear that X11 users arent negatively impacted and any=20
> needed  changes in libgles-omap3.inc are made.

What's the timeframe for such tests?

I plan on leaving the DEFAULT_PREFERENCE at -1 until we can ensure that X11=
 issues are sorted out. I am not even sure if there really is an issue.. Al=
l I know is libpvrPVR2D_X11WSEGL OpenGLES2 was being used in the 4.05 versi=
on but no longer exists in this newer version. The only version of libpvrPV=
R2D_X11WSEGL that exist is for OpenVG. I was told by the graphics team that=
 libpvrPVR2D_X11WSEGL is deprecated and libpvrPVR2D_DRIWSEGL should be used=
 instead. Is this a non issue?

>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> ---
> .../libgles/libgles-omap3_4.06.00.02.bb            |   32 +++++++++++++++=
+++++
> 1 files changed, 32 insertions(+), 0 deletions(-) create mode 100644=20
> recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb
>=20
> diff --git a/recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb=20
> b/recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb
> new file mode 100644
> index 0000000..6c450a3
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb
> @@ -0,0 +1,32 @@
> +require libgles-omap3.inc
> +
> +# Xsgx and the OpenGL *X11WS* non longer exist. Graphcis team stated tha=
t X11WS is deprecated and DRIWSEGL should be used instead.
> +# Setting the DEFAULT_PREFERENCE to -1 until it is determined if this ch=
ange affects X11 base distros.
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
> +#=20
> +http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
> +xsdk/latest/index_FDS.html # see libgles-omap3.inc for detailed=20
> +installation instructions
> +
> +SGXPV =3D "4_06_00_02"
> +IMGPV =3D "1.7.867897"
> +BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
> +TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
> +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/gfxsdk/latest//exports/${BINFILE} \
> +		   file://cputype \
> +		   file://rc.pvr \
> +		   file://sample.desktop \
> +		   file://99-bufferclass.rules  \

You're mixing tabs and spaces, the preferred format is spaces only.=20

I will fix this.
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


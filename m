Return-Path: <r-monk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 162A6E0123F
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2012 07:11:25 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1FFBNjJ006045;
	Wed, 15 Feb 2012 09:11:23 -0600
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1FFBM6R004341;
	Wed, 15 Feb 2012 09:11:22 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Wed, 15 Feb 2012 16:11:22 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: "Peter A. Bigot" <bigotp@acm.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 4/4] ti-dmai_svn: correct path within svn
	checkout
Thread-Index: AQHM4BWmCNDEn1Fs90m75nDbcc6Md5Y+J4YA
Date: Wed, 15 Feb 2012 15:11:21 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B5E7FD4@DNCE02.ent.ti.com>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
	<1328013657-2069-5-git-send-email-bigotp@acm.org>
In-Reply-To: <1328013657-2069-5-git-send-email-bigotp@acm.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.88.84]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] ti-dmai_svn: correct path within svn checkout
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
X-List-Received-Date: Wed, 15 Feb 2012 15:11:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 12:40:57, Peter A. Bigot wrote:
> Subject: [meta-ti] [PATCH 4/4] ti-dmai_svn: correct path within svn
> checkout
>
> From: "Peter A. Bigot" <bigotp@acm.org>
>
> At r642 as currently retrieved, the contents of ${S} are
> subdirectories dmai and patches, so the subsequent attempt to run
> "make clean" in ${S} fails because there is no Makefile there.  Append
> /dmai to the default ${S}, remove the now incorrect /dmai from
> LIC_FILES_CHKSUM, and correct the strippath for the patches to reflect th=
e new starting location.
>
> Signed-off-by: Peter A. Bigot <bigotp@acm.org>

Acked-by: Roger Monk <r-monk@ti.com>

> ---
>  recipes-ti/dmai/ti-dmai_svn.bb |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-
> dmai_svn.bb index 3c5595d..3ac7a81 100644
> --- a/recipes-ti/dmai/ti-dmai_svn.bb
> +++ b/recipes-ti/dmai/ti-dmai_svn.bb
> @@ -1,11 +1,14 @@
>  require ti-dmai.inc
>
> +# Need to descend one level more to find source S =3D
> +"${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dm
> +a
> i_${PV}/dmai"
> +
>  # Hack to be able to use recent kernel headers from userspace
> TARGET_CC_ARCH +=3D " -D__EXPORTED_HEADERS__"
>
>  PV =3D "2_10_00_01+svnr${SRCPV}"
>
> -LIC_FILES_CHKSUM =3D
> "file://dmai/dmai_${PV}_License.html;md5=3D3302f728a5a42f97cabc26a54d7fa
> 6
> 07"
> +LIC_FILES_CHKSUM =3D
> "file://dmai_${PV}_License.html;md5=3D3302f728a5a42f97cabc26a54d7fa607"
>
>  # This package has high dependence on kernel, use kernel PR as base
> and append a local version  PR =3D "${MACHINE_KERNEL_PR}"
> @@ -29,7 +32,7 @@ SRCREV_omapl137       =3D "482"
>  SRCREV_omapl138       =3D "570"
>  SRCREV               ?=3D "UNDEFINED_SRCREV"
>
> -SRC_URI_append =3D " file://omap3530-r642-remove-include-
> videodev.diff;striplevel=3D2 \
> -                   file://r642-fix-config-bld.diff;striplevel=3D2 \
> +SRC_URI_append =3D " file://omap3530-r642-remove-include-
> videodev.diff;striplevel=3D3 \
> +                   file://r642-fix-config-bld.diff;striplevel=3D3 \
>                   "
>
> --
> 1.7.6.4
>
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti





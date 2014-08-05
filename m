Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02479E007C1; Tue,  5 Aug 2014 07:51:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6DA3E00790
	for <meta-ti@yoctoproject.org>; Tue,  5 Aug 2014 07:51:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s75EpROp014386;
	Tue, 5 Aug 2014 09:51:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75EpQAm007965;
	Tue, 5 Aug 2014 09:51:26 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 5 Aug 2014 09:51:26 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/2] omap3-sgx-modules: update one of
	Darren's patches to match change in 3.14 API
Thread-Index: AQHPsHRb8BKYgd5IdkOqVdXjgZHBMJvCGIQA
Date: Tue, 5 Aug 2014 14:51:26 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F3044@DFLE08.ent.ti.com>
References: <1407219135-17200-1-git-send-email-denis@denix.org>
	<1407219135-17200-2-git-send-email-denis@denix.org>
In-Reply-To: <1407219135-17200-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] omap3-sgx-modules: update one of Darren's patches to match change in 3.14 API
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
X-List-Received-Date: Tue, 05 Aug 2014 14:51:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Tuesday, August 05, 2014 1:12 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 2/2] omap3-sgx-modules: update one of Darren's
> patches to match change in 3.14 API
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../0002-SGX-linux-use-platform-data-to-provide-reset-info.patch  | 8 ++=
++----
>  recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb       | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/000=
2-
> SGX-linux-use-platform-data-to-provide-reset-info.patch b/recipes-
> bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-linux-use-
> platform-data-to-provide-reset-info.patch
> index 22b73fd..5a8d1f1 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-
> linux-use-platform-data-to-provide-reset-info.patch
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-
> +++ linux-use-platform-data-to-provide-reset-info.patch
> @@ -1,7 +1,7 @@
> -From 30a695502496302f804e14eeca90568f067b2db2 Mon Sep 17 00:00:00
> 2001
> +From 7886ef77e4b48a7edd14acbcbe48f6a898251e78 Mon Sep 17 00:00:00
> 2001
>  From: Darren Etheridge <detheridge@ti.com>
>  Date: Fri, 25 Jul 2014 16:03:14 -0500
> -Subject: [PATCH 2/4] SGX: linux: use platform data to provide reset info
> +Subject: [PATCH 2/5] SGX: linux: use platform data to provide reset
> +info
>=20
>  In ti-linux-3.14.y we will not have a reset driver unlike ti-linux-3.12.=
y  so this
> commit removes the dependency on the reset driver and instead @@ -14,7
> +14,7 @@ Signed-off-by: Darren Etheridge <detheridge@ti.com>
>   1 file changed, 28 insertions(+), 6 deletions(-)
>=20
>  diff --git a/GFX_Linux_KM/services4/srvkm/env/linux/module.c
> b/GFX_Linux_KM/services4/srvkm/env/linux/module.c
> -index e03dc00..82d07f4 100644
> +index e03dc00..90e16ce 100644
>  --- a/GFX_Linux_KM/services4/srvkm/env/linux/module.c
>  +++ b/GFX_Linux_KM/services4/srvkm/env/linux/module.c
>  @@ -47,6 +47,10 @@ CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER DEALINGS IN THE SOFTWARE.
> @@ -22,7 +22,7 @@ index e03dc00..82d07f4 100644
>   #endif
>=20
>  +#ifndef CONFIG_RESET_CONTROLLER
> -+#include <linux/platform_data/gfx-sgx.h>
> ++#include <linux/platform_data/sgx-omap.h>
>  +#endif
>  +
>   #if defined(SUPPORT_DRI_DRM) && !defined(SUPPORT_DRI_DRM_PLUGIN)
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> index 0b1c06f..a1d95bf 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> @@ -10,7 +10,7 @@ IMGPV =3D "1.10.2359475"
>=20
>  inherit module
>=20
> -MACHINE_KERNEL_PR_append =3D "b"
> +MACHINE_KERNEL_PR_append =3D "c"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
>  BINFILE_HARDFP =3D "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> --
> 2.0.4
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


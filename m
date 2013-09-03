Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF46EE00715
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 08:19:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r83FJR6I009542;
	Tue, 3 Sep 2013 10:19:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83FJRU6027496;
	Tue, 3 Sep 2013 10:19:27 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 3 Sep 2013 10:19:27 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/5] ompa3-sgx-modules-x11: fix some build
	failures with latest versions
Thread-Index: AQHOpsFI48YInVEtyECnEZqckywz4pm0JGuQ
Date: Tue, 3 Sep 2013 15:19:26 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159701277@DLEE11.ent.ti.com>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
	<1378005180-30928-2-git-send-email-denis@denix.org>
In-Reply-To: <1378005180-30928-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] ompa3-sgx-modules-x11: fix some build failures with latest versions
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
X-List-Received-Date: Tue, 03 Sep 2013 15:19:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Saturday, August 31, 2013 10:13 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 2/5] ompa3-sgx-modules-x11: fix some
>build failures with latest versions
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>* Do not hardcode kernel source location and name.
>* Fix some discrepancies between GFX SDK versions as related to
>DRM.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb |
>8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-
>x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-
>x11_4.09.00.01.bb
>index d439d83..9134e61 100644
>--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-
>x11_4.09.00.01.bb
>+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-
>x11_4.09.00.01.bb
>@@ -11,7 +11,7 @@ BINFILE =3D
>"Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
>
> inherit module
>
>-MACHINE_KERNEL_PR_append =3D "a"
>+MACHINE_KERNEL_PR_append =3D "b"
> PR =3D "${MACHINE_KERNEL_PR}"
>
> DEFAULT_PREFERENCE =3D "-1"
>@@ -48,16 +48,16 @@ do_compile() {
> 	export PLAT_CC=3D"${CC}"
> 	export PLAT_CPP=3D"${CXX}"
> 	export PLAR_AR=3D"${AR}"
>-	for kernelver in ${WORKDIR}/../../linux-ti-staging/* ; do
>+	for kernelver in
>${WORKDIR}/../../${PREFERRED_PROVIDER_virtual/kernel}/* ; do
> 		cp -f $kernelver/git/drivers/gpu/drm/*.c
>${S}/services4/3rdparty/linux_drm/
> 	done
> 	if [ $(echo -e "${KERNEL_VERSION}\n3.3" | sort --version-
>sort | head -1) =3D "3.3" ] ; then
> 		cp -f ${S}/services4/3rdparty/linux_drm/Kbuild_3.3 \
>-			${S}/services4/3rdparty/linux_drm/Kbuild
>+			${S}/services4/3rdparty/linux_drm/Kbuild || true
> 	else
> 		if [ $(echo -e "${KERNEL_VERSION}\n3.2" | sort --
>version-sort | head -1) =3D "3.2" ] ; then
> 			cp -f
>${S}/services4/3rdparty/linux_drm/Kbuild_3.2 \
>-				${S}/services4/3rdparty/linux_drm/Kbuild
>+				${S}/services4/3rdparty/linux_drm/Kbuild
>|| true
> 		fi
> 	fi
> 	oe_runmake BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM}
>SUPPORT_XORG=3D${SUPPORT_XORG}
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti


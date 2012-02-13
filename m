Return-Path: <koen@dominion.thruhere.net>
Received: from mail-pz0-f43.google.com (mail-pz0-f43.google.com
	[209.85.210.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79EF3E0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:01:02 -0800 (PST)
Received: by damc16 with SMTP id c16so5318895dam.2
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:01:02 -0800 (PST)
Received: by 10.68.75.79 with SMTP id a15mr47777133pbw.62.1329156062106;
	Mon, 13 Feb 2012 10:01:02 -0800 (PST)
Received: from [10.10.0.62] ([108.60.121.129]) by mx.google.com with ESMTPS id
	li19sm41281608pbb.17.2012.02.13.10.01.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 10:01:01 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1329151888-7525-1-git-send-email-trini@ti.com>
Date: Mon, 13 Feb 2012 10:00:59 -0800
Message-Id: <BC6EC46C-3942-4228-AB0A-AE84F8149DD7@dominion.thruhere.net>
References: <1329151888-7525-1-git-send-email-trini@ti.com>
To: Tom Rini <trini@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkSbxgVptYK7/XiqVaEvl78N4u1DffprZ7odS8sjiFrDf782/S97Qjqo+VZGNPIgmqo/Jcf
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] u-boot.inc: Move fw_env.config to main package
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
X-List-Received-Date: Mon, 13 Feb 2012 18:01:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

Op 13 feb. 2012, om 08:51 heeft Tom Rini het volgende geschreven:

> Now that u-boot-fw-utils is a separate recipe (in oe-core) we do not
> want to try and build the tools here.  We also want to package the
> fw_env.config file in the main package, if it exists.
>=20
> Signed-off-by: Tom Rini <trini@ti.com>
> ---
> recipes-bsp/u-boot/u-boot.inc |    9 +--------
> 1 files changed, 1 insertions(+), 8 deletions(-)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot.inc =
b/recipes-bsp/u-boot/u-boot.inc
> index 9669ade..9303568 100644
> --- a/recipes-bsp/u-boot/u-boot.inc
> +++ b/recipes-bsp/u-boot/u-boot.inc
> @@ -28,7 +28,6 @@ do_compile () {
> 	unset CFLAGS
> 	unset CPPFLAGS
> 	oe_runmake ${UBOOT_MAKE_TARGET}
> -	oe_runmake tools env
> }
>=20
> do_install () {
> @@ -37,22 +36,16 @@ do_install () {
> 	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>=20
> 	if [ -e ${WORKDIR}/fw_env.config ] ; then
> -	    install -d ${D}${base_sbindir}
> 		install -d ${D}${sysconfdir}
> 		install -m 644 ${WORKDIR}/fw_env.config =
${D}${sysconfdir}/fw_env.config
> -#		install -m 755 ${S}/tools/env/fw_printenv =
${D}${base_sbindir}/fw_printenv
> -#		install -m 755 ${S}/tools/env/fw_printenv =
${D}${base_sbindir}/fw_setenv
> 	fi
>=20
> }
>=20
> -FILES_${PN} =3D "/boot"
> +FILES_${PN} =3D "/boot ${sysconfdir}"
> # no gnu_hash in uboot.bin, by design, so skip QA
> INSANE_SKIP_${PN} =3D True
>=20
> -PACKAGES +=3D "${PN}-fw-utils"
> -FILES_${PN}-fw-utils =3D "${sysconfdir} ${base_sbindir}"
> -
> inherit deploy
>=20
> addtask deploy before do_package after do_compile
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti



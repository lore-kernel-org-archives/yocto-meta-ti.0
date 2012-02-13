Return-Path: <koen@dominion.thruhere.net>
Received: from mail-pz0-f43.google.com (mail-pz0-f43.google.com
	[209.85.210.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8774AE0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:01:39 -0800 (PST)
Received: by damc16 with SMTP id c16so5319456dam.2
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:01:39 -0800 (PST)
Received: by 10.68.217.41 with SMTP id ov9mr50124401pbc.82.1329156099332;
	Mon, 13 Feb 2012 10:01:39 -0800 (PST)
Received: from [10.10.0.62] ([108.60.121.129]) by mx.google.com with ESMTPS id
	li19sm41281608pbb.17.2012.02.13.10.01.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 10:01:38 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1329151888-7525-2-git-send-email-trini@ti.com>
Date: Mon, 13 Feb 2012 10:01:37 -0800
Message-Id: <8EE3869C-584E-4810-8AAF-05B72B5679E5@dominion.thruhere.net>
References: <1329151888-7525-1-git-send-email-trini@ti.com>
	<1329151888-7525-2-git-send-email-trini@ti.com>
To: Tom Rini <trini@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk5nEx2L+h4MNPiQdDSA1NijIVPaaxz9iFULDcjm5T5MoVg+E8P/13hqvjsNKk+r+ALIBlz
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 2/3] u-boot 2011.12: Add fw_env.config for beagleboard
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
X-List-Received-Date: Mon, 13 Feb 2012 18:01:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 feb. 2012, om 08:51 heeft Tom Rini het volgende geschreven:

> beagleboard provides a correct fw_env.config file so add to the =
SRC_URI
> and RRECOMMENDS on u-boot-fw-utils.
>=20
> Signed-off-by: Tom Rini <trini@ti.com>
> ---
> recipes-bsp/u-boot/u-boot_2011.12.bb |    8 +++++++-
> 1 files changed, 7 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb =
b/recipes-bsp/u-boot/u-boot_2011.12.bb
> index 3610837..4024e64 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.12.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
> @@ -6,7 +6,7 @@ UBOOT_IMAGE =3D "u-boot-${MACHINE}-${PV}-${PR}.img"
> UBOOT_SYMLINK =3D "u-boot-${MACHINE}.img"
>=20
> PV =3D "2011.12"
> -PR =3D "r4"
> +PR =3D "r5"
>=20
> # No patches for other machines yet
> COMPATIBLE_MACHINE =3D =
"(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
> @@ -15,6 +15,11 @@ COMPATIBLE_MACHINE =3D =
"(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|oma
> CACHEFIX =3D =
"file://2011.12/0008-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.=
patch"
> CACHEFIX_omap4 =3D ""
>=20
> +# File is board-specific, only copy when it will be correct.
> +FWENV_beagleboard =3D "file://fw_env.config"
> +FWENV =3D ""
> +RRECOMMENDS_beagleboard =3D "u-boot-fw-utils"

RECOMMENDS_${PN}_foo and move it below do_install

> +
> SRC_URI =3D "git://www.denx.de/git/u-boot.git;protocol=3Dgit \
>            =
file://2011.12/0001-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patc=
h \
>            =
file://2011.12/0002-beagleboard-add-support-for-TCT-Beacon-board.patch \
> @@ -26,6 +31,7 @@ SRC_URI =3D =
"git://www.denx.de/git/u-boot.git;protocol=3Dgit \
>            ${CACHEFIX} \
>            =
file://2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch \
>            =
file://2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch \
> +           ${FWENV} \
>           "
>=20
>=20
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti



Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7689E013FE
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 07:09:39 -0700 (PDT)
Received: by wibhm4 with SMTP id hm4so476407wib.11
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 07:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=2pVMqJI1LnFZsgPIHEcTBPdi1Mh7qTTJuu5ObXcJukI=;
	b=Qe9U05A3T9FW20hdUCzq9CL8rvw4Kg42G1HSwLT2avy+9O454Nb550QtbRIHOcPH+B
	G81VPL8xGHD9YtyiyQRKuyBrAHB6erOg5T0urMYrCPrsS6OPLeODHqZrIo5wdUS+gvEw
	6Gheq7TFg587NL43HANPuuLw1f8uo7U3g8YO4qyUm9In1gSzqlq2ONC+QUagQD/LlMoG
	IRMkbqmJHnJDvAG9Cjo4lM6PT6PiM7SUAeOXVvc7Qkh3++5z6028OXUFA7lC2+cGQtOZ
	SHdzHDt5x4X/KcQomlut/QNASRYFY+qJ85Hqlf62NQoD61mMk95KybVZvF0zjDnbxCer
	4LoA==
Received: by 10.180.24.193 with SMTP id w1mr9647910wif.5.1336658978946;
	Thu, 10 May 2012 07:09:38 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h8sm5525962wix.4.2012.05.10.07.09.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 07:09:37 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4C82F39BABFE6A429733A300DEBF52240B755661@DNCE05.ent.ti.com>
Date: Thu, 10 May 2012 16:09:36 +0200
Message-Id: <F6B9E80B-34AA-44B6-99BA-C875C3589CC1@dominion.thruhere.net>
References: <1336651467-17102-1-git-send-email-koen@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B755661@DNCE05.ent.ti.com>
To: "Monk, Roger" <r-monk@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQl3c4t5VfcI84XQvmeB1pHj0bMfkrnepP3Xhb9VpwzuH/BFaFD9ePe7MFTTdeBuhmJNR5pZ
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Dmytriyenko,
	Denys" <denys@ti.com>
Subject: Re: [PATCH] omapfbplay: import from OE classic
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
X-List-Received-Date: Thu, 10 May 2012 14:09:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 mei 2012, om 15:42 heeft Monk, Roger het volgende geschreven:

> Hi Koen,
>=20
> Think we've still got some API incompatibility here.  I needed to roll =
back to an earlier omapfbplay commit =
(34293052c5a2ae328eac6903512e6b4ce19b5639) and patch CODEC_TYPE :-
>=20
> -        if (afc->streams[i]->codec->codec_type =3D=3D =
CODEC_TYPE_VIDEO && !st)
> +        if (afc->streams[i]->codec->codec_type =3D=3D =
AVMEDIA_TYPE_VIDEO && !st)
>=20
> to get this working on beagleboard-xm, so I suspect there may have =
been an API change after Aug11, or =
d03f042ecac0a231bedeadc7a6c67f0102d5505a was rebased against 0.8 branch? =
 I guess we should ask Mans...

We still use libav 0.7.4 in meta-oe, I suspect Mans updated to 0.8.x or =
even newer. I only build tested it, so I'm open for fixes that make it =
run :) Upgrading libav might be an option as well, but I'm not sure of =
that will get accepted for the meta-oe release branch.

regards,

Koen


>=20
> ~rog
>=20
>=20
> Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. =
Registered in England & Wales under company number 00574102
>=20
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org =
[mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Koen Kooi
> Sent: 10 May 2012 13:04
> To: meta-ti@yoctoproject.org
> Cc: Dmytriyenko, Denys
> Subject: [meta-ti] [PATCH] omapfbplay: import from OE classic
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> .../files/0001-rollback-to-libav-0.7.4-API.patch   |   26 =
+++++++++++++++
> .../files/omapfbplay-errorhandling.patch           |   34 =
++++++++++++++++++++
> recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb |   16 +++++++++
> recipes-graphics/omapfbplay/omapfbplay-dce_git.bb  |    7 ++++
> recipes-graphics/omapfbplay/omapfbplay-xv_git.bb   |    3 ++
> recipes-graphics/omapfbplay/omapfbplay.inc         |   33 =
+++++++++++++++++++
> recipes-graphics/omapfbplay/omapfbplay_git.bb      |    3 ++
> 7 files changed, 122 insertions(+)
> create mode 100644 =
recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-API.patch
> create mode 100644 =
recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
> create mode 100644 recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
> create mode 100644 recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
> create mode 100644 recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
> create mode 100644 recipes-graphics/omapfbplay/omapfbplay.inc
> create mode 100644 recipes-graphics/omapfbplay/omapfbplay_git.bb
>=20
> diff --git =
a/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-API.patch=
 =
b/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-API.patch=

> new file mode 100644
> index 0000000..9095fe5
> --- /dev/null
> +++ =
b/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-API.patch=

> @@ -0,0 +1,26 @@
> +=46rom dca631cfa22b1f903c943a9e03597aa6f9ae10d4 Mon Sep 17 00:00:00 =
2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Thu, 10 May 2012 14:01:27 +0200
> +Subject: [PATCH] rollback to libav 0.7.4 API
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + omapfbplay.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/omapfbplay.c b/omapfbplay.c
> +index 6a6fc96..1e5a29c 100644
> +--- a/omapfbplay.c
> ++++ b/omapfbplay.c
> +@@ -674,7 +674,7 @@ main(int argc, char **argv)
> +     pthread_join(dispt, NULL);
> +
> + out:
> +-    if (afc) avformat_close_input(&afc);
> ++    if (afc) av_close_input_file(&afc);
> +
> +     if (codec)   codec->close();
> +     if (timer)   timer->close();
> +--
> +1.7.10
> +
> diff --git =
a/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch =
b/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
> new file mode 100644
> index 0000000..7dd544f
> --- /dev/null
> +++ b/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
> @@ -0,0 +1,34 @@
> +=46rom e321ae7df57ada9ecc8c155fa4e5511c96ef5db3 Mon Sep 17 00:00:00 =
2001
> +From: Rob Clark <rob@ti.com>
> +Date: Fri, 18 Mar 2011 12:40:51 -0500
> +Subject: [PATCH] dce: differentiate between fatal and non-fatal =
errors
> +
> +For streams with errors, the codec will throw back an error. But not
> +all errors are fatal.
> +---
> + dce.c |   10 ++++++++--
> + 1 files changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/dce.c b/dce.c
> +index ab7ad0a..88f175e 100644
> +--- a/dce.c
> ++++ b/dce.c
> +@@ -270,8 +270,14 @@ static int dce_decode(AVPacket *p)
> +
> +     err =3D VIDDEC3_process(codec, inbufs, outbufs, in_args, =
out_args);
> +     if (err) {
> +-        fprintf(stderr, "VIDDEC3_process() error %d\n", err);
> +-        return -1;
> ++        fprintf(stderr, "VIDDEC3_process() error %d %08x\n", err,
> ++                    out_args->extendedError);
> ++        /* for non-fatal errors, keep going.. a non-fatal error =
could
> ++         * just indicate an error in the input stream which the =
codec
> ++         * was able to conceal
> ++         */
> ++        if (XDM_ISFATALERROR(out_args->extendedError))
> ++            return -1;
> +     }
> +
> +     for (i =3D 0; i < out_args->outputID[i]; i++) {
> +--
> +1.7.1
> diff --git a/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb =
b/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
> new file mode 100644
> index 0000000..a0392f6
> --- /dev/null
> +++ b/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
> @@ -0,0 +1,16 @@
> +require omapfbplay.inc
> +
> +DEPENDS +=3D "ti-linuxutils"
> +
> +require recipes-ti/includes/ti-paths.inc
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +SDMA_CFLAGS =3D " =
-I${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/sdma/include/"
> +CMEM_CFLAGS =3D " =
-I${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/cmem/include/"
> +CFLAGS +=3D " -I. -I${STAGING_KERNEL_DIR}/include ${SDMA_CFLAGS} =
${CMEM_CFLAGS}"
> +
> +export SDMA_LIBS =3D =
"-L${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/sdma/lib =
-l:sdma.a470MV"
> +export CMEM_LIBS =3D =
"-L${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/cmem/lib =
-l:cmem.a470MV"
> +
> +OMAPFBPLAYOPTS =3D "V4L2=3Dy OMAPFB=3Dy NETSYNC=3Dy CMEM=3Dy SDMA=3Dy"
> diff --git a/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb =
b/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
> new file mode 100644
> index 0000000..e70ac72
> --- /dev/null
> +++ b/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
> @@ -0,0 +1,7 @@
> +require omapfbplay.inc
> +
> +DEPENDS +=3D "libdce"
> +
> +CFLAGS +=3D " -I. -I${STAGING_INCDIR}/dce =
-I${STAGING_KERNEL_DIR}/include "
> +
> +OMAPFBPLAYOPTS =3D "V4L2=3Dy OMAPFB=3Dy NETSYNC=3Dy DCE=3Dy"
> diff --git a/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb =
b/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
> new file mode 100644
> index 0000000..cadf6d8
> --- /dev/null
> +++ b/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
> @@ -0,0 +1,3 @@
> +require omapfbplay.inc
> +
> +OMAPFBPLAYOPTS =3D "V4L2=3Dy NETSYNC=3Dy XV=3Dy"
> diff --git a/recipes-graphics/omapfbplay/omapfbplay.inc =
b/recipes-graphics/omapfbplay/omapfbplay.inc
> new file mode 100644
> index 0000000..88de77b
> --- /dev/null
> +++ b/recipes-graphics/omapfbplay/omapfbplay.inc
> @@ -0,0 +1,33 @@
> +DESCRIPTION =3D "Simple libav-based player that uses the omapfb =
overlays"
> +DEPENDS =3D "bzip2 lame libav virtual/kernel"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D =
"file://omapfbplay.c;beginline=3D2;endline=3D22;md5=3D05d3789ab362e6f4a968=
2e98100ea0fa"
> +
> +PV =3D "0.0+${PR}+gitr${SRCREV}"
> +
> +SRCREV =3D "d03f042ecac0a231bedeadc7a6c67f0102d5505a"
> +SRC_URI =3D "git://git.mansr.com/omapfbplay;protocol=3Dgit \
> +           file://omapfbplay-errorhandling.patch \
> +           file://0001-rollback-to-libav-0.7.4-API.patch \
> +          "
> +
> +S =3D "${WORKDIR}/git"
> +
> +# We want a kernel header for armv7a, but we don't want to make =
mplayer machine specific for that
> +STAGING_KERNEL_DIR =3D =
"${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"
> +CFLAGS +=3D " -I. -I${STAGING_KERNEL_DIR}/include "
> +
> +OMAPFBPLAYVARIANT ?=3D "${PN}"
> +OMAPFBPLAYOPTS ?=3D "V4L2=3Dy NETSYNC=3Dy"
> +
> +do_compile() {
> +       cp =
${STAGING_KERNEL_DIR}/arch/arm/plat-omap/include/mach/omapfb.h ${S} || =
true
> +       cp ${STAGING_KERNEL_DIR}/include/asm-arm/arch-omap/omapfb.h =
${S} || true
> +       cp ${STAGING_KERNEL_DIR}/include/linux/omapfb.h ${S} || true
> +       oe_runmake ${TARGET_ARCH}=3Dy ${OMAPFBPLAYOPTS} -e
> +}
> +
> +do_install() {
> +       install -d ${D}/${bindir}
> +       install -m 0755 ${S}/omapfbplay =
${D}/${bindir}/${OMAPFBPLAYVARIANT}
> +}
> diff --git a/recipes-graphics/omapfbplay/omapfbplay_git.bb =
b/recipes-graphics/omapfbplay/omapfbplay_git.bb
> new file mode 100644
> index 0000000..0d3956f
> --- /dev/null
> +++ b/recipes-graphics/omapfbplay/omapfbplay_git.bb
> @@ -0,0 +1,3 @@
> +require omapfbplay.inc
> +
> +OMAPFBPLAYOPTS =3D "V4L2=3Dy OMAPFB=3Dy NETSYNC=3Dy"
> --
> 1.7.10
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>=20



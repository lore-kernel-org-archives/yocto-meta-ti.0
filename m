Return-Path: <r-monk@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C3EDE013FE
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 07:13:40 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4AEDdC0000911;
	Thu, 10 May 2012 09:13:39 -0500
Received: from DNCE70.ent.ti.com (dnce70.ent.ti.com [137.167.131.19])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4AEDc3p032452;
	Thu, 10 May 2012 09:13:38 -0500
Received: from DNCE05.ent.ti.com ([fe80::2868:e891:b6c7:394]) by
	DNCE70.ent.ti.com ([fe80::70c9:b447:24a2:dddc%30]) with mapi id
	14.01.0323.003; Thu, 10 May 2012 16:13:38 +0200
From: "Monk, Roger" <r-monk@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [PATCH] omapfbplay: import from OE classic
Thread-Index: AQHNLqUZfbMuoq6l6USfKciGIL58ZpbDBCMA///qGwCAACHx8A==
Date: Thu, 10 May 2012 14:13:37 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B75582C@DNCE05.ent.ti.com>
References: <1336651467-17102-1-git-send-email-koen@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B755661@DNCE05.ent.ti.com>
	<F6B9E80B-34AA-44B6-99BA-C875C3589CC1@dominion.thruhere.net>
In-Reply-To: <F6B9E80B-34AA-44B6-99BA-C875C3589CC1@dominion.thruhere.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {B9070D51-F04A-4901-AA8D-3930F9A6B272}
x-cr-hashedpuzzle: B0Jr Cr07 DQXy FSF8 HV7M H5XY IM99 IfPs JRlW JmHl PLId
	P3d7 S0bv Vgs5 Wum6 XBUg; 2;
	awBvAGUAbgBAAGQAbwBtAGkAbgBpAG8AbgAuAHQAaAByAHUAaABlAHIAZQAuAG4AZQB0ADsAbQBlAHQAYQAtAHQAaQBAAHkAbwBjAHQAbwBwAHIAbwBqAGUAYwB0AC4AbwByAGcA;
	Sosha1_v1; 7; {B9070D51-F04A-4901-AA8D-3930F9A6B272};
	cgAtAG0AbwBuAGsAQAB0AGkALgBjAG8AbQA=; Thu,
	10 May 2012 14:13:13 GMT;
	UgBFADoAIABbAG0AZQB0AGEALQB0AGkAXQAgAFsAUABBAFQAQwBIAF0AIABvAG0AYQBwAGYAYgBwAGwAYQB5ADoAIABpAG0AcABvAHIAdAAgAGYAcgBvAG0AIABPAEUAIABjAGwAYQBzAHMAaQBjAA==
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 10 May 2012 14:13:40 -0000
X-Groupsio-MsgNum: 1089
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_4C82F39BABFE6A429733A300DEBF52240B75582CDNCE05entticom_"

--_002_4C82F39BABFE6A429733A300DEBF52240B75582CDNCE05entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2012 at 15:09:36, Koen Kooi wrote:
> Subject: Re: [meta-ti] [PATCH] omapfbplay: import from OE classic
>
>
> Op 10 mei 2012, om 15:42 heeft Monk, Roger het volgende geschreven:
>
> > Hi Koen,
> >
> > Think we've still got some API incompatibility here.  I needed to
> roll
> > back to an earlier omapfbplay commit
> > (34293052c5a2ae328eac6903512e6b4ce19b5639) and patch CODEC_TYPE :-
> >
> > -        if (afc->streams[i]->codec->codec_type =3D=3D CODEC_TYPE_VIDEO
> && !st)
> > +        if (afc->streams[i]->codec->codec_type =3D=3D
> > + AVMEDIA_TYPE_VIDEO && !st)
> >
> > to get this working on beagleboard-xm, so I suspect there may have
> been an API change after Aug11, or
> d03f042ecac0a231bedeadc7a6c67f0102d5505a was rebased against 0.8
> branch?  I guess we should ask Mans...
>
> We still use libav 0.7.4 in meta-oe, I suspect Mans updated to 0.8.x
> or even newer. I only build tested it, so I'm open for fixes that make
> it run :) Upgrading libav might be an option as well, but I'm not sure
> of that will get accepted for the meta-oe release branch.
>

See attached for now - probably ok as reasonable known working baseline bef=
ore we upgrade other bits?

> regards,
>
> Koen
>
>
> >
> > ~rog
> >
> >
> > Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL.
> > Registered in England & Wales under company number 00574102
> >
> >
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

-----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org
> > [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Koen Kooi
> > Sent: 10 May 2012 13:04
> > To: meta-ti@yoctoproject.org
> > Cc: Dmytriyenko, Denys
> > Subject: [meta-ti] [PATCH] omapfbplay: import from OE classic
> >
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> > .../files/0001-rollback-to-libav-0.7.4-API.patch   |   26
> +++++++++++++++
> > .../files/omapfbplay-errorhandling.patch           |   34
> ++++++++++++++++++++
> > recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb |   16 +++++++++
> > recipes-graphics/omapfbplay/omapfbplay-dce_git.bb  |    7 ++++
> > recipes-graphics/omapfbplay/omapfbplay-xv_git.bb   |    3 ++
> > recipes-graphics/omapfbplay/omapfbplay.inc         |   33
> +++++++++++++++++++
> > recipes-graphics/omapfbplay/omapfbplay_git.bb      |    3 ++
> > 7 files changed, 122 insertions(+)
> > create mode 100644
> > recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-
> API.pat
> > ch create mode 100644
> > recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
> > create mode 100644
> > recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
> > create mode 100644 recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
> > create mode 100644 recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
> > create mode 100644 recipes-graphics/omapfbplay/omapfbplay.inc
> > create mode 100644 recipes-graphics/omapfbplay/omapfbplay_git.bb
> >
> > diff --git
> > a/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-
> API.p
> > atch
> > b/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-
> API.p
> > atch
> > new file mode 100644
> > index 0000000..9095fe5
> > --- /dev/null
> > +++ b/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4
> > +++ -
> A
> > +++ PI.patch
> > @@ -0,0 +1,26 @@
> > +From dca631cfa22b1f903c943a9e03597aa6f9ae10d4 Mon Sep 17 00:00:00
> > +2001
> > +From: Koen Kooi <koen@dominion.thruhere.net>
> > +Date: Thu, 10 May 2012 14:01:27 +0200
> > +Subject: [PATCH] rollback to libav 0.7.4 API
> > +
> > +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > +---
> > + omapfbplay.c |    2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/omapfbplay.c b/omapfbplay.c index 6a6fc96..1e5a29c
> > +100644
> > +--- a/omapfbplay.c
> > ++++ b/omapfbplay.c
> > +@@ -674,7 +674,7 @@ main(int argc, char **argv)
> > +     pthread_join(dispt, NULL);
> > +
> > + out:
> > +-    if (afc) avformat_close_input(&afc);
> > ++    if (afc) av_close_input_file(&afc);
> > +
> > +     if (codec)   codec->close();
> > +     if (timer)   timer->close();
> > +--
> > +1.7.10
> > +
> > diff --git
> > a/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
> > b/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
> > new file mode 100644
> > index 0000000..7dd544f
> > --- /dev/null
> > +++ b/recipes-graphics/omapfbplay/files/omapfbplay-
> errorhandling.patch
> > @@ -0,0 +1,34 @@
> > +From e321ae7df57ada9ecc8c155fa4e5511c96ef5db3 Mon Sep 17 00:00:00
> > +2001
> > +From: Rob Clark <rob@ti.com>
> > +Date: Fri, 18 Mar 2011 12:40:51 -0500
> > +Subject: [PATCH] dce: differentiate between fatal and non-fatal
> > +errors
> > +
> > +For streams with errors, the codec will throw back an error. But
> > +not all errors are fatal.
> > +---
> > + dce.c |   10 ++++++++--
> > + 1 files changed, 8 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/dce.c b/dce.c
> > +index ab7ad0a..88f175e 100644
> > +--- a/dce.c
> > ++++ b/dce.c
> > +@@ -270,8 +270,14 @@ static int dce_decode(AVPacket *p)
> > +
> > +     err =3D VIDDEC3_process(codec, inbufs, outbufs, in_args,
> out_args);
> > +     if (err) {
> > +-        fprintf(stderr, "VIDDEC3_process() error %d\n", err);
> > +-        return -1;
> > ++        fprintf(stderr, "VIDDEC3_process() error %d %08x\n", err,
> > ++                    out_args->extendedError);
> > ++        /* for non-fatal errors, keep going.. a non-fatal error
> could
> > ++         * just indicate an error in the input stream which the
> codec
> > ++         * was able to conceal
> > ++         */
> > ++        if (XDM_ISFATALERROR(out_args->extendedError))
> > ++            return -1;
> > +     }
> > +
> > +     for (i =3D 0; i < out_args->outputID[i]; i++) {
> > +--
> > +1.7.1
> > diff --git a/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
> > b/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
> > new file mode 100644
> > index 0000000..a0392f6
> > --- /dev/null
> > +++ b/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
> > @@ -0,0 +1,16 @@
> > +require omapfbplay.inc
> > +
> > +DEPENDS +=3D "ti-linuxutils"
> > +
> > +require recipes-ti/includes/ti-paths.inc
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +SDMA_CFLAGS =3D " -
> I${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/sdma/include/"
> > +CMEM_CFLAGS =3D " -
> I${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/cmem/include/"
> > +CFLAGS +=3D " -I. -I${STAGING_KERNEL_DIR}/include ${SDMA_CFLAGS}
> ${CMEM_CFLAGS}"
> > +
> > +export SDMA_LIBS =3D "-
> L${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/sdma/lib -
> l:sdma.a470MV"
> > +export CMEM_LIBS =3D "-
> L${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/cmem/lib -
> l:cmem.a470MV"
> > +
> > +OMAPFBPLAYOPTS =3D "V4L2=3Dy OMAPFB=3Dy NETSYNC=3Dy CMEM=3Dy SDMA=3Dy"
> > diff --git a/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
> > b/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
> > new file mode 100644
> > index 0000000..e70ac72
> > --- /dev/null
> > +++ b/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
> > @@ -0,0 +1,7 @@
> > +require omapfbplay.inc
> > +
> > +DEPENDS +=3D "libdce"
> > +
> > +CFLAGS +=3D " -I. -I${STAGING_INCDIR}/dce -
> I${STAGING_KERNEL_DIR}/include "
> > +
> > +OMAPFBPLAYOPTS =3D "V4L2=3Dy OMAPFB=3Dy NETSYNC=3Dy DCE=3Dy"
> > diff --git a/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
> > b/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
> > new file mode 100644
> > index 0000000..cadf6d8
> > --- /dev/null
> > +++ b/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
> > @@ -0,0 +1,3 @@
> > +require omapfbplay.inc
> > +
> > +OMAPFBPLAYOPTS =3D "V4L2=3Dy NETSYNC=3Dy XV=3Dy"
> > diff --git a/recipes-graphics/omapfbplay/omapfbplay.inc
> > b/recipes-graphics/omapfbplay/omapfbplay.inc
> > new file mode 100644
> > index 0000000..88de77b
> > --- /dev/null
> > +++ b/recipes-graphics/omapfbplay/omapfbplay.inc
> > @@ -0,0 +1,33 @@
> > +DESCRIPTION =3D "Simple libav-based player that uses the omapfb
> overlays"
> > +DEPENDS =3D "bzip2 lame libav virtual/kernel"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://omapfbplay.c;beginline=3D2;endline=3D22;md5=3D05d3789ab362e6f4a96=
82e
> 9
> 8100ea0fa"
> > +
> > +PV =3D "0.0+${PR}+gitr${SRCREV}"
> > +
> > +SRCREV =3D "d03f042ecac0a231bedeadc7a6c67f0102d5505a"
> > +SRC_URI =3D "git://git.mansr.com/omapfbplay;protocol=3Dgit \
> > +           file://omapfbplay-errorhandling.patch \
> > +           file://0001-rollback-to-libav-0.7.4-API.patch \
> > +          "
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +# We want a kernel header for armv7a, but we don't want to make
> > +mplayer machine specific for that STAGING_KERNEL_DIR =3D
> "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"
> > +CFLAGS +=3D " -I. -I${STAGING_KERNEL_DIR}/include "
> > +
> > +OMAPFBPLAYVARIANT ?=3D "${PN}"
> > +OMAPFBPLAYOPTS ?=3D "V4L2=3Dy NETSYNC=3Dy"
> > +
> > +do_compile() {
> > +       cp ${STAGING_KERNEL_DIR}/arch/arm/plat-
> omap/include/mach/omapfb.h ${S} || true
> > +       cp ${STAGING_KERNEL_DIR}/include/asm-arm/arch-omap/omapfb.h
> ${S} || true
> > +       cp ${STAGING_KERNEL_DIR}/include/linux/omapfb.h ${S} || true
> > +       oe_runmake ${TARGET_ARCH}=3Dy ${OMAPFBPLAYOPTS} -e }
> > +
> > +do_install() {
> > +       install -d ${D}/${bindir}
> > +       install -m 0755 ${S}/omapfbplay
> > +${D}/${bindir}/${OMAPFBPLAYVARIANT}
> > +}
> > diff --git a/recipes-graphics/omapfbplay/omapfbplay_git.bb
> > b/recipes-graphics/omapfbplay/omapfbplay_git.bb
> > new file mode 100644
> > index 0000000..0d3956f
> > --- /dev/null
> > +++ b/recipes-graphics/omapfbplay/omapfbplay_git.bb
> > @@ -0,0 +1,3 @@
> > +require omapfbplay.inc
> > +
> > +OMAPFBPLAYOPTS =3D "V4L2=3Dy OMAPFB=3Dy NETSYNC=3Dy"
> > --
> > 1.7.10
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >





--_002_4C82F39BABFE6A429733A300DEBF52240B75582CDNCE05entticom_
Content-Type: application/octet-stream;
	name="0001-omapfbplay-import-from-OE-classic-api-tweak.patch"
Content-Description: 0001-omapfbplay-import-from-OE-classic-api-tweak.patch
Content-Disposition: attachment;
	filename="0001-omapfbplay-import-from-OE-classic-api-tweak.patch"; size=7514;
	creation-date="Thu, 10 May 2012 14:12:13 GMT";
	modification-date="Thu, 10 May 2012 14:07:41 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlY2YxNDlmMjgzYWFhMGFmZDJhMzE0OWFkNzU3NzY2ODBjMmMxM2I5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBNb25rIDxyLW1vbmtAdGkuY29tPgpEYXRlOiBUaHUs
IDEwIE1heSAyMDEyIDE0OjU3OjA5ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gb21hcGZicGxheTog
aW1wb3J0IGZyb20gT0UgY2xhc3NpYyArIGFwaSB0d2VhawoKU2lnbmVkLW9mZi1ieTogUm9nZXIg
TW9uayA8ci1tb25rQHRpLmNvbT4KLS0tCiAuLi5zd2l0Y2gtQ09ERUNfVFlQRV9WSURFTy10by1B
Vk1FRElBX1RZUEVfVi5wYXRjaCB8ICAgMjYgKysrKysrKysrKysrKysrCiAuLi4vZmlsZXMvb21h
cGZicGxheS1lcnJvcmhhbmRsaW5nLnBhdGNoICAgICAgICAgICB8ICAgMzQgKysrKysrKysrKysr
KysrKysrKysKIHJlY2lwZXMtZ3JhcGhpY3Mvb21hcGZicGxheS9vbWFwZmJwbGF5LWNtZW1fZ2l0
LmJiIHwgICAxNiArKysrKysrKysKIHJlY2lwZXMtZ3JhcGhpY3Mvb21hcGZicGxheS9vbWFwZmJw
bGF5LWRjZV9naXQuYmIgIHwgICAgNyArKysrCiByZWNpcGVzLWdyYXBoaWNzL29tYXBmYnBsYXkv
b21hcGZicGxheS14dl9naXQuYmIgICB8ICAgIDMgKysKIHJlY2lwZXMtZ3JhcGhpY3Mvb21hcGZi
cGxheS9vbWFwZmJwbGF5LmluYyAgICAgICAgIHwgICAzMyArKysrKysrKysrKysrKysrKysrCiBy
ZWNpcGVzLWdyYXBoaWNzL29tYXBmYnBsYXkvb21hcGZicGxheV9naXQuYmIgICAgICB8ICAgIDMg
KysKIDcgZmlsZXMgY2hhbmdlZCwgMTIyIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcmVjaXBlcy1ncmFwaGljcy9vbWFwZmJwbGF5L2ZpbGVzLzAwMDEt
b21hcGZicGxheS1zd2l0Y2gtQ09ERUNfVFlQRV9WSURFTy10by1BVk1FRElBX1RZUEVfVi5wYXRj
aAogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtZ3JhcGhpY3Mvb21hcGZicGxheS9maWxlcy9v
bWFwZmJwbGF5LWVycm9yaGFuZGxpbmcucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVz
LWdyYXBoaWNzL29tYXBmYnBsYXkvb21hcGZicGxheS1jbWVtX2dpdC5iYgogY3JlYXRlIG1vZGUg
MTAwNjQ0IHJlY2lwZXMtZ3JhcGhpY3Mvb21hcGZicGxheS9vbWFwZmJwbGF5LWRjZV9naXQuYmIK
IGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWdyYXBoaWNzL29tYXBmYnBsYXkvb21hcGZicGxh
eS14dl9naXQuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWdyYXBoaWNzL29tYXBmYnBs
YXkvb21hcGZicGxheS5pbmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWdyYXBoaWNzL29t
YXBmYnBsYXkvb21hcGZicGxheV9naXQuYmIKCmRpZmYgLS1naXQgYS9yZWNpcGVzLWdyYXBoaWNz
L29tYXBmYnBsYXkvZmlsZXMvMDAwMS1vbWFwZmJwbGF5LXN3aXRjaC1DT0RFQ19UWVBFX1ZJREVP
LXRvLUFWTUVESUFfVFlQRV9WLnBhdGNoIGIvcmVjaXBlcy1ncmFwaGljcy9vbWFwZmJwbGF5L2Zp
bGVzLzAwMDEtb21hcGZicGxheS1zd2l0Y2gtQ09ERUNfVFlQRV9WSURFTy10by1BVk1FRElBX1RZ
UEVfVi5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5lMDFmZGRiCi0t
LSAvZGV2L251bGwKKysrIGIvcmVjaXBlcy1ncmFwaGljcy9vbWFwZmJwbGF5L2ZpbGVzLzAwMDEt
b21hcGZicGxheS1zd2l0Y2gtQ09ERUNfVFlQRV9WSURFTy10by1BVk1FRElBX1RZUEVfVi5wYXRj
aApAQCAtMCwwICsxLDI2IEBACitGcm9tIDcxNjcwZjRhMDY3ZWZjMTY5MDE4YTllYzkzMjFjY2M5
YWYzYmJkNTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSb2dlciBNb25rIDxyLW1v
bmtAdGkuY29tPgorRGF0ZTogVGh1LCAxMCBNYXkgMjAxMiAxNDo1MDoxMSArMDEwMAorU3ViamVj
dDogW1BBVENIXSBvbWFwZmJwbGF5OiAgc3dpdGNoIENPREVDX1RZUEVfVklERU8gdG8gQVZNRURJ
QV9UWVBFX1ZJREVPCisKK1NpZ25lZC1vZmYtYnk6IFJvZ2VyIE1vbmsgPHItbW9ua0B0aS5jb20+
CistLS0KKyBvbWFwZmJwbGF5LmMgfCAgICAyICstCisgMSBmaWxlcyBjaGFuZ2VkLCAxIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9vbWFwZmJwbGF5LmMgYi9v
bWFwZmJwbGF5LmMKK2luZGV4IGFkMzViZDUuLjgxOGNmMmMgMTAwNjQ0CistLS0gYS9vbWFwZmJw
bGF5LmMKKysrKyBiL29tYXBmYnBsYXkuYworQEAgLTc0LDcgKzc0LDcgQEAgZmluZF9zdHJlYW0o
QVZGb3JtYXRDb250ZXh0ICphZmMpCisgICAgIGludCBpOworIAorICAgICBmb3IgKGkgPSAwOyBp
IDwgYWZjLT5uYl9zdHJlYW1zOyBpKyspIHsKKy0gICAgICAgIGlmIChhZmMtPnN0cmVhbXNbaV0t
PmNvZGVjLT5jb2RlY190eXBlID09IENPREVDX1RZUEVfVklERU8gJiYgIXN0KQorKyAgICAgICAg
aWYgKGFmYy0+c3RyZWFtc1tpXS0+Y29kZWMtPmNvZGVjX3R5cGUgPT0gQVZNRURJQV9UWVBFX1ZJ
REVPICYmICFzdCkKKyAgICAgICAgICAgICBzdCA9IGFmYy0+c3RyZWFtc1tpXTsKKyAgICAgICAg
IGVsc2UKKyAgICAgICAgICAgICBhZmMtPnN0cmVhbXNbaV0tPmRpc2NhcmQgPSBBVkRJU0NBUkRf
QUxMOworLS0gCisxLjcuMC40CisKZGlmZiAtLWdpdCBhL3JlY2lwZXMtZ3JhcGhpY3Mvb21hcGZi
cGxheS9maWxlcy9vbWFwZmJwbGF5LWVycm9yaGFuZGxpbmcucGF0Y2ggYi9yZWNpcGVzLWdyYXBo
aWNzL29tYXBmYnBsYXkvZmlsZXMvb21hcGZicGxheS1lcnJvcmhhbmRsaW5nLnBhdGNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjdkZDU0NGYKLS0tIC9kZXYvbnVsbAorKysg
Yi9yZWNpcGVzLWdyYXBoaWNzL29tYXBmYnBsYXkvZmlsZXMvb21hcGZicGxheS1lcnJvcmhhbmRs
aW5nLnBhdGNoCkBAIC0wLDAgKzEsMzQgQEAKK0Zyb20gZTMyMWFlN2RmNTdhZGE5ZWNjOGMxNTVm
YTRlNTUxMWM5NmVmNWRiMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJvYiBDbGFy
ayA8cm9iQHRpLmNvbT4KK0RhdGU6IEZyaSwgMTggTWFyIDIwMTEgMTI6NDA6NTEgLTA1MDAKK1N1
YmplY3Q6IFtQQVRDSF0gZGNlOiBkaWZmZXJlbnRpYXRlIGJldHdlZW4gZmF0YWwgYW5kIG5vbi1m
YXRhbCBlcnJvcnMKKworRm9yIHN0cmVhbXMgd2l0aCBlcnJvcnMsIHRoZSBjb2RlYyB3aWxsIHRo
cm93IGJhY2sgYW4gZXJyb3IuIEJ1dCBub3QKK2FsbCBlcnJvcnMgYXJlIGZhdGFsLgorLS0tCisg
ZGNlLmMgfCAgIDEwICsrKysrKysrLS0KKyAxIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL2RjZS5jIGIvZGNlLmMKK2luZGV4IGFi
N2FkMGEuLjg4ZjE3NWUgMTAwNjQ0CistLS0gYS9kY2UuYworKysrIGIvZGNlLmMKK0BAIC0yNzAs
OCArMjcwLDE0IEBAIHN0YXRpYyBpbnQgZGNlX2RlY29kZShBVlBhY2tldCAqcCkKKyAKKyAgICAg
ZXJyID0gVklEREVDM19wcm9jZXNzKGNvZGVjLCBpbmJ1ZnMsIG91dGJ1ZnMsIGluX2FyZ3MsIG91
dF9hcmdzKTsKKyAgICAgaWYgKGVycikgeworLSAgICAgICAgZnByaW50ZihzdGRlcnIsICJWSURE
RUMzX3Byb2Nlc3MoKSBlcnJvciAlZFxuIiwgZXJyKTsKKy0gICAgICAgIHJldHVybiAtMTsKKysg
ICAgICAgIGZwcmludGYoc3RkZXJyLCAiVklEREVDM19wcm9jZXNzKCkgZXJyb3IgJWQgJTA4eFxu
IiwgZXJyLAorKyAgICAgICAgICAgICAgICAgICAgb3V0X2FyZ3MtPmV4dGVuZGVkRXJyb3IpOwor
KyAgICAgICAgLyogZm9yIG5vbi1mYXRhbCBlcnJvcnMsIGtlZXAgZ29pbmcuLiBhIG5vbi1mYXRh
bCBlcnJvciBjb3VsZAorKyAgICAgICAgICoganVzdCBpbmRpY2F0ZSBhbiBlcnJvciBpbiB0aGUg
aW5wdXQgc3RyZWFtIHdoaWNoIHRoZSBjb2RlYworKyAgICAgICAgICogd2FzIGFibGUgdG8gY29u
Y2VhbAorKyAgICAgICAgICovCisrICAgICAgICBpZiAoWERNX0lTRkFUQUxFUlJPUihvdXRfYXJn
cy0+ZXh0ZW5kZWRFcnJvcikpCisrICAgICAgICAgICAgcmV0dXJuIC0xOworICAgICB9CisgCisg
ICAgIGZvciAoaSA9IDA7IGkgPCBvdXRfYXJncy0+b3V0cHV0SURbaV07IGkrKykgeworLS0gCisx
LjcuMQpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1ncmFwaGljcy9vbWFwZmJwbGF5L29tYXBmYnBsYXkt
Y21lbV9naXQuYmIgYi9yZWNpcGVzLWdyYXBoaWNzL29tYXBmYnBsYXkvb21hcGZicGxheS1jbWVt
X2dpdC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5hMDM5MmY2Ci0tLSAv
ZGV2L251bGwKKysrIGIvcmVjaXBlcy1ncmFwaGljcy9vbWFwZmJwbGF5L29tYXBmYnBsYXktY21l
bV9naXQuYmIKQEAgLTAsMCArMSwxNiBAQAorcmVxdWlyZSBvbWFwZmJwbGF5LmluYworCitERVBF
TkRTICs9ICJ0aS1saW51eHV0aWxzIgorCityZXF1aXJlIHJlY2lwZXMtdGkvaW5jbHVkZXMvdGkt
cGF0aHMuaW5jCisKK1BBQ0tBR0VfQVJDSCA9ICIke01BQ0hJTkVfQVJDSH0iCisKK1NETUFfQ0ZM
QUdTID0gIiAtSSR7TElOVVhVVElMU19JTlNUQUxMX0RJUn0vcGFja2FnZXMvdGkvc2RvL2xpbnV4
dXRpbHMvc2RtYS9pbmNsdWRlLyIKK0NNRU1fQ0ZMQUdTID0gIiAtSSR7TElOVVhVVElMU19JTlNU
QUxMX0RJUn0vcGFja2FnZXMvdGkvc2RvL2xpbnV4dXRpbHMvY21lbS9pbmNsdWRlLyIKK0NGTEFH
UyArPSAiIC1JLiAtSSR7U1RBR0lOR19LRVJORUxfRElSfS9pbmNsdWRlICR7U0RNQV9DRkxBR1N9
ICR7Q01FTV9DRkxBR1N9IgorCitleHBvcnQgU0RNQV9MSUJTID0gIi1MJHtMSU5VWFVUSUxTX0lO
U1RBTExfRElSfS9wYWNrYWdlcy90aS9zZG8vbGludXh1dGlscy9zZG1hL2xpYiAtbDpzZG1hLmE0
NzBNViIKK2V4cG9ydCBDTUVNX0xJQlMgPSAiLUwke0xJTlVYVVRJTFNfSU5TVEFMTF9ESVJ9L3Bh
Y2thZ2VzL3RpL3Nkby9saW51eHV0aWxzL2NtZW0vbGliIC1sOmNtZW0uYTQ3ME1WIgorCitPTUFQ
RkJQTEFZT1BUUyA9ICJWNEwyPXkgT01BUEZCPXkgTkVUU1lOQz15IENNRU09eSBTRE1BPXkiCmRp
ZmYgLS1naXQgYS9yZWNpcGVzLWdyYXBoaWNzL29tYXBmYnBsYXkvb21hcGZicGxheS1kY2VfZ2l0
LmJiIGIvcmVjaXBlcy1ncmFwaGljcy9vbWFwZmJwbGF5L29tYXBmYnBsYXktZGNlX2dpdC5iYgpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5lNzBhYzcyCi0tLSAvZGV2L251bGwK
KysrIGIvcmVjaXBlcy1ncmFwaGljcy9vbWFwZmJwbGF5L29tYXBmYnBsYXktZGNlX2dpdC5iYgpA
QCAtMCwwICsxLDcgQEAKK3JlcXVpcmUgb21hcGZicGxheS5pbmMKKworREVQRU5EUyArPSAibGli
ZGNlIgorCitDRkxBR1MgKz0gIiAtSS4gLUkke1NUQUdJTkdfSU5DRElSfS9kY2UgLUkke1NUQUdJ
TkdfS0VSTkVMX0RJUn0vaW5jbHVkZSAiCisKK09NQVBGQlBMQVlPUFRTID0gIlY0TDI9eSBPTUFQ
RkI9eSBORVRTWU5DPXkgRENFPXkiCmRpZmYgLS1naXQgYS9yZWNpcGVzLWdyYXBoaWNzL29tYXBm
YnBsYXkvb21hcGZicGxheS14dl9naXQuYmIgYi9yZWNpcGVzLWdyYXBoaWNzL29tYXBmYnBsYXkv
b21hcGZicGxheS14dl9naXQuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4u
Y2FkZjZkOAotLS0gL2Rldi9udWxsCisrKyBiL3JlY2lwZXMtZ3JhcGhpY3Mvb21hcGZicGxheS9v
bWFwZmJwbGF5LXh2X2dpdC5iYgpAQCAtMCwwICsxLDMgQEAKK3JlcXVpcmUgb21hcGZicGxheS5p
bmMKKworT01BUEZCUExBWU9QVFMgPSAiVjRMMj15IE5FVFNZTkM9eSBYVj15IgpkaWZmIC0tZ2l0
IGEvcmVjaXBlcy1ncmFwaGljcy9vbWFwZmJwbGF5L29tYXBmYnBsYXkuaW5jIGIvcmVjaXBlcy1n
cmFwaGljcy9vbWFwZmJwbGF5L29tYXBmYnBsYXkuaW5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAuLjc3ZTIzODAKLS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVzLWdyYXBoaWNz
L29tYXBmYnBsYXkvb21hcGZicGxheS5pbmMKQEAgLTAsMCArMSwzMyBAQAorREVTQ1JJUFRJT04g
PSAiU2ltcGxlIGxpYmF2LWJhc2VkIHBsYXllciB0aGF0IHVzZXMgdGhlIG9tYXBmYiBvdmVybGF5
cyIKK0RFUEVORFMgPSAiYnppcDIgbGFtZSBsaWJhdiB2aXJ0dWFsL2tlcm5lbCIKK0xJQ0VOU0Ug
PSAiTUlUIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vb21hcGZicGxheS5jO2JlZ2lubGlu
ZT0yO2VuZGxpbmU9MjI7bWQ1PTA1ZDM3ODlhYjM2MmU2ZjRhOTY4MmU5ODEwMGVhMGZhIgorCitQ
ViA9ICIwLjArJHtQUn0rZ2l0ciR7U1JDUkVWfSIKKworU1JDUkVWID0gIjM0MjkzMDUyYzVhMmFl
MzI4ZWFjNjkwMzUxMmU2YjRjZTE5YjU2MzkiCitTUkNfVVJJID0gImdpdDovL2dpdC5tYW5zci5j
b20vb21hcGZicGxheTtwcm90b2NvbD1naXQgXAorICAgICAgICAgICBmaWxlOi8vb21hcGZicGxh
eS1lcnJvcmhhbmRsaW5nLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtb21hcGZicGxh
eS1zd2l0Y2gtQ09ERUNfVFlQRV9WSURFTy10by1BVk1FRElBX1RZUEVfVi5wYXRjaCBcCisgICAg
ICAgICAgIgorCitTID0gIiR7V09SS0RJUn0vZ2l0IgorCisjIFdlIHdhbnQgYSBrZXJuZWwgaGVh
ZGVyIGZvciBhcm12N2EsIGJ1dCB3ZSBkb24ndCB3YW50IHRvIG1ha2UgbXBsYXllciBtYWNoaW5l
IHNwZWNpZmljIGZvciB0aGF0CitTVEFHSU5HX0tFUk5FTF9ESVIgPSAiJHtTVEFHSU5HX0RJUn0v
JHtNQUNISU5FX0FSQ0h9JHtUQVJHRVRfVkVORE9SfS0ke1RBUkdFVF9PU30va2VybmVsIgorQ0ZM
QUdTICs9ICIgLUkuIC1JJHtTVEFHSU5HX0tFUk5FTF9ESVJ9L2luY2x1ZGUgIgorCitPTUFQRkJQ
TEFZVkFSSUFOVCA/PSAiJHtQTn0iCitPTUFQRkJQTEFZT1BUUyA/PSAiVjRMMj15IE5FVFNZTkM9
eSIKKworZG9fY29tcGlsZSgpIHsKKwljcCAke1NUQUdJTkdfS0VSTkVMX0RJUn0vYXJjaC9hcm0v
cGxhdC1vbWFwL2luY2x1ZGUvbWFjaC9vbWFwZmIuaCAke1N9IHx8IHRydWUKKwljcCAke1NUQUdJ
TkdfS0VSTkVMX0RJUn0vaW5jbHVkZS9hc20tYXJtL2FyY2gtb21hcC9vbWFwZmIuaCAke1N9IHx8
IHRydWUKKwljcCAke1NUQUdJTkdfS0VSTkVMX0RJUn0vaW5jbHVkZS9saW51eC9vbWFwZmIuaCAk
e1N9IHx8IHRydWUKKwlvZV9ydW5tYWtlICR7VEFSR0VUX0FSQ0h9PXkgJHtPTUFQRkJQTEFZT1BU
U30gLWUKK30KKworZG9faW5zdGFsbCgpIHsKKwlpbnN0YWxsIC1kICR7RH0vJHtiaW5kaXJ9CisJ
aW5zdGFsbCAtbSAwNzU1ICR7U30vb21hcGZicGxheSAke0R9LyR7YmluZGlyfS8ke09NQVBGQlBM
QVlWQVJJQU5UfQorfQpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1ncmFwaGljcy9vbWFwZmJwbGF5L29t
YXBmYnBsYXlfZ2l0LmJiIGIvcmVjaXBlcy1ncmFwaGljcy9vbWFwZmJwbGF5L29tYXBmYnBsYXlf
Z2l0LmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjBkMzk1NmYKLS0tIC9k
ZXYvbnVsbAorKysgYi9yZWNpcGVzLWdyYXBoaWNzL29tYXBmYnBsYXkvb21hcGZicGxheV9naXQu
YmIKQEAgLTAsMCArMSwzIEBACityZXF1aXJlIG9tYXBmYnBsYXkuaW5jCisKK09NQVBGQlBMQVlP
UFRTID0gIlY0TDI9eSBPTUFQRkI9eSBORVRTWU5DPXkiCi0tIAoxLjcuMC40Cgo=

--_002_4C82F39BABFE6A429733A300DEBF52240B75582CDNCE05entticom_--

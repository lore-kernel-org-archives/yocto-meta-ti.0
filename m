Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FA08E005B7; Mon, 30 Nov 2015 09:51:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 316BBE00457
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 09:51:08 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAUHp75A031378
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 11:51:07 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAUHp7KJ028031
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 11:51:07 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Mon, 30 Nov 2015 11:51:07 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/2] mpm-transport: Update to new version
	2.0.0.0
Thread-Index: AQHRJ82qC7vLaY1rm0KNQRtgtTQCI56tsuKA//+f6GCAAGb4gP//nPrAgABm2QD//6ChcAD7CWyAAAyD6hA=
Date: Mon, 30 Nov 2015 17:51:06 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490582912D9@DLEE11.ent.ti.com>
References: <1448489243-26741-1-git-send-email-sam.nelson@ti.com>
	<20151125221639.GE28188@edge>
	<4F9216F96E5DF9428610502835A9F4905828C245@DLEE11.ent.ti.com>
	<20151125224115.GF28188@edge>
	<4F9216F96E5DF9428610502835A9F4905828C27A@DLEE11.ent.ti.com>
	<20151125225456.GG28188@edge>
	<4F9216F96E5DF9428610502835A9F4905828C2F9@DLEE11.ent.ti.com>
	<20151130170132.GN28188@edge>
In-Reply-To: <20151130170132.GN28188@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] mpm-transport: Update to new version 2.0.0.0
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
X-List-Received-Date: Mon, 30 Nov 2015 17:51:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This needs update to uio-module-drv as well. I will send update to uio-modu=
le-drv.
Sorry I missed.
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, November 30, 2015 12:02 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/2] mpm-transport: Update to new version
> 2.0.0.0
>=20
> Sam,
>=20
> After bunch of fixes to pull the necessary dependencies for k2g, mpm-
> transport still fails due to this:
>=20
> | sharedmem/mpm_transport_sharedmem.c:44:28: fatal error:
> | uio_module_drv.h: No such file or directory  #include "uio_module_drv.h=
"
>=20
> The version of uio_module_drv we have doesn't even have the necessary
> header
> file:
> http://git.ti.com/gitweb/?p=3Dkeystone-linux/uio-module-drv.git;a=3Dtree
>=20
> If it expects said header to be part of mpm-transport, it's not in that r=
epo
> either:
> http://git.ti.com/gitweb/?p=3Dkeystone-linux/mpm-
> transport.git;a=3Dtree;h=3Drefs/heads/linux41;hb=3Drefs/heads/linux41
>=20
> --
> Denys
>=20
>=20
> On Wed, Nov 25, 2015 at 06:16:19PM -0500, Nelson, Sam wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Wednesday, November 25, 2015 5:55 PM
> > > To: Nelson, Sam
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] [PATCH 1/2] mpm-transport: Update to new versi=
on
> > > 2.0.0.0
> > >
> > > On Wed, Nov 25, 2015 at 05:47:53PM -0500, Nelson, Sam wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Wednesday, November 25, 2015 5:41 PM
> > > > > To: Nelson, Sam
> > > > > Cc: meta-ti@yoctoproject.org
> > > > > Subject: Re: [meta-ti] [PATCH 1/2] mpm-transport: Update to new
> > > > > version
> > > > > 2.0.0.0
> > > > >
> > > > > On Wed, Nov 25, 2015 at 05:33:54PM -0500, Nelson, Sam wrote:
> > > > > >
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Dmytriyenko, Denys
> > > > > > > Sent: Wednesday, November 25, 2015 5:17 PM
> > > > > > > To: Nelson, Sam
> > > > > > > Cc: meta-ti@yoctoproject.org
> > > > > > > Subject: Re: [meta-ti] [PATCH 1/2] mpm-transport: Update to n=
ew
> > > > > > > version
> > > > > > > 2.0.0.0
> > > > > > >
> > > > > > > On Wed, Nov 25, 2015 at 05:07:22PM -0500, Sam Nelson wrote:
> > > > > > > > - Updates to work with kernel version 4.1 and other uio dri=
ver
> > > > > > > > changes
> > > > > > > > - Making the package machine specific and hence the
> > > > > > > > dependencies according to the platform is updated
> > > > > > > > - Add use of oe_runmake instead of direct call to make
> > > > > > > >
> > > > > > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > > > > > ---
> > > > > > > >  recipes-ti/mpm-transport/mpm-transport_git.bb | 30
> > > > > > > > ++++++++++++++++-----------
> > > > > > > >  1 file changed, 18 insertions(+), 12 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb
> > > > > > > > b/recipes-ti/mpm-transport/mpm-transport_git.bb
> > > > > > > > index 752ada5..cc211ce 100644
> > > > > > > > --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> > > > > > > > +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> > > > > > > > @@ -3,16 +3,27 @@ HOMEPAGE =3D
> > > > > > > > "http://git.ti.com/cgit/cgit.cgi/keystone-
> > > > > > > linux/mpm-transport.git"
> > > > > > > >  LICENSE =3D "BSD-3-Clause & MIT"
> > > > > > > >  LIC_FILES_CHKSUM =3D
> > > > > > > "file://LICENSE.txt;md5=3D122b7757f366f3f6fe11988715258fc9"
> > > > > > > >  COMPATIBLE_MACHINE =3D "keystone"
> > > > > > > > -DEPENDS =3D "common-csl-ip hyplnk-lld edma3-lld mmap-lld
> cmem
> > > > > > > > rm-lld
> > > > > > > qmss-lld cppi-lld srio-lld"
> > > > > > > > +
> > > > > > > > +DEPENDS =3D "common-csl-ip edma3-lld mmap-lld cmem rm-lld
> > > > > > > > +qmss-lld
> > > > > > > cppi-lld uio-module-drv syslog-ng"
> > > > > > >
> > > > > > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipe=
s-b
> > > > > > > sp/m
> > > > > > > map-
> > > > > > > lld/mmap-lld.inc?h=3Dfido#n3
> > > > > > > Will fail for k2l and k2g...
> > > > > > The mmap-lld recipes need to be updated to build for k2l and k2=
g.
> > > > > > My
> > > > > understanding is same drivers should work.
> > > > >
> > > > > Well, at least the test part has only k/h/e devices in the list:
> > > > >
> > > > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bs=
p/m
> > > > > map-
> > > > > lld/mmap-lld-test_git.bb?h=3Dfido#n11
> > > > Test part may need update per device. Currently hope this is not a =
show
> > > stopper.
> > >
> > > So, are you saying mmap-lld can lax the restrictions in the same vers=
ion?
> Or
> > > do you mean a new version is required?
> > >
> > Same version can work.
> > >
> > > > > > > > +DEPENDS_append_k2hk-evm +=3D "hyplnk-lld srio-lld"
> > > > > > > > +DEPENDS_append_k2e-evm +=3D "hyplnk-lld"
> > > > > > > > +
> > > > > > > > +RDEPENDS_${PN} =3D "syslog-ng"
> > > > > > > > +
> > > > > > > > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > > > >
> > > > > > > >  SRC_URI =3D "git://git.ti.com/keystone-linux/mpm-
> > > > > > > transport.git;protocol=3Dgit;branch=3D${BRANCH}"
> > > > > > > >
> > > > > > > > -BRANCH =3D "master"
> > > > > > > > -# This commit corresponds to tag DEV.MPM-TRANSPORT-
> > > 01.00.08.03
> > > > > > > > -SRCREV =3D "f6c5426d68c2be832903b6d215370c94e134167f"
> > > > > > > > +BRANCH =3D "linux41"
> > > > > > > > +# This commit corresponds to tag DEV.MPM-TRANSPORT-
> > > > > > > 02.00.00.00_ENG
> > > > > > > > +SRCREV =3D "892e93238b7f9f480ddceb7ade042026a4d178bd"
> > > > > > > >
> > > > > > > > -PV =3D "1.0.8.3"
> > > > > > > > -PR =3D "r1"
> > > > > > > > +PV =3D "2.0.0.0"
> > > > > > > > +PR =3D "r0"
> > > > > > > > +
> > > > > > > > +EXTRA_OEMAKE =3D "PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
> > > > > > > > +EXTRA_OEMAKE_append_k2hk-evm +=3D
> "HYPLNK_TRANSPORT=3Dtrue
> > > > > > > SRIO_TRANSPORT=3Dtrue"
> > > > > > > > +EXTRA_OEMAKE_append_k2e-evm +=3D
> "HYPLNK_TRANSPORT=3Dtrue"
> > > > > > > >
> > > > > > > >  S =3D "${WORKDIR}/git"
> > > > > > > >
> > > > > > > > @@ -25,13 +36,8 @@ FILES_${PN}-test =3D
> > > > > > > "${bindir}/mpm_transport_test.out \
> > > > > > > >
> > > > > > > 	${bindir}/mpm_transport_qmss_arm_mt.out \
> > > > > > > >
> > > > > > > 	${bindir}/mpm_transport_srio_arm_mt.out"
> > > > > > > >
> > > > > > > > -do_compile () {
> > > > > > > > -	cd ${S}
> > > > > > > > -	make PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> > > > > > > > -}
> > > > > > > > -
> > > > > > > >  do_install() {
> > > > > > > > -	make installbin BASE_DIR=3D${S}
> > > > > > > INSTALL_BIN_BASE_DIR=3D${D}/${bindir}
> > > > > > > > +	oe_runmake installbin BASE_DIR=3D${S}
> > > > > > > > +INSTALL_BIN_BASE_DIR=3D${D}/${bindir}
> > > > > > > >
> > > > > > > >  	install -d ${D}${includedir}/
> > > > > > > >  	install -c -m 755 ${S}/include/* ${D}${includedir}/
> > > > > > > > --
> > > > > > > > 1.9.1
> > > > > > > >
> > > > > > > > --
> > > > > > > > _______________________________________________
> > > > > > > > meta-ti mailing list
> > > > > > > > meta-ti@yoctoproject.org
> > > > > > > > https://lists.yoctoproject.org/listinfo/meta-ti


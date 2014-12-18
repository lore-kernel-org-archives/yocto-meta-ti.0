Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5BD40E00A1C; Thu, 18 Dec 2014 09:40:42 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FDF7E009B3
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 09:40:41 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBIHee1m023904
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 11:40:40 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBIHee2E027784
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 11:40:40 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Thu, 18 Dec 2014 11:40:40 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] mpm-transport: Add new recipe for multiproc
	transport library and test code
Thread-Index: AQHQGtri1u3/+K3/LkWmlgBRsO4XiZyV/+IA//+cbTCAAGXhgP//m3/w
Date: Thu, 18 Dec 2014 17:40:40 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490580ED06D@DLEE11.ent.ti.com>
References: <1418918057-13812-1-git-send-email-sam.nelson@ti.com>
	<20141218173150.GJ29971@edge>
	<4F9216F96E5DF9428610502835A9F490580ED051@DLEE11.ent.ti.com>
	<20141218174005.GK29971@edge>
In-Reply-To: <20141218174005.GK29971@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] mpm-transport: Add new recipe for multiproc transport library and test code
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
X-List-Received-Date: Thu, 18 Dec 2014 17:40:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, December 18, 2014 12:40 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] mpm-transport: Add new recipe for multipro=
c
> transport library and test code
>=20
> On Thu, Dec 18, 2014 at 12:38:17PM -0500, Nelson, Sam wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Thursday, December 18, 2014 12:32 PM
> > > To: Nelson, Sam
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] [PATCH] mpm-transport: Add new recipe for
> multiproc
> > > transport library and test code
> > >
> > > On Thu, Dec 18, 2014 at 10:54:17AM -0500, Sam Nelson wrote:
> > > > - mpm-transport provide basic transport layer for moving data betwe=
en
> > > different processing nodes
> > > > - Support communication with the process nodes using shared memory
> > > and hyperlink interface
> > > >
> > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > ---
> > > >  recipes-ti/mpm-transport/mpm-transport_git.bb |   37
> > > +++++++++++++++++++++++++
> > > >  1 file changed, 37 insertions(+)
> > > >  create mode 100644 recipes-ti/mpm-transport/mpm-transport_git.bb
> > > >
> > > > diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipe=
s-
> > > ti/mpm-transport/mpm-transport_git.bb
> > > > new file mode 100644
> > > > index 0000000..fe67195
> > > > --- /dev/null
> > > > +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> > > > @@ -0,0 +1,37 @@
> > > > +DESCRIPTION =3D "Multiproc transport layer for KeyStone devices:
> Provide
> > > basic transport layer for moving data between different processing
> nodes"
> > > > +HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-linux/mpm-
> > > transport.git"
> > > > +LICENSE =3D "BSD-3-Clause & MIT"
> > > > +LIC_FILES_CHKSUM =3D
> > > "file://LICENSE.txt;md5=3D2c17cd1dc60dc06a4c4f2a2c45472a51"
> > > > +COMPATIBLE_MACHINE =3D "keystone"
> > > > +DEPENDS =3D "common-csl-ip hyplnk-lld edma3-lld mmap-lld"
> > > > +
> > > > +SRC_URI =3D "git://git.ti.com/keystone-linux/mpm-
> > > transport.git;protocol=3Dgit;branch=3D${BRANCH}"
> > > > +
> > > > +BRANCH =3D "master"
> > > > +# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.04.00E
> > > > +SRCREV =3D "56640c6296f9f4816140364b7620b1d1a483ac40"
> > > > +PV =3D "1.0.4.0"
> > > > +PR =3D "r0"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +PACKAGES =3D+ "${PN}-test"
> > > > +FILES_${PN}-test =3D "${bindir}/mpm_transport_test.out
> > > ${bindir}/mpm_transport_hyplnk_loopback.out
> > > ${bindir}/mpm_transport_hyplnk_remote.out
> > > ${bindir}/mpm_transport_hyplnk_loopback_dma.out
> > > ${bindir}/mpm_transport_hyplnk_loopback64.out"
> > > > +
> > > > +do_compile () {
> > > > +	cd ${S}
> > > > +	make PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> > > > +}
> > > > +
> > > > +do_install() {
> > > > +	make installbin BASE_DIR=3D${S}
> > > INSTALL_BIN_BASE_DIR=3D${D}/${bindir}
> > > > +
> > > > +	install -d ${D}${includedir}/
> > > > +	install -c -m 755 ${S}/include/* ${D}${includedir}/
> > >
> > > Do you want to make a ${PN}-dev package with those headers for the
> > > devkit? Or
> > > do you only need those on the target?
>=20
> > [Sam] The header files are only needed part of the ${PN}-dev for devkit=
.
> Not
> > needed on target.
>=20
> Ok. Do they automatically get packaged into ${PN}-dev?
[Sam] YES.
>=20
>=20
> > > > +	install -d ${D}${libdir}/
> > > > +	cp  -a ${S}/lib/* ${D}${libdir}/
> > > > +
> > > > +	install -d ${D}${sysconfdir}/mpm/
> > > > +	install -c -m 755 ${S}/scripts/mpm_config.json
> > > ${D}${sysconfdir}/mpm/mpm_config.json
> > > > +}
> > > > --
> > > > 1.7.9.5
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti


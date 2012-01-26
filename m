Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D81DE0030F
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 11:28:03 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QJS1fX004969;
	Thu, 26 Jan 2012 13:28:01 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QJS15t026607;
	Thu, 26 Jan 2012 13:28:01 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 26 Jan 2012 13:28:01 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-ti] [PATCH] arm-benchmarks: port of am-benchmarks from
	arago
Thread-Index: AQHM3F4UYQBPuobe3UCO4FAVAxlFepYfCFGg
Date: Thu, 26 Jan 2012 19:28:01 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BF9A18A@DLEE12.ent.ti.com>
References: <1327604455-4778-1-git-send-email-Chase.Maupin@ti.com>
	<20120126190949.GA18244@denix.org>
In-Reply-To: <20120126190949.GA18244@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] arm-benchmarks: port of am-benchmarks from arago
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
X-List-Received-Date: Thu, 26 Jan 2012 19:28:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Thursday, January 26, 2012 1:10 PM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] arm-benchmarks: port of am-
> benchmarks from arago
>=20
> On Thu, Jan 26, 2012 at 01:00:55PM -0600, Chase Maupin wrote:
> > * Ported the am-benchmarks recipe from arago and changed the name
> >   to arm-benchmarks.
> > * Updated the SRCREV to pickup licensing file
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb |   26
> +++++++++++++++++++++++
> >  1 files changed, 26 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes-ti/arm-benchmarks/arm-
> benchmarks_1.3.bb
> >
> > diff --git a/recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb
> b/recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb
> > new file mode 100644
> > index 0000000..c7a8e12
> > --- /dev/null
> > +++ b/recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb
> > @@ -0,0 +1,26 @@
> > +DESCRIPTION =3D "AM Benchmarks"
>=20
> Didn't you change the name? ^^^

Yes, good point

>=20
>=20
> > +HOMEPAGE =3D "https://gforge.ti.com/gf/project/am_benchmarks/"
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D7aefb5e1cffc7b6a3ef18b803f957922"
> > +SECTION =3D "system"
> > +
> > +SRCREV =3D "76"
> > +PR =3D "r0+svnr${SRCPV}"
> > +
> > +SRC_URI =3D
> "svn://gforge.ti.com/svn/am_benchmarks/;module=3Dtrunk;proto=3Dhttps;us
> er=3Danonymous;pswd=3D''"
> > +
> > +S =3D "${WORKDIR}/trunk"
> > +
> > +do_compile() {
> > +	export CROSS_COMPILE=3D${TARGET_PREFIX}
> > +	export ARCH=3D${TUNE_PKGARCH}
> > +	# build the release version
> > +	make release
> > +}
> > +
> > +do_install() {
> > +	export ARCH=3D${TUNE_PKGARCH}
> > +	make DESTDIR=3D${D} install
> > +}
> > +
> > +RDEPENDS +=3D matrix-gui-armbenchmarks-demos
>=20
> Do we really need to RDEPENDS on matrix?

It just pulls in the matrix information, but this by itself does not pull i=
n full matrix.

>=20
> --
> Denys


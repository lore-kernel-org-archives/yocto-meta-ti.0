Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABDC3E0089B; Thu,  5 Feb 2015 07:25:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D184E00829
	for <meta-ti@yoctoproject.org>; Thu,  5 Feb 2015 07:24:44 -0800 (PST)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15FOgqd012827
	for <meta-ti@yoctoproject.org>; Thu, 5 Feb 2015 09:24:42 -0600
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FOcG9004774
	for <meta-ti@yoctoproject.org>; Thu, 5 Feb 2015 20:54:40 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0224.002; Thu, 5 Feb 2015 20:54:38 +0530
From: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-ti] vpe-tests: Add DEPENDS for the recipe
Thread-Index: AQHQQVaExMXGbWCu60aN6BXNWNLO6pziLFAA
Date: Thu, 5 Feb 2015 15:24:37 +0000
Message-ID: <E60A9E1B4132A24DB80BD56ABC92684735048F41@DBDE04.ent.ti.com>
References: <1423131050-13022-1-git-send-email-a0393906@ti.com>
	<20150205151445.GD9943@edge>
In-Reply-To: <20150205151445.GD9943@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: vpe-tests: Add DEPENDS for the recipe
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
X-List-Received-Date: Thu, 05 Feb 2015 15:25:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, February 05, 2015 8:45 PM
> To: R, Karthik
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] vpe-tests: Add DEPENDS for the recipe
>=20
> On Thu, Feb 05, 2015 at 03:40:50PM +0530, Karthik Ramanan wrote:
> > Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > ---
> >  recipes-bsp/vpe-tests/vpe-tests_git.bb |    4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/recipes-bsp/vpe-tests/vpe-tests_git.bb b/recipes-
> bsp/vpe-tests/vpe-tests_git.bb
> > index a8ee7f8..ee91dea 100644
> > --- a/recipes-bsp/vpe-tests/vpe-tests_git.bb
> > +++ b/recipes-bsp/vpe-tests/vpe-tests_git.bb
> > @@ -3,6 +3,10 @@ DESCRIPTION =3D "VPE test program"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D74d2f71d8898c54e3d1c9d0058c484aa"
> >
> > +DEPENDS =3D "virtual/kernel"
>=20
> Should it also RDEPENDS on vpdma-fw?

This is a generic v4l2 m2m test application
Even though it is used for testing VPE, it does not mandate that has to be =
run only on VPE
It works with other m2m devices also, so ideally the vpdma-fw dependency is=
 not needed.

>=20
>=20
> > +PR=3D"r1"
> > +
> >  COMPATIBLE_MACHINE =3D "dra7xx"
> >
> >  SRCREV =3D "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


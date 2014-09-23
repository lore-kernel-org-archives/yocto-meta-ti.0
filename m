Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70E0EE0086E; Tue, 23 Sep 2014 11:06:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE389E0084F
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:06:34 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NI6X2K025360
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:06:33 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NI6Xqa009027
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:06:33 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 23 Sep 2014 13:06:33 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-ti] [for master 5/6] omap5-sgx-ddk-um-linux: Updated
	SRCREV to include bugfixes
Thread-Index: AQHP10ohNEK5eLKlaUC04GsRNVeKHJwPA52Q
Date: Tue, 23 Sep 2014 18:06:32 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C73B8C6@DFLE08.ent.ti.com>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-6-git-send-email-a0393906@ti.com>
	<20140923161900.GP6303@edge>
In-Reply-To: <20140923161900.GP6303@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [for master 5/6] omap5-sgx-ddk-um-linux: Updated SRCREV to include bugfixes
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
X-List-Received-Date: Tue, 23 Sep 2014 18:06:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, September 23, 2014 11:19 AM
> To: R, Karthik
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [for master 5/6] omap5-sgx-ddk-um-linux: Updated
> SRCREV to include bugfixes
>=20
> Ack.
>=20
> On Tue, Sep 23, 2014 at 09:30:35PM +0530, Karthik Ramanan wrote:
> > * This version is compatible with version Kernel 3.12
> >
> > Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > ---
> >  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.b=
b
> b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > index b875328..37ea088 100644
> > --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > @@ -4,9 +4,9 @@ LICENSE =3D "TI-TSPA"
> >  LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-
> Manifest.doc;md5=3D360d293df455e4f2d363bb4014a49603"
> >
> >  SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-
> linux.git;protocol=3Dgit"
> > -SRCREV =3D "994922a5655c63b05343a9238cb30e6ef61744be"
> > +SRCREV =3D "0af11b676900de5a3e5550728fe18acd88c29848"
> >
> > -PR =3D "r2"
> > +PR =3D "r3"
> >  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2"
> >
> >  RREPLACES_${PN} =3D "libegl libgles1 libgles2"
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


Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE9C6E0084D; Tue, 23 Sep 2014 11:05:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DCF9E0084F
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:05:51 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NI5puF009370
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:05:51 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NI5pAu017202
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:05:51 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 23 Sep 2014 13:05:51 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-ti] [for master 4/6] bltsville: Updated SRCREV to the
	latest
Thread-Index: AQHP10gqV8iB7O9yDkqE2h7aTzblypwPOlaA///JHXA=
Date: Tue, 23 Sep 2014 18:05:50 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C73B851@DFLE08.ent.ti.com>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-5-git-send-email-a0393906@ti.com>
	<20140923162216.GR6303@edge>
In-Reply-To: <20140923162216.GR6303@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [for master 4/6] bltsville: Updated SRCREV to the latest
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
X-List-Received-Date: Tue, 23 Sep 2014 18:05:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, September 23, 2014 11:22 AM
> To: R, Karthik
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [for master 4/6] bltsville: Updated SRCREV to the =
latest
>=20
> Ack.
>=20
> On Tue, Sep 23, 2014 at 09:30:34PM +0530, Karthik Ramanan wrote:
> > * Contains incremental updates and bug fixes
> >
> > Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > ---
> >  recipes-graphics/bltsville/bltsville_git.bb |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-graphics/bltsville/bltsville_git.bb b/recipes-
> graphics/bltsville/bltsville_git.bb
> > index 158d189..7a05b4d 100644
> > --- a/recipes-graphics/bltsville/bltsville_git.bb
> > +++ b/recipes-graphics/bltsville/bltsville_git.bb
> > @@ -4,9 +4,9 @@ LICENSE =3D "BSD-3-Clause & TI-TSPA"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D10a9abb9c5bb19edd83a8cf66eef7148 \
> >
> file://ticpu/license;md5=3D0bb831850a0de80e32a63772d89c6562"
> >
> > -PR =3D "r2"
> > +PR =3D "r3"
> >
> > -SRCREV =3D "016586280ecdae201fd6e340ec8c4f8a9605cc94"
> > +SRCREV =3D "a759bde8a5a6e518dfb8a6e633736a360005498e"
> >
> >  inherit autotools pkgconfig
> >
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


Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0A29E0027F
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 22:45:49 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8I5jloC005346
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2012 00:45:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8I5jlG7009873
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2012 00:45:47 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Tue, 18 Sep 2012 00:45:47 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/2] ti-hw-bringup-image: remove duplicate
	timestamp-service, as it's in systemd-image
Thread-Index: AQHNlTfQ8f6N106joEOKBh5yvPvL1JePlzKg
Date: Tue, 18 Sep 2012 05:45:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015920B2DD@DLEE12.ent.ti.com>
References: <1347603239-10221-1-git-send-email-denys@ti.com>
	<20120918005156.GF1708@edge>
In-Reply-To: <20120918005156.GF1708@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ti-hw-bringup-image: remove duplicate timestamp-service, as it's in systemd-image
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
X-List-Received-Date: Tue, 18 Sep 2012 05:45:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, September 17, 2012 7:52 PM
> To: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/2] ti-hw-bringup-image: remove
> duplicate timestamp-service, as it's in systemd-image
>=20
> This one is also a trivial change - regardless of whether this
> recipe stays or
> goes, the change is only cosmetic, as it removes duplicate that
> is already
> included in the base systemd-image recipe. Any objections for me
> pushing it in?
>=20
> --
> Denys
>=20
>=20
> On Fri, Sep 14, 2012 at 02:13:59AM -0400, Denys Dmytriyenko
> wrote:
> > Since systemd-image from meta-angstrom already includes
> timestamp-service, remove
> > the duplicate from ti-hw-bringup-image recipe, which uses the
> former as a base.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-misc/images/ti-hw-bringup-image.bb |    1 -
> >  1 files changed, 0 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes-misc/images/ti-hw-bringup-image.bb
> b/recipes-misc/images/ti-hw-bringup-image.bb
> > index e8dd5ed..62b4c73 100644
> > --- a/recipes-misc/images/ti-hw-bringup-image.bb
> > +++ b/recipes-misc/images/ti-hw-bringup-image.bb
> > @@ -23,7 +23,6 @@ IMAGE_INSTALL +=3D " \
> >  	bc \
> >  	packagegroup-ti-test \
> >  	kernel-modules \
> > -	timestamp-service \
> >  	${EXTRA_MACHINE_IMAGE_INSTALL} \
> >  "
> >
> > --
> > 1.7.8.6
> >
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


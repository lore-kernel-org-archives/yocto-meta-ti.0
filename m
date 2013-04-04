Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49399E0140A
	for <meta-ti@yoctoproject.org>; Thu,  4 Apr 2013 04:44:20 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r34BiJl0017925
	for <meta-ti@yoctoproject.org>; Thu, 4 Apr 2013 06:44:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r34BiJXF031323
	for <meta-ti@yoctoproject.org>; Thu, 4 Apr 2013 06:44:19 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 4 Apr 2013 06:44:19 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 4 Apr 2013 06:44:19 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 2/2] ti33x: Add DTB filter for building SDKs
Thread-Index: AQHOML3+rAnXnkkAJEm+j09WaX9supjFN/cKgABcqYCAAF1M0A==
Date: Thu, 4 Apr 2013 11:44:17 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594BE6AE@DLEE11.ent.ti.com>
References: <1365008161-14609-1-git-send-email-Chase.Maupin@ti.com>
	<1365008161-14609-2-git-send-email-Chase.Maupin@ti.com>
	<20130403225248.GE31233@denix.org>
	<47BFB0D4-4FB5-4C58-A905-C12C79B8E60C@ti.com>
	<20130404011007.GR10072@edge>
In-Reply-To: <20130404011007.GR10072@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] ti33x: Add DTB filter for building SDKs
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
X-List-Received-Date: Thu, 04 Apr 2013 11:44:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, April 03, 2013 8:10 PM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 2/2] ti33x: Add DTB filter for
> building SDKs
>=20
> On Wed, Apr 03, 2013 at 08:38:28PM -0400, Maupin, Chase wrote:
> > We could probably do it in the image recipe with machine
> overrides.  How's
> > that?
>=20
> Seems better, as it is nicely localized. And in case it grows up
> on us and
> starts being used for other purposes or by other
> components/recipes, we can
> always revisit adding it to meta-ti/BSP.

OK.  I'll send an update today.

>=20
> --
> Denys
>=20
>=20
> > On Apr 3, 2013, at 5:53 PM, "Dmytriyenko, Denys" <denys@ti.com>
> wrote:
> >
> > > On Wed, Apr 03, 2013 at 11:56:01AM -0500, Chase Maupin wrote:
> > >> * Add a DTB_FILTER variable to only package the am335x DTB
> files
> > >>  in the SDK.
> > >>
> > >> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > >> ---
> > >> conf/machine/include/ti33x.inc |    2 ++
> > >> 1 files changed, 2 insertions(+), 0 deletions(-)
> > >>
> > >> diff --git a/conf/machine/include/ti33x.inc
> b/conf/machine/include/ti33x.inc
> > >> index e8aa2ba..50844d1 100644
> > >> --- a/conf/machine/include/ti33x.inc
> > >> +++ b/conf/machine/include/ti33x.inc
> > >> @@ -25,6 +25,8 @@ PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-
> staging"
> > >>
> > >> KERNEL_IMAGETYPE =3D "uImage"
> > >>
> > >> +DTB_FILTER =3D "am335x"
> > >
> > > I'm not sure about adding a new variable to meta-ti that is
> only used in tisdk
> > > part of meta-arago... Any other options?
> > >
> > >
> > >> UBOOT_ARCH =3D "arm"
> > >> UBOOT_MACHINE =3D "am335x_evm_config"
> > >>
> > >> --
> > >> 1.7.0.4
> > >>
> > >> _______________________________________________
> > >> meta-ti mailing list
> > >> meta-ti@yoctoproject.org
> > >> https://lists.yoctoproject.org/listinfo/meta-ti
> > >>


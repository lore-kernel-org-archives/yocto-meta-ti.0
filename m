Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8DE2E0051D
	for <meta-ti@yoctoproject.org>; Mon,  1 Apr 2013 14:10:36 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31LAa8M023951
	for <meta-ti@yoctoproject.org>; Mon, 1 Apr 2013 16:10:36 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31LAa9H010840
	for <meta-ti@yoctoproject.org>; Mon, 1 Apr 2013 16:10:36 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 1 Apr 2013 16:10:36 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 1 Apr 2013 16:10:36 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] ti33x: remove sgx until latest kernels are
	supported
Thread-Index: AQHOLwIeG37C6eL//kmlEQbhXXwvDJjBreGggAB0uID//7mE4A==
Date: Mon, 1 Apr 2013 21:10:35 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594B4BBD@DLEE11.ent.ti.com>
References: <1364833567-8510-1-git-send-email-Chase.Maupin@ti.com>
	<20130401175536.GA9892@edge>
	<7D46E86EC0A8354091174257B2FED101594B459C@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C418F9A@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C418F9A@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti33x: remove sgx until latest kernels are supported
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
X-List-Received-Date: Mon, 01 Apr 2013 21:10:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Monday, April 01, 2013 3:21 PM
> To: Maupin, Chase; Dmytriyenko, Denys
> Cc: meta-ti@yoctoproject.org
> Subject: RE: [meta-ti] [PATCH] ti33x: remove sgx until latest
> kernels are supported
>=20
>=20
>=20
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Maupin, Chase
> > Sent: Monday, April 01, 2013 1:24 PM
> > To: Dmytriyenko, Denys
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] ti33x: remove sgx until latest
> kernels are
> > supported
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Monday, April 01, 2013 12:56 PM
> > > To: Maupin, Chase
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] [PATCH] ti33x: remove sgx until latest
> kernels
> > > are supported
> > >
> > > On Mon, Apr 01, 2013 at 11:26:07AM -0500, Chase Maupin wrote:
> > > > * Remove the sgx feature from the ti33x devices until the
> > > update
> > > >   to a later version of the graphics SDK and drivers
> enables
> > > SGX
> > > >   support for later kernels such a v3.8
> > >
> > > But we still have 3.2 supported and AM-SDK is using it...
> > >
> >
> > I would expect that they won't pick up this change in their
> tree.  Is there a
> > way to "add" it back from a distro centric conf file?
> What is the difference between meta-arago including this change
> compared to meta-ti? Meta-ti doesn't "use" the sgx value so I am
> assuming your issue is that meta-arago uses this variable to
> build a filesystem.
>=20
> Anyway this "sgx" value should be left in meta-ti.

Fair enough.  I'll either submit a patch to meta-arago to remove the compon=
ents, or assuming your other sgx patches get picked up I'll see about updat=
ing to the latest graphics SDK which should work with v3.8 kernels (at leas=
t build)

>=20
> >
> > >
> > > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > > ---
> > > >  conf/machine/include/ti33x.inc |    2 +-
> > > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > > >
> > > > diff --git a/conf/machine/include/ti33x.inc
> > > b/conf/machine/include/ti33x.inc
> > > > index 12b80c6..e8aa2ba 100644
> > > > --- a/conf/machine/include/ti33x.inc
> > > > +++ b/conf/machine/include/ti33x.inc
> > > > @@ -34,4 +34,4 @@ UBOOT_LOADADDRESS =3D "0x80008000"
> > > >  EXTRA_IMAGEDEPENDS +=3D "u-boot"
> > > >
> > > >  # List common SoC features, may need to add touchscreen
> for
> > > specific machines
> > > > -MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat
> ext2
> > > screen alsa ethernet sgx"
> > > > +MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat
> ext2
> > > screen alsa ethernet"
> > > > --
> > > > 1.7.0.4
> > > >
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


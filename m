Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABC45E0051D
	for <meta-ti@yoctoproject.org>; Mon,  1 Apr 2013 14:32:07 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31LW7Xg004167
	for <meta-ti@yoctoproject.org>; Mon, 1 Apr 2013 16:32:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31LW7fR003309
	for <meta-ti@yoctoproject.org>; Mon, 1 Apr 2013 16:32:07 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 1 Apr 2013 16:32:06 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] ti33x: remove sgx until latest kernels are
	supported
Thread-Index: AQHOLwIeG37C6eL//kmlEQbhXXwvDJjBreGggAB0uID//7mE4IAAVPGA//+xgrA=
Date: Mon, 1 Apr 2013 21:32:05 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594B4CF5@DLEE11.ent.ti.com>
References: <1364833567-8510-1-git-send-email-Chase.Maupin@ti.com>
	<20130401175536.GA9892@edge>
	<7D46E86EC0A8354091174257B2FED101594B459C@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C418F9A@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101594B4BBD@DLEE11.ent.ti.com>
	<20130401211233.GD10072@edge>
In-Reply-To: <20130401211233.GD10072@edge>
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
X-List-Received-Date: Mon, 01 Apr 2013 21:32:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, April 01, 2013 4:13 PM
> To: Maupin, Chase
> Cc: Cooper Jr., Franklin; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] ti33x: remove sgx until latest
> kernels are supported
>=20
> On Mon, Apr 01, 2013 at 05:10:35PM -0400, Maupin, Chase wrote:
> > > -----Original Message-----
> > > From: Cooper Jr., Franklin
> > > Sent: Monday, April 01, 2013 3:21 PM
> > > To: Maupin, Chase; Dmytriyenko, Denys
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: RE: [meta-ti] [PATCH] ti33x: remove sgx until latest
> > > kernels are supported
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > > bounces@yoctoproject.org] On Behalf Of Maupin, Chase
> > > > Sent: Monday, April 01, 2013 1:24 PM
> > > > To: Dmytriyenko, Denys
> > > > Cc: meta-ti@yoctoproject.org
> > > > Subject: Re: [meta-ti] [PATCH] ti33x: remove sgx until
> latest
> > > kernels are
> > > > supported
> > > >
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Monday, April 01, 2013 12:56 PM
> > > > > To: Maupin, Chase
> > > > > Cc: meta-ti@yoctoproject.org
> > > > > Subject: Re: [meta-ti] [PATCH] ti33x: remove sgx until
> latest
> > > kernels
> > > > > are supported
> > > > >
> > > > > On Mon, Apr 01, 2013 at 11:26:07AM -0500, Chase Maupin
> wrote:
> > > > > > * Remove the sgx feature from the ti33x devices until
> the
> > > > > update
> > > > > >   to a later version of the graphics SDK and drivers
> > > enables
> > > > > SGX
> > > > > >   support for later kernels such a v3.8
> > > > >
> > > > > But we still have 3.2 supported and AM-SDK is using it...
> > > > >
> > > >
> > > > I would expect that they won't pick up this change in their
> > > tree.  Is there a
> > > > way to "add" it back from a distro centric conf file?
> > > What is the difference between meta-arago including this
> change
> > > compared to meta-ti? Meta-ti doesn't "use" the sgx value so I
> am
> > > assuming your issue is that meta-arago uses this variable to
> > > build a filesystem.
> > >
> > > Anyway this "sgx" value should be left in meta-ti.
> >
> > Fair enough.  I'll either submit a patch to meta-arago to
> remove the
> > components, or assuming your other sgx patches get picked up
> I'll see about
> > updating to the latest graphics SDK which should work with v3.8
> kernels (at
> > least build)
>=20
> Second option would be the best - I'll give those new sgx patches
> some
> attention tonight...

Thanks.=20

>=20
>=20
> > > > > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > > > > ---
> > > > > >  conf/machine/include/ti33x.inc |    2 +-
> > > > > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > > > > >
> > > > > > diff --git a/conf/machine/include/ti33x.inc
> > > > > b/conf/machine/include/ti33x.inc
> > > > > > index 12b80c6..e8aa2ba 100644
> > > > > > --- a/conf/machine/include/ti33x.inc
> > > > > > +++ b/conf/machine/include/ti33x.inc
> > > > > > @@ -34,4 +34,4 @@ UBOOT_LOADADDRESS =3D "0x80008000"
> > > > > >  EXTRA_IMAGEDEPENDS +=3D "u-boot"
> > > > > >
> > > > > >  # List common SoC features, may need to add
> touchscreen
> > > for
> > > > > specific machines
> > > > > > -MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost
> vfat
> > > ext2
> > > > > screen alsa ethernet sgx"
> > > > > > +MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost
> vfat
> > > ext2
> > > > > screen alsa ethernet"
> > > > > > --
> > > > > > 1.7.0.4
> > > > > >
> > > > > > _______________________________________________
> > > > > > meta-ti mailing list
> > > > > > meta-ti@yoctoproject.org
> > > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti


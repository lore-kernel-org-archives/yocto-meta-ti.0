Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7476DE0051D
	for <meta-ti@yoctoproject.org>; Mon,  1 Apr 2013 11:24:23 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31IONnd006467
	for <meta-ti@yoctoproject.org>; Mon, 1 Apr 2013 13:24:23 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31IONan016494
	for <meta-ti@yoctoproject.org>; Mon, 1 Apr 2013 13:24:23 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 1 Apr 2013 13:24:22 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] ti33x: remove sgx until latest kernels are
	supported
Thread-Index: AQHOLwIeG37C6eL//kmlEQbhXXwvDJjBreGg
Date: Mon, 1 Apr 2013 18:24:21 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594B459C@DLEE11.ent.ti.com>
References: <1364833567-8510-1-git-send-email-Chase.Maupin@ti.com>
	<20130401175536.GA9892@edge>
In-Reply-To: <20130401175536.GA9892@edge>
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
X-List-Received-Date: Mon, 01 Apr 2013 18:24:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, April 01, 2013 12:56 PM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] ti33x: remove sgx until latest
> kernels are supported
>=20
> On Mon, Apr 01, 2013 at 11:26:07AM -0500, Chase Maupin wrote:
> > * Remove the sgx feature from the ti33x devices until the
> update
> >   to a later version of the graphics SDK and drivers enables
> SGX
> >   support for later kernels such a v3.8
>=20
> But we still have 3.2 supported and AM-SDK is using it...
>=20

I would expect that they won't pick up this change in their tree.  Is there=
 a way to "add" it back from a distro centric conf file?

>=20
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  conf/machine/include/ti33x.inc |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/conf/machine/include/ti33x.inc
> b/conf/machine/include/ti33x.inc
> > index 12b80c6..e8aa2ba 100644
> > --- a/conf/machine/include/ti33x.inc
> > +++ b/conf/machine/include/ti33x.inc
> > @@ -34,4 +34,4 @@ UBOOT_LOADADDRESS =3D "0x80008000"
> >  EXTRA_IMAGEDEPENDS +=3D "u-boot"
> >
> >  # List common SoC features, may need to add touchscreen for
> specific machines
> > -MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2
> screen alsa ethernet sgx"
> > +MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2
> screen alsa ethernet"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


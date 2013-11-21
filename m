Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B13D1E005BB
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 15:51:54 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rALNpstC001276
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 17:51:54 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rALNpsJM011555
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 17:51:54 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 21 Nov 2013 17:51:54 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Ring, Chris" <cring@ti.com>
Thread-Topic: [meta-ti] [PATCH] ipc: IPC for communication between multiple
	processors
Thread-Index: AQHO5gPNYvyQ/HYmyk2G3F8bfXq4dpowvjyAgAAAkwD//5zbUA==
Date: Thu, 21 Nov 2013 23:51:52 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490549A39AB@DLEE11.ent.ti.com>
References: <20131120110538.GA22903@ti.com>
	<7D46E86EC0A8354091174257B2FED1015983FD3F@DLEE11.ent.ti.com>
	<20131120151843.GB29952@edge>
	<1C8E0AB07841D94E95FFFB7FCFE26FE00C7D2D14@DFLE10.ent.ti.com>
	<20131121234058.GT29952@edge>
In-Reply-To: <20131121234058.GT29952@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ipc: IPC for communication between multiple processors
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
X-List-Received-Date: Thu, 21 Nov 2013 23:51:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, November 21, 2013 6:41 PM
> To: Ring, Chris
> Cc: Maupin, Chase; Hingolikar, Mrinmayee; meta-ti@yoctoproject.org;
> Nelson, Sam
> Subject: Re: [meta-ti] [PATCH] ipc: IPC for communication between multipl=
e
> processors
>=20
> On Thu, Nov 21, 2013 at 06:38:55PM -0500, Ring, Chris wrote:
> > Below...
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Wednesday, November 20, 2013 7:19 AM
> > > To: Maupin, Chase
> > > Cc: Hingolikar, Mrinmayee; meta-ti@yoctoproject.org; Ring, Chris;
> Nelson,
> > > Sam
> > > Subject: Re: [meta-ti] [PATCH] ipc: IPC for communication between
> multiple
> > > processors
> > >
> > > See my comments below.
> > >
> > > <chop>
> > >
> > > > >+
> > > > >+Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > > > >+---
> > > > >+ ipc-linux.mak |    1 +
> > > > >+ products.mak  |    1 +
> > > > >+ 2 files changed, 2 insertions(+)
> > > > >+
> > > > >+diff --git a/ipc-linux.mak b/ipc-linux.mak
> > > > >+index 788a5a2..01579e4 100644
> > > > >+--- a/ipc-linux.mak
> > > > >++++ b/ipc-linux.mak
> > > > >+@@ -38,6 +38,7 @@ include products.mak
> > > > >+ config:
> > > > >+ 	@echo "Configuring Linux Ipc ..."
> > > > >+ 	./configure --host=3D$(TOOLCHAIN_LONGNAME) \
> > > > >++            --prefix=3D$(PREFIX) \
> > > > >+             CC=3D$(TOOLCHAIN_PREFIX)gcc \
> > > > >+             PLATFORM=3D$(PLATFORM) \
> > > > >+             CMEM_INSTALL_DIR=3D$(CMEM_INSTALL_DIR) \
> > > >
> > > > This line makes me think there is a dependency missing.  In the pas=
t
> > > > something like ti-paths.inc would pass this value along.  I'm not s=
aying
> > > > that should be replicated as is, but likely you want to se this to
> > > > STAGING_DIR_TARGET or something similar and the cmem recipe
> should stage
> > > > appropriately.
> > > >
> > > > I think it would be good if you walked through your software stack =
to
> > > make
> > > > sure you are sending your patches in order.  Likewise, there was so=
me
> > > > discussion with Sam about cmem recipes and basically about aligning
> > > recipes
> > > > between your groups.  I thin the approach of breaking linux-utils u=
p
> > > into a
> > > > recipe per component is going to be the cleanest approach.  I'll pi=
ng on
> > > > Sam's patches as well to get an update posted to meta-ti instead of
> > > > meta-arago list.
> > > >
> > > > Any pointers you can provide to documentation about the configurati=
on
> > > and
> > > > building of these components you are pushing up would also be usefu=
l
> to
> > > help
> > > > in reviewing so we can understand what you are trying to accomplish=
.
> > >
> > > Nice catch. The first question - does it depend and require cmem?
> >
> > The IPC build, including required variables, is described here:
> >     http://processors.wiki.ti.com/index.php/IPC_Install_Guide_Linux
> >
> > CMEM_INSTALL_DIR is only required if you want to build the examples
> which
> > leverage CMEM.  It shouldn't be needed if you only want to build the IP=
C
> > libraries.
>=20
> Thanks, Chris!
>=20
> Sam, Mrinmayee, can you comment on whether you need IPC examples
> and/or pass
> CMEM_INSTALL_DIR. Thanks.
[Sam] My general thought on this, is that  the test or examples should go i=
nto a separate recipe may be ipc-test or ipc-examples. Which in turn can de=
pend on multiple components.  This I guess need changes to build the exampl=
es separately. =20
>=20
> --
> Denys


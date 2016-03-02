Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5E80E00720; Wed,  2 Mar 2016 08:51:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3458E00443
	for <meta-ti@yoctoproject.org>; Wed,  2 Mar 2016 08:51:19 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u22GpI6Q032187
	for <meta-ti@yoctoproject.org>; Wed, 2 Mar 2016 10:51:18 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u22GpHoJ024657
	for <meta-ti@yoctoproject.org>; Wed, 2 Mar 2016 10:51:18 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Wed, 2 Mar 2016 10:51:17 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] ti-ipc: Update to GA version IPC 3.42
Thread-Index: AQHRdDfOrsH6wlh5+0+URZ+cenrovJ9GqASA//+2h6A=
Date: Wed, 2 Mar 2016 16:51:17 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905832A29C@DLEE11.ent.ti.com>
References: <1456891119-4169-1-git-send-email-sam.nelson@ti.com>
	<20160302151229.GC7505@edge>
In-Reply-To: <20160302151229.GC7505@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-ipc: Update to GA version IPC 3.42
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
X-List-Received-Date: Wed, 02 Mar 2016 16:51:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, March 02, 2016 10:12 AM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] ti-ipc: Update to GA version IPC 3.42
>=20
> On Tue, Mar 01, 2016 at 10:58:39PM -0500, Sam Nelson wrote:
> > Updated to GA version and commit for IPC 3.42 Added platform name for
> > 6678 Added additional platform for K2HK
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-ti/ipc/ti-ipc.inc | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> > index a7e1ed9..4620416 100644
> > --- a/recipes-ti/ipc/ti-ipc.inc
> > +++ b/recipes-ti/ipc/ti-ipc.inc
> > @@ -6,18 +6,18 @@ LIC_FILES_CHKSUM =3D
> > "file://${S}/ipc-linux.mak;beginline=3D1;endline=3D30;md5=3D7b327f9
> >
> >  TI_IPC_GIT_URI =3D "git://git.ti.com/ipc/ipcdev.git"
> >  TI_IPC_GIT_PROTOCOL =3D "git"
> > -TI_IPC_GIT_BRANCH =3D "ipc-next"
> > +TI_IPC_GIT_BRANCH =3D "3.42"
> >
> > -#Corresponds to 3.42.00.00_eng
> > -TI_IPC_SRCREV =3D "2b47e35ed72170e4e56906fb9ab93dd9ef385a38"
> > +#Corresponds to 3.42.00.02
> > +TI_IPC_SRCREV =3D "a520969994378fb2629d7dfc25f306c3a711b5bc"
> >
> >  BRANCH =3D "${TI_IPC_GIT_BRANCH}"
> >  SRC_URI =3D
> "${TI_IPC_GIT_URI};protocol=3D${TI_IPC_GIT_PROTOCOL};branch=3D${BRANCH}"
> >  SRCREV =3D "${TI_IPC_SRCREV}"
> >
> >  S =3D "${WORKDIR}/git"
> > -PV =3D "3.42.00.00"
> > -INC_PR =3D "r1"
> > +PV =3D "3.42.00.02"
> > +INC_PR =3D "r0"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > @@ -28,3 +28,6 @@ PLATFORM_k2hk-evm =3D "TCI6638"
> >  PLATFORM_k2l-evm =3D "TCI6630"
> >  PLATFORM_k2e-evm =3D "66AK2E"
> >  PLATFORM_k2g-evm =3D "66AK2G"
> > +PLATFORM_c667x-evm =3D "C6678"
>=20
> There's no c667x-evm in meta-ti.

Sorry I  did not realize c667x is not added yet.  Given that that will be c=
oming soon, when we upstream recipes from processor-sdk rtos, can we leave =
this in there?
Or do you want me to remove it.
>=20
>=20
> > +ALT_PLATFORM_k2hk-evm =3D "TCI6636"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


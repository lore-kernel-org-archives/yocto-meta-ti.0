Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BEE77E00D47; Fri,  5 Feb 2016 14:13:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F3F0E00D3C
	for <meta-ti@yoctoproject.org>; Fri,  5 Feb 2016 14:12:57 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u15MCuhP014551
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2016 16:12:56 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u15MCuw5009980
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2016 16:12:56 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Fri, 5 Feb 2016 16:12:56 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] ti-ipc: Update to new version 3.42.0.0_eng
Thread-Index: AQHRYEt37O4heH+FRU+xnFgEgLgIap8ePagA///GGRA=
Date: Fri, 5 Feb 2016 22:12:55 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490582EE8E2@DLEE11.ent.ti.com>
References: <1454700538-7424-1-git-send-email-sam.nelson@ti.com>
	<20160205193848.GW31480@edge>
In-Reply-To: <20160205193848.GW31480@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-ipc: Update to new version 3.42.0.0_eng
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
X-List-Received-Date: Fri, 05 Feb 2016 22:13:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes. It is backward compatible.
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, February 05, 2016 2:39 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] ti-ipc: Update to new version 3.42.0.0_eng
>=20
> Is it backward-compatible? Will it break any existing IPC uses?
>=20
>=20
> On Fri, Feb 05, 2016 at 02:28:58PM -0500, Sam Nelson wrote:
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-ti/ipc/ti-ipc.inc | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> > index 94a1657..f3b1bff 100644
> > --- a/recipes-ti/ipc/ti-ipc.inc
> > +++ b/recipes-ti/ipc/ti-ipc.inc
> > @@ -4,15 +4,15 @@
> HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:IPC"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://${S}/ipc-
> linux.mak;beginline=3D1;endline=3D30;md5=3D7b327f9b710fd7c95e545b91cec792=
55"
> >
> > -BRANCH =3D "3.41"
> > +BRANCH =3D "ipc-next"
> >
> >  SRC_URI =3D "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit;branch=3D$=
{BRANCH}"
> >
> > -#Corresponds to 3.41.00.08
> > -SRCREV =3D "7370abce2e3f2a09fd4b057fbbf9e7d3d029c0df"
> > +#Corresponds to 3.42.00.00_eng
> > +SRCREV =3D "2b47e35ed72170e4e56906fb9ab93dd9ef385a38"
> >
> >  S =3D "${WORKDIR}/git"
> > -PV =3D "3.41.00.08"
> > +PV =3D "3.42.00.00"
> >  INC_PR =3D "r0"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4754CE00C1F; Mon, 28 Nov 2016 07:36:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA740E00BF3
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2016 07:36:54 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id uASFase3028834
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2016 09:36:54 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uASFasuE031068
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2016 09:36:54 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 28 Nov 2016 09:36:53 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] mpm-transport: Update commit id with fixes
Thread-Index: AQHSPPOG4n9/iX267Uq7qFpAODA2sKDYo2RAgBX85jA=
Date: Mon, 28 Nov 2016 15:36:52 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490584F273E@DLEE11.ent.ti.com>
References: <1478961971-54163-1-git-send-email-sam.nelson@ti.com>
	<4F9216F96E5DF9428610502835A9F490584E16F9@DLEE11.ent.ti.com>
In-Reply-To: <4F9216F96E5DF9428610502835A9F490584E16F9@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [PATCH] mpm-transport: Update commit id with fixes
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
X-List-Received-Date: Mon, 28 Nov 2016 15:36:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch is good to go. Previously NAK because of reported failures. Look=
s like they are false alarm.
So this patch can be picked up.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Nelson, Sam
> Sent: Monday, November 14, 2016 10:49 AM
> To: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] mpm-transport: Update commit id with fixes
>=20
> NAK
> Ignore this.
>=20
> > -----Original Message-----
> > From: Nelson, Sam
> > Sent: Saturday, November 12, 2016 9:46 AM
> > To: meta-ti@yoctoproject.org
> > Cc: Nelson, Sam
> > Subject: [PATCH] mpm-transport: Update commit id with fixes
> >
> > Update and fixes to handle different type of memory sections in sysfs
> > entry or device tree.
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-ti/mpm-transport/mpm-transport_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-
> > ti/mpm-transport/mpm-transport_git.bb
> > index 51b5e9e..ee28f2f 100644
> > --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> > +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> > @@ -15,11 +15,11 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >  SRC_URI =3D "git://git.ti.com/keystone-linux/mpm-
> > transport.git;protocol=3Dgit;branch=3D${BRANCH}"
> >
> >  BRANCH =3D "master"
> > -# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.02.00 -
> > SRCREV =3D "696a9ec37559b671860ef393194c6032b7b6d9ef"
> > +# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.02.00A
> > SRCREV
> > +=3D "7284e75d36b265ef8535d2e2ee54d1f2c700e862"
> >
> >  PV =3D "2.0.2.0"
> > -PR =3D "r0"
> > +PR =3D "r1"
> >
> >  EXTRA_OEMAKE =3D "PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
> >  EXTRA_OEMAKE_append_k2hk-evm +=3D "HYPLNK_TRANSPORT=3Dtrue
> > SRIO_TRANSPORT=3Dtrue"
> > --
> > 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


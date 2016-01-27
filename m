Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6F67E008F5; Wed, 27 Jan 2016 10:54:50 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BF34E0079A
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 10:54:45 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RIsjot031853
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:45 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RIsjMg029896
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:45 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 27 Jan 2016 12:54:45 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Sam Nelson : linux-ti-staging: Work around to avoid
	race condition with external module
Thread-Index: AQHRV9UFnFCxvrhOiEqWEyrWdOpeu58PseEQ
Date: Wed, 27 Jan 2016 18:54:43 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490582E3A28@DLEE11.ent.ti.com>
References: <20151218010723.30EA852A14@arago-project.org>
	<20160126010013.GS11314@edge>
In-Reply-To: <20160126010013.GS11314@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: Sam Nelson : linux-ti-staging: Work around to avoid race condition with external module
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
X-List-Received-Date: Wed, 27 Jan 2016 18:54:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, this workaround needs to be copied to 4.1 recipe as well.  (As the pro=
blem itself will still exist in fido and the issue is not kernel specific)
With regards,
Sam

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, January 25, 2016 8:00 PM
> To: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Sam Nelson : linux-ti-staging: Work around to avoi=
d race
> condition with external module
>=20
> Sam,
>=20
> Is this still a problem on 4.1 kernel? Do we need to copy this work aroun=
d to
> 4.1 recipe in Fido branch?
>=20
>=20
> On Fri, Dec 18, 2015 at 01:07:23AM +0000, Arago Project git wrote:
> > Module: meta-ti
> > Branch: fido
> > Commit: 4f542c3fe47a8c6be195b3c97fd83efbf930bb70
> > URL:    http://arago-project.org/git/meta-
> ti.git?a=3Dcommit;h=3D4f542c3fe47a8c6be195b3c97fd83efbf930bb70
> >
> > Author: Sam Nelson <sam.nelson@ti.com>
> > Date:   Mon Dec 14 17:47:48 2015 +0000
> >
> > linux-ti-staging: Work around to avoid race condition with external mod=
ule
> >
> > - Currently there is an issue with compiling external kernel module
> > which depends on symbols from another kernel module which is part of th=
e
> > list of modules configured to be built as modules in the default config=
.
> > - This work around allows to avoid the issue by copying the module
> > symbols to the kernel directory after making the kernel modules build.
> > - This issue is already fixed in oe-core: master branch as of date
> > - This is just work around before updating to latest oe-core
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >
> > ---
> >
> >  recipes-kernel/linux/linux-ti-staging_3.14.bb |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> >
> > diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-
> kernel/linux/linux-ti-staging_3.14.bb
> > index 54530e4..88950ae 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > @@ -65,3 +65,7 @@ KERNEL_GIT_PROTOCOL =3D "git"
> >  SRC_URI +=3D
> "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D${BRANCH}
> \
> >              file://defconfig \
> >             "
> > +
> > +do_compile_kernelmodules_append() {
> > +	cp Module.symvers ${STAGING_KERNEL_BUILDDIR}/
> > +}
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


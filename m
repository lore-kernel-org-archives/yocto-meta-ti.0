Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58F9BE006D5; Tue, 20 Oct 2015 09:11:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58F65E0048C
	for <meta-ti@yoctoproject.org>; Tue, 20 Oct 2015 09:10:57 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9KGAvWI017404
	for <meta-ti@yoctoproject.org>; Tue, 20 Oct 2015 11:10:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9KGAulI030841
	for <meta-ti@yoctoproject.org>; Tue, 20 Oct 2015 11:10:57 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Tue, 20 Oct 2015 11:10:57 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] ti-softhsmv2: Update to new version 1.3.0.4
Thread-Index: AQHRCqYtvyMnqwBQoEuNakCyr4iKPJ5zo3aAgADlMiA=
Date: Tue, 20 Oct 2015 16:10:56 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058240523@DLEE11.ent.ti.com>
References: <1445283698-10019-1-git-send-email-sam.nelson@ti.com>
	<20151019210941.GJ5620@edge>
In-Reply-To: <20151019210941.GJ5620@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-softhsmv2: Update to new version 1.3.0.4
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
X-List-Received-Date: Tue, 20 Oct 2015 16:11:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, October 19, 2015 5:10 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] ti-softhsmv2: Update to new version 1.3.0.=
4
>=20
> On Mon, Oct 19, 2015 at 03:41:38PM -0400, Sam Nelson wrote:
> > - Update License checksum
>=20
> Don't take license changes lightly - please confirm the LICENSE field its=
elf
> hasn't changed and it's still OSRB approved.

Yes.  The updated text is part of the software manifest approved by OSRB.=20
The LICENSE field itself does not need to be updated as the new license tex=
t added is also based on GPLv2.
>=20
>=20
> > - Skip PR
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |    9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/t=
i-
> softhsmv2/ti-softhsmv2_git.bb
> > index 329fbaa..c1e1654 100644
> > --- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> > +++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "TI softhsmv2 package"
> >  LICENSE =3D "BSD-2-Clause | BSD-3-Clause | ISC | IBM-License | FSFULLR=
 |
> Zlib"
> > -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D55144a048ba54f211a1aaa38c7fd2424"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D664f3daf042b19d634189e709d5d558e"
> >  SECTION =3D "libs"
> >
> >  mntdir =3D "/mnt"
> > @@ -12,10 +12,9 @@ COMPATIBLE_MACHINE =3D "(tci6614-evm|keystone)"
> >
> >  BRANCH=3D"master"
> >  SRC_URI =3D "git://git.ti.com/keystone-linux/ti-
> softhsmv2.git;protocol=3Dgit;branch=3D${BRANCH}"
> > -#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.01
> > -SRCREV =3D "c79d93ac2a326567a7245dda1b903ef340b5650c"
> > -PV =3D "1.3.0.1"
> > -PR =3D "r1"
> > +#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.04
> > +SRCREV =3D "c2688afb9373309751e640088705cb739997665d"
> > +PV =3D "1.3.0.4"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


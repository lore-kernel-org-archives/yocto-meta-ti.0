Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFFD4E013B8
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 28 Feb 2012 11:45:59 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1SJjv0e031456;
	Tue, 28 Feb 2012 13:45:57 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SJjvAl022018;
	Tue, 28 Feb 2012 13:45:57 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Tue, 28 Feb 2012 13:45:58 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [PATCH] linux-davinci: quoting fixes
Thread-Index: AQHM9kSnKWLaIolLo06XgrbwOwhRI5ZStkPg
Date: Tue, 28 Feb 2012 19:45:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012F04312C@DLEE12.ent.ti.com>
References: <1330442197-10408-1-git-send-email-koen@dominion.thruhere.net>
	<20120228152205.GC10713@denix.org>
	<81A0AEEA-EB5D-4C82-ABD1-D6E05E7226F1@dominion.thruhere.net>
	<20120228181321.GD10713@denix.org>
In-Reply-To: <20120228181321.GD10713@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH] linux-davinci: quoting fixes
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 19:46:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Yeah, it is up to date in meta-arago so you can pull it from there.  We jus=
t need the patch into meta-ti to delete it since meta-arago now has it. =20

BTW, Koen, it is in meta-arago-extras layer so you should still be able to =
pull it into your angstrom builds.

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Tuesday, February 28, 2012 12:13 PM
> To: Koen Kooi
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] linux-davinci: quoting fixes
>=20
> On Tue, Feb 28, 2012 at 04:58:11PM +0100, Koen Kooi wrote:
> >
> > Op 28 feb. 2012, om 16:22 heeft Denys Dmytriyenko het volgende
> geschreven:
> >
> > > On Tue, Feb 28, 2012 at 04:16:37PM +0100, Koen Kooi wrote:
> > >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > >
> > > Thanks, I've started cleaning up missing quotes in other places
> too.
> >
> > I sent another patch to fix some more recipes, that gave up in
> the matrix dir.
>=20
> Yeah, matrix is the one I was fixing, but it needs to be removed
> from meta-ti
> anyway... I'll sync up the fixes from Arago.
>=20
> Denys
>=20
> > >> ---
> > >> recipes-kernel/linux/linux-davinci_git.bb |    8 ++++----
> > >> 1 files changed, 4 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/recipes-kernel/linux/linux-davinci_git.bb
> b/recipes-kernel/linux/linux-davinci_git.bb
> > >> index 1fda1ee..e4b85d6 100644
> > >> --- a/recipes-kernel/linux/linux-davinci_git.bb
> > >> +++ b/recipes-kernel/linux/linux-davinci_git.bb
> > >> @@ -22,13 +22,13 @@ ARAGO_L1_BR  =3D "master"
> > >> ARAGO_L1_PV  =3D "2.6.32+2.6.33-rc4-${PR}+gitr${SRCREV}"
> > >> ARAGO_L1_URI =3D "git://arago-project.org/git/projects/linux-
> omapl1.git;protocol=3Dgit;branch=3D${BRANCH} "
> > >>
> > >> -SRCREV_hawkboard                  =3D ${ARAGO_L1_REV}
> > >> +SRCREV_hawkboard                  =3D "${ARAGO_L1_REV}"
> > >>
> > >> -PV_omapl138             =3D ${ARAGO_L1_PV}
> > >> +PV_omapl138             =3D "${ARAGO_L1_PV}"
> > >>
> > >> -BRANCH_omapl138         =3D ${ARAGO_L1_BR}
> > >> +BRANCH_omapl138         =3D "${ARAGO_L1_BR}"
> > >>
> > >> -SRC_URI_append_omapl138 =3D ${ARAGO_L1_URI}
> > >> +SRC_URI_append_omapl138 =3D "${ARAGO_L1_URI}"
> > >>
> > >> SRC_URI_append_omapl138 =3D " file://logo_linux_clut224.ppm \
> > >>                                      file://0001-ahci-ti-Fix-
> currently-harmless-typo-in-SATA-PHY.patch \
> > >> --
> > >> 1.7.2.5
> > >>
> > >> _______________________________________________
> > >> meta-ti mailing list
> > >> meta-ti@yoctoproject.org
> > >> https://lists.yoctoproject.org/listinfo/meta-ti
> > >>
> >
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


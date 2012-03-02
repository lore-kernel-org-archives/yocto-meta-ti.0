Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6F8BE003E1
	for <meta-ti@yoctoproject.org>; Fri,  2 Mar 2012 07:49:33 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q22FnUas023382;
	Fri, 2 Mar 2012 09:49:30 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q22FnU0c003414;
	Fri, 2 Mar 2012 09:49:30 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Fri, 2 Mar 2012 09:49:30 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] Chase Maupin : linux-ti33x-psp: add am335x-evm support
Thread-Index: AQHM+ITmDql2EKCK3kWSgyCDscTkypZXGRyA
Date: Fri, 2 Mar 2012 15:49:29 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012F049DD6@DLEE12.ent.ti.com>
References: <20120301212837.C08F852A8A@arago-project.org>
	<50999BC3-EC35-4F51-BD1E-9F35FD9AD78C@dominion.thruhere.net>
In-Reply-To: <50999BC3-EC35-4F51-BD1E-9F35FD9AD78C@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Chase Maupin : linux-ti33x-psp: add am335x-evm support
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
X-List-Received-Date: Fri, 02 Mar 2012 15:49:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Koen,

Looks like my build was not clean.  I see now that when I clean everything =
even the am335x-evm build will fail to find the configs.  So now the questi=
on is why this happens.  I'm used to if the configs wasn't found in the bea=
glebone or am335x-evm directory, you would fall back to looking in the base=
 linux-ti33x-psp-3.2 directory.  However, it looks like this fallback does =
not happen.  My reading of FILESPATH is that the linux/linux-ti33x-psp-3.2 =
directory is in the FILESPATH.

Sincerely,
Chase Maupin
Software Applications
ARM MPU

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> Sent: Friday, March 02, 2012 8:58 AM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Chase Maupin : linux-ti33x-psp: add am335x-
> evm support
>=20
>=20
> Op 1 mrt. 2012, om 22:28 heeft Arago Project git het volgende
> geschreven:
>=20
> > Module: meta-ti
> > Branch: master
> > Commit: 8172b803e73126c2e336050d43251538bdc4d09b
> > URL:    http://arago-project.org/git/meta-
> ti.git?a=3Dcommit;h=3D8172b803e73126c2e336050d43251538bdc4d09b
> >
> > Author: Chase Maupin <Chase.Maupin@ti.com>
> > Date:   Tue Feb 28 17:28:14 2012 -0600
> >
> > linux-ti33x-psp: add am335x-evm support
> >
> > * Added a defconfig file for the am335x-evm and moved the common
> >  configs directory from the beaglebone directory to the top
> >  of the kernel files tree.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >
> > ---
> >
> > .../linux/linux-ti33x-psp-3.2/am335x-evm/defconfig | 2640
> ++++++++++++++++++++
> > .../{beaglebone =3D> }/configs/empty                 |    0
> > 2 files changed, 2640 insertions(+), 0 deletions(-)
>=20
> As Gary points out, this breaks the beaglebone kernel build
>=20
> regards,
>=20
> Koen


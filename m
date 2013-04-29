Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE856E01308
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 11:18:59 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3TIIx1M000343
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 13:18:59 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3TIIxNK023207
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 13:18:59 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 29 Apr 2013 13:18:59 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 2/2] linux-am335x-psp: Correct recipe name typo
Thread-Index: AQHOROW4oLBhrKkpBkeNjst2wWtE9Jjt1WUA//+sR3A=
Date: Mon, 29 Apr 2013 18:18:58 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C439A3B@DFLE08.ent.ti.com>
References: <1367245658-15077-1-git-send-email-fcooper@ti.com>
	<1367245658-15077-2-git-send-email-fcooper@ti.com>
	<20130429181635.GG27211@edge>
In-Reply-To: <20130429181635.GG27211@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] linux-am335x-psp: Correct recipe name typo
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
X-List-Received-Date: Mon, 29 Apr 2013 18:19:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What's the issue?
I can't find 1 kernel recipe where the kernel version is a part of the PN a=
nd not PV.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, April 29, 2013 1:17 PM
> To: Cooper Jr., Franklin
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 2/2] linux-am335x-psp: Correct recipe name =
typo
>=20
> NAK.
>=20
> On Mon, Apr 29, 2013 at 09:27:38AM -0500, Franklin S. Cooper Jr wrote:
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  ...x-am335x-psp-3.2.bb =3D> linux-am335x-psp_3.2.bb} |    0
> >  1 files changed, 0 insertions(+), 0 deletions(-)  rename
> > recipes-kernel/linux/{linux-am335x-psp-3.2.bb =3D>
> > linux-am335x-psp_3.2.bb} (100%)
> >
> > diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2.bb
> > b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> > similarity index 100%
> > rename from recipes-kernel/linux/linux-am335x-psp-3.2.bb
> > rename to recipes-kernel/linux/linux-am335x-psp_3.2.bb
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


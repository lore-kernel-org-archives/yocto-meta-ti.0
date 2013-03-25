Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5419AE013A7
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 06:54:13 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2PDs5cJ024598;
	Mon, 25 Mar 2013 08:54:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2PDs52R011211;
	Mon, 25 Mar 2013 08:54:05 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 25 Mar 2013 08:54:04 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 25 Mar 2013 08:54:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Enrico <ebutera@users.sourceforge.net>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: Add panda dts file as
	supported DTS
Thread-Index: AQHOKWANcKEkdV6idkCLzcES2kdEupi2bZXA
Date: Mon, 25 Mar 2013 13:54:04 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015949C50A@DLEE11.ent.ti.com>
References: <1364216750-29038-1-git-send-email-Chase.Maupin@ti.com>
	<CA+2YH7s7mmU0-uxSnQ0na2BE1oULz5Ouy5FX8qTBi=kX7DrGxQ@mail.gmail.com>
	<20130325135147.GD30363@denix.org>
In-Reply-To: <20130325135147.GD30363@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: Add panda dts file as supported DTS
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
X-List-Received-Date: Mon, 25 Mar 2013 13:54:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 25, 2013 8:52 AM
> To: Enrico
> Cc: Maupin, Chase; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] linux-ti-staging: Add panda dts
> file as supported DTS
>=20
> On Mon, Mar 25, 2013 at 02:37:03PM +0100, Enrico wrote:
> > On Mon, Mar 25, 2013 at 2:05 PM, Chase Maupin
> <Chase.Maupin@ti.com> wrote:
> > > * Add the omap5-panda.dts file as a supported DTS to be
> built.
> > >   This file is for use on the panda and uEVM boards.
> >
> > The name omap5-panda seems a bit misleading to me.
>=20
> You are not alone.
>=20
>=20
> > Or maybe there are plans for an omap5 pandaboard?
>=20
> Not any longer - it is now called uEVM and DTS will be renamed
> accordingly
> soon. Until then Chase is just adding the old existing DTS to the
> build.

Correct.  I'll update this when all the renames are worked out.

>=20
> --
> Denys


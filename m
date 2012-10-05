Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CF7AE00294
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 15:09:57 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95M9ue2008804;
	Fri, 5 Oct 2012 17:09:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95M9uFp030706;
	Fri, 5 Oct 2012 17:09:56 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 17:09:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Gary Thomas <gary@mlbassoc.com>
Thread-Topic: [meta-ti] [PATCH] wl12xx-firmware: Port wl12xx-firmware recipe
Thread-Index: AQHNo0VPU+nM68MTY0CxB9Fgbiy2tJerRHxA
Date: Fri, 5 Oct 2012 22:09:55 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159249A80@DLEE12.ent.ti.com>
References: <1349465081-10787-1-git-send-email-fcooper@ti.com>
	<506F2E82.8060906@mlbassoc.com>
	<CA+2YH7ucY8NoMMc28fxsVav2cCg=n_6mYvama9Ox4t0ZowVizA@mail.gmail.com>
	<6CF2DE49-0D65-4216-B374-805CE3754A17@ti.com>
	<506F57C5.7000400@mlbassoc.com> <20121005220335.GD27533@denix.org>
In-Reply-To: <20121005220335.GD27533@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] wl12xx-firmware: Port wl12xx-firmware recipe
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
X-List-Received-Date: Fri, 05 Oct 2012 22:09:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, October 05, 2012 5:04 PM
> To: Gary Thomas
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] wl12xx-firmware: Port wl12xx-
> firmware recipe
>=20
> On Fri, Oct 05, 2012 at 03:57:25PM -0600, Gary Thomas wrote:
> > On 2012-10-05 13:20, Cooper Jr., Franklin wrote:
> > >The custom git tree is wl12xx only not all the different
> components that linux-firmware provides. My understanding is that
> the team that works on wl12xx should be pushing it back to linux-
> firmware. But like I said this will contain the latest changes.
> >
> > I still don't think it should be separate.  If the upstream
> (TI) stuff
> > isn't being properly tracked (there should be an effort to make
> this so),
> > just add a .bbappend that fixes things.  I use these packages
> and I don't
> > want to have to track the "flavour of the week" to keep
> current.
>=20
> That would require extracting individual commits from the git
> tree and listing
> them in .bbappend. I would not personally mind that approach, but
> it may
> require extra work for the wireless team. We need to check with
> them...

Couldn't you use the bbappend to just change the SRC_URI and SRCREV?  Is th=
e issue the recipe name changing from linux-firmware to wl12xx-firmware?

Wireless team went with their own recipe because of the issues with trackin=
g/maintaining the patch set from their development team.  I know this may n=
ot make sense outside of TI but there is a development team in wireless mak=
ing and pushing changes to mainline and then there is the integration team =
responsible for providing the validated code drop.  I'm not saying this is =
a good work flow, but the integration team pushed to get a single repo of t=
he proper sources from the development team because the patch set was un-wi=
eldy.

That's just a little context of what I know about how these recipes were cr=
eated.  So again my question is what is the particular pain point you want =
to avoid?  The name of the recipe or something else?

>=20
> --
> Denys
>=20
>=20
> > >On Oct 5, 2012, at 2:09 PM, "Enrico"
> <ebutera@users.berlios.de> wrote:
> > >
> > >>On Fri, Oct 5, 2012 at 9:01 PM, Gary Thomas
> <gary@mlbassoc.com> wrote:
> > >>>On 2012-10-05 13:24, Franklin S. Cooper Jr wrote:
> > >>>>
> > >>>>* Port wl12xx-firmware recipe from arago. This recipe was
> originally
> > >>>>   named linux-firmware in arago.
> > >>>>* Wl12xx-firmware provides the firmware files for use with
> the TI
> > >>>>   Wi-Fi + Bluetooth module.
> > >>>>
> > >>>>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > >>>
> > >>>
> > >>>Why not just keep the main linux-firmware recipe up to date
> instead of
> > >>>duplicate
> > >>>functionality?
> > >>
> > >>
> > >>I made myself the same question at first, but the answer was
> there:
> > >>
> > >>
> > >>>>+# This recipe provides the latest firmware files for
> wl12xx.
> > >>>>+# Therefore, use the contents of this recipe instead of
> the contents
> > >>>>+# of linux-firmware-wl12xx.
> > >>
> > >>>>+SRC_URI =3D "git://github.com/TI-ECS/ti-
> utils.git;protocol=3Dgit"
> > >>
> > >>
> > >>Well one could ask why they are there and not in linux-
> firmware git
> > >>(not polemic, just curious).
> > >>
> > >>Enrico
> > >>_______________________________________________
> > >>meta-ti mailing list
> > >>meta-ti@yoctoproject.org
> > >>https://lists.yoctoproject.org/listinfo/meta-ti
> >
> > --
> > ------------------------------------------------------------
> > Gary Thomas                 |  Consulting for the
> > MLB Associates              |    Embedded world
> > ------------------------------------------------------------
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


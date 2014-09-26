Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE5C1E007DC; Fri, 26 Sep 2014 14:09:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93F07E00781
	for <meta-ti@yoctoproject.org>; Fri, 26 Sep 2014 14:09:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8QL9RjK026173
	for <meta-ti@yoctoproject.org>; Fri, 26 Sep 2014 16:09:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8QL9RJK013459
	for <meta-ti@yoctoproject.org>; Fri, 26 Sep 2014 16:09:27 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 26 Sep 2014 16:09:27 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [daisy][PATCH] dra7xx: add "mmip" to MACHINE_FEATURES
Thread-Index: AQHP0OEYcIwuQJoYlUqlQUimHB4uwJwQaa2wgAOFGJCAAFuqAP//rHfw
Date: Fri, 26 Sep 2014 21:09:26 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C73F0F5@DFLE08.ent.ti.com>
References: <1410784339-25597-1-git-send-email-j-stiffler@ti.com>
	<4B26FB5A64EBA14C87266869E037F958140B2C3B@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C73F08B@DFLE08.ent.ti.com>
	<20140926205521.GH6303@edge>
In-Reply-To: <20140926205521.GH6303@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [daisy][PATCH] dra7xx: add "mmip" to MACHINE_FEATURES
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
X-List-Received-Date: Fri, 26 Sep 2014 21:09:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, September 26, 2014 3:55 PM
> To: Cooper Jr., Franklin
> Cc: Stiffler, Jacob; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [daisy][PATCH] dra7xx: add "mmip" to
> MACHINE_FEATURES
>=20
> On Fri, Sep 26, 2014 at 08:33:39PM +0000, Cooper Jr., Franklin wrote:
> > So this patch shouldn't be needed.
> >
> > The only recipe that is using mmip is ipumm-fw. Currently the recipe
> > has COMPATIBLE_MACHINE set to only omap-a15. So why do we also
> need to
> > add this to the SOC family?
>=20
> The above statement is not correct.
>=20
> The flag mmip in MACHINE_FEATURES was introduced to handle cases of
> hardware accelerated multimedia, when some software components needs
> to be replaced with "forked" patched and modified versions. Take a look a=
t
> gstreamer pieces in meta-arago...
[Franklin] Ah. My grep was only in meta-ti  I missed the usage in meta-arag=
o.
>=20
>=20
> > Honestly for ipumm-fw the below code should be removed.
> > python __anonymous() {
> >      features =3D bb.data.getVar("MACHINE_FEATURES", d, 1)
> >      if not features:
> >          return
> >      if "mmip" not in features:
> >          raise bb.parse.SkipPackage('ipumm-fw does not apply to
> > systems without the "mmip" flag in MACHINE_FEATURES')  }
> >
> > Plus this patch will break things for am57xx-evm. By allowing this
> > change ipumm-fw would not be skipped for am57x evm and the current
> > recipe will fail because of it.
>=20
> So, am57xx-evm should not build and load ipumm-fw is what you are saying?
[Franklin] I didn't realize that dra7xx was used for am57x-evm. So it will =
build.

So this patch is fine but I'm still pretty confused by the usage of mmip. N=
ow that mmip is added to omap-a15 SOC family can we now remove skip package=
 code from all the various recipes that use mmip and simply replace it with=
 COMPATIBLE_MACHINE?

>=20
> --
> Denys
>=20
>=20
> > > -----Original Message-----
> > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
> > > Sent: Wednesday, September 24, 2014 9:42 AM
> > > To: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] [daisy][PATCH] dra7xx: add "mmip" to
> > > MACHINE_FEATURES
> > >
> > > ping
> > >
> > > -----Original Message-----
> > > From: Stiffler, Jacob
> > > Sent: Monday, September 15, 2014 8:32 AM
> > > To: meta-ti@yoctoproject.org
> > > Cc: Stiffler, Jacob
> > > Subject: [daisy][PATCH] dra7xx: add "mmip" to MACHINE_FEATURES
> > >
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > >  conf/machine/include/dra7xx.inc |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/conf/machine/include/dra7xx.inc
> > > b/conf/machine/include/dra7xx.inc index 857e1b3..a7c8782 100644
> > > --- a/conf/machine/include/dra7xx.inc
> > > +++ b/conf/machine/include/dra7xx.inc
> > > @@ -1,4 +1,4 @@
> > >  require conf/machine/include/omap-a15.inc  SOC_FAMILY_append =3D
> > > ":dra7xx"
> > >
> > > -MACHINE_FEATURES +=3D "pci"
> > > +MACHINE_FEATURES +=3D "pci mmip"
> > > --
> > > 1.7.9.5
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35EACE008CE; Thu, 30 Oct 2014 06:12:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D368FE008C9
	for <meta-ti@yoctoproject.org>; Thu, 30 Oct 2014 06:12:36 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9UDCZl5025914
	for <meta-ti@yoctoproject.org>; Thu, 30 Oct 2014 08:12:35 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9UDCZVq030977
	for <meta-ti@yoctoproject.org>; Thu, 30 Oct 2014 08:12:35 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 30 Oct 2014 08:12:35 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [daisy][PATCH v2] dra7xx: add "mmip" to
	MACHINE_FEATURES
Thread-Index: AQHP4vDkifuYUKaFAEyhjm4ZtIomH5wna98AgAKe9ACAA+3H4IAax8OQ
Date: Thu, 30 Oct 2014 13:12:35 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140B7433@DFLE09.ent.ti.com>
References: <1412770244-3829-1-git-send-email-j-stiffler@ti.com>
	<20141009031315.GA13128@edge> <20141010191442.GC13128@edge>
	<4B26FB5A64EBA14C87266869E037F958140B5B0F@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958140B5B0F@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [daisy][PATCH v2] dra7xx: add "mmip" to MACHINE_FEATURES
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
X-List-Received-Date: Thu, 30 Oct 2014 13:12:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Stiffler, Jacob
Sent: Monday, October 13, 2014 8:16 AM
To: Dmytriyenko, Denys
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [daisy][PATCH v2] dra7xx: add "mmip" to MACHINE_FEAT=
URES

Denys,

What is the error you see? And what are you building?

I have not seen any issues when building for "arago-amsdk-image"


- Jake

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, October 10, 2014 3:15 PM
To: Stiffler, Jacob
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [daisy][PATCH v2] dra7xx: add "mmip" to MACHINE_FEAT=
URES

Unofrtunately, I spent my time fixing the devkit and toolchain issues, so I=
 don't have much time to look into this one. It is failing in devkit packag=
ing step due to conflicts between different variants of gstreamer. I'll pro=
bably revert this change for now and will deal with it when I'm back. Jake,=
 let me know if you have a fix for it before that. Thanks.

--=20
Denys


On Wed, Oct 08, 2014 at 11:13:16PM -0400, Denys Dmytriyenko wrote:
> Ah, this causes some grief to dra7xx and am57x builds due to gstreamer=20
> conflicts. I guess we need to play with preferred provider settings some =
more.=20
> I'll look into it tomorrow...
>=20
>=20
> On Wed, Oct 08, 2014 at 08:10:44AM -0400, Jacob Stiffler wrote:
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  conf/machine/include/dra7xx.inc |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra=
7xx.inc
> > index 857e1b3..a7c8782 100644
> > --- a/conf/machine/include/dra7xx.inc
> > +++ b/conf/machine/include/dra7xx.inc
> > @@ -1,4 +1,4 @@
> >  require conf/machine/include/omap-a15.inc
> >  SOC_FAMILY_append =3D ":dra7xx"
> > =20
> > -MACHINE_FEATURES +=3D "pci"
> > +MACHINE_FEATURES +=3D "pci mmip"
> > --=20
> > 1.7.9.5
> >=20
> > --=20
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
--=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 853AEE00E47; Thu, 25 Jan 2018 13:32:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9929BE00C45
	for <meta-ti@yoctoproject.org>; Thu, 25 Jan 2018 13:32:21 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0PLWLZ1028438
	for <meta-ti@yoctoproject.org>; Thu, 25 Jan 2018 15:32:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516915941;
	bh=/Eyp18n/Rsz7k8FvdIPyY40ErlZXHtWNLqw3gR/aOzw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=jfj7lsE88EY4EL+5ZgLNPHGzI/f8mWG5c06H8rJbCer/gP0CrJQY4oFQB4JPfTHLD
	ZuFeyHeKM60391TCcF8z+EkuvMc5Ejnaw1Y9vLVy9u2wYwGBBPHm6CVMRZRM/E4Jwd
	yciQDW0FSDcXeBT2kPt8hOumpL3R151os+4cNJok=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0PLWKjF006589
	for <meta-ti@yoctoproject.org>; Thu, 25 Jan 2018 15:32:21 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 25 Jan 2018 15:32:20 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Thu, 25 Jan 2018 15:32:20 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Molfetta, Stephen"
	<sjmolfetta@ti.com>
Thread-Topic: [meta-ti]  [PATCH] dra7xx-evm.conf: removing am57xx SOCS from PDK
Thread-Index: AQHTlJfMcg2nrIHq50CTp1QUTshYG6ODZpaAgAH2gYD//6rnYA==
Date: Thu, 25 Jan 2018 21:32:20 +0000
Message-ID: <d8380c1e785e4bbab45298193dd509c3@ti.com>
References: <1516652148-16513-1-git-send-email-sjmolfetta@ti.com>
	<20180123221621.GA10142@edge> <5606eef4743d48e58e43f19ac4f6b606@ti.com>
	<20180125191522.GC12398@edge>
In-Reply-To: <20180125191522.GC12398@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] dra7xx-evm.conf: removing am57xx SOCS from PDK
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
X-List-Received-Date: Thu, 25 Jan 2018 21:32:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, January 25, 2018 2:15 PM
> To: Molfetta, Stephen
> Cc: Stiffler, Jacob; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] dra7xx-evm.conf: removing am57xx SOCS
> from PDK
>=20
> Jake?
>

I would like to run a test build to make sure nothing else fails. I will tr=
y to provide an update tomorrow.
=20
>=20
> On Wed, Jan 24, 2018 at 08:16:51AM -0500, Molfetta, Stephen wrote:
> >    Yes, please merge into morty.
> >
> >    Agreed on where PDK SOCs ought to be set, but I'm not sure whether t=
his
> >    will break am57xx builds right now and will let Jake comment further=
.
> >
> >    Thanks,
> >    Stephen
> >
> >    -----Original Message-----
> >    From: Dmytriyenko, Denys
> >    Sent: Tuesday, January 23, 2018 4:16 PM
> >    To: Molfetta, Stephen; Stiffler, Jacob
> >    Cc: meta-ti@yoctoproject.org
> >    Subject: Re: [meta-ti] [PATCH] dra7xx-evm.conf: removing am57xx SOCS
> from
> >    PDK
> >
> >    I assume, you want this merged into morty too, correct?
> >
> >    This change is fine with me, but I'd go even further and move settin=
g
> >    initial TI_PDK_LIMIT_SOCS from omap-a15.inc into am57xx-evm.conf
> >
> >    Jake,
> >
> >    Do you have any comments?
> >
> >    On Mon, Jan 22, 2018 at 02:15:48PM -0600, Stephen Molfetta wrote:
> >    > opencl-monitor does not distinguish between dra7xx and am57xx
> devices,
> >    > treating both as the same and attempting to build for am57xx
> regardless.
> >    > However, this is dependent on common-csl-ip-rtos, a component of
> PDK,
> >    > which in general does handle these devices differently.  The defin=
ition
> >    > of am57xx SOCs in the PDK list from omap-15.conf gets inherited by
> >    > dra7xx-evm.conf, thereby creating a rule that all dra7xx PDK recip=
es
> >    > must build am57xx libraries. This results in a dra7xx image which =
is
> >    > much larger than necessary, and more severely, creates an artifica=
l
> >    > dependency link between these two devices and introduces build
> failures
> >    > for various PDK recipes.
> >    >
> >    > Instead, we now override the PDK SOC definition in dra7xx-evm.conf=
,
> and
> >    > only in the CSL RTOS recipe do we append the am57xx SOCS for dra7x=
x-
> evm
> >    > machine build.  This allows for opencl-monitor to build successful=
ly for
> >    > dra7xx while preventing any other PDK recipes from attempting to b=
uild
> >    > libraries for am57xx devices.
> >    >
> >    > This is a workaround that must stay in place until opencl build ca=
n
> >    > properly comprehend am57xx and dra7xx independently, and/or omap-
> a15
> >    > is not implied to be synonymous with am57xx in various recipes.
> >    >
> >    > Signed-off-by: Stephen Molfetta <sjmolfetta@ti.com>
> >    > ---
> >    >  conf/machine/dra7xx-evm.conf                        | 2 +-
> >    >  recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 5 ++++-
> >    >  2 files changed, 5 insertions(+), 2 deletions(-)
> >    >
> >    > diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-
> evm.conf
> >    > index 91afd85..7db9ff6 100644
> >    > --- a/conf/machine/dra7xx-evm.conf
> >    > +++ b/conf/machine/dra7xx-evm.conf
> >    > @@ -40,4 +40,4 @@ UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 20=
48"
> >    >
> >    >  # Set the list of device targets for ti-pdk class recipes
> >    >  TI_PDK_LIMIT_BOARDS =3D "evmDRA72x evmDRA75x evmDRA78x"
> >    > -TI_PDK_LIMIT_SOCS_append =3D " dra72x dra75x dra78x"
> >    > +TI_PDK_LIMIT_SOCS =3D "dra72x dra75x dra78x"
> >    > diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> >    b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> >    > index f4496b9..100d2f4 100644
> >    > --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> >    > +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> >    > @@ -1,5 +1,5 @@
> >    >  require common-csl-ip.inc
> >    > -PR =3D "${INC_PR}.5"
> >    > +PR =3D "${INC_PR}.6"
> >    >
> >    >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >    >  COMPATIBLE_MACHINE_append =3D "|c66x"
> >    > @@ -16,3 +16,6 @@ export DEST_ROOT=3D"${S}"
> >    >
> >    >  # HTML doc link params
> >    >  PDK_COMP_LINK_TEXT =3D "CSL-Chip Support Library"
> >    > +
> >    > +# Workaround: dra7xx build requires am57xx CSL libraries for
> >    opencl-monitor
> >    > +TI_PDK_LIMIT_SOCS_append_dra7xx =3D " am571x am572x"
> >    > --
> >    > 2.7.4
> >    >
> >    > --
> >    > _______________________________________________
> >    > meta-ti mailing list
> >    > meta-ti@yoctoproject.org
> >    > https://lists.yoctoproject.org/listinfo/meta-ti


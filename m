Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD5E2E0071C; Wed,  2 Nov 2016 01:17:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD17FE006E9
	for <meta-ti@yoctoproject.org>; Wed,  2 Nov 2016 01:17:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id uA28GxxD007602
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2016 03:17:00 -0500
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uA28GwPe018794
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2016 03:16:59 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id uA28Gt4U014257
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2016 13:46:57 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0294.000; Wed, 2 Nov 2016 13:46:54 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] ti-sgx-ddk-km: remove dependency between
	user-mode and kernel-mode builds
Thread-Index: AQHSLutkHVVtmKzvUEqGrbqMKQIrt6DCRIiAgAMf8tA=
Date: Wed, 2 Nov 2016 08:16:53 +0000
Message-ID: <05CF4794C98B244ABDC620C109037622C02F01CB@DBDE04.ent.ti.com>
References: <1476362286-27157-1-git-send-email-anandb@ti.com>
	<20161025181246.GN12745@edge>
	<4B26FB5A64EBA14C87266869E037F958143257CA@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958143257CA@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.171.114]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-sgx-ddk-km: remove dependency between user-mode and kernel-mode builds
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
X-List-Received-Date: Wed, 02 Nov 2016 08:17:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Jake,

The intermittent part is surprising. Build issues are typically Boolean. Wi=
ll check and let you know.=20

Regards,
Anand

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Monday, October 31, 2016 7:32 PM
To: Dmytriyenko, Denys; Balagopalakrishnan, Anand
Cc: meta-ti@yoctoproject.org
Subject: RE: [meta-ti] [PATCH] ti-sgx-ddk-km: remove dependency between use=
r-mode and kernel-mode builds



> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-=20
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, October 25, 2016 2:13 PM
> To: Balagopalakrishnan, Anand
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] ti-sgx-ddk-km: remove dependency=20
> between user-mode and kernel-mode builds
>=20
> Anand,
>=20
> am57xx-evm is now breaking with this at do_compile():
>=20
> /bin/sh: eurasiacon/binary2_omap_linux_release/target/install.sh: No=20
> such file or directory
>=20

I am also seeing this issue. However, it does not appear to be specific to =
am57xx-evm, but intermittent for all machines.

> --
> Denys
>=20
>=20
> On Thu, Oct 13, 2016 at 06:08:06PM +0530, Anand Balagopalakrishnan wrote:
> > Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> > ---
> >  recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git=20
> > a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> > index 7007c20..d0e9206 100644
> > --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> > +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> > @@ -25,7 +25,7 @@ BRANCH =3D "ti-img-sgx/${PV}/k4.4"
> >  SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-
> linux.git;protocol=3Dgit;branch=3D${BRANCH}"
> >  S =3D "${WORKDIR}/git"
> >
> > -SRCREV =3D "a5a0fe1799cabfa1278321b667263cf3fa2cf32f"
> > +SRCREV =3D "e68719ba7c54602c710b6615cd665f5b7f47f85e"
> >
> >  TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
> >  TARGET_PRODUCT_ti33x =3D "ti335x"
> > --
> > 1.9.1
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


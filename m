Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 521DBE007E1; Mon,  9 May 2016 10:00:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06A91E0077E
	for <meta-ti@yoctoproject.org>; Mon,  9 May 2016 10:00:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u49H0RIx006559
	for <meta-ti@yoctoproject.org>; Mon, 9 May 2016 12:00:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u49H0RUO018733
	for <meta-ti@yoctoproject.org>; Mon, 9 May 2016 12:00:27 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Mon, 9 May 2016 12:00:26 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [fido][PATCH] omap5-sgx-ddk-um-linux: Add DEPENDS
	based on REDEPENDS
Thread-Index: AQHRqhCVSjP+8z5hGUSCxXRoSOOYRZ+xJ9uA//+sc3A=
Date: Mon, 9 May 2016 17:00:26 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581426E802@DFLE09.ent.ti.com>
References: <1462811630-25842-1-git-send-email-j-stiffler@ti.com>
	<20160509165901.GF16188@edge>
In-Reply-To: <20160509165901.GF16188@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [fido][PATCH] omap5-sgx-ddk-um-linux: Add DEPENDS based on REDEPENDS
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
X-List-Received-Date: Mon, 09 May 2016 17:00:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, May 09, 2016 12:59 PM
> To: Stiffler, Jacob
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [fido][PATCH] omap5-sgx-ddk-um-linux: Add DEPENDS
> based on REDEPENDS
>=20
> Looks fine. What about master?
>=20

I am checking the patch right now.

>=20
> On Mon, May 09, 2016 at 12:33:50PM -0400, Jacob Stiffler wrote:
> > * The omap5-sgx-ddk-um-linux recipe installs pre-built libraries
> > * Because of this, the dependencies are given as RDEPENDS as they are
> >   not needed for building the recipe
> > * However, this may break recipes which depend on
> >   omap5-sgx-ddk-um-linux, as the omap5-sgx-ddk-um-linux dependencies
> >   may not yet be populated in the sysroot.
> > * This resolves the break in the dependency chain by translating the
> >   RDEPENDS into a list of DEPENDS
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb | 3 ++=
-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
> linux_1.14.3699939.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-
> linux_1.14.3699939.bb
> > index a79c61f..a4a00b9 100644
> > --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
> > +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
> > @@ -19,9 +19,10 @@ INITSCRIPT_PARAMS =3D "defaults 8"
> >
> >  inherit update-rc.d
> >
> > -PR =3D "r8"
> > +PR =3D "r9"
> >  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2"
> >
> > +DEPENDS +=3D "libdrm udev libgbm wayland libffi"
> >  RDEPENDS_${PN} +=3D "libdrm libudev libgbm wayland libffi libdrm-omap"
> >
> >  RREPLACES_${PN} =3D "libegl libgles1 libgles2"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


Return-Path: <prabu@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA273E01483
	for <meta-ti@yoctoproject.org>; Mon, 17 Jun 2013 19:31:56 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5I2VqHQ027854;
	Mon, 17 Jun 2013 21:31:53 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5I2Vn2p007817;
	Mon, 17 Jun 2013 21:31:50 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Tue, 18 Jun 2013 10:31:49 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Prabindh Sundareson
	<prabindh@yahoo.com>
Thread-Topic: [meta-ti] [PATCH 06/10] libgles-omap3: Add missing RPROVIDES
Thread-Index: AQHOUMlnxR8r9GaqmUmJLcl3AGqz/pkFHfKAgDT4iQCAAN8WIA==
Date: Tue, 18 Jun 2013 02:31:48 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB50382@DBDE04.ent.ti.com>
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
	<1367501964-6294-6-git-send-email-prabu@ti.com>
	<20130514173131.GD31835@denix.org>
	<1368591321.48894.YahooMailNeo@web125603.mail.ne1.yahoo.com>
	<20130617211024.GD12618@edge>
In-Reply-To: <20130617211024.GD12618@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 06/10] libgles-omap3: Add missing RPROVIDES
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
X-List-Received-Date: Tue, 18 Jun 2013 02:31:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Denys,

No, these are not dlopen'ed libraries.=20

regards,
Prabu

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, June 18, 2013 2:40 AM
To: Prabindh Sundareson
Cc: Sundareson, Prabindh; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 06/10] libgles-omap3: Add missing RPROVIDES

Prabu,

By "libraries that are dynamically loaded at runtime", do you mean shared l=
ibraries or rather libraries loaded with dlopen() [1]? The latter one would=
 explain why they are not automatically handled by shlib code, as it only d=
etects shared libraries, AFAIK...

[1] http://tldp.org/HOWTO/Program-Library-HOWTO/dl-libraries.html

--
Denys


On Tue, May 14, 2013 at 09:15:21PM -0700, Prabindh Sundareson wrote:
> Denys,
>=20
> How can this be confirmed ? Any other list to ask ?
>=20
>=20
> regards
> Prabu
>=20
>=20
> ________________________________
>  From: Denys Dmytriyenko <denys@ti.com>
> To: Prabindh Sundareson <prabu@ti.com>=20
> Cc: meta-ti@yoctoproject.org=20
> Sent: Tuesday, May 14, 2013 11:01 PM
> Subject: Re: [meta-ti] [PATCH 06/10] libgles-omap3: Add missing RPROVIDES
> =20
>=20
> On Thu, May 02, 2013 at 07:09:20PM +0530, Prabindh Sundareson wrote:
> > RPROVIDES specifies the libraries that are dynamically loaded
> > at runtime. This patch fixes "no package provides libGLESv2.so" and
> > similar errors that occur when including packages like qtbase.
>=20
> I'm still somewhat not sure about this patch. I know you had this problem=
 with=20
> Qt5, but I'm wondering if there's a bug with shlib handling in latest OE,=
 as=20
> you ususally don't need to specify shared libs in RPROVIDES...
>=20
>=20
> > Signed-off-by: Prabindh Sundareson <prabu@ti.com>
> > ---
> >=A0 recipes-graphics/libgles/libgles-omap3.inc |=A0 =A0 1 +
> >=A0 1 files changed, 1 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graph=
ics/libgles/libgles-omap3.inc
> > index d08a04d..c33062a 100644
> > --- a/recipes-graphics/libgles/libgles-omap3.inc
> > +++ b/recipes-graphics/libgles/libgles-omap3.inc
> > @@ -201,6 +201,7 @@ PRIVATE_LIBS_${PN}-es5 =3D "libGLESv2.so libIMGegl.=
so libsrv_um.so libpvr2d.so lib
> >=A0 PRIVATE_LIBS_${PN}-es6 =3D "libGLESv2.so libIMGegl.so libsrv_um.so l=
ibpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so lib=
GLES_CM.so"
> >=A0 PRIVATE_LIBS_${PN}-es8 =3D "libGLESv2.so libIMGegl.so libsrv_um.so l=
ibpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so lib=
GLES_CM.so"
> >=A0=20
> > +RPROVIDES_${PN} +=3D "libGLESv2.so libEGL.so libGLES_CM.so libpvr2d.so=
 libIMGegl.so libsrv_init.so libsrv_um.so libsrv_um_dri.so libglslcompiler.=
so"
> >=A0=20
> >=A0 PACKAGES =3D+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN=
}-linuxfbwsegl"
> >=A0=20
> > --=20
> > 1.7.1
> >=20
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56653E01415
	for <meta-ti@yoctoproject.org>; Wed,  4 Sep 2013 22:14:37 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r855EZC6007185
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2013 00:14:35 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r855EVdF011583
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2013 00:14:33 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Thu, 5 Sep 2013 13:14:31 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCHv2] libgles: Added prebuilt userspace
	libraries for graphics acceleration
Thread-Index: AQHOjEQxE6RLQjA1Q0Se/WVmrlj7R5mcF9NggACroAD//4QkAIAXtNgAgALYPYA=
Date: Thu, 5 Sep 2013 05:14:30 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D5451C23@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D54445D0@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101596CBD7C@DLEE11.ent.ti.com>
	<20130819154524.GC7460@edge> <20130903174638.GH22235@edge>
In-Reply-To: <20130903174638.GH22235@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: [PATCHv2] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Thu, 05 Sep 2013 05:14:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I had sent a v3 patch for this earlier. Resending it if missed.

Regards,
Mrinmayee

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, September 03, 2013 11:17 PM
> To: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCHv2] libgles: Added prebuilt userspace
> libraries for graphics acceleration
>=20
> Mrinmayee,
>=20
> Ping on this one too.
>=20
>=20
> On Mon, Aug 19, 2013 at 11:45:24AM -0400, Denys Dmytriyenko wrote:
> > On Mon, Aug 19, 2013 at 03:09:55PM +0000, Maupin, Chase wrote:
> > > >-----Original Message-----
> > > >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > >bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
> > > >Sent: Sunday, August 18, 2013 11:55 PM
> > > >To: meta-ti@yoctoproject.org
> > > >Subject: [meta-ti] [PATCHv2] libgles: Added prebuilt userspace
> > > >libraries for graphics acceleration
> > > >
> > > >
> > > >Subject: [PATCHv2] libgles: Added prebuilt userspace libraries for
> > > >graphics acceleration
> > > >
> > > >* These libraries are not distributable in source and hence
> > > >  are available only as binary. They implement OpenGLES 1.x and
> > > >  OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
> > > >  class of devices.
> > > >
> > > >v2:
> > > >
> > > >Addressed Chases's comments:
> > > >* Updated the PR
> > > >* Added shasum for the tarball
> > > >* Removed redundant FILES section.
> > > >
> > > >Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > > >Signed-off-by: Siddharth Heroor <heroor@ti.com>
> > > >---
> > > > .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   20
> > > >++++++++++++++++++++
> > > > 1 file changed, 20 insertions(+)
> > > > create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-
> > > >linux_1.9.0.10.bb
> > > >
> > > >diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
> > > >linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-
> > > >linux_1.9.0.10.bb
> > > >new file mode 100644
> > > >index 0000000..052f343
> > > >--- /dev/null
> > > >+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> > > >@@ -0,0 +1,20 @@
> > > >+DESCRIPTION =3D "Userspace libraries for sgx"
> > > >+HOMEPAGE =3D "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
> > > >+LICENSE =3D "TI"
> > > >+
> > > >+SRC_URI =3D
> > > >"http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/
> > > >gfxsdk/OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-linux-
> > > >${PV}.tar.gz;protocol=3Dhttp"
> > > >+
> > > >+LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-
> > > >Manifest.doc;md5=3Dd280df8e94bb2e7b9251c8526078eeb8"
> > > >+
> > > >+PR =3D "r0"
> > > >+
> > > >+SRC_URI[md5sum] =3D "3cfb875de031098a4c1eeeaf4e442367"
> > > >+SRC_URI[shasum] =3D "773299242fc72a5837b7e17053123ad55d69723b"
> > >
> > > This should be a sha256sum.  So your checksum is too small and you
> > > need to specify SRC_URI[sh256sum]
> >
> > You can also just run a recipe once through bitbake and it will tell
> > you there are no checksums and provide a handy cut and paste lines to
> populate them.
> >
> >
> > > >+
> > > >+S =3D "${WORKDIR}/${PN}-${PV}"
> > > >+
> > > >+do_install () {
> > > >+    oe_runmake install DESTDIR=3D${D} }
> > > >+
> > > >+FILES_${PN} +=3D " ${libdir}/gbm/"
> > > >--
> > > >1.7.9.5
> > > >
> > > >_______________________________________________
> > > >meta-ti mailing list
> > > >meta-ti@yoctoproject.org
> > > >https://lists.yoctoproject.org/listinfo/meta-ti
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


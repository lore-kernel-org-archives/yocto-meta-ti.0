Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C274E00985; Tue,  9 Dec 2014 12:04:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DDC6E0097F
	for <meta-ti@yoctoproject.org>; Tue,  9 Dec 2014 12:04:35 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB9K4YjM002948
	for <meta-ti@yoctoproject.org>; Tue, 9 Dec 2014 14:04:34 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB9K4YJC024283
	for <meta-ti@yoctoproject.org>; Tue, 9 Dec 2014 14:04:34 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 9 Dec 2014 14:04:33 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-ti] [PATCH] mmap-lld; Add new recipe for mmap lld
Thread-Index: AQHQA+6Jz6Ry8pnetEauB0zT/8VdtpxoktyAgAHBCACAEicScIALU9xw
Date: Tue, 9 Dec 2014 20:04:33 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490580E5093@DLEE11.ent.ti.com>
References: <1416397621-20552-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D375D5C@DLEE11.ent.ti.com>
	<20141120195300.GD31396@edge>
	<4F9216F96E5DF9428610502835A9F490580D964B@DLEE11.ent.ti.com>
In-Reply-To: <4F9216F96E5DF9428610502835A9F490580D964B@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] mmap-lld; Add new recipe for mmap lld
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
X-List-Received-Date: Tue, 09 Dec 2014 20:04:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Nelson, Sam
> Sent: Tuesday, December 02, 2014 10:08 AM
> To: Dmytriyenko, Denys; Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] mmap-lld; Add new recipe for mmap lld
>=20
> Denys & Chase,
>=20
> Can you please advise on further action on this?
>=20
> With regards,
> Sam
>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, November 20, 2014 2:53 PM
> > To: Maupin, Chase
> > Cc: Nelson, Sam; meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] mmap-lld; Add new recipe for mmap lld
> >
> > Chase,
> >
> > I had pretty much all the same questions before. Please see the discuss=
ion
> > we
> > had previously on hyplnk-lld patch:
> >
> > http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/4651
> >
> > --
> > Denys
> >
> >
> > On Wed, Nov 19, 2014 at 05:05:51PM +0000, Maupin, Chase wrote:
> > >
> > > diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-
> > bsp/mmap-lld/mmap-lld-test_git.bb
> > > new file mode 100755
> > > index 0000000..41e46f7
> > > --- /dev/null
> > > +++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
> > > @@ -0,0 +1,40 @@
> > > +DESCRIPTION =3D "TI KEYSTONE MMAP driver test binaries "
> > > +include mmap-lld.inc
> > > +
> > > +DEPENDS=3D"common-csl-ip mmap-lld"
> > > +RDEPENDS_${PN}=3D"uio-module-drv"
> > > +
> > > +DEVICELIST =3D "k2h \
> > > +              k2k \
> > > +              k2e \
> > > +"
> > >
> > > I don't have a fundamental issue with a single  recipe for all device=
s, but
> > would it be easier to make this per device and then keep a generic bina=
ry
> > name?  i.e. a machine specific recipe that installs the binary build fo=
r that
> > device into the file system?
> > >
> > > +
> > > +CHOICELIST =3D " yes \
> > > +               no \
> > > +"
> > > +
> > > +do_compile () {
> > > +	for device in ${DEVICELIST}
> > > +	do
> > > +		make -f makefile_armv7 clean \
> > > +			PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
> > > +			DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}"
> > > +		for choice in ${CHOICELIST}
> > > +		do
> > > +			make -f makefile_armv7 tests examples \
> > > +				PDK_INSTALL_PATH=3D${STAGING_INCDIR} \
> > > +				DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}" \
> > > +				USEDYNAMIC_LIB=3D"$choice"
> > > +		done
> > >
> > > What is the purpose for both choice options?  Are you expecting users=
 to
> > use both?
> > >
> > > +	done
> > > +}
> > > +
> > > +do_install () {
> > > +	for device in ${DEVICELIST}
> > > +	do
> > > +		make -f makefile_armv7 installbin \
> > > +		PDK_INSTALL_PATH=3D${STAGING_INCDIR} \
> > > +		DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}" \
> > > +		INSTALL_BIN_BASE_DIR=3D"${D}/${bindir}"
> > > +	done
> > > +}
> > > diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-
> > lld/mmap-lld.inc
> > > new file mode 100644
> > > index 0000000..b8a5b32
> > > --- /dev/null
> > > +++ b/recipes-bsp/mmap-lld/mmap-lld.inc
> > > @@ -0,0 +1,16 @@
> > > +LICENSE =3D "BSD-3-Clause"
> > > +
> > > +COMPATIBLE_MACHINE =3D "keystone"
> > > +
> > > +LIC_FILES_CHKSUM =3D
> > "file://COPYING.txt;md5=3Db3315b8190036fe1c6a8263d02e15606"
> > >
> > > Nit pick here but can this checksum go after the LICENSE setting?
> > >
> > > +
> > > +
> > > +BRANCH=3D"master"
> > > +SRC_URI =3D "git://git.ti.com/keystone-rtos/mmap-
> > lld.git;destsuffix=3Dgit/ti/runtime/mmap;protocol=3Dgit;branch=3D${BRAN=
CH}"
> > > +# Commit correspond to DEV.MMAP.02.00.00.03 SRCREV =3D
> > > +"601f9284c392f67bb7f69ed1a5df5231a43c3137"
> > >
> > > I would put the SRCREV in the _git file, not in the .inc since you wo=
uld
> > expect the .inc to be common across all versions.  I guess you are usin=
g the
> > .inc to handle the different test vs driver recipes.  Maybe a better id=
ea
> would
> > be a single recipe that builds both but package the driver as the defau=
lt
> > package and make a new PACKAGE for the test applications?
> > >
> > > +
> > > +PV=3D"2.0.0"
> > > +PR =3D "r0"
> > > +
> > > +S =3D "${WORKDIR}/git/ti/runtime/mmap"
> > > \ No newline at end of file
> > > diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-
> > lld/mmap-lld_git.bb
> > > new file mode 100755
> > > index 0000000..3a56a62
> > > --- /dev/null
> > > +++ b/recipes-bsp/mmap-lld/mmap-lld_git.bb
> > > @@ -0,0 +1,12 @@
> > > +DESCRIPTION =3D "TI KEYSTONE mmap driver using Keystone MPAX
> > Programming"
> > > +include mmap-lld.inc
> > > +
> > > +DEPENDS=3D"common-csl-ip"
> > > +
> > > +do_compile () {
> > > +	make -f makefile_armv7 clean lib
> > PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> > > +}
> > > +
> > > +do_install () {
> > > +	make -f makefile_armv7 install
> > PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> > > +INSTALL_INC_BASE_DIR=3D${D}/${includedir}
> > > +INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> > > +}
> > > --
> > > 1.7.9.5
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


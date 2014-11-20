Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52CAFE008E5; Thu, 20 Nov 2014 09:42:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08F2CE0086F
	for <meta-ti@yoctoproject.org>; Thu, 20 Nov 2014 09:42:15 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAKHgFlK026294
	for <meta-ti@yoctoproject.org>; Thu, 20 Nov 2014 11:42:15 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAKHgF1a032611
	for <meta-ti@yoctoproject.org>; Thu, 20 Nov 2014 11:42:15 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 20 Nov 2014 11:42:14 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] mmap-lld; Add new recipe for mmap lld
Thread-Index: AQHQA+6Jz6Ry8pnetEauB0zT/8VdtpxoktyAgAETANA=
Date: Thu, 20 Nov 2014 17:42:14 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490580AB720@DLEE11.ent.ti.com>
References: <1416397621-20552-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D375D5C@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D375D5C@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 20 Nov 2014 17:42:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Maupin, Chase
> Sent: Wednesday, November 19, 2014 12:06 PM
> To: Nelson, Sam; meta-ti@yoctoproject.org
> Subject: RE: [meta-ti] [PATCH] mmap-lld; Add new recipe for mmap lld
>=20
>=20
> diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap=
-
> lld/mmap-lld-test_git.bb
> new file mode 100755
> index 0000000..41e46f7
> --- /dev/null
> +++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
> @@ -0,0 +1,40 @@
> +DESCRIPTION =3D "TI KEYSTONE MMAP driver test binaries "
> +include mmap-lld.inc
> +
> +DEPENDS=3D"common-csl-ip mmap-lld"
> +RDEPENDS_${PN}=3D"uio-module-drv"
> +
> +DEVICELIST =3D "k2h \
> +              k2k \
> +              k2e \
> +"
>=20
> I don't have a fundamental issue with a single  recipe for all devices, b=
ut
> would it be easier to make this per device and then keep a generic binary
> name?  i.e. a machine specific recipe that installs the binary build for =
that
> device into the file system?
>=20
[Sam]  This was originally done to keep the same test root file system for =
multiple devices.=20
That said, right now there are some components  still need separate target =
builds and binaries.  So we currently do have multiple file systems. But ou=
r long term objective is still to have a single file system. I would prefer=
 to leave it this way for now.
Also note that this is just for the test builds. Library itself is made dev=
ice independent.
> +
> +CHOICELIST =3D " yes \
> +               no \
> +"
> +
> +do_compile () {
> +	for device in ${DEVICELIST}
> +	do
> +		make -f makefile_armv7 clean \
> +			PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
> +			DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}"
> +		for choice in ${CHOICELIST}
> +		do
> +			make -f makefile_armv7 tests examples \
> +				PDK_INSTALL_PATH=3D${STAGING_INCDIR} \
> +				DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}" \
> +				USEDYNAMIC_LIB=3D"$choice"
> +		done
>=20
> What is the purpose for both choice options?  Are you expecting users to =
use
> both?
>=20
[Sam] Note, that these are test builds. We create both the test build s: on=
e uses dynamic shared library and another test build which uses static libr=
ary.
There is already suggestion on this to actually make it as a separate targe=
t instead of Build time option. ( That is in progress and will take time to=
 get that in). With the current code this is needed for now. Will go away p=
robably with makefile updates getting done in the driver later.
> +	done
> +}
> +
> +do_install () {
> +	for device in ${DEVICELIST}
> +	do
> +		make -f makefile_armv7 installbin \
> +		PDK_INSTALL_PATH=3D${STAGING_INCDIR} \
> +		DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}" \
> +		INSTALL_BIN_BASE_DIR=3D"${D}/${bindir}"
> +	done
> +}
> diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-
> lld/mmap-lld.inc
> new file mode 100644
> index 0000000..b8a5b32
> --- /dev/null
> +++ b/recipes-bsp/mmap-lld/mmap-lld.inc
> @@ -0,0 +1,16 @@
> +LICENSE =3D "BSD-3-Clause"
> +
> +COMPATIBLE_MACHINE =3D "keystone"
> +
> +LIC_FILES_CHKSUM =3D
> "file://COPYING.txt;md5=3Db3315b8190036fe1c6a8263d02e15606"
>=20
> Nit pick here but can this checksum go after the LICENSE setting?
>=20
[Sam] I will fix this.
> +
> +
> +BRANCH=3D"master"
> +SRC_URI =3D "git://git.ti.com/keystone-rtos/mmap-
> lld.git;destsuffix=3Dgit/ti/runtime/mmap;protocol=3Dgit;branch=3D${BRANCH=
}"
> +# Commit correspond to DEV.MMAP.02.00.00.03 SRCREV =3D
> +"601f9284c392f67bb7f69ed1a5df5231a43c3137"
>=20
> I would put the SRCREV in the _git file, not in the .inc since you would =
expect
> the .inc to be common across all versions.  I guess you are using the .in=
c to
> handle the different test vs driver recipes.  Maybe a better idea would b=
e a
> single recipe that builds both but package the driver as the default pack=
age
> and make a new PACKAGE for the test applications?
>=20
[Sam] Currently the .inc is just capturing the common parts of the recipe. =
=20
Currently we are not having different versions supported at the same time.
The separate recipe is done intentionally to make the test application inde=
pendent of the library and depend on the Sysroot directory and not on anyth=
ing local.
( See also discussion on hyplnk-lld recipe for discussion on this).
> +
> +PV=3D"2.0.0"
> +PR =3D "r0"
> +
> +S =3D "${WORKDIR}/git/ti/runtime/mmap"
> \ No newline at end of file
> diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-
> lld/mmap-lld_git.bb
> new file mode 100755
> index 0000000..3a56a62
> --- /dev/null
> +++ b/recipes-bsp/mmap-lld/mmap-lld_git.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION =3D "TI KEYSTONE mmap driver using Keystone MPAX
> Programming"
> +include mmap-lld.inc
> +
> +DEPENDS=3D"common-csl-ip"
> +
> +do_compile () {
> +	make -f makefile_armv7 clean lib
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> +}
> +
> +do_install () {
> +	make -f makefile_armv7 install
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> +INSTALL_INC_BASE_DIR=3D${D}/${includedir}
> +INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> +}
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


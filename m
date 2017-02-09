Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBDA6E009B8; Thu,  9 Feb 2017 12:57:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14493E0094C
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2017 12:57:14 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v19KvExB024541
	for <meta-ti@yoctoproject.org>; Thu, 9 Feb 2017 14:57:14 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v19KvEuk005255
	for <meta-ti@yoctoproject.org>; Thu, 9 Feb 2017 14:57:14 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 9 Feb 2017 14:57:13 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] multiprocmgr-test: Add test c66x images,
	sources and scripts to package
Thread-Index: AQHSglI5FkfNbljVxU6hKI2kuhqiAaFhYLSA///IlTA=
Date: Thu, 9 Feb 2017 20:57:13 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905855077D@DLEE11.ent.ti.com>
References: <1486589279-48191-1-git-send-email-sam.nelson@ti.com>
	<20170209181441.GF2612@edge>
In-Reply-To: <20170209181441.GF2612@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] multiprocmgr-test: Add test c66x images, sources and scripts to package
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
X-List-Received-Date: Thu, 09 Feb 2017 20:57:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It can go in both krogoth and morty. ( patches created using master)
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, February 09, 2017 1:15 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] multiprocmgr-test: Add test c66x images,
> sources and scripts to package
>=20
> Sam,
>=20
> Is this for krogoth or morty? Would be nice to specify in the subject...
>=20
>=20
> On Wed, Feb 08, 2017 at 04:27:59PM -0500, Sam Nelson wrote:
> > multiprocmgr-test installs source files, host binaries and associated
> >     scripts (ti/examples/mpm/test)
> > multiprocmgr-rtos-test installs the C66x test images in the same
> > directory structure.
> >
> > Other updates include
> > - Use of oe_runmake instead of make
> > - Added runtime dependency of multiprocmgr-rtos-test & bash
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb | 24
> > +++++++++++++++++++-----
> > recipes-ti/multiprocmgr/multiprocmgr-test_git.bb | 21
> > ++++++++++++++++-----
> >  2 files changed, 35 insertions(+), 10 deletions(-)
> >
> > diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
> > b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
> > index 061790b..c88f0d7 100644
> > --- a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
> > +++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
> > @@ -6,22 +6,36 @@ require recipes-ti/multiprocmgr/multiprocmgr.inc
> >
> >  DEPENDS =3D "ti-cgt6x-native"
> >
> > -PR =3D "${INC_PR}.0"
> > +PR =3D "${INC_PR}.1"
> >
> > -export LOCAL_SYSROOT=3D"${STAGING_DIR_TARGET}"
> > -export
> C6X_GEN_INSTALL_PATH=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> > +PACKAGES =3D+ "${PN}-test"
> > +FILES_${PN}-test =3D
> "${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/buil
> d/bin/*.out \
> > +                    ${datadir}/ti/examples/mpm/test/sync_test/c66x/bin=
/*.out"
> > +
> > +EXTRA_OEMAKE =3D "LOCAL_SYSROOT=3D"${STAGING_DIR_TARGET}" \
> > +
> C6X_GEN_INSTALL_PATH=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> > +               "
> >
> >  do_compile() {
> > -    make c66x
> > -    make test_c66x
> > +    oe_runmake c66x
> > +    oe_runmake test_c66x
> >  }
> >
> >  do_install() {
> >      install -d ${D}${MPM_INSTALL_DIR_RECIPE}
> >      cp -pPrf ${S}/* ${D}${MPM_INSTALL_DIR_RECIPE}
> > +
> > +    # Copy C66x binaries
> > +    install -d
> ${D}${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/b
> uild/bin
> > +    cp ${S}/test/filetestdemo/c66x/demo_loopback/build/bin/*.out \
> > +
> ${D}${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/b
> uild/bin/
> > +    install -d ${D}${datadir}/ti/examples/mpm/test/sync_test/c66x/bin
> > +    cp ${S}/test/sync_test/c66x/bin/*.out \
> > +        ${D}${datadir}/ti/examples/mpm/test/sync_test/c66x/bin/
> >  }
> >
> >  FILES_${PN}-dev +=3D "${MPM_INSTALL_DIR_RECIPE}"
> >  INSANE_SKIP_${PN}-dev =3D "arch"
> > +INSANE_SKIP_${PN}-test =3D "arch"
> >
> >  ALLOW_EMPTY_${PN} =3D "1"
> > diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
> > b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
> > index 7ec8796..f01d651 100644
> > --- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
> > +++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
> > @@ -2,22 +2,33 @@ DESCRIPTION =3D "TI Multiproc Manager test code"
> >
> >  include multiprocmgr.inc
> >
> > -PR =3D "${INC_PR}.1"
> > +PR =3D "${INC_PR}.2"
> >
> >  DEPENDS =3D "multiprocmgr cmem"
> >  RDEPENDS_${PN} =3D "multiprocmgr mpm-transport cmem"
> > +RDEPENDS_${PN} +=3D "multiprocmgr-rtos-test bash"
> >
> >  CC +=3D "-I${STAGING_KERNEL_DIR}/include"
> >
> >  # Assuming the multiprocmgr kernel API is safe  CC[vardepsexclude] =3D
> > "STAGING_KERNEL_DIR"
> >
> > +FILES_${PN} +=3D "\
> > +    ${datadir}/ti/examples/mpm \
> > +"
> > +
> > +FILES_${PN}-dbg +=3D "\
> > +    ${datadir}/ti/examples/mpm/*/.debug \ "
> > +
> >  do_compile() {
> > -	make -C ${S} test
> > +	oe_runmake -C ${S} test
> >  }
> >
> >  do_install() {
> > -	install -d ${D}${bindir}/
> > -	install -c -m 755 ${S}/test/filetestdemo/host/bin/demo_filetest
> ${D}${bindir}/mpm_demo_filetest
> > -	install -c -m 755 ${S}/test/sync_test/host/bin/sync_test
> ${D}${bindir}/mpm_sync_test
> > +	# Copy Sources and binary
> > +	install -d ${D}${datadir}/ti/examples/mpm/src
> > +	cp -r ${S}/src/mailbox ${D}${datadir}/ti/examples/mpm/src
> > +	cp -r ${S}/src/sync ${D}${datadir}/ti/examples/mpm/src
> > +	cp -r ${S}/test ${D}${datadir}/ti/examples/mpm
> >  }
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


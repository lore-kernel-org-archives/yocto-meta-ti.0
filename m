Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 872F4E0086E; Tue,  3 Feb 2015 19:03:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28FEEE00828
	for <meta-ti@yoctoproject.org>; Tue,  3 Feb 2015 19:03:24 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1433NGB026604
	for <meta-ti@yoctoproject.org>; Tue, 3 Feb 2015 21:03:23 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1433MCP026095
	for <meta-ti@yoctoproject.org>; Tue, 3 Feb 2015 21:03:22 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Tue, 3 Feb 2015 21:03:22 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] ipsecmgr: Add recipe for ipsec manager
Thread-Index: AQHQP/kYodrBpr3uokm82A2Yco0aAJzf2lEA///z3KA=
Date: Wed, 4 Feb 2015 03:03:21 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905810EEEC@DLEE11.ent.ti.com>
References: <1422999226-5198-1-git-send-email-sam.nelson@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7F6039@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C7F6039@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ipsecmgr: Add recipe for ipsec manager
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
X-List-Received-Date: Wed, 04 Feb 2015 03:03:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 Thanks for the suggestion. I  will split the recipe into two.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Tuesday, February 03, 2015 4:46 PM
> To: Nelson, Sam; meta-ti@yoctoproject.org
> Subject: RE: [meta-ti] [PATCH] ipsecmgr: Add recipe for ipsec manager
>=20
> I'm not sure why we do it but for the graphics sdk we create two recipes.=
 One
> for the userspace libraries and another one for the kernel modules. So I =
would
> assume something similar should be done here.
>=20
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Nelson, Sam
> > Sent: Tuesday, February 03, 2015 3:34 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH] ipsecmgr: Add recipe for ipsec manager
> >
> > - Provides module and library to offload IPSec security  policy & assoc=
iated
> > security association to NETCP for  crypto operations
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-bsp/ipsecmgr/ipsecmgr_git.bb |   52
> > ++++++++++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644 recipes-bsp/ipsecmgr/ipsecmgr_git.bb
> >
> > diff --git a/recipes-bsp/ipsecmgr/ipsecmgr_git.bb b/recipes-
> > bsp/ipsecmgr/ipsecmgr_git.bb
> > new file mode 100644
> > index 0000000..2fb6c1a
> > --- /dev/null
> > +++ b/recipes-bsp/ipsecmgr/ipsecmgr_git.bb
> > @@ -0,0 +1,52 @@
> > +SUMMARY =3D "IPSec Manager kernel module and libraries"
> > +DESCRIPTION =3D "Provides ability to offload IPSec security policy &
> > associated security association to NETCP for crypto operations"
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D
> > "file://ipsecmgr_snoop.h;beginline=3D1;endline=3D33;md5=3Df7eadca4fb559=
9f508
> > dc11fa1e752919"
> > +
> > +BRANCH=3D"master"
> > +SRC_URI =3D "git://arago-
> > project.org/git/projects/ipsecmgr.git;protocol=3Dgit;branch=3D${BRANCH}=
"
> > +#Commit ID corresponding to DEV.IPSECMGR.01.01.00.03 SRCREV =3D
> > +"1ea8355ae9142311901c842c97a58d2846b308e6"
> > +PV     =3D "01.01.00.03"
> > +
> > +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> > +PR =3D "${MACHINE_KERNEL_PR}"
> > +
> > +DEPENDS =3D "libnl libnl-xfrm"
> > +
> > +S =3D "${WORKDIR}/git"
> > +LIB_BUILD_DIR =3D "${S}/build"
> > +MODULE_BUILD_DIR =3D "${S}/src/module"
> > +LIB_INC_DIR =3D "${S}/"
> > +UTILS_LIB_INC_DIR =3D "${S}/utils/iface/"
> > +
> > +EXTRA_OEMAKE +=3D "KDIR=3D"${STAGING_KERNEL_DIR}""
> > +CFLAGS +=3D "-I${STAGING_INCDIR}/libnl3"
> > +
> > +inherit module
> > +
> > +do_compile() {
> > +# Compile the library
> > +	cd ${LIB_BUILD_DIR}
> > +	make clean
> > +	make all
> > +
> > +# Compile kernel module
> > +	cd ${MODULE_BUILD_DIR}
> > +	oe_runmake clean
> > +	oe_runmake
> > +}
> > +
> > +do_install() {
> > +# Install libraries
> > +	install -d ${D}${libdir}/
> > +	install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_snoop.a
> > ${D}${libdir}/
> > +	install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_ipc.a ${D}${libdir}/
> > +	install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_syslog.a
> > ${D}${libdir}/
> > +	install -d ${D}${includedir}/
> > +	install -c -m 666 ${LIB_INC_DIR}/*.h ${D}${includedir}/
> > +	install -c -m 666 ${UTILS_LIB_INC_DIR}/*.h ${D}${includedir}/ #
> > +Install kernel module
> > +	cd ${MODULE_BUILD_DIR}
> > +	oe_runmake INSTALL_MOD_PATH=3D"${D}" install }
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


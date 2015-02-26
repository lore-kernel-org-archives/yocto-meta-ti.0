Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4F639E0084F; Thu, 26 Feb 2015 09:57:47 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A6CCE0077E
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 09:57:44 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QHvhnA012572
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 11:57:43 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QHvgPO009952
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 11:57:42 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 26 Feb 2015 11:57:42 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2] netapi: Add recipe for NETAPI module
Thread-Index: AQHQUINbU4QfDTfAvU+ZT8ApJHuU+50Djh0A//+sJDA=
Date: Thu, 26 Feb 2015 17:57:41 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490581267D2@DLEE11.ent.ti.com>
References: <1424817827-5585-1-git-send-email-sam.nelson@ti.com>
	<20150226165718.GC6052@edge>
In-Reply-To: <20150226165718.GC6052@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2] netapi: Add recipe for NETAPI module
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
X-List-Received-Date: Thu, 26 Feb 2015 17:57:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, February 26, 2015 11:57 AM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v2] netapi: Add recipe for NETAPI module
>=20
> On Tue, Feb 24, 2015 at 05:43:47PM -0500, Sam Nelson wrote:
> > - Provide TI user space network library and test code
> > - Supports k2h, k2k, k2l & k2e devices
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Changes from previous patch
> > - Modifed recipes to use oe_runmake for the applications as well
> > ---
> > ---
> >  recipes-ti/netapi/netapi-test_git.bb |   49
> ++++++++++++++++++++++++++++++++++
> >  recipes-ti/netapi/netapi.inc         |   16 +++++++++++
> >  recipes-ti/netapi/netapi_git.bb      |   34 +++++++++++++++++++++++
> >  3 files changed, 99 insertions(+)
> >  create mode 100644 recipes-ti/netapi/netapi-test_git.bb
> >  create mode 100644 recipes-ti/netapi/netapi.inc
> >  create mode 100644 recipes-ti/netapi/netapi_git.bb
> >
> > diff --git a/recipes-ti/netapi/netapi-test_git.bb b/recipes-ti/netapi/n=
etapi-
> test_git.bb
> > new file mode 100644
> > index 0000000..9d49c29
> > --- /dev/null
> > +++ b/recipes-ti/netapi/netapi-test_git.bb
> > @@ -0,0 +1,49 @@
> > +DESCRIPTION =3D "Provides test and application binaries using NETAPI
> module"
> > +COMPATIBLE_MACHINE =3D "keystone"
> > +DEPENDS =3D "netapi ipsecmgr"
> > +
> > +include netapi.inc
> > +
> > +EXTRA_OEMAKE =3D "PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
> > +
> > +do_compile () {
> > +#   Build the netapi binaries
> > +	for device in ${DEVICELIST}
> > +	do
> > +		for choice in ${CHOICELIST}
> > +		do
> > +			oe_runmake -f makefile_armv7 tests
> NETAPI_SRC_DIR=3D${S} NETAPI_INC_DIR=3D${BASEDIR} \
> > +				USEDYNAMIC_LIB=3D"$choice"
> DEVICE=3D"$device"
> > +		done
> > +
> > +#     Now build the netapi appplications
> > +		cd ${S}/applications/ipsec_offload/ipsecmgr/build
> > +		oe_runmake clean NETAPI_SRC_DIR=3D${S} DEVICE=3D"$device"
> > +		oe_runmake app NETAPI_SRC_DIR=3D${S} DEVICE=3D"$device"
> > +
> > +		cd ${S}/applications/ipsec_offload/config-app/build
> > +		oe_runmake clean DEVICE=3D"$device"
> > +		oe_runmake app DEVICE=3D"$device"
> > +		cd ${S}
> > +	done
> > +}
> > +
> > +do_install () {
> > +	for device in ${DEVICELIST}
> > +	do
> > +		oe_runmake -f makefile_armv7 installbin
> INSTALL_INC_BASE_DIR=3D${D}/${includedir} \
> > +			INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> INSTALL_BIN_BASE_DIR=3D${D}${bindir} \
> > +			SYSCONFDIR=3D${D}${sysconfdir} DEVICE=3D"$device"
> > +
> > +		cd ${S}/applications/ipsec_offload/ipsecmgr/build
> > +		oe_runmake install \
> > +			INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> SYSCONFDIR=3D${D}${sysconfdir} \
> > +			DEVICE=3D"$device"
> > +
> > +		cd ${S}/applications/ipsec_offload/config-app/build
> > +		oe_runmake install \
> > +			INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> SYSCONFDIR=3D${D}${sysconfdir} \
> > +			DEVICE=3D"$device"
> > +		cd ${S}
> > +	done
> > +}
> > diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.in=
c
> > new file mode 100644
> > index 0000000..b8d481a
> > --- /dev/null
> > +++ b/recipes-ti/netapi/netapi.inc
> > @@ -0,0 +1,16 @@
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/git/COPYING.txt;md5=3Df2b4f162358b1ffaf3f2307287ca207
> 4"
> > +
> > +BRANCH =3D "master"
> > +SRC_URI =3D "git://git.ti.com/keystone-
> rtos/netapi.git;protocol=3Dgit;branch=3D${BRANCH}"
> > +
> > +# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.04"
> > +SRCREV=3D "dc08af268200908d3d8a456ac852c65c53d2fd12"
> > +PV =3D "01.01.00.04"
> > +
> > +DEVICELIST =3D "k2h k2k k2l k2e"
> > +
> > +CHOICELIST =3D "yes no"
> > +
> > +BASEDIR =3D "${WORKDIR}/git"
> > +S =3D "${BASEDIR}/ti/runtime/netapi"
> > diff --git a/recipes-ti/netapi/netapi_git.bb b/recipes-ti/netapi/netapi=
_git.bb
> > new file mode 100644
> > index 0000000..d568cd0
> > --- /dev/null
> > +++ b/recipes-ti/netapi/netapi_git.bb
> > @@ -0,0 +1,34 @@
> > +DESCRIPTION =3D "Provides NETAPI module: TI user space network library=
"
> > +
> > +COMPATIBLE_MACHINE =3D "keystone"
> > +
> > +DEPENDS =3D "common-csl-ip rm-lld qmss-lld cppi-lld sa-lld hplib pktli=
b nwal-
> lld"
> > +
> > +NAME =3D "netapi"
>=20
> Sorry, didn't notice it at first - what is this NAME variable for?
[Sam] Looks like not needed. I will send update patch.
>=20
>=20
> > +include netapi.inc
> > +
> > +EXTRA_OEMAKE =3D "-f makefile_armv7
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
> > +
> > +do_compile () {
> > +#   Now build the netapi
> > +	for device in ${DEVICELIST}
> > +	do
> > +		for choice in ${CHOICELIST}
> > +		do
> > +			oe_runmake  clean NETAPI_SRC_DIR=3D${S}
> NETAPI_INC_DIR=3D${BASEDIR} \
> > +				USEDYNAMIC_LIB=3D"$choice"
> DEVICE=3D"$device"
> > +			oe_runmake lib NETAPI_SRC_DIR=3D${S}
> NETAPI_INC_DIR=3D${BASEDIR} \
> > +				USEDYNAMIC_LIB=3D"$choice"
> DEVICE=3D"$device"
> > +		done
> > +	done
> > +}
> > +
> > +do_install () {
> > +	for device in ${DEVICELIST}
> > +	do
> > +		oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir} \
> > +			INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> INSTALL_BIN_BASE_DIR=3D${D}${bindir} \
> > +			SYSCONFDIR=3D${D}${sysconfdir} DEVICE=3D"$device"
> > +	done
> > +}
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


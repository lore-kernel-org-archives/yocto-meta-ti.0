Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62C64E00DD9; Thu, 21 Dec 2017 09:25:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B457AE00D9C
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 09:25:08 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBLHP6o5016404;
	Thu, 21 Dec 2017 11:25:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513877106;
	bh=h/zDhU43XCkRcU8IfzvAO99fWf2dvVArIXR4eUY72i0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=FoMQguyMjTMi2hxQzesXsZS+Bx+eGqsJ5ZP3hdwWn/OU/LmRiEhiBV/weZYMy5Rrw
	AgVZNl8uL+oc2OyS9QWkmQSTyMizen2z06ekmhraU/+5Z5qR6C4dsXXuY4q5NvD57P
	wg3jywSuqKikPH4VDRC6ebMxBLHiHHRCx4jtP1KI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBLHP6pW000359;
	Thu, 21 Dec 2017 11:25:06 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 21 Dec 2017 11:25:06 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Thu, 21 Dec 2017 11:25:06 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [EXTERNAL] Re: [meta-ti] [morty][PATCH v3] ti-xdctools: extend
	to native and nativesdk
Thread-Index: AQHTen8xEvBXp222AEaCZbgGe212sqNOC9/A
Date: Thu, 21 Dec 2017 17:25:06 +0000
Message-ID: <3870d67e3aa74deb8ff3f7eba1956848@ti.com>
References: <1513447575-21127-1-git-send-email-denys@ti.com>
	<20171221171303.GE5984@edge>
In-Reply-To: <20171221171303.GE5984@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "Mertz, Timothy" <timothy.mertz@garmin.com>
Subject: Re: [EXTERNAL] Re: [morty][PATCH v3] ti-xdctools: extend to native and nativesdk
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
X-List-Received-Date: Thu, 21 Dec 2017 17:25:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

Acked-by: Jacob Stiffler <j-stiffler@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, December 21, 2017 12:13 PM
> To: meta-ti@yoctoproject.org
> Cc: Mertz, Timothy
> Subject: [EXTERNAL] Re: [meta-ti] [morty][PATCH v3] ti-xdctools: extend t=
o
> native and nativesdk
>=20
> Are there any objections to this change? If not, I'll merge this soon to =
morty
> and, with some modifications, to rocko and master. Thanks.
>=20
>=20
> On Sat, Dec 16, 2017 at 01:06:15PM -0500, Denys Dmytriyenko wrote:
> > From: "Mertz, Timothy" <timothy.mertz@garmin.com>
> >
> > ti-xdctools should be a native recipe as it more accurately reflects ho=
w
> > it is supposed to be used. In addition, this allows it to be built as
> > nativesdk and included in SDK image tools
> >
> > Signed-off-by: "Mertz, Timothy" <timothy.mertz@garmin.com>
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > v3 - fix ipumm-fw build by passing native sysroot of xdctools
> >
> >  classes/ti-pdk.bbclass                                    | 2 +-
> >  recipes-bsp/dspdce-fw/dspdce-fw_git.bb                    | 2 +-
> >  recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb               | 2 +-
> >  recipes-bsp/ipumm-fw/ipumm-fw_git.bb                      | 4 +++-
> >  recipes-devtools/gdbc6x/gdbserver-c6x_git.bb              | 2 +-
> >  recipes-ti/c6accel/ti-c6accel.inc                         | 2 +-
> >  recipes-ti/codec-engine/ti-codec-engine.inc               | 2 +-
> >  recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb  | 2 +-
> >  recipes-ti/devtools/ti-xdctools_3.50.03.33.bb             | 4 ++++
> >  recipes-ti/dmai/ti-dmai.inc                               | 2 +-
> >  recipes-ti/dsplink/ti-dsplink.inc                         | 2 +-
> >  recipes-ti/includes/ti-paths.inc                          | 2 +-
> >  recipes-ti/ipc/ti-ipc-examples-linux_git.bb               | 2 +-
> >  recipes-ti/ipc/ti-ipc-examples_git.bb                     | 2 +-
> >  recipes-ti/ipc/ti-ipc-rtos_git.bb                         | 2 +-
> >  recipes-ti/local-power-manager/ti-local-power-manager.inc | 2 +-
> >  recipes-ti/openmp-rtos/openmp-rtos_git.bb                 | 2 +-
> >  recipes-ti/syslink/ti-syslink.inc                         | 2 +-
> >  18 files changed, 23 insertions(+), 17 deletions(-)
> >
> > diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> > index f876802..b84b161 100644
> > --- a/classes/ti-pdk.bbclass
> > +++ b/classes/ti-pdk.bbclass
> > @@ -3,7 +3,7 @@ require recipes-ti/includes/ti-staging.inc
> >
> >  inherit perlnative
> >
> > -DEPENDS =3D "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rto=
s
> libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-cgt=
-
> pru-native ti-pdk-build-rtos"
> > +DEPENDS =3D "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl=
-ip-
> rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native t=
i-
> cgt-pru-native ti-pdk-build-rtos"
> >
> >  DEPENDS_append_omap-a15 =3D " ti-cgt-arm-native"
> >  DEPENDS_remove_ti33x =3D "ti-cgt6x-native"
> > diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-
> bsp/dspdce-fw/dspdce-fw_git.bb
> > index 2bada7b..2756c2d 100644
> > --- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> > +++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> > @@ -17,7 +17,7 @@ require recipes-ti/includes/ti-paths.inc
> >  PR =3D "r4"
> >  inherit update-alternatives
> >
> > -DEPENDS =3D "ti-xdctools ti-sysbios ti-codec-engine ti-framework-
> components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
> > +DEPENDS =3D "ti-xdctools-native ti-sysbios ti-codec-engine ti-framewor=
k-
> components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
> >
> >  export HWVERSION =3D "ES10"
> >  export BIOSTOOLSROOT =3D "${STAGING_DIR_TARGET}/usr/share/ti"
> > diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-
> bsp/edma3-lld/edma3-lld-rtos_git.bb
> > index 08ab4ec..f7bc0b1 100644
> > --- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> > +++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> > @@ -3,7 +3,7 @@ require recipes-ti/includes/ti-paths.inc
> >
> >  PR =3D "${INC_PR}.1"
> >
> > -DEPENDS =3D "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-cgt-ar=
m-
> native ti-cgt6x-native"
> > +DEPENDS =3D "ti-sysbios ti-xdctools-native gcc-arm-none-eabi-native ti=
-cgt-
> arm-native ti-cgt6x-native"
> >
> >  COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone"
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-
> bsp/ipumm-fw/ipumm-fw_git.bb
> > index 633cb13..7a06e43 100644
> > --- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> > +++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> > @@ -28,7 +28,7 @@ require recipes-ti/includes/ti-paths.inc
> >
> >  inherit update-alternatives
> >
> > -DEPENDS =3D "ti-xdctools ti-sysbios ti-codec-engine ti-framework-
> components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
> > +DEPENDS =3D "ti-xdctools-native ti-sysbios ti-codec-engine ti-framewor=
k-
> components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
> >
> >  export HWVERSION=3D"ES10"
> >  export BIOSTOOLSROOT=3D"${STAGING_DIR_TARGET}/usr/share/ti"
> > @@ -43,6 +43,8 @@ export XDAISVERSION=3D"ti-xdais-tree"
> >  export TMS470CGTOOLPATH=3D"${M4_TOOLCHAIN_INSTALL_DIR}"
> >  export IPCSRC=3D"${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
> >
> > +EXTRA_OEMAKE +=3D
> "XDCDIST_TREE=3D${STAGING_DIR_NATIVE}/usr/share/ti/${XDCVERSION}"
> > +
> >  do_configure() {
> >      oe_runmake unconfig
> >      oe_runmake vayu_smp_config
> > diff --git a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/recipes-
> devtools/gdbc6x/gdbserver-c6x_git.bb
> > index f4dc51d..79b584b 100644
> > --- a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
> > +++ b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
> > @@ -2,7 +2,7 @@ DESCRIPTION =3D "TI gdb-server to be used with c6xgdb."
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D
> "file://../debian/copyright;md5=3D82c616b6c8f9c11c46feaaf8f9a11495"
> >
> > -DEPENDS =3D "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbi=
os ti-
> xdctools"
> > +DEPENDS =3D "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbi=
os
> ti-xdctools-native"
> >
> >  PR =3D "${INC_PR}.0"
> >
> > diff --git a/recipes-ti/c6accel/ti-c6accel.inc b/recipes-ti/c6accel/ti-
> c6accel.inc
> > index 65990a8..7e7fb29 100644
> > --- a/recipes-ti/c6accel/ti-c6accel.inc
> > +++ b/recipes-ti/c6accel/ti-c6accel.inc
> > @@ -29,7 +29,7 @@ BINFILE=3D"c6accel_${PV}_Linux-x86_Setup.bin"
> >  TI_BIN_UNPK_CMDS=3D"Y:workdir"
> >
> >  DEPENDS =3D "ti-codec-engine ti-xdais ti-dsplink ti-dspbios"
> > -DEPENDS +=3D "ti-edma3lld ti-cgt6x ti-xdctools ti-framework-components=
"
> > +DEPENDS +=3D "ti-edma3lld ti-cgt6x ti-xdctools-native ti-framework-
> components"
> >  DEPENDS +=3D "ti-biosutils"
> >
> >  TIARGS =3D ' \
> > diff --git a/recipes-ti/codec-engine/ti-codec-engine.inc b/recipes-ti/c=
odec-
> engine/ti-codec-engine.inc
> > index 15bd464..b4d366e 100644
> > --- a/recipes-ti/codec-engine/ti-codec-engine.inc
> > +++ b/recipes-ti/codec-engine/ti-codec-engine.inc
> > @@ -18,7 +18,7 @@ S =3D "${WORKDIR}/codec_engine_${PV}"
> >
> >  SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/${PV}/exports/co
> dec_engine_${PV},lite.tar.gz;name=3Dcetarball "
> >
> > -DEPENDS =3D "ti-framework-components ti-xdais ti-xdctools ti-linuxutil=
s"
> > +DEPENDS =3D "ti-framework-components ti-xdais ti-xdctools-native ti-
> linuxutils"
> >  DEPENDS_append_dm6446 	=3D " ti-dspbios ti-dsplink ti-local-power-
> manager ti-cgt6x ti-biosutils ti-edma3lld"
> >  DEPENDS_append_dm6467 	=3D " ti-dspbios ti-dsplink ti-cgt6x ti-biosuti=
ls ti-
> edma3lld"
> >  DEPENDS_append_omap3	=3D " ti-dspbios ti-dsplink ti-local-power-
> manager ti-cgt6x ti-biosutils ti-edma3lld"
> > diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
> b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
> > index 5c87b4c..e14f1c1 100644
> > --- a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
> > +++ b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
> > @@ -68,7 +68,7 @@ TI_BIN_UNPK_CMDS =3D "Y:workdir"
> >
> >  S =3D "${CODEC_SUITE_NAME}"
> >
> > -DEPENDS =3D "ti-cgt6x ti-xdctools ti-dspbios ti-codec-engine ti-linuxu=
tils"
> > +DEPENDS =3D "ti-cgt6x ti-xdctools-native ti-dspbios ti-codec-engine ti=
-
> linuxutils"
> >
> >  #generic codec
> >  DSPSUFFIX_omap3530 =3D "x64P"
> > diff --git a/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb b/recipes-
> ti/devtools/ti-xdctools_3.50.03.33.bb
> > index 73ab3bd..6ab2b94 100644
> > --- a/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
> > +++ b/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
> > @@ -7,3 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://docs/license/xdc/shelf/package.html;beginline=3D1;endli
> >
> >  SRC_URI[xdczip.md5sum] =3D "21310b647275a7c7dd5b37dcb96c0b1b"
> >  SRC_URI[xdczip.sha256sum] =3D
> "afe8616773e63b01e79e8cfacaf4d2c8d3b92c798c7f8cf5d1c7b5fe2060bbe4"
> > +
> > +FILES_${PN} +=3D "${XDC_INSTALL_DIR_RECIPE}"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
> > index f81b4cf..5062118 100644
> > --- a/recipes-ti/dmai/ti-dmai.inc
> > +++ b/recipes-ti/dmai/ti-dmai.inc
> > @@ -29,7 +29,7 @@ SRC_URI =3D
> "svn://gforge.ti.com/svn/dmai/;module=3D${DMAIBRANCH};protocol=3Dhttps;us
> e
> >          file://arago-tdox \
> >  	"
> >
> > -DEPENDS =3D "virtual/kernel alsa-lib ti-framework-components ti-codec-
> engine ti-xdctools"
> > +DEPENDS =3D "virtual/kernel alsa-lib ti-framework-components ti-codec-
> engine ti-xdctools-native"
> >
> >  DEPENDS_append_dm6446 	=3D " ti-codecs-dm6446   ti-dspbios ti-cgt6x ti=
-
> linuxutils"
> >  DEPENDS_append_dm6467 	=3D " ti-codecs-dm6467   ti-dspbios ti-cgt6x ti=
-
> linuxutils"
> > diff --git a/recipes-ti/dsplink/ti-dsplink.inc b/recipes-ti/dsplink/ti-
> dsplink.inc
> > index 78b53cf..e009615 100644
> > --- a/recipes-ti/dsplink/ti-dsplink.inc
> > +++ b/recipes-ti/dsplink/ti-dsplink.inc
> > @@ -30,7 +30,7 @@ SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/${PV_DL_PATH}/dsplink_l
> >             file://ti-dsplink-examples-loadmodules.sh \
> >             file://ti-dsplink-examples-unloadmodules.sh "
> >
> > -DEPENDS =3D "ti-dspbios ti-xdctools ti-cgt6x"
> > +DEPENDS =3D "ti-dspbios ti-xdctools-native ti-cgt6x"
> >  DEPENDS +=3D "virtual/kernel perl-native"
> >
> >  # SOC_FAMILY configuration
> > diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-=
paths.inc
> > index ebd4b8a..3745ec0 100644
> > --- a/recipes-ti/includes/ti-paths.inc
> > +++ b/recipes-ti/includes/ti-paths.inc
> > @@ -88,7 +88,7 @@ export SYSBIOS_INSTALL_DIR    =3D
> "${STAGING_DIR_TARGET}${SYSBIOS_INSTALL_DIR_RECI
> >  export SYSLINK_INSTALL_DIR    =3D
> "${STAGING_DIR_TARGET}${SYSLINK_INSTALL_DIR_RECIPE}"
> >  export UIA_INSTALL_DIR        =3D
> "${STAGING_DIR_TARGET}${UIA_INSTALL_DIR_RECIPE}"
> >  export XDAIS_INSTALL_DIR      =3D
> "${STAGING_DIR_TARGET}${XDAIS_INSTALL_DIR_RECIPE}"
> > -export XDC_INSTALL_DIR        =3D
> "${STAGING_DIR_TARGET}${XDC_INSTALL_DIR_RECIPE}"
> > +export XDC_INSTALL_DIR        =3D
> "${STAGING_DIR_NATIVE}${XDC_INSTALL_DIR_RECIPE}"
> >  export PDK_INSTALL_DIR        =3D
> "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
> >  export OSAL_INSTALL_DIR       =3D
> "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
> >  export M4_TOOLCHAIN_INSTALL_DIR    =3D
> "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
> > diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/recipes-ti/i=
pc/ti-
> ipc-examples-linux_git.bb
> > index 2340206..545448c 100644
> > --- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> > +++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION =3D "TI Inter Process Communication (IPC) examples with Ho=
st
> running bios"
> >  require ti-ipc-examples.inc
> >
> > -DEPENDS =3D "ti-ipc ti-xdctools ti-sysbios ti-ipc-rtos"
> > +DEPENDS =3D "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos"
> >
> >  do_compile_append() {
> >
> > diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-=
ipc-
> examples_git.bb
> > index 5482ce4..36df294 100644
> > --- a/recipes-ti/ipc/ti-ipc-examples_git.bb
> > +++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION =3D "TI Inter Process Communication (IPC) examples with Ho=
st
> running linux"
> >  require ti-ipc-examples.inc
> >
> > -DEPENDS =3D "ti-xdctools ti-sysbios ti-ipc-rtos"
> > +DEPENDS =3D "ti-xdctools-native ti-sysbios ti-ipc-rtos"
> >
> >  do_compile_append() {
> >
> > diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-=
rtos_git.bb
> > index f4eefa8..4040c4d 100644
> > --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > @@ -2,7 +2,7 @@ require ti-ipc.inc
> >  require ti-ipc-common.inc
> >  require ti-ipc-rtos.inc
> >
> > -DEPENDS =3D "ti-xdctools ti-sysbios doxygen-native zip-native"
> > +DEPENDS =3D "ti-xdctools-native ti-sysbios doxygen-native zip-native"
> >
> >  PACKAGES =3D+ "${PN}-fw"
> >  FILES_${PN}-fw =3D "${base_libdir}/firmware/*"
> > diff --git a/recipes-ti/local-power-manager/ti-local-power-manager.inc
> b/recipes-ti/local-power-manager/ti-local-power-manager.inc
> > index 2f2b525..0e5d4f2 100644
> > --- a/recipes-ti/local-power-manager/ti-local-power-manager.inc
> > +++ b/recipes-ti/local-power-manager/ti-local-power-manager.inc
> > @@ -21,7 +21,7 @@ S =3D "${WORKDIR}/local_power_manager_linux_${PV}"
> >
> >  SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/lpm/${PV}/exports/lo
> cal_power_manager_linux_${PV}.tar.gz;name=3Dlpmtarball"
> >
> > -DEPENDS =3D "ti-dsplink ti-xdctools"
> > +DEPENDS =3D "ti-dsplink ti-xdctools-native"
> >  DEPENDS +=3D "virtual/kernel"
> >
> >  # SOC_FAMILY configuration
> > diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-
> ti/openmp-rtos/openmp-rtos_git.bb
> > index f5bf476..9747465 100644
> > --- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> > +++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> > @@ -19,7 +19,7 @@ SRCREV =3D
> "a2a518dcc9154a372b38bd5be8a483359123823c"
> >
> >  LIC_FILES_CHKSUM =3D
> "file://docs/license/omp_manifest_template.html;md5=3D61a6972303c0447b7
> c056195d7ebafee"
> >
> > -DEPENDS =3D "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-=
cgt6x-
> native libulm zip-native"
> > +DEPENDS =3D "common-csl-ip-rtos ti-xdctools-native ti-ipc-rtos ti-sysb=
ios ti-
> cgt6x-native libulm zip-native"
> >  DEPENDS_append_k2hk =3D " qmss-lld-rtos cppi-lld-rtos"
> >  DEPENDS_append_k2e =3D " qmss-lld-rtos cppi-lld-rtos"
> >  DEPENDS_append_k2l-evm =3D " qmss-lld-rtos cppi-lld-rtos"
> > diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-=
syslink.inc
> > index af5f896..5ff6af7 100644
> > --- a/recipes-ti/syslink/ti-syslink.inc
> > +++ b/recipes-ti/syslink/ti-syslink.inc
> > @@ -31,7 +31,7 @@ SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/sy
> >             file://syslink.pc \
> >            "
> >
> > -DEPENDS =3D "ti-sysbios ti-xdctools ti-cgt6x ti-ipc ti-cgt470"
> > +DEPENDS =3D "ti-sysbios ti-xdctools-native ti-cgt6x ti-ipc ti-cgt470"
> >  DEPENDS +=3D "virtual/kernel"
> >
> >  #common frameq gateMP heapBufMP heapMemMP knlNotify listMP
> messageQ notify ringIO ringIO_gpp sharedRegion slaveLoader tilerDaemon
> > --
> > 2.7.4
> >
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


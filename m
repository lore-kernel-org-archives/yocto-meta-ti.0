Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42AAAE00566; Wed, 12 Sep 2018 12:40:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_MED,
	T_FILL_THIS_FORM_SHORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B8B7E00519
	for <meta-ti@yoctoproject.org>; Wed, 12 Sep 2018 12:40:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8CJegBa026995
	for <meta-ti@yoctoproject.org>; Wed, 12 Sep 2018 14:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536781242;
	bh=egVfwIZFbeUYURklMbounhwpp0Qv5zyiZzSx4eas3C0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=mCSpYz3+zmL/W8A/uiOofxbqhVbdgPpszTFxoaxWJ9/ibu0g7Mhxg7bKYA7fiGbdg
	TPCzre1N0txnvGCV2kWVR5HC0wfeRBKuU3GkQHCVUOWe+OJy5um4kmXLY3TWMX6HEV
	9DsKW5FA2XFd7G/PLLQaOMafGbKVCr2ohurk6GPM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CJegJU020212
	for <meta-ti@yoctoproject.org>; Wed, 12 Sep 2018 14:40:42 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 12 Sep 2018 14:40:43 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Wed, 12 Sep 2018 14:40:42 -0500
From: "Xu, Jianzhong" <xuj@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to build
	DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB
	and DSPLIB.
Thread-Index: AQHUSszaPzA8kiYI0UeuilkCSFgFTaTtClyg
Date: Wed, 12 Sep 2018 19:40:42 +0000
Message-ID: <0edace8daec141e48401dfaf972f69af@ti.com>
References: <1536255983-16162-1-git-send-email-xuj@ti.com>
	<674173dd-2a6b-b932-49f3-e3c30fbfd050@ti.com>
	<20180912191313.GB12296@beryl>
In-Reply-To: <20180912191313.GB12296@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.76]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to build DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and DSPLIB.
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
X-List-Received-Date: Wed, 12 Sep 2018 19:40:46 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_0edace8daec141e48401dfaf972f69afticom_"

--_000_0edace8daec141e48401dfaf972f69afticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,



You're right. The versioning was inconsistent. Please use [EXTERNAL,3/3,v2]=
 and newer versions of [EXTERNAL,2/3], [EXTERNAL,1/3]. The latter two shoul=
d have had v2 in it. Please see highlights below.



[EXTERNAL,3/3,v2] Added DSPLIB recipe to build DSPLIB from source. Updated =
includes/ti-paths.inc for MATHLIB and DSPLIB.<http://patchwork.dal.design.t=
i.com/patch/40555/>

2018-09-06

Jianzhong Xu<mailto:xuj@ti.com>

New

[EXTERNAL] Added DSPLIB recipe to build DSPLIB from source. Updated include=
s/ti-paths.inc for MATHLIB and DSPLIB.<http://patchwork.dal.design.ti.com/p=
atch/40553/>

2018-09-06

Jianzhong Xu<mailto:xuj@ti.com>

New

[EXTERNAL,3/3] Added DSPLIB recipe to build DSPLIB from source.<http://patc=
hwork.dal.design.ti.com/patch/40451/>

2018-09-04

Jianzhong Xu<mailto:xuj@ti.com>

New

[EXTERNAL,2/3] Added MATHLIB recipe to build MATHLIB from source.<http://pa=
tchwork.dal.design.ti.com/patch/40450/>

2018-09-04

Jianzhong Xu<mailto:xuj@ti.com>

New

[EXTERNAL,1/3] Added SWTOOLS which is needed to build processor libs (DSPLI=
B, MATHLIB, etc) from source.<http://patchwork.dal.design.ti.com/patch/4044=
9/>

2018-09-04

Jianzhong Xu<mailto:xuj@ti.com>

New




Thanks,

Jianzhong



-----Original Message-----
From: Dmytriyenko, Denys
Sent: Wednesday, September 12, 2018 3:13 PM
To: Stiffler, Jacob
Cc: Xu, Jianzhong; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to bui=
ld DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and DSPLIB=
.



Jake,



I'll give it a look - I assume you want the 3 most recent patches, I don't

think versioning was consistent...



Denys





On Tue, Sep 11, 2018 at 09:17:49AM -0400, Jacob Stiffler wrote:

> ACK

>

>

> Denys,

>

> Can you apply these patches to the ti2018.03 branch?

>

>

> Thank you,

>

> Jake

>

>

> On 9/6/2018 1:46 PM, Jianzhong Xu wrote:

> >Signed-off-by: Jianzhong Xu <xuj@ti.com>

> >---

> >Change from previous version of patch

> >Corrected typo: MATHLIB_C674INSTALL_XXX should have been MATHLIB_C674_IN=
STALL_XXX

> >---

> >---

> >  recipes-ti/dsplib/dsplib-c64xp_git.bb    |  9 ++++

> >  recipes-ti/dsplib/dsplib-c66x.inc        | 30 ------------

> >  recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb |  9 ----

> >  recipes-ti/dsplib/dsplib-c66x_git.bb     | 10 ++++

> >  recipes-ti/dsplib/dsplib-c674x_git.bb    |  9 ++++

> >  recipes-ti/dsplib/dsplib.inc             | 79 ++++++++++++++++++++++++=
++++++++

> >  recipes-ti/includes/ti-paths.inc         |  8 +++-

> >  7 files changed, 114 insertions(+), 40 deletions(-)

> >  create mode 100644 recipes-ti/dsplib/dsplib-c64xp_git.bb

> >  delete mode 100644 recipes-ti/dsplib/dsplib-c66x.inc

> >  delete mode 100644 recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb

> >  create mode 100644 recipes-ti/dsplib/dsplib-c66x_git.bb

> >  create mode 100644 recipes-ti/dsplib/dsplib-c674x_git.bb

> >  create mode 100644 recipes-ti/dsplib/dsplib.inc

> >

> >diff --git a/recipes-ti/dsplib/dsplib-c64xp_git.bb b/recipes-ti/dsplib/d=
splib-c64xp_git.bb

> >new file mode 100644

> >index 0000000..1038d44

> >--- /dev/null

> >+++ b/recipes-ti/dsplib/dsplib-c64xp_git.bb

> >@@ -0,0 +1,9 @@

> >+MATHLIB_INSTALL_DIR =3D "${MATHLIB_C64P_INSTALL_DIR}/packages"

> >+DSPLIB_INSTALL_DIR_RECIPE =3D "${DSPLIB_C64P_INSTALL_DIR_RECIPE}"

> >+DSPLIB_INSTALL_DIR =3D "${DSPLIB_C64P_INSTALL_DIR}"

> >+DSPLIB_BUILD_TARGET =3D "c64Px"

> >+

> >+DEPENDS =3D ""

> >+

> >+include dsplib.inc

> >+

> >diff --git a/recipes-ti/dsplib/dsplib-c66x.inc b/recipes-ti/dsplib/dspli=
b-c66x.inc

> >deleted file mode 100644

> >index 7ff99c2..0000000

> >--- a/recipes-ti/dsplib/dsplib-c66x.inc

> >+++ /dev/null

> >@@ -1,30 +0,0 @@

> >-DESCRIPTION =3D "DSPLIB contains optimized general-purpose signal-proce=
ssing routines for TI DSPs"

> >-HOMEPAGE =3D "http://www.ti.com/tool/sprc265"

> >-SECTION =3D "devel"

> >-LICENSE =3D "BSD-3-Clause"

> >-

> >-require ../includes/ti-paths.inc

> >-require ../includes/ti-staging.inc

> >-require ../includes/ti-unpack.inc

> >-

> >-COMPATIBLE_MACHINE =3D "omap-a15|keystone"

> >-

> >-SRC_URI =3D "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/dsplib/$=
{PV}/exports/${BINFILE};name=3Ddsplib"

> >-

> >-BINFILE =3D "dsplib_c66x_${PV}_Linux.bin"

> >-TI_BIN_UNPK_ARGS =3D "--mode silent --prefix ${S}"

> >-TI_BIN_UNPK_CMDS =3D ""

> >-

> >-do_install() {

> >-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downers=
hip"

> >-    install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}

> >-    cp ${CP_ARGS} ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}

> >-}

> >-

> >-ALLOW_EMPTY_${PN} =3D "1"

> >-FILES_${PN}-dev +=3D "${DSPLIB_C66_INSTALL_DIR_RECIPE}"

> >-

> >-INHIBIT_PACKAGE_STRIP =3D "1"

> >-INHIBIT_SYSROOT_STRIP =3D "1"

> >-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"

> >-INSANE_SKIP_${PN}-dev =3D "arch"

> >diff --git a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb b/recipes-ti/dspli=
b/dsplib-c66x_3.4.0.0.bb

> >deleted file mode 100644

> >index f1273f3..0000000

> >--- a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb

> >+++ /dev/null

> >@@ -1,9 +0,0 @@

> >-require dsplib-c66x.inc

> >-

> >-PV =3D "3_4_0_0"

> >-PR =3D "r1"

> >-

> >-LIC_FILES_CHKSUM =3D "file://packages/ti/dsplib/dsplib.h;beginline=3D9;=
endline=3D35;md5=3D17733f9e1100f8a628512f47c4bf676a"

> >-

> >-SRC_URI[dsplib.md5sum] =3D "66785604729c153dcad5282097dee8bf"

> >-SRC_URI[dsplib.sha256sum] =3D "e88909b6271ce6c4c62e2ab90181b7adb36c7f28=
f5c52836668eb35888785ce8"

> >diff --git a/recipes-ti/dsplib/dsplib-c66x_git.bb b/recipes-ti/dsplib/ds=
plib-c66x_git.bb

> >new file mode 100644

> >index 0000000..cbc25d0

> >--- /dev/null

> >+++ b/recipes-ti/dsplib/dsplib-c66x_git.bb

> >@@ -0,0 +1,10 @@

> >+MATHLIB_INSTALL_DIR =3D "${MATHLIB_C66_INSTALL_DIR}/packages"

> >+DSPLIB_INSTALL_DIR_RECIPE =3D "${DSPLIB_C66_INSTALL_DIR_RECIPE}"

> >+DSPLIB_INSTALL_DIR =3D "${DSPLIB_C66_INSTALL_DIR}"

> >+DSPLIB_BUILD_TARGET =3D "c66x"

> >+

> >+DEPENDS =3D "mathlib-c66x"

> >+

> >+include dsplib.inc

> >+

> >+

> >diff --git a/recipes-ti/dsplib/dsplib-c674x_git.bb b/recipes-ti/dsplib/d=
splib-c674x_git.bb

> >new file mode 100644

> >index 0000000..07c6892

> >--- /dev/null

> >+++ b/recipes-ti/dsplib/dsplib-c674x_git.bb

> >@@ -0,0 +1,9 @@

> >+MATHLIB_INSTALL_DIR =3D "${MATHLIB_C674_INSTALL_DIR}/packages"

> >+DSPLIB_INSTALL_DIR_RECIPE =3D "${DSPLIB_C674_INSTALL_DIR_RECIPE}"

> >+DSPLIB_INSTALL_DIR =3D "${DSPLIB_C674_INSTALL_DIR}"

> >+DSPLIB_BUILD_TARGET =3D "c674x"

> >+

> >+DEPENDS =3D "mathlib-c674x"

> >+

> >+include dsplib.inc

> >+

> >diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc

> >new file mode 100644

> >index 0000000..66fe0fb

> >--- /dev/null

> >+++ b/recipes-ti/dsplib/dsplib.inc

> >@@ -0,0 +1,79 @@

> >+SUMMARY =3D "DSPLIB contains optimized signal processing functions for =
TI DSPs"

> >+HOMEPAGE =3D "http://git.ti.com/ep-processor-libraries/dsplib"

> >+LICENSE =3D "BSD-3-Clause"

> >+

> >+require ../includes/ti-paths.inc

> >+

> >+PV =3D "3_4_0_1"

> >+PR =3D "r0"

> >+

> >+COMPATIBLE_MACHINE =3D "am57xx-evm|keystone|c66x|omapl1"

> >+

> >+DEPENDS +=3D "ti-cgt6x-native \

> >+           ti-xdctools-native \

> >+           ti-sysbios \

> >+           doxygen-native \

> >+           zip-native \

> >+           swtools "

> >+

> >+S =3D "${WORKDIR}/git"

> >+

> >+SRC_URI =3D "git://git.ti.com/ep-processor-libraries/dsplib.git;protoco=
l=3Dgit;branch=3Dmaster"

> >+SRCREV =3D "bf5a51cba462c5cb03ed20a6a1bb1bd16c0683e1"

> >+

> >+LIC_FILES_CHKSUM =3D "file://ti/dsplib/src/common/c66/lnk.cmd;beginline=
=3D1;endline=3D37;md5=3D0f0c9c4d51d8af75419781591ace190b"

> >+

> >+export DSPLIB_WORK_DIR=3D"${S}"

> >+export CGTOOLS_INSTALL_DIR  =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt=
-c6x"

> >+export C64PCODEGENTOOL=3D"${CGTOOLS_INSTALL_DIR}"

> >+export C674CODEGENTOOL=3D"${CGTOOLS_INSTALL_DIR}"

> >+export C66CODEGENTOOL =3D"${CGTOOLS_INSTALL_DIR}"

> >+export SWTOOLS_PATH =3D "${SWTOOLS_INSTALL_DIR}/ti/mas/swtools"

> >+export XDCBUILDCFG=3D"${SWTOOLS_PATH}/config.bld"

> >+export INCDIR=3D"${MATHLIB_INSTALL_DIR}/"

> >+

> >+PATH_append =3D ":${XDC_INSTALL_DIR}"

> >+

> >+XDCPATH.=3D"${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_=
INSTALL_DIR}/packages;"

> >+XDCPATH.=3D"${SWTOOLS_INSTALL_DIR};${MATHLIB_INSTALL_DIR};${DSPLIB_WORK=
_DIR};"

> >+

> >+export XDCPATH

> >+

> >+DSPLIB_PACKAGE_NAME =3D "dsplib_${DSPLIB_BUILD_TARGET}_${PV}"

> >+

> >+do_compile() {

> >+       cd ${DSPLIB_WORK_DIR}/ti/dsplib;

> >+       xdc XDCARGS=3D"${DSPLIB_BUILD_TARGET} bundle" XDCOPTIONS=3D"-v"

> >+}

> >+

> >+do_install() {

> >+       install -d ${D}${DSPLIB_INSTALL_DIR_RECIPE}

> >+

> >+       find -name "${DSPLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D=
}${DSPLIB_INSTALL_DIR_RECIPE} \;

> >+       mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/* ${D}${DSPLIB_INSTAL=
L_DIR_RECIPE}

> >+       mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/.metadata ${D}${DSPLI=
B_INSTALL_DIR_RECIPE}

> >+       rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib

> >+}

> >+

> >+

> >+inherit deploy

> >+addtask deploy before do_build after do_install

> >+

> >+do_deploy() {

> >+       install -d ${DEPLOYDIR}

> >+       # zip up files in ${D}${DSPLIB_INSTALL_DIR_RECIPE}

> >+       # and place the zip file in ${DEPLOYDIR}

> >+       mkdir ./${DSPLIB_PACKAGE_NAME}

> >+       cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/* ./${DSPLIB_PACKAGE_NAME=
}

> >+       cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/.metadata ./${DSPLIB_PACK=
AGE_NAME}

> >+       zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip ./${DSPL=
IB_PACKAGE_NAME}

> >+       rm -r ./${DSPLIB_PACKAGE_NAME}

> >+}

> >+

> >+PACKAGE_ARCH =3D "${MACHINE_ARCH}"

> >+

> >+ALLOW_EMPTY_${PN} =3D "1"

> >+FILES_${PN}-dev +=3D "${DSPLIB_INSTALL_DIR_RECIPE}"

> >+

> >+INSANE_SKIP_${PN}-dev =3D "arch"

> >+

> >diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-p=
aths.inc

> >index 4f99d5e..8740b6a 100644

> >--- a/recipes-ti/includes/ti-paths.inc

> >+++ b/recipes-ti/includes/ti-paths.inc

> >@@ -17,6 +17,7 @@ export DMAI_INSTALL_DIR_RECIPE       =3D "${installdir=
}/ti-dmai-tree"

> >  export DSP_BENCHMARK_INSTALL_DIR_RECIPE =3D "${installdir}/ti-dsp-benc=
hmark-tree"

> >  export DSPLIB_C64P_INSTALL_DIR_RECIPE =3D "${installdir}/ti-dsplib-c64=
p-tree"

> >  export DSPLIB_C674_INSTALL_DIR_RECIPE =3D "${installdir}/ti-dsplib-c67=
4x-tree"

> >+export DSPLIB_C66_INSTALL_DIR_RECIPE  =3D "${installdir}/ti-dsplib-c66x=
-tree"

> >  export DSPLIB_INSTALL_DIR_RECIPE     =3D "${installdir}/ti-dsplib-tree=
"

> >  export DVSDK_DEMOS_INSTALL_DIR_RECIPE=3D "${installdir}/ti-dvsdk-demos=
-tree"

> >  export DVTB_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-dvtb-tree"

> >@@ -39,6 +40,7 @@ export OSAL_INSTALL_DIR_RECIPE       =3D "${installdir=
}/ti-osal-tree"

> >  export RTFS_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-rtfs-tree"

> >  export SYSBIOS_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-sysbios-tre=
e"

> >  export SYSLINK_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-syslink-tre=
e"

> >+export SWTOOLS_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-swtools-tree=
"

> >  export UIA_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-uia-tree"

> >  export VICPLIB_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-vicplib-tre=
e"

> >  export XDAIS_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-xdais-tree"

> >@@ -48,8 +50,8 @@ export OSAL_INSTALL_DIR_RECIPE       =3D "${installdir=
}/ti-osal-tree"

> >  export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-cgt-ar=
m"

> >  export GCC_ARM_NONE_TOOLCHAIN_RECIPE      =3D "${installdir}/gcc-arm-n=
one-eabi"

> >  export TI_CGT_PRU_INSTALL_DIR_RECIPE      =3D "${installdir}/cgt-pru"

> >-export DSPLIB_C66_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-dsplib-=
c66x-tree"

> >  export MATHLIB_C66_INSTALL_DIR_RECIPE     =3D "${installdir}/ti-mathli=
b-c66x-tree"

> >+export MATHLIB_C674_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-mathlib=
-c674x-tree"

> >  export IMGLIB_C66_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-imglib=
-c66x-tree"

> >  export VLIB_C66_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-vlib-c=
66x-tree"

> >  export CG_XML_INSTALL_DIR_RECIPE     =3D "${installdir}/ti-cg-xml-tree=
"

> >@@ -95,7 +97,11 @@ export OSAL_INSTALL_DIR       =3D "${STAGING_DIR_TARG=
ET}${OSAL_INSTALL_DIR_RECIPE}

> >  export M4_TOOLCHAIN_INSTALL_DIR    =3D "${STAGING_DIR_NATIVE}${M4_TOOL=
CHAIN_INSTALL_DIR_RECIPE}"

> >  export GCC_ARM_NONE_TOOLCHAIN      =3D "${STAGING_DIR_NATIVE}${GCC_ARM=
_NONE_TOOLCHAIN_RECIPE}"

> >  export TI_CGT_PRU_INSTALL_DIR      =3D "${STAGING_DIR_NATIVE}${TI_CGT_=
PRU_INSTALL_DIR_RECIPE}"

> >+export SWTOOLS_INSTALL_DIR         =3D "${STAGING_DIR_TARGET}${SWTOOLS_=
INSTALL_DIR_RECIPE}"

> >+export DSPLIB_C64P_INSTALL_DIR     =3D "${STAGING_DIR_TARGET}${DSPLIB_C=
64P_INSTALL_DIR_RECIPE}"

> >+export DSPLIB_C674_INSTALL_DIR     =3D "${STAGING_DIR_TARGET}${DSPLIB_C=
674_INSTALL_DIR_RECIPE}"

> >  export DSPLIB_C66_INSTALL_DIR      =3D "${STAGING_DIR_TARGET}${DSPLIB_=
C66_INSTALL_DIR_RECIPE}"

> >+export MATHLIB_C674_INSTALL_DIR    =3D "${STAGING_DIR_TARGET}${MATHLIB_=
C674_INSTALL_DIR_RECIPE}"

> >  export MATHLIB_C66_INSTALL_DIR     =3D "${STAGING_DIR_TARGET}${MATHLIB=
_C66_INSTALL_DIR_RECIPE}"

> >  export IMGLIB_C66_INSTALL_DIR      =3D "${STAGING_DIR_TARGET}${IMGLIB_=
C66_INSTALL_DIR_RECIPE}"

> >  export VLIB_C66_INSTALL_DIR        =3D "${STAGING_DIR_TARGET}${VLIB_C6=
6_INSTALL_DIR_RECIPE}"

>

> --

> _______________________________________________

> meta-ti mailing list

> meta-ti@yoctoproject.org

> https://lists.yoctoproject.org/listinfo/meta-ti

--_000_0edace8daec141e48401dfaf972f69afticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:p=3D"urn:schemas-m=
icrosoft-com:office:powerpoint" xmlns:a=3D"urn:schemas-microsoft-com:office=
:access" xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:s=3D"=
uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" xmlns:rs=3D"urn:schemas-microsof=
t-com:rowset" xmlns:z=3D"#RowsetSchema" xmlns:b=3D"urn:schemas-microsoft-co=
m:office:publisher" xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadshee=
t" xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" xmlns=
:odc=3D"urn:schemas-microsoft-com:office:odc" xmlns:oa=3D"urn:schemas-micro=
soft-com:office:activation" xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" xmlns:rtc=3D"http://m=
icrosoft.com/officenet/conferencing" xmlns:D=3D"DAV:" xmlns:Repl=3D"http://=
schemas.microsoft.com/repl/" xmlns:mt=3D"http://schemas.microsoft.com/share=
point/soap/meetings/" xmlns:x2=3D"http://schemas.microsoft.com/office/excel=
/2003/xml" xmlns:ppda=3D"http://www.passport.com/NameSpace.xsd" xmlns:ois=
=3D"http://schemas.microsoft.com/sharepoint/soap/ois/" xmlns:dir=3D"http://=
schemas.microsoft.com/sharepoint/soap/directory/" xmlns:ds=3D"http://www.w3=
.org/2000/09/xmldsig#" xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint=
/dsp" xmlns:udc=3D"http://schemas.microsoft.com/data/udc" xmlns:xsd=3D"http=
://www.w3.org/2001/XMLSchema" xmlns:sub=3D"http://schemas.microsoft.com/sha=
repoint/soap/2002/1/alerts/" xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#"=
 xmlns:sp=3D"http://schemas.microsoft.com/sharepoint/" xmlns:sps=3D"http://=
schemas.microsoft.com/sharepoint/soap/" xmlns:xsi=3D"http://www.w3.org/2001=
/XMLSchema-instance" xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/so=
ap" xmlns:udcxf=3D"http://schemas.microsoft.com/data/udc/xmlfile" xmlns:udc=
p2p=3D"http://schemas.microsoft.com/data/udc/parttopart" xmlns:wf=3D"http:/=
/schemas.microsoft.com/sharepoint/soap/workflow/" xmlns:dsss=3D"http://sche=
mas.microsoft.com/office/2006/digsig-setup" xmlns:dssi=3D"http://schemas.mi=
crosoft.com/office/2006/digsig" xmlns:mdssi=3D"http://schemas.openxmlformat=
s.org/package/2006/digital-signature" xmlns:mver=3D"http://schemas.openxmlf=
ormats.org/markup-compatibility/2006" xmlns:m=3D"http://schemas.microsoft.c=
om/office/2004/12/omml" xmlns:mrels=3D"http://schemas.openxmlformats.org/pa=
ckage/2006/relationships" xmlns:spwp=3D"http://microsoft.com/sharepoint/web=
partpages" xmlns:ex12t=3D"http://schemas.microsoft.com/exchange/services/20=
06/types" xmlns:ex12m=3D"http://schemas.microsoft.com/exchange/services/200=
6/messages" xmlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/Sli=
deLibrary/" xmlns:spsl=3D"http://microsoft.com/webservices/SharePointPortal=
Server/PublishedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" xmlns:=
tax=3D"http://schemas.microsoft.com/sharepoint/taxonomy/soap/" xmlns:tns=3D=
"http://schemas.microsoft.com/sharepoint/soap/recordsrepository/" xmlns:sps=
up=3D"http://microsoft.com/webservices/SharePointPortalServer/UserProfileSe=
rvice" xmlns:mml=3D"http://www.w3.org/1998/Math/MathML" xmlns:st=3D"&#1;" x=
mlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Denys,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">You're right. The versioning was inconsistent. Pl=
ease use [EXTERNAL,3/3,v2] and newer versions of [EXTERNAL,2/3], [EXTERNAL,=
1/3]. The latter two should have had v2 in it. Please see highlights below.=
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"1" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"1440" style=3D"width:15.0in;background:white;border-collaps=
e:collapse;border:none">
<tbody>
<tr>
<td style=3D"border-top:solid black 1.0pt;border-left:solid black 1.0pt;bor=
der-bottom:none;border-right:none;padding:1.5pt 4.5pt 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black;ba=
ckground:yellow;mso-highlight:yellow"><a href=3D"http://patchwork.dal.desig=
n.ti.com/patch/40555/"><span style=3D"color:black"><br>
[EXTERNAL,3/3,v2] Added DSPLIB recipe to build DSPLIB from source. Updated =
includes/ti-paths.inc for MATHLIB and DSPLIB.</span></a><o:p></o:p></span><=
/p>
</td>
<td style=3D"border:none;border-top:solid black 1.0pt;padding:1.5pt 4.5pt 1=
.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black">2=
018-09-06<o:p></o:p></span></p>
</td>
<td style=3D"border:none;border-top:solid black 1.0pt;padding:1.5pt 4.5pt 1=
.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black"><=
a href=3D"mailto:xuj@ti.com"><span style=3D"color:black">Jianzhong Xu</span=
></a><o:p></o:p></span></p>
</td>
<td style=3D"border:none;border-top:solid black 1.0pt;padding:1.5pt 4.5pt 1=
.5pt 4.5pt">
</td>
<td style=3D"border-top:solid black 1.0pt;border-left:none;border-bottom:no=
ne;border-right:solid black 1.0pt;padding:1.5pt 4.5pt 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black">N=
ew<o:p></o:p></span></p>
</td>
</tr>
<tr id=3D"patch_row:40553">
<td style=3D"border:none;border-left:solid black 1.0pt;background:#E8E8E8;p=
adding:1.5pt 4.5pt 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black"><=
a href=3D"http://patchwork.dal.design.ti.com/patch/40553/"><span style=3D"c=
olor:black">[EXTERNAL] Added DSPLIB recipe to build DSPLIB from
 source. Updated includes/ti-paths.inc for MATHLIB and DSPLIB.</span></a><o=
:p></o:p></span></p>
</td>
<td style=3D"border:none;background:#E8E8E8;padding:1.5pt 4.5pt 1.5pt 4.5pt=
">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black">2=
018-09-06<o:p></o:p></span></p>
</td>
<td style=3D"border:none;background:#E8E8E8;padding:1.5pt 4.5pt 1.5pt 4.5pt=
">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black"><=
a href=3D"mailto:xuj@ti.com"><span style=3D"color:black">Jianzhong Xu</span=
></a><o:p></o:p></span></p>
</td>
<td style=3D"border:none;background:#E8E8E8;padding:1.5pt 4.5pt 1.5pt 4.5pt=
"></td>
<td style=3D"border:none;border-right:solid black 1.0pt;background:#E8E8E8;=
padding:1.5pt 4.5pt 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black">N=
ew<o:p></o:p></span></p>
</td>
</tr>
<tr id=3D"patch_row:40451">
<td style=3D"border:none;border-left:solid black 1.0pt;padding:1.5pt 4.5pt =
1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black"><=
a href=3D"http://patchwork.dal.design.ti.com/patch/40451/"><span style=3D"c=
olor:black">[EXTERNAL,3/3] Added DSPLIB recipe to build DSPLIB
 from source.</span></a><o:p></o:p></span></p>
</td>
<td style=3D"border:none;padding:1.5pt 4.5pt 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black">2=
018-09-04<o:p></o:p></span></p>
</td>
<td style=3D"border:none;padding:1.5pt 4.5pt 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black"><=
a href=3D"mailto:xuj@ti.com"><span style=3D"color:black">Jianzhong Xu</span=
></a><o:p></o:p></span></p>
</td>
<td style=3D"border:none;padding:1.5pt 4.5pt 1.5pt 4.5pt"></td>
<td style=3D"border:none;border-right:solid black 1.0pt;padding:1.5pt 4.5pt=
 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black">N=
ew<o:p></o:p></span></p>
</td>
</tr>
<tr id=3D"patch_row:40450">
<td style=3D"border:none;border-left:solid black 1.0pt;background:#E8E8E8;p=
adding:1.5pt 4.5pt 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black;ba=
ckground:yellow;mso-highlight:yellow"><a href=3D"http://patchwork.dal.desig=
n.ti.com/patch/40450/"><span style=3D"color:black">[EXTERNAL,2/3]
 Added MATHLIB recipe to build MATHLIB from source.</span></a><o:p></o:p></=
span></p>
</td>
<td style=3D"border:none;background:#E8E8E8;padding:1.5pt 4.5pt 1.5pt 4.5pt=
">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black">2=
018-09-04<o:p></o:p></span></p>
</td>
<td style=3D"border:none;background:#E8E8E8;padding:1.5pt 4.5pt 1.5pt 4.5pt=
">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black"><=
a href=3D"mailto:xuj@ti.com"><span style=3D"color:black">Jianzhong Xu</span=
></a><o:p></o:p></span></p>
</td>
<td style=3D"border:none;background:#E8E8E8;padding:1.5pt 4.5pt 1.5pt 4.5pt=
"></td>
<td style=3D"border:none;border-right:solid black 1.0pt;background:#E8E8E8;=
padding:1.5pt 4.5pt 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black">N=
ew<o:p></o:p></span></p>
</td>
</tr>
<tr id=3D"patch_row:40449">
<td style=3D"border-top:none;border-left:solid black 1.0pt;border-bottom:so=
lid black 1.0pt;border-right:none;padding:1.5pt 4.5pt 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black;ba=
ckground:yellow;mso-highlight:yellow"><a href=3D"http://patchwork.dal.desig=
n.ti.com/patch/40449/"><span style=3D"color:black">[EXTERNAL,1/3]
 Added SWTOOLS which is needed to build processor libs (DSPLIB, MATHLIB, et=
c) from source.</span></a><o:p></o:p></span></p>
</td>
<td style=3D"border:none;border-bottom:solid black 1.0pt;padding:1.5pt 4.5p=
t 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black">2=
018-09-04<o:p></o:p></span></p>
</td>
<td style=3D"border:none;border-bottom:solid black 1.0pt;padding:1.5pt 4.5p=
t 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black"><=
a href=3D"mailto:xuj@ti.com"><span style=3D"color:black">Jianzhong Xu</span=
></a><o:p></o:p></span></p>
</td>
<td style=3D"border:none;border-bottom:solid black 1.0pt;padding:1.5pt 4.5p=
t 1.5pt 4.5pt">
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid black 1.0=
pt;border-right:solid black 1.0pt;padding:1.5pt 4.5pt 1.5pt 4.5pt">
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt"><span style=3D"font-size:=
9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:black">N=
ew<o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks,<o:p></o:p></p>
<p class=3D"MsoPlainText">Jianzhong<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: Dmytriyenko, Denys <br>
Sent: Wednesday, September 12, 2018 3:13 PM<br>
To: Stiffler, Jacob<br>
Cc: Xu, Jianzhong; meta-ti@yoctoproject.org<br>
Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to bui=
ld DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and DSPLIB=
.</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Jake,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I'll give it a look - I assume you want the 3 mos=
t recent patches, I don't
<o:p></o:p></p>
<p class=3D"MsoPlainText">think versioning was consistent...<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Denys<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">On Tue, Sep 11, 2018 at 09:17:49AM -0400, Jacob S=
tiffler wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ACK<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Denys,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Can you apply these patches to the ti2018.03=
 branch?<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Thank you,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Jake<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; On 9/6/2018 1:46 PM, Jianzhong Xu wrote:<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;Signed-off-by: Jianzhong Xu &lt;xuj@ti.c=
om&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;Change from previous version of patch<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;Corrected typo: MATHLIB_C674INSTALL_XXX =
should have been MATHLIB_C674_INSTALL_XXX<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; recipes-ti/dsplib/dsplib-c64xp_gi=
t.bb&nbsp;&nbsp;&nbsp; |&nbsp; 9 &#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; recipes-ti/dsplib/dsplib-c66x.inc=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 30 ------------<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; recipes-ti/dsplib/dsplib-c66x_3.4=
.0.0.bb |&nbsp; 9 ----<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; recipes-ti/dsplib/dsplib-c66x_git=
.bb&nbsp;&nbsp;&nbsp;&nbsp; | 10 &#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; recipes-ti/dsplib/dsplib-c674x_gi=
t.bb&nbsp;&nbsp;&nbsp; |&nbsp; 9 &#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; recipes-ti/dsplib/dsplib.inc&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 79 &#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; recipes-ti/includes/ti-paths.inc&=
nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp; 8 &#43;&#43;&#43;-<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; 7 files changed, 114 insertions(&=
#43;), 40 deletions(-)<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; create mode 100644 recipes-ti/dsp=
lib/dsplib-c64xp_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; delete mode 100644 recipes-ti/dsp=
lib/dsplib-c66x.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; delete mode 100644 recipes-ti/dsp=
lib/dsplib-c66x_3.4.0.0.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; create mode 100644 recipes-ti/dsp=
lib/dsplib-c66x_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; create mode 100644 recipes-ti/dsp=
lib/dsplib-c674x_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; create mode 100644 recipes-ti/dsp=
lib/dsplib.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;diff --git a/recipes-ti/dsplib/dsplib-c6=
4xp_git.bb b/recipes-ti/dsplib/dsplib-c64xp_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;index 0000000..1038d44<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;--- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&#43;&#43; b/recipes-ti/dsplib/dspl=
ib-c64xp_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;@@ -0,0 &#43;1,9 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;MATHLIB_INSTALL_DIR =3D &quot;${MAT=
HLIB_C64P_INSTALL_DIR}/packages&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DSPLIB_INSTALL_DIR_RECIPE =3D &quot=
;${DSPLIB_C64P_INSTALL_DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DSPLIB_INSTALL_DIR =3D &quot;${DSPL=
IB_C64P_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DSPLIB_BUILD_TARGET =3D &quot;c64Px=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DEPENDS =3D &quot;&quot;<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;include dsplib.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;diff --git a/recipes-ti/dsplib/dsplib-c6=
6x.inc b/recipes-ti/dsplib/dsplib-c66x.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;deleted file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;index 7ff99c2..0000000<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;--- a/recipes-ti/dsplib/dsplib-c66x.inc<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&#43;&#43; /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;@@ -1,30 &#43;0,0 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-DESCRIPTION =3D &quot;DSPLIB contains o=
ptimized general-purpose signal-processing routines for TI DSPs&quot;<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-HOMEPAGE =3D &quot;http://www.ti.com/to=
ol/sprc265&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-SECTION =3D &quot;devel&quot;<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; &gt;-LICENSE =3D &quot;BSD-3-Clause&quot;<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-require ../includes/ti-paths.inc<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-require ../includes/ti-staging.inc<o:p>=
</o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-require ../includes/ti-unpack.inc<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-COMPATIBLE_MACHINE =3D &quot;omap-a15|k=
eystone&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-SRC_URI =3D &quot;http://software-dl.ti=
.com/sdoemb/sdoemb_public_sw/dsplib/${PV}/exports/${BINFILE};name=3Ddsplib&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-BINFILE =3D &quot;dsplib_c66x_${PV}_Lin=
ux.bin&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-TI_BIN_UNPK_ARGS =3D &quot;--mode silen=
t --prefix ${S}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-TI_BIN_UNPK_CMDS =3D &quot;&quot;<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-do_install() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-&nbsp;&nbsp;&nbsp; CP_ARGS=3D&quot;-Prf=
 --preserve=3Dmode,timestamps --no-preserve=3Downership&quot;<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&gt; &gt;-&nbsp;&nbsp;&nbsp; install -d ${D}${DSP=
LIB_C66_INSTALL_DIR_RECIPE}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/*=
 ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-FILES_${PN}-dev &#43;=3D &quot;${DSPLIB=
_C66_INSTALL_DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-INSANE_SKIP_${PN}-dev =3D &quot;arch&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;diff --git a/recipes-ti/dsplib/dsplib-c6=
6x_3.4.0.0.bb b/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;deleted file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;index f1273f3..0000000<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;--- a/recipes-ti/dsplib/dsplib-c66x_3.4.=
0.0.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&#43;&#43; /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;@@ -1,9 &#43;0,0 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-require dsplib-c66x.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-PV =3D &quot;3_4_0_0&quot;<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; &gt;-PR =3D &quot;r1&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-LIC_FILES_CHKSUM =3D &quot;file://packa=
ges/ti/dsplib/dsplib.h;beginline=3D9;endline=3D35;md5=3D17733f9e1100f8a6285=
12f47c4bf676a&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-SRC_URI[dsplib.md5sum] =3D &quot;667856=
04729c153dcad5282097dee8bf&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-SRC_URI[dsplib.sha256sum] =3D &quot;e88=
909b6271ce6c4c62e2ab90181b7adb36c7f28f5c52836668eb35888785ce8&quot;<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; &gt;diff --git a/recipes-ti/dsplib/dsplib-c6=
6x_git.bb b/recipes-ti/dsplib/dsplib-c66x_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;index 0000000..cbc25d0<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;--- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&#43;&#43; b/recipes-ti/dsplib/dspl=
ib-c66x_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;@@ -0,0 &#43;1,10 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;MATHLIB_INSTALL_DIR =3D &quot;${MAT=
HLIB_C66_INSTALL_DIR}/packages&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DSPLIB_INSTALL_DIR_RECIPE =3D &quot=
;${DSPLIB_C66_INSTALL_DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DSPLIB_INSTALL_DIR =3D &quot;${DSPL=
IB_C66_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DSPLIB_BUILD_TARGET =3D &quot;c66x&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DEPENDS =3D &quot;mathlib-c66x&quot=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;include dsplib.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;diff --git a/recipes-ti/dsplib/dsplib-c6=
74x_git.bb b/recipes-ti/dsplib/dsplib-c674x_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;index 0000000..07c6892<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;--- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&#43;&#43; b/recipes-ti/dsplib/dspl=
ib-c674x_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;@@ -0,0 &#43;1,9 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;MATHLIB_INSTALL_DIR =3D &quot;${MAT=
HLIB_C674_INSTALL_DIR}/packages&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DSPLIB_INSTALL_DIR_RECIPE =3D &quot=
;${DSPLIB_C674_INSTALL_DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DSPLIB_INSTALL_DIR =3D &quot;${DSPL=
IB_C674_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DSPLIB_BUILD_TARGET =3D &quot;c674x=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DEPENDS =3D &quot;mathlib-c674x&quo=
t;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;include dsplib.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;diff --git a/recipes-ti/dsplib/dsplib.in=
c b/recipes-ti/dsplib/dsplib.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;index 0000000..66fe0fb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;--- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&#43;&#43; b/recipes-ti/dsplib/dspl=
ib.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;@@ -0,0 &#43;1,79 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;SUMMARY =3D &quot;DSPLIB contains o=
ptimized signal processing functions for TI DSPs&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;HOMEPAGE =3D &quot;http://git.ti.co=
m/ep-processor-libraries/dsplib&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;LICENSE =3D &quot;BSD-3-Clause&quot=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;require ../includes/ti-paths.inc<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;PV =3D &quot;3_4_0_1&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;PR =3D &quot;r0&quot;<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;COMPATIBLE_MACHINE =3D &quot;am57xx=
-evm|keystone|c66x|omapl1&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DEPENDS &#43;=3D &quot;ti-cgt6x-nat=
ive \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ti-xdctools-native \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ti-sysbios \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; doxygen-native \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; zip-native \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; swtools &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;S =3D &quot;${WORKDIR}/git&quot;<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;SRC_URI =3D &quot;git://git.ti.com/=
ep-processor-libraries/dsplib.git;protocol=3Dgit;branch=3Dmaster&quot;<o:p>=
</o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;SRCREV =3D &quot;bf5a51cba462c5cb03=
ed20a6a1bb1bd16c0683e1&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;LIC_FILES_CHKSUM =3D &quot;file://t=
i/dsplib/src/common/c66/lnk.cmd;beginline=3D1;endline=3D37;md5=3D0f0c9c4d51=
d8af75419781591ace190b&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export DSPLIB_WORK_DIR=3D&quot;${S}=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export CGTOOLS_INSTALL_DIR&nbsp; =
=3D &quot;${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export C64PCODEGENTOOL=3D&quot;${CG=
TOOLS_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export C674CODEGENTOOL=3D&quot;${CG=
TOOLS_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export C66CODEGENTOOL =3D&quot;${CG=
TOOLS_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export SWTOOLS_PATH =3D &quot;${SWT=
OOLS_INSTALL_DIR}/ti/mas/swtools&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export XDCBUILDCFG=3D&quot;${SWTOOL=
S_PATH}/config.bld&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export INCDIR=3D&quot;${MATHLIB_INS=
TALL_DIR}/&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;PATH_append =3D &quot;:${XDC_INSTAL=
L_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;XDCPATH.=3D&quot;${XDCCGROOT}/inclu=
de;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;&quot;<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;XDCPATH.=3D&quot;${SWTOOLS_INSTALL_=
DIR};${MATHLIB_INSTALL_DIR};${DSPLIB_WORK_DIR};&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export XDCPATH<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;DSPLIB_PACKAGE_NAME =3D &quot;dspli=
b_${DSPLIB_BUILD_TARGET}_${PV}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;do_compile() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; cd ${DSPLIB_WORK_DIR}/ti/dsplib;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; xdc XDCARGS=3D&quot;${DSPLIB_BUILD_TARGET} bundle&quot; XDCOPTIONS=3D&quo=
t;-v&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;do_install() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; install -d ${D}${DSPLIB_INSTALL_DIR_RECIPE}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; find -name &quot;${DSPLIB_PACKAGE_NAME}.zip&quot; -exec unzip -o {} -d ${=
D}${DSPLIB_INSTALL_DIR_RECIPE} \;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/* ${D}${DSPLIB_INSTALL_DIR_REC=
IPE}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/.metadata ${D}${DSPLIB_INSTALL=
_DIR_RECIPE}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;inherit deploy<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;addtask deploy before do_build afte=
r do_install<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;do_deploy() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; install -d ${DEPLOYDIR}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; # zip up files in ${D}${DSPLIB_INSTALL_DIR_RECIPE}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; # and place the zip file in ${DEPLOYDIR}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; mkdir ./${DSPLIB_PACKAGE_NAME}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/* ./${DSPLIB_PACKAGE_NAME}<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/.metadata ./${DSPLIB_PACKAGE_NAME}=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip ./${DSPLIB_PACKAG=
E_NAME}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; rm -r ./${DSPLIB_PACKAGE_NAME}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;PACKAGE_ARCH =3D &quot;${MACHINE_AR=
CH}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;ALLOW_EMPTY_${PN} =3D &quot;1&quot;=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;FILES_${PN}-dev &#43;=3D &quot;${DS=
PLIB_INSTALL_DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;INSANE_SKIP_${PN}-dev =3D &quot;arc=
h&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;diff --git a/recipes-ti/includes/ti-path=
s.inc b/recipes-ti/includes/ti-paths.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;index 4f99d5e..8740b6a 100644<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &gt;--- a/recipes-ti/includes/ti-paths.inc<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;&#43;&#43; b/recipes-ti/includes/ti=
-paths.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;@@ -17,6 &#43;17,7 @@ export DMAI_INSTAL=
L_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti=
-dmai-tree&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export DSP_BENCHMARK_INSTALL_DIR_=
RECIPE =3D &quot;${installdir}/ti-dsp-benchmark-tree&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export DSPLIB_C64P_INSTALL_DIR_RE=
CIPE =3D &quot;${installdir}/ti-dsplib-c64p-tree&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export DSPLIB_C674_INSTALL_DIR_RE=
CIPE =3D &quot;${installdir}/ti-dsplib-c674x-tree&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export DSPLIB_C66_INSTALL_DIR_RECIP=
E&nbsp; =3D &quot;${installdir}/ti-dsplib-c66x-tree&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export DSPLIB_INSTALL_DIR_RECIPE&=
nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-dsplib-tree&quot;<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export DVSDK_DEMOS_INSTALL_DIR_RE=
CIPE=3D &quot;${installdir}/ti-dvsdk-demos-tree&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export DVTB_INSTALL_DIR_RECIPE&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-dvtb-tree&quot=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;@@ -39,6 &#43;40,7 @@ export OSAL_INSTAL=
L_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti=
-osal-tree&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export RTFS_INSTALL_DIR_RECIPE&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-rtfs-tree&quot=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export SYSBIOS_INSTALL_DIR_RECIPE=
&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-sysbios-tree&quot;<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export SYSLINK_INSTALL_DIR_RECIPE=
&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-syslink-tree&quot;<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export SWTOOLS_INSTALL_DIR_RECIPE&n=
bsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-swtools-tree&quot;<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export UIA_INSTALL_DIR_RECIPE&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-uia-tree&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export VICPLIB_INSTALL_DIR_RECIPE=
&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-vicplib-tree&quot;<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export XDAIS_INSTALL_DIR_RECIPE&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-xdais-tree&quot;<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;@@ -48,8 &#43;50,8 @@ export OSAL_INSTAL=
L_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti=
-osal-tree&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export M4_TOOLCHAIN_INSTALL_DIR_R=
ECIPE&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-cgt-arm&quot;<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export GCC_ARM_NONE_TOOLCHAIN_REC=
IPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/gcc-arm-none-eabi=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export TI_CGT_PRU_INSTALL_DIR_REC=
IPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/cgt-pru&quot;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;-export DSPLIB_C66_INSTALL_DIR_RECIPE&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-dsplib-c66x-tree&quo=
t;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export MATHLIB_C66_INSTALL_DIR_RE=
CIPE&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-mathlib-c66x-tree&q=
uot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export MATHLIB_C674_INSTALL_DIR_REC=
IPE&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-mathlib-c674x-tree&quot;<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export IMGLIB_C66_INSTALL_DIR_REC=
IPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-imglib-c66x-tr=
ee&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export VLIB_C66_INSTALL_DIR_RECIP=
E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-vlib=
-c66x-tree&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export CG_XML_INSTALL_DIR_RECIPE&=
nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-cg-xml-tree&quot;<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;@@ -95,7 &#43;97,11 @@ export OSAL_INSTA=
LL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_TARGET}$=
{OSAL_INSTALL_DIR_RECIPE}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export M4_TOOLCHAIN_INSTALL_DIR&n=
bsp;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_=
RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export GCC_ARM_NONE_TOOLCHAIN&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TO=
OLCHAIN_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export TI_CGT_PRU_INSTALL_DIR&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_NATIVE}${TI_CGT_PRU_INST=
ALL_DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export SWTOOLS_INSTALL_DIR&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_TARGET}${SW=
TOOLS_INSTALL_DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export DSPLIB_C64P_INSTALL_DIR&nbsp=
;&nbsp;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_TARGET}${DSPLIB_C64P_INSTALL_DI=
R_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export DSPLIB_C674_INSTALL_DIR&nbsp=
;&nbsp;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_TARGET}${DSPLIB_C674_INSTALL_DI=
R_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export DSPLIB_C66_INSTALL_DIR&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_TARGET}${DSPLIB_C66_INST=
ALL_DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&#43;export MATHLIB_C674_INSTALL_DIR&nbs=
p;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_TARGET}${MATHLIB_C674_INSTALL_DIR_RE=
CIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export MATHLIB_C66_INSTALL_DIR&nb=
sp;&nbsp;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_=
DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export IMGLIB_C66_INSTALL_DIR&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_TARGET}${IMGLIB_C66_INST=
ALL_DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; export VLIB_C66_INSTALL_DIR&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${STAGING_DIR_TARGET}${VLIB_=
C66_INSTALL_DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -- <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ____________________________________________=
___<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; meta-ti mailing list<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; meta-ti@yoctoproject.org<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; https://lists.yoctoproject.org/listinfo/meta=
-ti<o:p></o:p></p>
</div>
</body>
</html>

--_000_0edace8daec141e48401dfaf972f69afticom_--

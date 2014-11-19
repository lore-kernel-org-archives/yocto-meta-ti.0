Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55797E0084F; Wed, 19 Nov 2014 09:09:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 114F3E0071C
	for <meta-ti@yoctoproject.org>; Wed, 19 Nov 2014 09:09:52 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAJH9pcF014570
	for <meta-ti@yoctoproject.org>; Wed, 19 Nov 2014 11:09:51 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAJH9p1d031875
	for <meta-ti@yoctoproject.org>; Wed, 19 Nov 2014 11:09:51 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 19 Nov 2014 11:09:51 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] edma3-lld: add new recipe for edma3 low
	level	driver
Thread-Index: AQHQA/vjHOoRYW6VCEu03EI4kwrPqZxoLuKw
Date: Wed, 19 Nov 2014 17:09:50 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D375DBE@DLEE11.ent.ti.com>
References: <1416403293-23706-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1416403293-23706-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] edma3-lld: add new recipe for edma3 low level	driver
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
X-List-Received-Date: Wed, 19 Nov 2014 17:09:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Same comments as mmap-lld about whether this should be a machine specific r=
ecipe.  For the do_install you could use a machine override for the values =
there.  Just a thought though as to whether that makes more sense or not.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Nelson, Sam
Sent: Wednesday, November 19, 2014 7:22 AM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] [PATCH] edma3-lld: add new recipe for edma3 low level dr=
iver

- Provides low level driver for EDMA3 module
- supports k2k, k2l, k2e evm platforms

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld_git.bb |   80 ++++++++++++++++++++++++++++=
++++
 1 file changed, 80 insertions(+)
 create mode 100755 recipes-bsp/edma3-lld/edma3-lld_git.bb

diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld=
/edma3-lld_git.bb
new file mode 100755
index 0000000..1ed4b93
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bb
@@ -0,0 +1,80 @@
+DESCRIPTION =3D "TI EDMA3 low level driver and test code"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D5bdceac872dffdec915b819654e=
e23ea"
+
+BRANCH =3D "master"
+SRC_URI =3D "git://git.ti.com/keystone-rtos/edma3_lld.git"
+# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_13_17=20
+SRCREV =3D "8c27e548fa53ca8472404ef347b8f6b6e2588d46"
+
+PV =3D "2.11.13"
+PR =3D "r0"
+
+COMPATIBLE_MACHINE =3D "keystone"
+
+DEPENDS =3D "common-csl-ip"
+
+PLATFORMLIST =3D "tci6636k2h-evm \
+	tci6638k2k-evm \
+	tci6630k2l-evm \
+	c66ak2e-evm \
+	"
+
+PACKAGES =3D+ "${PN}-test"
+
+FILES_${PN}-test =3D "${bindir}/*"
+
+S =3D "${WORKDIR}/git"
+
+do_compile () {
+	cd ${S}/packages
+	for platform in ${PLATFORMLIST}
+	do
+		ROOTDIR=3D${S} CROSSCC=3D"${TARGET_PREFIX}gcc" CROSSAR=3D"${TARGET_PREFI=
X}ar" \
+		CROSSLNK=3D"${TARGET_PREFIX}gcc" INTERNAL_SW_ROOT=3D"${S}" make \
+		PLATFORM=3D"$platform" TARGET=3Da15 TOOLCHAIN_a15=3DGCC FORMAT=3DELF \
+		SONAME=3Dlibedma3.so all
+	done
+}
+
+do_install () {
+	install -d ${D}/${libdir}
+
+	# Static Libraries
+	cp ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/edma3_lld_drv.aa15fg \
+		${D}/${libdir}/libedma3.a
+	cp ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/edma3_lld=
_rm.aa15fg \
+		${D}/${libdir}/libedma3rm.a
+
+	# Shared Libraries
+	cp -a ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/libedma* ${D}/${libd=
ir}
+	cp -a=20
+${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/libedma*=20
+${D}/${libdir}
+
+	# Copy Headers
+	install -d ${D}/${includedir}/ti/sdo/edma3/drv/
+	install -d ${D}/${includedir}/ti/sdo/edma3/rm
+	cp ${S}/packages/ti/sdo/edma3/drv/*.h ${D}/${includedir}/ti/sdo/edma3/drv=
/
+	cp ${S}/packages/ti/sdo/edma3/rm/*.h=20
+${D}/${includedir}/ti/sdo/edma3/rm/
+
+	# Copy Sample Config
+	install -d ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/evmTCI6636K2HSampl=
e.c \
+		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/evmTCI6638K2KSampl=
e.c \
+		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/evmTCI6630K2LSampl=
e.c \
+		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmC66AK2E/evmC66AK2ESample.c \
+		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+
+	install -d ${D}/${bindir}
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/bin=
/tci6636k2h-evm/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg \
+		${D}/${bindir}/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/bin=
/tci6638k2k-evm/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg \
+		${D}/${bindir}/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/bin=
/tci6630k2l-evm/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg \
+		${D}/${bindir}/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmC66AK2E/bin/c6=
6ak2e-evm/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg \
+		${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
+}
+
--
1.7.9.5

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


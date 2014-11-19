Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF36DE0084F; Wed, 19 Nov 2014 09:05:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 661BCE0071C
	for <meta-ti@yoctoproject.org>; Wed, 19 Nov 2014 09:05:53 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAJH5qa9002781
	for <meta-ti@yoctoproject.org>; Wed, 19 Nov 2014 11:05:52 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAJH5qec028873
	for <meta-ti@yoctoproject.org>; Wed, 19 Nov 2014 11:05:52 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 19 Nov 2014 11:05:52 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] mmap-lld; Add new recipe for mmap lld
Thread-Index: AQHQA+6jdF/zJ5TMvU2VC3dKlW1pM5xoLK4g
Date: Wed, 19 Nov 2014 17:05:51 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D375D5C@DLEE11.ent.ti.com>
References: <1416397621-20552-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1416397621-20552-1-git-send-email-sam.nelson@ti.com>
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
X-List-Received-Date: Wed, 19 Nov 2014 17:05:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-l=
ld/mmap-lld-test_git.bb
new file mode 100755
index 0000000..41e46f7
--- /dev/null
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -0,0 +1,40 @@
+DESCRIPTION =3D "TI KEYSTONE MMAP driver test binaries "
+include mmap-lld.inc
+
+DEPENDS=3D"common-csl-ip mmap-lld"
+RDEPENDS_${PN}=3D"uio-module-drv"
+
+DEVICELIST =3D "k2h \
+              k2k \
+              k2e \
+"

I don't have a fundamental issue with a single  recipe for all devices, but=
 would it be easier to make this per device and then keep a generic binary =
name?  i.e. a machine specific recipe that installs the binary build for th=
at device into the file system?

+
+CHOICELIST =3D " yes \
+               no \
+"
+
+do_compile () {
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 clean \
+			PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
+			DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}"
+		for choice in ${CHOICELIST}
+		do
+			make -f makefile_armv7 tests examples \
+				PDK_INSTALL_PATH=3D${STAGING_INCDIR} \
+				DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}" \
+				USEDYNAMIC_LIB=3D"$choice"
+		done

What is the purpose for both choice options?  Are you expecting users to us=
e both?

+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 installbin \
+		PDK_INSTALL_PATH=3D${STAGING_INCDIR} \
+		DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}" \
+		INSTALL_BIN_BASE_DIR=3D"${D}/${bindir}"
+	done
+}
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-=
lld.inc
new file mode 100644
index 0000000..b8a5b32
--- /dev/null
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -0,0 +1,16 @@
+LICENSE =3D "BSD-3-Clause"
+
+COMPATIBLE_MACHINE =3D "keystone"
+
+LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Db3315b8190036fe1c6a8263d02e=
15606"

Nit pick here but can this checksum go after the LICENSE setting?

+
+
+BRANCH=3D"master"
+SRC_URI =3D "git://git.ti.com/keystone-rtos/mmap-lld.git;destsuffix=3Dgit/=
ti/runtime/mmap;protocol=3Dgit;branch=3D${BRANCH}"
+# Commit correspond to DEV.MMAP.02.00.00.03 SRCREV =3D=20
+"601f9284c392f67bb7f69ed1a5df5231a43c3137"

I would put the SRCREV in the _git file, not in the .inc since you would ex=
pect the .inc to be common across all versions.  I guess you are using the =
.inc to handle the different test vs driver recipes.  Maybe a better idea w=
ould be a single recipe that builds both but package the driver as the defa=
ult package and make a new PACKAGE for the test applications?=20

+
+PV=3D"2.0.0"
+PR =3D "r0"
+
+S =3D "${WORKDIR}/git/ti/runtime/mmap"
\ No newline at end of file
diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-lld/mm=
ap-lld_git.bb
new file mode 100755
index 0000000..3a56a62
--- /dev/null
+++ b/recipes-bsp/mmap-lld/mmap-lld_git.bb
@@ -0,0 +1,12 @@
+DESCRIPTION =3D "TI KEYSTONE mmap driver using Keystone MPAX Programming"
+include mmap-lld.inc
+
+DEPENDS=3D"common-csl-ip"
+
+do_compile () {
+	make -f makefile_armv7 clean lib PDK_INSTALL_PATH=3D${STAGING_INCDIR}
+}
+
+do_install () {
+	make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR}=20
+INSTALL_INC_BASE_DIR=3D${D}/${includedir}=20
+INSTALL_LIB_BASE_DIR=3D${D}${libdir}
+}
--
1.7.9.5

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


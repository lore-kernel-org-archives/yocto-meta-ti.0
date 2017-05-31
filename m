Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA3EBE00B01; Wed, 31 May 2017 10:20:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BD53E00992
	for <meta-ti@yoctoproject.org>; Wed, 31 May 2017 10:20:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4VHKWks002217
	for <meta-ti@yoctoproject.org>; Wed, 31 May 2017 12:20:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496251232;
	bh=sGuy2F2q7vNQn72y+eYKoo+s/iFUnWMNvvEG/uh38/w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=glyVw4KVEM+sc+nGF/9OYYIW9/BiivWLj/t2VWwzmcS/G51Fxv25jj0U1sKW/YN5J
	Cg3S/U9UVAySamJ7+azRglhauzq3hQRSZ8dUGgywX+Pzy9uRrPM1OdnPI+vnjqYr1x
	S7cFdBsBOziFJAqBhElELCai9AyfaDUmpQOCswRA=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4VHKWQ3009269
	for <meta-ti@yoctoproject.org>; Wed, 31 May 2017 12:20:32 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Wed, 31 May 2017 12:20:32 -0500
From: "Pang, Ivan" <i-pang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-ti] [PATCH] starterware-rtos: added recipe for RTOS
	starterware
Thread-Index: AQHS2iy9JOPYEq2rnEGKx39k2cSJfKIO+xkAgAADiAD//7CR4A==
Date: Wed, 31 May 2017 17:20:30 +0000
Message-ID: <C45960711C772449A33A51ED1374F08A406207CC@DFLE08.ent.ti.com>
References: <1496248865-13909-1-git-send-email-i-pang@ti.com>
	<d448e54f-e861-929c-648f-204b31f8b96f@ti.com>
	<20170531170143.GM28136@edge>
In-Reply-To: <20170531170143.GM28136@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] starterware-rtos: added recipe for RTOS starterware
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
X-List-Received-Date: Wed, 31 May 2017 17:20:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2017 at 12:49:06PM -0400, Jacob Stiffler wrote:
>=20
>=20
> On 5/31/2017 12:41 PM, Ivan Pang wrote:
> >Signed-off-by: Ivan Pang <i-pang@ti.com>
> >---
> >  recipes-bsp/starterware/starterware-rtos_git.bb | 46=20
> >+++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 recipes-bsp/starterware/starterware-rtos_git.bb
> >
> >diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb=20
> >b/recipes-bsp/starterware/starterware-rtos_git.bb
> >new file mode 100644
> >index 0000000..f831fb8
> >--- /dev/null
> >+++ b/recipes-bsp/starterware/starterware-rtos_git.bb
> >@@ -0,0 +1,46 @@
> >+LICENSE =3D "BSD-3-Clause"
> >+LIC_FILES_CHKSUM =3D "file://Makefile;beginline=3D1;endline=3D35;md5=3D=
286cbb5dce3e348294b6b025cff969b3"
> >+
> >+COMPATIBLE_MACHINE =3D "ti33x|ti43x"
> >+DEPENDS =3D "gcc-arm-none-eabi-native"
> >+
> >+require recipes-ti/includes/ti-paths-append.inc
>       ^^^ This is not available in the meta-ti layer.
[Ivan] will change to ti-paths.inc and submit a PATCH v2

BTW, is it any different from previous submission last week?
[Ivan] No, it's the same patch, but this time I included [meta-ti] in the s=
ubject line as it was missing before.

> >+require recipes-ti/includes/ti-staging.inc
> >+
> >+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >+
> >+STARTERWARE_GIT_URI =3D "git://git.ti.com/keystone-rtos/starterware.git=
"
> >+STARTERWARE_GIT_PROTOCOL =3D "git"
> >+STARTERWARE_GIT_BRANCH =3D "master"
> >+
> >+# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.02A"
> >+STARTERWARE_SRCREV =3D "d648ffc46a3508802ec5d4f70f3d0e8f970ce1fa"
> >+
> >+BRANCH =3D "${STARTERWARE_GIT_BRANCH}"
> >+SRC_URI =3D "${STARTERWARE_GIT_URI};protocol=3D${STARTERWARE_GIT_PROTOC=
OL};branch=3D${BRANCH}"
> >+
> >+SRCREV =3D "${STARTERWARE_SRCREV}"
> >+PV =3D "02.01.01.02A"
> >+PR =3D "r0"
> >+
> >+S =3D "${WORKDIR}/git"
> >+
> >+PARTNO_ti33x =3D "am335x"
> >+PARTNO_ti43x =3D "am437x"
> >+
> >+export TOOLCHAIN_PATH_A8 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
> >+export TOOLCHAIN_PATH_A9 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
> >+
> >+do_compile() {
> >+    cd build
> >+    ./release_${PARTNO}.sh
> >+}
> >+
> >+do_install() {
> >+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware
> >+    find -name "*.tar" -exec tar xf {} --no-same-owner -C=20
> >+${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware \; }
> >+
> >+FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
> >+
> >+INSANE_SKIP_${PN} =3D "arch staticdev"
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


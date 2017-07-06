Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDC8FE00B57; Thu,  6 Jul 2017 11:02:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4ACCCE00A9B
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 11:02:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66I2eSN006328
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 13:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499364160;
	bh=pTsre0+Pd2+0kjOSM0W2pHWkFEcreHBUQHzcW6FRaTE=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=lxOUHZUQd0n5ujhygn+D2z0MWaK6vQyMGeyuQRLJBH57fcfCvATCmfGprza+6R1JS
	kRwB85gsqSgS2Wxg67ltATUS1tkICBT1I16aRkE4QR5cWhRax950HmqGgw5XVSxvkz
	YFNqAW8PviU/b+OnkwqGj8DBong8veOXi8z2dD+E=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66I2Zjb008007
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 13:02:35 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Thu, 6 Jul 2017 13:02:35 -0500
From: "Pang, Ivan" <i-pang@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] board-rtos: Added board-rtos recipe
Thread-Index: AQHS9nZxgt/G2dYCq0CuDqjC/JsnbKJHFhnA
Date: Thu, 6 Jul 2017 18:02:34 +0000
Message-ID: <C45960711C772449A33A51ED1374F08A406267AF@DFLE08.ent.ti.com>
References: <1499359152-35413-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1499359152-35413-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [PATCH] board-rtos: Added board-rtos recipe
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
X-List-Received-Date: Thu, 06 Jul 2017 18:02:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Are all the DEPENDS needed already upstreamed or in patches preceding this?
There's probably no other recipe using board.inc, so you can combine this i=
nto a single recipe too.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Radhakrishnan, Mahesh
Sent: Thursday, July 06, 2017 11:39 AM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] [PATCH] board-rtos: Added board-rtos recipe

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bb | 58 ++++++++++++++++++++++++++++=
++++
 recipes-bsp/board-rtos/board.inc         | 19 +++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bb
 create mode 100644 recipes-bsp/board-rtos/board.inc

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-r=
tos/board-rtos_git.bb
new file mode 100644
index 0000000..b4b8b0b
--- /dev/null
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -0,0 +1,58 @@
+inherit ti-pdk
+require board.inc
+
+PR =3D "${INC_PR}.0"
+
+DEPENDS_append =3D " i2c-lld-rtos \
+                   spi-lld-rtos \
+                   uart-lld-rtos \
+"
+
+DEPENDS_append_omap-a15 =3D " osal-rtos \
+                            ti-ndk \
+"
+
+DEPENDS_append_am57xx-evm =3D " gpio-lld-rtos \
+                              icss-emac-lld-rtos \
+                              mmcsd-lld-rtos \
+                              pruss-lld-rtos \
+                              pm-lld-rtos \ "
+
+DEPENDS_append_ti33x =3D " gpio-lld-rtos \
+                         gpmc-lld-rtos \
+                         icss-emac-lld-rtos \
+                         mmcsd-lld-rtos \
+                         osal-rtos \
+                         pruss-lld-rtos \
+                         starterware-rtos \
+                         ti-ndk \
+"
+
+DEPENDS_append_ti43x =3D " gpio-lld-rtos \
+                         gpmc-lld-rtos \
+                         icss-emac-lld-rtos \
+                         mmcsd-lld-rtos \
+                         osal-rtos \
+                         pruss-lld-rtos \
+                         starterware-rtos \
+                         ti-ndk \
+"
+
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE =3D "0"
+
+LIMBOARDS_ti33x =3D "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
+LIMBOARDS_ti43x =3D "evmAM437x idkAM437x skAM437x"
+LIMBOARDS_am57xx-evm =3D "evmAM571x evmAM572x idkAM571x idkAM572x"
+LIMBOARDS_dra7xx-evm =3D "evmDRA72x evmDRA75x evmDRA78x"
+LIMBOARDS_omapl137-evm =3D "evmOMAPL137"
+LIMBOARDS_omapl138-lcdk =3D "lcdkOMAPL138"
+LIMBOARDS_k2hk-evm =3D "evmK2H evmK2K"
+LIMBOARDS_k2e-evm =3D "evmK2E"
+LIMBOARDS_k2l-evm =3D "evmK2L"
+LIMBOARDS_k2g =3D "evmK2G iceK2G"
+export PDK_BOARD_ROOT_PATH =3D"${WORKDIR}/build"
+export DEST_ROOT=3D"${S}"
+XDCPATH_append =3D ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}=
/packages"
diff --git a/recipes-bsp/board-rtos/board.inc b/recipes-bsp/board-rtos/boar=
d.inc
new file mode 100644
index 0000000..6d6655e
--- /dev/null
+++ b/recipes-bsp/board-rtos/board.inc
@@ -0,0 +1,19 @@
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://board.h;beginline=3D1;endline=3D32;md5=3D0e31=
82ba6a963da159c37eafa9752ade"
+
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|omapl1"
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+BOARD_GIT_URI =3D "git://git.ti.com/keystone-rtos/board.git"
+BOARD_GIT_PROTOCOL =3D "git"
+BOARD_GIT_BRANCH =3D "master"
+
+# Below commit ID corresponds to "DEV.BOARD.01.00.07.00"
+BOARD_SRCREV =3D "7d6a76ee65d75714740d468a48ca7e3668e66a94"
+
+BRANCH =3D"${BOARD_GIT_BRANCH}"
+SRC_URI =3D "${BOARD_GIT_URI};protocol=3D${BOARD_GIT_PROTOCOL};branch=3D${=
BRANCH}"
+
+SRCREV =3D "${BOARD_SRCREV}"
+PV =3D "01.00.07.00"
+INC_PR =3D "r0"
--
1.9.1

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


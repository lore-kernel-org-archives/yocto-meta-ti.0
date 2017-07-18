Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CB6BE00C54; Tue, 18 Jul 2017 16:04:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C86A3E00C4D
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:22 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4MDM020756
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419062;
	bh=dWfoJgS9G85sl/ixorMVcmsZGdXYVli6mZMxCBL7Koo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uparif6uSFq99/mRKGuIluL/iVBOtxls7BLB82pDnFx4MnyCCl1kns6knUeHxLJJp
	ZuaBjhoL4fjZWRsbbhNyDFjbThLsrKI9lfzUTC0w7PVjHDIsCocbwTkwgVeW5m29uY
	Eaib9wMEn4OxStIs5hdzz9AfIHiQEsyLOoh/Otgs=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4MgH031721
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:22 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:21 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46he000997;	Tue, 18 Jul 2017 18:04:21 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:18 -0400
Message-ID: <1500419028-3361-7-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 07/37] gpio-lld-rtos: Added rtos recipe for gpio lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:24 -0000
Content-Type: text/plain

Upstreaming TI RTOS driver for General Purpose IO pins (GPIO)

'Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Adding summary

 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb

diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
new file mode 100644
index 0000000..be68c9e
--- /dev/null
+++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
@@ -0,0 +1,42 @@
+SUMMARY = "TI RTOS driver for General Purpose IO (GPIO)"
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://GPIO.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c667x-evm|c665x-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+GPIO_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/gpio-lld.git"
+GPIO_LLD_GIT_PROTOCOL = "git"
+GPIO_LLD_GIT_BRANCH = "master"
+GPIO_LLD_GIT_DESTSUFFIX = "git/ti/drv/gpio"
+
+# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.07A"
+GPIO_LLD_SRCREV = "3abf90c7c3dabb456346da0ab308fab12ff590de"
+
+BRANCH = "${GPIO_LLD_GIT_BRANCH}"
+SRC_URI = "${GPIO_LLD_GIT_URI};destsuffix=${GPIO_LLD_GIT_DESTSUFFIX};protocol=${GPIO_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${GPIO_LLD_SRCREV}"
+PV = "01.00.00.07A"
+PR = "r0"
+
+S = "${WORKDIR}/${GPIO_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append = " osal-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_GPIO_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "GPIO LLD"
-- 
1.9.1



Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0EB35E00BD5; Thu,  6 Jul 2017 15:28:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0A22E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:28:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MSTfn002618
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:28:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499380109;
	bh=wAzhCcUyLs6VwrIQ4cVCcch4YA/V/j7iEhe80tdC2lE=;
	h=From:To:CC:Subject:Date;
	b=nNWcdITRtDJ1W5rKuXl6HlGMzVuS3qRVG8CpEwdlQEqHhcEOu/VBxNlHM8hJlIQpd
	Bw8M33qgYj1kFfR1AUtAJc0c7kfZxpdMqQEJ+BvKu3YwZk5At5LhoXsBMB02sC0bNi
	vXo5+3US9T0Pl97iVs4Mml8y5IVTKZwDMtacnOhc=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MSTtI009066
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:28:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:28:28 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MSSeT018480;	Thu, 6 Jul 2017 17:28:28 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:28:27 -0400
Message-ID: <1499380107-57353-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gpmc-lld-rtos: Added rtos recipe for gpmc-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:28:31 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb

diff --git a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
new file mode 100644
index 0000000..fb1636e
--- /dev/null
+++ b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
@@ -0,0 +1,37 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://GPMC.h;beginline=1;endline=31;md5=485ec97c36f809bf92323fde3e988c72"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+GPMC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/gpmc-lld.git"
+GPMC_LLD_GIT_PROTOCOL = "git"
+GPMC_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.GPMC_LLD.01.00.00.01"
+GPMC_LLD_SRCREV = "86df4c099ad9c84f4b92d515ba64c343c75cf44d"
+
+BRANCH = "${GPMC_LLD_GIT_BRANCH}"
+SRC_URI = "${GPMC_LLD_GIT_URI};protocol=${GPMC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${GPMC_LLD_SRCREV}"
+PV = "01.00.00.01"
+PR = "r0"
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
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "GPMC LLD"
+
+export PDK_GPMC_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
-- 
1.9.1



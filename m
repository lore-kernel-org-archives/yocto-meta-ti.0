Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0ED91E00BD5; Thu,  6 Jul 2017 15:01:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2FC3E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:01:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66M1MiM022420
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499378482;
	bh=fRuBN2L8HvnaSKjXIP6X6hWCTCvknXwL8mO+JLzwHuw=;
	h=From:To:CC:Subject:Date;
	b=cmD0IcsHBh86NIm4Wp2mkZaNb2JLZG425W6F2Mofo2V1gS59DyMSBW+bFbXI/kX9o
	T1pI+It6N94vF9b44UQsd2tz1xgiMmZgMPHAybFGd4xyEG4TkwhdOZqcuyJFMN8829
	rP6PBtyjnnYUM42JbwpdGTNpysZEq+kgGRKGDi+Q=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66M1MPr008871
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:01:22 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:01:22 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66M1MY1024321;	Thu, 6 Jul 2017 17:01:22 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:01:20 -0400
Message-ID: <1499378480-55812-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] fftc-lld-rtos: Added rtos recipe for fftc-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:01:25 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb

diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
new file mode 100644
index 0000000..0b73b9e
--- /dev/null
+++ b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
@@ -0,0 +1,32 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://fftc.h;beginline=1;endline=39;md5=2f1010c47d364414644caf6d30a2b7df"
+
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FFTC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/fftc-lld.git"
+FFTC_LLD_GIT_PROTOCOL = "git"
+FFTC_LLD_GIT_BRANCH = "master"
+FFTC_LLD_GIT_DESTSUFFIX = "git/ti/drv/fftc"
+
+# Below commit ID corresponds to "DEV.FFTC_LLD.02.02.00.06A"
+FFTC_LLD_SRCREV = "96e8839a2de5f15ba8765f4a6a4fd499689c496d"
+
+BRANCH = "${FFTC_LLD_GIT_BRANCH}"
+SRC_URI = "${FFTC_LLD_GIT_URI};destsuffix=${FFTC_LLD_GIT_DESTSUFFIX};protocol=${FFTC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${FFTC_LLD_SRCREV}"
+PV = "02.02.00.06A"
+PR = "r0"
+
+S = "${WORKDIR}/${FFTC_LLD_GIT_DESTSUFFIX}"
+
+
+DEPENDS_append= " qmss-lld-rtos \
+                  cppi-lld-rtos \
+"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "FFTC LLD"
-- 
1.9.1



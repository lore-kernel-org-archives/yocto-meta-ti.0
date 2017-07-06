Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53DA6E00BAD; Thu,  6 Jul 2017 09:50:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,TVD_SPACE_RATIO,
	TVD_SPACE_RATIO_MINFP autolearn=ham version=3.3.1
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
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  0.0 TVD_SPACE_RATIO_MINFP Space ratio
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2C5DE00B57
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:50:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66Go9tI010399
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499359809;
	bh=HLMi7zT9++ij5ePaagh3snyZL3RMR8zWDmlPiQJ0PgI=;
	h=From:To:CC:Subject:Date;
	b=KitDb43fY9M2Dmpx0X6mtwuKcMghfbBejWSvLjin6LH5g8XvZU37uelcI+FI21mJN
	VaRkR5LIYw+snaO3DcZZPsEHXJvc5I7ytf7NnOY2ehwT1JosjmcHSqQadJqc0WuFDr
	Q1gqFSVsYBZi6BDtaT2EIWQF7sb1RrTF+LtVKKgs=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66Go9jw006137
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:50:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:50:08 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66Go8Pv019879;	Thu, 6 Jul 2017 11:50:08 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:50:07 -0400
Message-ID: <1499359807-37981-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] faultmanagement-rtos: Added rtos recipe for faultmanagement
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
X-List-Received-Date: Thu, 06 Jul 2017 16:50:10 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../faultmanagement/faultmanagement-rtos_git.bb    | 14 ++++++++++++++
 recipes-bsp/faultmanagement/faultmanagement.inc    | 22 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
 create mode 100644 recipes-bsp/faultmanagement/faultmanagement.inc

diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
new file mode 100644
index 0000000..9bef92d
--- /dev/null
+++ b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
@@ -0,0 +1,14 @@
+inherit ti-pdk
+require faultmanagement.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append_keystone = " qmss-lld-rtos \
+                            cppi-lld-rtos \
+                            pa-lld-rtos \
+"
+
+DEPENDS_append_k2hk-evm = " aif2-lld-rtos \
+"
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "Fault Management"
diff --git a/recipes-bsp/faultmanagement/faultmanagement.inc b/recipes-bsp/faultmanagement/faultmanagement.inc
new file mode 100644
index 0000000..c5ebe8a
--- /dev/null
+++ b/recipes-bsp/faultmanagement/faultmanagement.inc
@@ -0,0 +1,22 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://fault_mgmt.h;beginline=1;endline=41;md5=4be5df2b9c314da729e9e4f6cc0b2979"
+
+COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm|k2l-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FAULT_MANAGEMENT_GIT_URI = "git://git.ti.com/keystone-rtos/fault_mgmt.git"
+FAULT_MANAGEMENT_GIT_PROTOCOL = "git"
+FAULT_MANAGEMENT_GIT_BRANCH = "master"
+FAULT_MANAGEMENT_GIT_DESTSUFFIX = "git/ti/instrumentation/fault_mgmt"
+
+# Below commit ID corresponds to "DEV.FAULT_MGMT.01.00.01.03"
+FAULT_MANAGEMENT_SRCREV = "a300e7d1f262bdfa48c92851bad0da228a41acc3"
+
+BRANCH = "${FAULT_MANAGEMENT_GIT_BRANCH}"
+SRC_URI = "${FAULT_MANAGEMENT_GIT_URI};destsuffix=${FAULT_MANAGEMENT_GIT_DESTSUFFIX};protocol=${FAULT_MANAGEMENT_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${FAULT_MANAGEMENT_SRCREV}"
+PV = "01.00.01.03"
+INC_PR = "r0"
+
+S = "${WORKDIR}/${FAULT_MANAGEMENT_GIT_DESTSUFFIX}"
-- 
1.9.1



Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CE19E00BD5; Thu,  6 Jul 2017 15:03:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BE44E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:03:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66M3gfH022618
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499378622;
	bh=zVnZsKXcEHRev2D8MjDQTyml2D9OaCbUF+oHJP9bVp4=;
	h=From:To:CC:Subject:Date;
	b=Nom0pKhsRROQoYZm5I1bcnCbAWpVvbEL+chXX63UABtg8RfKgZHuXk3efWI2qkPgz
	2kFAqHUv94rRMWzAWQqtUFjfJ3HqKwDiWCEnwSuH/VYhLE5KuM5Fb3/hTPsLDepLV7
	Jz+KyMn3rcL1AgsW5EuxzRkIq1nxZPEMzjv6TLiU=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66M3gT9009725
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:03:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:03:42 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66M3gKM026833;	Thu, 6 Jul 2017 17:03:42 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:03:40 -0400
Message-ID: <1499378620-55895-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] faultmanagement-rtos: Added rtos recipe for faultmanagement
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
X-List-Received-Date: Thu, 06 Jul 2017 22:03:44 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../faultmanagement/faultmanagement-rtos_git.bb    | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb

diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
new file mode 100644
index 0000000..9cc4381
--- /dev/null
+++ b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
@@ -0,0 +1,34 @@
+inherit ti-pdk
+
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
+PR = "r0"
+
+S = "${WORKDIR}/${FAULT_MANAGEMENT_GIT_DESTSUFFIX}"
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
-- 
1.9.1



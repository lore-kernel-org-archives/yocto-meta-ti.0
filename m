Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91F97E00CA9; Tue, 18 Jul 2017 16:04:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 673B6E00C7F
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4MuM001255
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419062;
	bh=YFRZGaTeU9p92EvyvjIOvDg4bqJTNfBExg4618517s4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YadbYREdr6Tg2njPex++S6u9iB6VTEAKflQacprjflaoDedd4cyueDk9EJ09Z7ZzY
	swV0+y6cC2ZevVZUrZGffV/+5i+syIob/CGm/1nOI402ZwGvC4ksDsk2/lSpSNoLHr
	RxiOITPr4+n0qYHWOM6yHuBG3+PgvH+tDfbMibpI=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4HWr031528
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:17 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hb000997;	Tue, 18 Jul 2017 18:04:17 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:15 -0400
Message-ID: <1500419028-3361-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 04/37] faultmanagement-rtos: Added rtos recipe for faultmanagement
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:43 -0000
Content-Type: text/plain

Upstreaming TI Fault management module recipe for RTOS

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Adding summary

 .../faultmanagement/faultmanagement-rtos_git.bb    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb

diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
new file mode 100644
index 0000000..0855b83
--- /dev/null
+++ b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
@@ -0,0 +1,36 @@
+SUMMARY = "TI Fault management module for keystone devices"
+
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



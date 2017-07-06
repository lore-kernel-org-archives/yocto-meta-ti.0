Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE8CFE00BD5; Thu,  6 Jul 2017 15:38:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72C77E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:38:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MctTv003494
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499380735;
	bh=oyrC7ggvQzXukuEfSCeWujvVCxLrapuh4VBduIQkR34=;
	h=From:To:CC:Subject:Date;
	b=WpKCpHyqLJOLwTUYgeWx51gGrf/L6tMtg51f2yjDCCahFuKBPqha78zVzelM3ZufM
	lEkFq5rbHf7m/wIFYNDtebYI4p8n1+RhRfvst8DjxJNbjesR8z9JJM8McMQQUZNPTr
	/y4a+BjxOH5oxC02R+Boy/AayQgJf4Rot5gvhW5o=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MctO9023438
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:38:55 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:38:54 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66McsK8006331;	Thu, 6 Jul 2017 17:38:54 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:38:51 -0400
Message-ID: <1499380731-60444-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pcie-lld-rtos: Added rtos recipe for pcie-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:38:57 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb

diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
new file mode 100644
index 0000000..4790731
--- /dev/null
+++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
@@ -0,0 +1,33 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://pcie.h;beginline=1;endline=34;md5=c094db055596498ba803933936611eb2"
+
+COMPATIBLE_MACHINE = "omap-a15|keystone|c66x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PCIE_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pcie-lld.git"
+PCIE_LLD_GIT_PROTOCOL = "git"
+PCIE_LLD_GIT_BRANCH = "master"
+PCIE_LLD_GIT_DESTSUFFIX = "git/ti/drv/pcie"
+
+# Below commit ID corresponds to "DEV.PCIE_LLD.02.02.00.09"
+PCIE_LLD_SRCREV = "93f302f6f3dd3a83ac0dd0e24b3965f98f46eac7"
+
+BRANCH = "${PCIE_LLD_GIT_BRANCH}"
+SRC_URI = "${PCIE_LLD_GIT_URI};destsuffix=${PCIE_LLD_GIT_DESTSUFFIX};protocol=${PCIE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${PCIE_LLD_SRCREV}"
+PV = "02.02.00.09"
+PR = "r0"
+
+S = "${WORKDIR}/${PCIE_LLD_GIT_DESTSUFFIX}"
+
+export PDK_PCIE_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "PCIe LLD"
-- 
1.9.1



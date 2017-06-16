Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78394E00B18; Fri, 16 Jun 2017 08:34:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,TVD_SPACE_RATIO,
	TVD_SPACE_RATIO_MINFP autolearn=no version=3.3.1
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
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  1.0 TVD_SPACE_RATIO_MINFP Space ratio
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A443E009A0
	for <meta-ti@yoctoproject.org>; Fri, 16 Jun 2017 08:34:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5GFYH67029880
	for <meta-ti@yoctoproject.org>; Fri, 16 Jun 2017 10:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497627257;
	bh=2j10veTNVSKqOiLCQLNax8UOSfEfAUoRRUvW+8p44yM=;
	h=From:To:Subject:Date;
	b=x2hx7Nj6dgnb/COobSZYk6lIMhVUjVfZJahVUm3VTSl/37uNhTFM8ypx4/NetKEmi
	oIWXbK39S4WbYd2OpgoPYMSsdmRfof/3SRxIfahRE9JEJ/XT/ckO3Xx4iabj9U7+d2
	8sR0XjYRGOnc/yx7ur97CXSGl6zmZXJfNJhATKz0=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5GFYHsQ003011
	for <meta-ti@yoctoproject.org>; Fri, 16 Jun 2017 10:34:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Jun 2017 10:34:16 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5GFYGxj009147	for <meta-ti@yoctoproject.org>; Fri, 16 Jun 2017 10:34:16
	-0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 Jun 2017 10:34:16 -0500
Message-ID: <1497627256-18932-1-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-sysbios: Upstream version 6.46.5.55
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
X-List-Received-Date: Fri, 16 Jun 2017 15:34:19 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-ti/bios/ti-sysbios_6.46.01.38.bb | 12 ------------
 recipes-ti/bios/ti-sysbios_6.46.05.55.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 recipes-ti/bios/ti-sysbios_6.46.01.38.bb
 create mode 100644 recipes-ti/bios/ti-sysbios_6.46.05.55.bb

diff --git a/recipes-ti/bios/ti-sysbios_6.46.01.38.bb b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
deleted file mode 100644
index 407b3b4..0000000
--- a/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require recipes-ti/bios/ti-sysbios.inc
-
-PV = "6_46_01_38"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=da86dca468e5dd80484dc83473ea32e3"
-
-SRC_URI[sysbiosbin.md5sum] = "5aee070f73eb6f3d9aab2ff9c483f396"
-SRC_URI[sysbiosbin.sha256sum] = "3a04a584c3ee3221997b7d616ba45bbcc21ad241f4a4ab5c0f28c465d538af90"
-
-TI_BIN_UNPK_CMDS=""
-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
diff --git a/recipes-ti/bios/ti-sysbios_6.46.05.55.bb b/recipes-ti/bios/ti-sysbios_6.46.05.55.bb
new file mode 100644
index 0000000..e910d53
--- /dev/null
+++ b/recipes-ti/bios/ti-sysbios_6.46.05.55.bb
@@ -0,0 +1,12 @@
+require recipes-ti/bios/ti-sysbios.inc
+
+PV = "6_46_05_55"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=1c88b63f0ce751d88354de0727623eba"
+
+SRC_URI[sysbiosbin.md5sum] = "8182effcbeea90778e393818ec4d65e8"
+SRC_URI[sysbiosbin.sha256sum] = "2ad3432cafd1a93dd8cd1e56b722c979852d5c72f5defc29843d507cdd7b667a"
+
+TI_BIN_UNPK_CMDS=""
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
1.9.1



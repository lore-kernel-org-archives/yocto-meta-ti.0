Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AEEEE00BD5; Thu,  6 Jul 2017 15:43:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03738E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:43:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66Mhsge020688
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499381034;
	bh=huMlwlEKIDq9lckVt/0P/KhS3w9HsbhaLmg0V6m5wAE=;
	h=From:To:CC:Subject:Date;
	b=Yu4wXO3/TgBzMV2lkHv5EUaJ3HLRzLMSKYWei2H5y0kiSZpcTrT1alIOc9spEEC/f
	x8HEac/fxEZ4IcKKfn5+7F5DQe30QP7TfmNfSHJMlkq3M3oOItxuK566ryDtm0K18K
	oK/qhu2K4ib70VYf7M0iZoyFsCNr/8ZfORNVtMoE=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MhscG030112
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:43:54 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:43:53 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66Mhrig032343;	Thu, 6 Jul 2017 17:43:53 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:43:52 -0400
Message-ID: <1499381032-60680-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] tsip-lld-rtos: Add rtos recipe for tsip-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:43:55 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb

diff --git a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb b/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
new file mode 100644
index 0000000..f2a3e3a
--- /dev/null
+++ b/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
@@ -0,0 +1,24 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://tsip.h;beginline=1;endline=32;md5=dab2257b0b8a3678c26915f6eb49b71e"
+
+COMPATIBLE_MACHINE = "k2e-evm|c667x-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+TSIP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/tsip-lld.git"
+TSIP_LLD_GIT_PROTOCOL = "git"
+TSIP_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.TSIP_LLD.01.00.00.07A"
+TSIP_LLD_SRCREV = "211d2f1a5c3c7ec80349a18e6e6cae6c9e4df921"
+
+BRANCH = "${TSIP_LLD_GIT_BRANCH}"
+SRC_URI = "${TSIP_LLD_GIT_URI};protocol=${TSIP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${TSIP_LLD_SRCREV}"
+PV = "01.00.00.07"
+PR = "r0"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "TSIP LLD"
-- 
1.9.1



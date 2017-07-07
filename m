Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89CEEE00BBC; Fri,  7 Jul 2017 12:26:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DD24E00B53
	for <meta-ti@yoctoproject.org>; Fri,  7 Jul 2017 12:26:32 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v67JQWjk020008
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 14:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499455592;
	bh=/im5Cc9fVCzHZ/y1xFSI7r7KQoTpP1moy0SFgHjKsOU=;
	h=From:To:CC:Subject:Date;
	b=trBcbCTSGmprvHNg9DhRztTAcoqMEftGjf5B4iuiDl9CzkNHGP958jGpEntJ+v1gO
	Xu/BPOnwmjUPMpx9TdwOTC+x73LF+WvYYNv6pvw3QRO1VVOyw9/uDI4egAxFPmPVMG
	gUNBRgDtdMJXAkB3q047LGMLjb3K612BmHnHUd44=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v67JQW9q023544
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 14:26:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Jul 2017 14:26:31 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v67JQVeH004876;	Fri, 7 Jul 2017 14:26:31 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 7 Jul 2017 15:26:10 -0400
Message-ID: <1499455570-47083-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] nwal-lld-rtos: Add rtos recipe for nwal
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
X-List-Received-Date: Fri, 07 Jul 2017 19:26:36 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb

diff --git a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb b/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
new file mode 100644
index 0000000..8ffe0dc
--- /dev/null
+++ b/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
@@ -0,0 +1,17 @@
+inherit ti-pdk
+
+require recipes-bsp/nwal-lld/nwal-lld.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " cppi-lld-rtos \
+                   pa-lld-rtos \
+                   pktlib-rtos \
+                   qmss-lld-rtos \
+                   sa-lld-rtos \
+"
+
+COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm|k2l-evm|c667x-evm"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "NWAL LLD"
-- 
1.9.1



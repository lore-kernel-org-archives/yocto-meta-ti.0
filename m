Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8733DE00B9D; Thu,  6 Jul 2017 10:01:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B167E00AD0
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 10:01:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66H14pG016964
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 12:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499360464;
	bh=HJSavLxC2MZkmAT0h9ybpQNo9qmUXBQjrPyO/egX0iM=;
	h=From:To:CC:Subject:Date;
	b=e2Cm6QcZq0oRgI3cUBQxloEMebzkgNy8i/OLBoeG/kL81pBkfqi9YLeszD6zK8/it
	jM3bAtR/3+8BmZwb0ejoauVe7v/qnbQ5We5Yfc8hFCKJEqsdE+xBA3z9lbb0aaj9mq
	Kd/R1CLdt1ncxGb+g5X5m5VSJ4t7nuNRx03Css8o=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66H14Wk000859
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 12:01:04 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 12:01:04 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66H13dI029741;	Thu, 6 Jul 2017 12:01:04 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 13:01:02 -0400
Message-ID: <1499360462-38531-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] sa-lld-rtos: Added rtos recipe for sa-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 17:01:06 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/sa-lld/sa-lld-rtos_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-bsp/sa-lld/sa-lld-rtos_git.bb

diff --git a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
new file mode 100644
index 0000000..0b60b25
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
@@ -0,0 +1,12 @@
+inherit ti-pdk
+
+require recipes-bsp/sa-lld/sa-lld.inc
+
+PR = "${INC_PR}.0"
+
+COMPATIBLE_MACHINE_append = "|c667x-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "SA LLD"
-- 
1.9.1



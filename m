Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E95EE00BEF; Thu,  6 Jul 2017 15:47:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BA4FE00BDF
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:47:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MlG6M007361
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499381236;
	bh=9YhSS7FpnW+hKKmqtBQa8s9UApV6t8oW0SGxttO2Yoo=;
	h=From:To:CC:Subject:Date;
	b=bpS19VONVDg77I0YHFbxA7Ob911sCycUARJ16nAiT4/ucQ5sPQLem9HZFZ50ukDsL
	y6aX/YYLAJjalLAyv7lDWpyOa/GVOjvuGkYBRcW3jT53Yhw87UzLRhaeEDPEG+lSWg
	bxjDi1OVW0jCWA8xbm355WfGOvMzulm4B+acAovo=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MlB3T001357
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:47:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:47:10 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MlAIf004408;	Thu, 6 Jul 2017 17:47:11 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:47:07 -0400
Message-ID: <1499381227-60834-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] hyplnk-lld-rtos: Add rtos recipe for hyplnk-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:47:28 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
new file mode 100644
index 0000000..14b4ed5
--- /dev/null
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
@@ -0,0 +1,10 @@
+inherit ti-pdk
+
+require recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+
+PR = "${INC_PR}.0"
+
+COMPATIBLE_MACHINE_append = "|c66x"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "HYPLNK LLD"
-- 
1.9.1



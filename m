Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00150E00BD0; Thu,  6 Jul 2017 09:31:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2E2DE00B57
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:31:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66GV5n9023951
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:31:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499358665;
	bh=UOd/FgZdmVY74Kr8cSgADArab1He9GjOtAlBsENYmDE=;
	h=From:To:CC:Subject:Date;
	b=pDsGLrClobyCx14AUGMC/Jd8Tx3L9Y4a4gVAtoYcDBccau+W9iHTLZ9xUJQfI9rSB
	KjB5TJkdBN18lqFsBKWjESCM1EZFX4IcpgfaQzvreVQHsKLLh30ZJQ1txVjZG+ie9a
	FZayBXlDJgth/tWhs2+6+Bil5mwM7hjp+QOANqi4=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66GV5UU029431
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:31:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:31:04 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66GV4dG002715;	Thu, 6 Jul 2017 11:31:04 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:31:03 -0400
Message-ID: <1499358663-35080-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] aif2-lld-rtos: Added RTOS recipe for aif2-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 16:31:11 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb

diff --git a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
new file mode 100644
index 0000000..50b76a8
--- /dev/null
+++ b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
@@ -0,0 +1,14 @@
+inherit ti-pdk
+
+require recipes-bsp/aif2-lld/aif2-lld.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " qmss-lld-rtos \
+                   cppi-lld-rtos \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "AIF2 LLD"
-- 
1.9.1



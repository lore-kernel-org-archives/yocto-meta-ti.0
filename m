Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C66D4E00B9D; Thu,  6 Jul 2017 09:03:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D98BE00B2F
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:03:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66G3B4f009507
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499356991;
	bh=prlbTBf9VStbBtdVGLp9RyMsEOgrUzDIHe0Vv3iQwak=;
	h=From:To:CC:Subject:Date;
	b=TjaNJr0LTV1fv1aEhAXglVcmusbwBaZYM9MHp7rhwUz2zM6rUNZuZ9BAnfuMqT8co
	ceoIIBQQ4V1x8zT+jJoNKGVua2mvHFxzvdv3Qj9kNWLIW3iY/UiSsrp9AoUDjmE0C6
	BF7VMNjaotlVP+CzeyoybRDzpYxuF7TXAjq4AlsI=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66G3BVG012964
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:03:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:03:10 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66G3AE9005719;	Thu, 6 Jul 2017 11:03:10 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:03:09 -0400
Message-ID: <1499356989-21593-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] traceframework-rtos: Add HTML doc link text
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
X-List-Received-Date: Thu, 06 Jul 2017 16:03:13 -0000
Content-Type: text/plain

---
 recipes-bsp/traceframework/traceframework-rtos_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/traceframework/traceframework-rtos_git.bb b/recipes-bsp/traceframework/traceframework-rtos_git.bb
index 32994d3..c4b76d1 100644
--- a/recipes-bsp/traceframework/traceframework-rtos_git.bb
+++ b/recipes-bsp/traceframework/traceframework-rtos_git.bb
@@ -2,9 +2,12 @@ inherit ti-pdk
 
 require traceframework.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS_append = " uia \
 "
 
 XDCPATH_append = ";${UIA_INSTALL_DIR}/packages"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "Trace Framework"
-- 
1.9.1



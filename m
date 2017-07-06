Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2290E00C1C; Thu,  6 Jul 2017 09:58:39 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EF93E00C0A
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:58:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66GwSHH026977
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499360308;
	bh=odKX6SnlWRLEhACW3gtaGLEOK5RnG2+triaqtf4tEIw=;
	h=From:To:CC:Subject:Date;
	b=piq+mJifnQc2wUoxZcbw/Szcky7zQ/tJJYnWotvwj0Edk+5pb4ij6DFFPDwiWzqo8
	nxWCfw2lWdj5Sw0KVBWTxW7922cVdhy8Vh6WSaMRZfzVJvZQnb5QX9K64e8fxv1etv
	ffgeV24tvjKvp4V7UeNO1w9WDdEtfS3K+ZTejjFY=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66GwSZg014243
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:58:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:58:28 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66GwRW6026465;	Thu, 6 Jul 2017 11:58:28 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:58:26 -0400
Message-ID: <1499360306-38422-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] iqn2-lld-rtos: Adding rtos recipe for iqn2-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 16:58:39 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb
new file mode 100644
index 0000000..6a0e0bd
--- /dev/null
+++ b/recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb
@@ -0,0 +1,10 @@
+inherit ti-pdk
+
+require recipes-bsp/iqn2-lld/iqn2-lld.inc
+
+PR = "${INC_PR}.0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "IQN2 LLD"
-- 
1.9.1



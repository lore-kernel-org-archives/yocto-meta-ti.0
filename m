Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1200E00BAD; Thu,  6 Jul 2017 09:35:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23B5EE00B57
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:35:00 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66GZ085024348
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499358900;
	bh=/KjHmWQKs0fwH6ad1JqRLYNltinbtDYTXiK3r7g+i8k=;
	h=From:To:CC:Subject:Date;
	b=EpWIJW5p6VA05KfQPlklQMOIIGuaxXco4HAXIU3PAMDnkOgq94CFFLFKacWl31LGg
	mNcklrOOlzme+4L1qr93qf+FtB8g1WsJBMiORa/lZg8SRguzZOPXyk/H0XoPpt8ery
	Z8ZuyMKEZxbK0bMmT6FyvrJFHk3KTOPt+SiGYla8=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66GZ0Ep001569
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:35:00 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:34:59 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66GYxL0018636;	Thu, 6 Jul 2017 11:34:59 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:34:58 -0400
Message-ID: <1499358898-35274-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] dfe-lld-rtos: Added RTOS recipe for dfe-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 16:35:01 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb

diff --git a/recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb b/recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb
new file mode 100644
index 0000000..2466569
--- /dev/null
+++ b/recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb
@@ -0,0 +1,10 @@
+inherit ti-pdk
+
+require recipes-bsp/dfe-lld/dfe-lld.inc
+
+PR = "${INC_PR}.0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "DFE LLD"
-- 
1.9.1



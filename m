Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6031E00B9D; Thu,  6 Jul 2017 10:00:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E0EFE00AD0
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 10:00:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66GxqCC031566
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499360392;
	bh=YYC/KmaKLqfd7OiTSzoTm0pZV7pmb/9SMq5r7KnCo68=;
	h=From:To:CC:Subject:Date;
	b=HpWCxH0NEG/pm+FWxlRXYEMCou14swC2T5tzMwK7t+V6cAzhDtNtIj4lw4euM1I8x
	K3e4yT4V3TvxPQWRTDzYT1zVATLVPXo2DDj6Uo0WZTu5gBwzbFu+DI9K+7wEej99I9
	3YP+v3XbKKl1KpdaiGJ0qLhnpNWwwo37MrCrMWS8=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66GxlSY015244
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:59:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:59:47 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66GxlG2025786;	Thu, 6 Jul 2017 11:59:47 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:59:45 -0400
Message-ID: <1499360385-38477-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pa-lld-rtos: Added rtos recipe for pa-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 17:00:04 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pa-lld/pa-lld-rtos_git.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-bsp/pa-lld/pa-lld-rtos_git.bb

diff --git a/recipes-bsp/pa-lld/pa-lld-rtos_git.bb b/recipes-bsp/pa-lld/pa-lld-rtos_git.bb
new file mode 100644
index 0000000..f296932
--- /dev/null
+++ b/recipes-bsp/pa-lld/pa-lld-rtos_git.bb
@@ -0,0 +1,10 @@
+inherit ti-pdk
+
+require recipes-bsp/pa-lld/pa-lld.inc
+COMPATIBLE_MACHINE_append = "|c667x-evm"
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " rm-lld-rtos"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "PA LLD"
-- 
1.9.1



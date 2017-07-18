Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7062E00C95; Tue, 18 Jul 2017 16:05:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71BA0E00CAA
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4o2T020807
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419090;
	bh=wvc4PQtN5zXKpzBhYxKMXuRiQ7EBBmGAK4I9vzHzafw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EUqeG0JgQ/RMGZNq8caxcF1gA4ZoJgUoZRtgJqJ5W2EWjUN+G6G0dVqPMPtznva0i
	4rI3c+2m43vNEZoebj3p6pVlIl5DvfMGWajoZL7+6SHWasz3AjCMEp/RtUCN8I+qGt
	4eNkVp8YOb5xhnyVZ5ZHKI6cMO2x/BvHobEeZeLs=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4oHd008922
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:49 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46i1000997;	Tue, 18 Jul 2017 18:04:49 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:39 -0400
Message-ID: <1500419028-3361-28-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 28/37] nwal-lld-rtos: Add rtos recipe for nwal
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
X-List-Received-Date: Tue, 18 Jul 2017 23:05:00 -0000
Content-Type: text/plain

Upstreaming the Network abstraction layer LLD library for RTOS

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary

 recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb

diff --git a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb b/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
new file mode 100644
index 0000000..7fe5103
--- /dev/null
+++ b/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "TI Network abstraction layer RTOS LLD library "
+
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



Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47096E00D47; Tue, 19 Apr 2016 14:43:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7467E00C87
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 14:43:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3JLhh8E002587
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 16:43:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3JLhhAO004101
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 16:43:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 Apr 2016 16:43:42 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3JLheFi017311;	Tue, 19 Apr 2016 16:43:42 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Apr 2016 17:43:39 -0400
Message-ID: <1461102219-11525-2-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1461102219-11525-1-git-send-email-jsobota@ti.com>
References: <1461102219-11525-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] pktlib-rtos: Add RTOS package for pktlib
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
X-List-Received-Date: Tue, 19 Apr 2016 21:43:47 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/pktlib/pktlib-rtos_git.bb |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-bsp/pktlib/pktlib-rtos_git.bb

diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/pktlib-rtos_git.bb
new file mode 100644
index 0000000..0471156
--- /dev/null
+++ b/recipes-bsp/pktlib/pktlib-rtos_git.bb
@@ -0,0 +1,13 @@
+inherit ti-pdk
+require pktlib.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " rm-lld-rtos \
+                   qmss-lld-rtos \
+                   cppi-lld-rtos \
+"
+
+XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2l-evm = "k2l"
-- 
1.7.10.4



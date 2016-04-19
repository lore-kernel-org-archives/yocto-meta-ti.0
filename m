Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52207E00C94; Tue, 19 Apr 2016 13:50:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEE8CE00DF0
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 13:49:57 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3JKnvI4004672
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 15:49:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3JKnvM9017183
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 15:49:57 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 Apr 2016 15:49:56 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3JKnnTR006030;	Tue, 19 Apr 2016 15:49:55 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Apr 2016 16:49:45 -0400
Message-ID: <1461098985-6981-2-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1461098985-6981-1-git-send-email-jsobota@ti.com>
References: <1461098985-6981-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] traceframework-rtos: Add RTOS package for Traceframework
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
X-List-Received-Date: Tue, 19 Apr 2016 20:50:01 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/traceframework/traceframework-rtos_git.bb |   10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-bsp/traceframework/traceframework-rtos_git.bb

diff --git a/recipes-bsp/traceframework/traceframework-rtos_git.bb b/recipes-bsp/traceframework/traceframework-rtos_git.bb
new file mode 100644
index 0000000..32994d3
--- /dev/null
+++ b/recipes-bsp/traceframework/traceframework-rtos_git.bb
@@ -0,0 +1,10 @@
+inherit ti-pdk
+
+require traceframework.inc
+
+PR = "${INC_PR}.1"
+
+DEPENDS_append = " uia \
+"
+
+XDCPATH_append = ";${UIA_INSTALL_DIR}/packages"
-- 
1.7.10.4



Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 723C2E00912; Tue, 25 Oct 2016 15:14:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33E7DE00912
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 15:14:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9PMENYL017456
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 17:14:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9PMENwR016429
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 17:14:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Oct 2016 17:14:23 -0500
Received: from uda0868762.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9PMEKMn013871;	Tue, 25 Oct 2016 17:14:23 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 25 Oct 2016 17:14:05 -0500
Message-ID: <1477433645-16457-2-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1477433645-16457-1-git-send-email-i-pang@ti.com>
References: <1477433645-16457-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-xdctools: updated version to 3.32.1.22
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
X-List-Received-Date: Tue, 25 Oct 2016 22:14:27 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-ti/devtools/ti-xdctools_3.32.01.22.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-xdctools_3.32.01.22.bb

diff --git a/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb b/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
new file mode 100644
index 0000000..5f379c1
--- /dev/null
+++ b/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
@@ -0,0 +1,9 @@
+require recipes-ti/devtools/ti-xdctools-core.inc
+
+PV = "3_32_01_22"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
+
+SRC_URI[xdczip.md5sum] = "ddae5b765ca62783c1e804c75c463c38"
+SRC_URI[xdczip.sha256sum] = "b1c6620ef0b8eac45ef6a587f93b3238bdcf3b02dfd7e4b40d872a45c02c5cdc"
-- 
1.9.1



Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AA06E00A44; Mon, 15 Jun 2015 09:56:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E1ECE00960
	for <meta-ti@yoctoproject.org>; Mon, 15 Jun 2015 09:56:40 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NPZ00DYCWDFLKD0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 15 Jun 2015 11:56:23 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=N5PUbDJB c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=XAFQembCKUMA:10
	a=sozttTNsAAAA:8	a=XD0L9khmlPrNNrXO4O8A:9 a=BB3OqBxbfGQA:10
	a=GNWJZC2dH_gA:10 a=My-4BpwWpkcA:10
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CB603161AA8;	Mon,
	15 Jun 2015 12:56:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 15 Jun 2015 12:56:03 -0400
Message-id: <1434387363-32596-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] layer.conf: add cmem and gdbserverproxy modules to safe ABI list
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
X-List-Received-Date: Mon, 15 Jun 2015 16:56:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 7bb46e6..abce730 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -12,4 +12,6 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     ti-ipc \
+    cmem-mod \
+    gdbserverproxy-module-drv \
 "
-- 
2.2.0



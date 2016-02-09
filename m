Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED11FE00D98; Tue,  9 Feb 2016 12:48:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB28AE00C8C
	for <meta-ti@yoctoproject.org>; Tue,  9 Feb 2016 12:47:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 71271529E4; Tue,  9 Feb 2016 20:47:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160209204754.71271529E4@arago-project.org>
Date: Tue,  9 Feb 2016 20:47:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : layer.conf: add cppi-lld, qmss-lld and multiprocmgr to ABI safe list
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
X-List-Received-Date: Tue, 09 Feb 2016 20:48:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 635e7ebf98aa036801e8f641b80975cea9d876de
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=635e7ebf98aa036801e8f641b80975cea9d876de

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb  9 21:44:10 2016 +0000

layer.conf: add cppi-lld, qmss-lld and multiprocmgr to ABI safe list

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index f5bf3ec..95ffe8e 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -21,4 +21,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     debugss-module-drv \
     uio-module-drv \
     mpm-transport \
+    cppi-lld \
+    qmss-lld \
+    multiprocmgr \
 "



Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 635FDE00A9B; Fri, 11 Dec 2015 10:49:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7B80E008C4
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2015 10:49:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3A00C52A7F; Fri, 11 Dec 2015 18:49:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151211184940.3A00C52A7F@arago-project.org>
Date: Fri, 11 Dec 2015 18:49:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : layer.conf: add mpm-transport to safe ABI list
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
X-List-Received-Date: Fri, 11 Dec 2015 18:49:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c2023a7c251b1f466f3f29d1cc8320c9519b1be3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c2023a7c251b1f466f3f29d1cc8320c9519b1be3

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Dec 12 00:32:32 2015 +0000

layer.conf: add mpm-transport to safe ABI list

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 1172503..f5bf3ec 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -20,4 +20,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     gdbserverproxy-module-drv \
     debugss-module-drv \
     uio-module-drv \
+    mpm-transport \
 "



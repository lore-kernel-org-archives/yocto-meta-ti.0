Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 636D5E009A1; Mon, 15 Jun 2015 15:52:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19679E0096A
	for <meta-ti@yoctoproject.org>; Mon, 15 Jun 2015 15:52:08 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CDEED529B5; Mon, 15 Jun 2015 22:52:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150615225207.CDEED529B5@arago-project.org>
Date: Mon, 15 Jun 2015 22:52:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : layer.conf: add cmem and gdbserverproxy modules to safe ABI list
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
X-List-Received-Date: Mon, 15 Jun 2015 22:52:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 489af85aaa81aa941eeb26f7448c525292d56d0e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=489af85aaa81aa941eeb26f7448c525292d56d0e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Jun 15 22:56:03 2015 +0000

layer.conf: add cmem and gdbserverproxy modules to safe ABI list

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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



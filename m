Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8AAFE00C8F; Tue,  7 Jun 2016 15:46:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B351AE00C49
	for <meta-ti@yoctoproject.org>; Tue,  7 Jun 2016 15:46:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 917C6529BF; Tue,  7 Jun 2016 22:46:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160607224605.917C6529BF@arago-project.org>
Date: Tue,  7 Jun 2016 22:46:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : recipes: cleanup
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
X-List-Received-Date: Tue, 07 Jun 2016 22:46:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 145693295920bf1187c1883379cb581f9c3437b9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=145693295920bf1187c1883379cb581f9c3437b9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jun  7 18:45:09 2016 -0400

recipes: cleanup

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/README                                  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
old mode 100755
new mode 100644
diff --git a/recipes-bsp/aif2-lld/aif2-lld.inc b/recipes-bsp/aif2-lld/aif2-lld.inc
old mode 100755
new mode 100644
diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/aif2-lld_git.bb
old mode 100755
new mode 100644
diff --git a/recipes-ti/README b/recipes-ti/README
index 9907901..b32c284 100644
--- a/recipes-ti/README
+++ b/recipes-ti/README
@@ -1 +1 @@
-Note: many of the packages in this area are not actively maintained.
+Note: some of the packages in this area are not actively maintained.
diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00033.bb b/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00033.bb
old mode 100755
new mode 100644



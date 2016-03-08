Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16DD4E00B9C; Mon,  7 Mar 2016 17:30:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84939E008C6
	for <meta-ti@yoctoproject.org>; Mon,  7 Mar 2016 17:30:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id CA95352B03; Tue,  8 Mar 2016 01:30:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308013012.CA95352B03@arago-project.org>
Date: Tue,  8 Mar 2016 01:30:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multiprocmgr-test: don't repackage between machines, as only K2 uses it
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
X-List-Received-Date: Tue, 08 Mar 2016 01:30:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 088a82454290dcc7e0dbbab5c6f18c0261d8517b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=088a82454290dcc7e0dbbab5c6f18c0261d8517b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar  8 02:24:18 2016 +0000

multiprocmgr-test: don't repackage between machines, as only K2 uses it

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
index 8605cf1..7ec8796 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
@@ -2,13 +2,16 @@ DESCRIPTION = "TI Multiproc Manager test code"
 
 include multiprocmgr.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS = "multiprocmgr cmem"
 RDEPENDS_${PN} = "multiprocmgr mpm-transport cmem"
 
 CC += "-I${STAGING_KERNEL_DIR}/include"
 
+# Assuming the multiprocmgr kernel API is safe
+CC[vardepsexclude] = "STAGING_KERNEL_DIR"
+
 do_compile() {
 	make -C ${S} test
 }



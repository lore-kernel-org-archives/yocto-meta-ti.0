Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 828ADE0092D; Wed, 21 Jan 2015 12:38:06 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A528DE0089B
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 12:38:00 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1FBC652099; Wed, 21 Jan 2015 20:38:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150121203800.1FBC652099@arago-project.org>
Date: Wed, 21 Jan 2015 20:38:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : multiprocmgr: Moved recipe verbatim from meta-arago
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
X-List-Received-Date: Wed, 21 Jan 2015 20:38:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 73d028e699ad28120e83e93d5da596e9f05f4420
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=73d028e699ad28120e83e93d5da596e9f05f4420

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Jan 16 18:20:25 2015 +0000

multiprocmgr: Moved recipe verbatim from meta-arago

- Original location: meta-arago:
  meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr_git.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
new file mode 100644
index 0000000..3f2e52c
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI Multiproc Manager for KeyStone II"
+HOMEPAGE = "http://gtgit01.gt.design.ti.com/git/?p=projects/multiprocmgr.git;a=summary"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
+SECTION = "console"
+COMPATIBLE_MACHINE = "keystone"
+
+PR = "r1"
+
+BRANCH ?= "master"
+SRCREV = "8a97fb5c2c06d5f02d30106629f27fe0ca8a4f95"
+
+SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
+}



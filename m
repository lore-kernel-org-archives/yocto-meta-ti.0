Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FAA8E00443
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2013 17:12:51 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6E40C5299C; Tue, 20 Aug 2013 00:12:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130820001250.6E40C5299C@arago-project.org>
Date: Tue, 20 Aug 2013 00:12:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Valentin Cobelea : recipes-ti: fix warning " variable key FILES_${PN}-dev replaces original key"
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
X-List-Received-Date: Tue, 20 Aug 2013 00:12:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: ee570b6331bab0bb741193c43723d0da5a5ead34
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ee570b6331bab0bb741193c43723d0da5a5ead34

Author: Valentin Cobelea <valentin.cobelea@enea.com>
Date:   Mon Aug 12 15:53:39 2013 +0200

recipes-ti: fix warning "variable key FILES_${PN}-dev replaces original key"

Use properly FILES_${PN}-dev to avoid warning about replacing value with default.

Signed-off-by: Valentin Cobelea <valentin.cobelea@enea.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc.inc         |    2 +-
 recipes-ti/syslink/ti-syslink.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 8d1b802..7f4b919 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -33,4 +33,4 @@ do_install() {
     install ${S}/ipc.pc ${D}/${libdir}/pkgconfig/
 }
 
-FILES_ti-ipc-dev = "${libdir}/*"
+FILES_${PN}-dev = "${libdir}/*"
diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-syslink.inc
index 04c59c1..70289d4 100644
--- a/recipes-ti/syslink/ti-syslink.inc
+++ b/recipes-ti/syslink/ti-syslink.inc
@@ -238,4 +238,4 @@ RRECOMMENDS_ti-syslink-examples_append = " ti-syslink-module"
 FILES_ti-syslink-examples = "${installdir}/ti-syslink-examples/*"
 INSANE_SKIP_ti-syslink-examples = "1"
 
-FILES_ti-syslink-dev = "${libdir}/*"
+FILES_${PN}-dev = "${libdir}/*"



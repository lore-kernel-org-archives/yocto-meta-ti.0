Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5176EE004D2
	for <meta-ti@yoctoproject.org>; Mon, 20 Feb 2012 18:26:20 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 93B3952AAF; Tue, 21 Feb 2012 02:26:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120221022618.93B3952AAF@arago-project.org>
Date: Tue, 21 Feb 2012 02:26:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Peter A. Bigot : ti-eula-unpack: remove extraneous newline in cmd output
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2012 02:26:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d8fc4a686262c50fd0053afa7240020909ec430b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d8fc4a686262c50fd0053afa7240020909ec430b

Author: Peter A. Bigot <bigotp@acm.org>
Date:   Tue Jan 31 06:40:54 2012 -0600

ti-eula-unpack: remove extraneous newline in cmd output

print adds one already; to add another causes the input to be off and the
default installation directory to be used, at least on Fedora 15.

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
Acked-by: Roger Monk <r-monk@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/includes/ti-eula-unpack.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-eula-unpack.inc
index 3b79c24..7c6e7b7 100644
--- a/recipes-ti/includes/ti-eula-unpack.inc
+++ b/recipes-ti/includes/ti-eula-unpack.inc
@@ -53,7 +53,7 @@ python ti_bin_do_unpack() {
             wdext = bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
             wdext = bb.data.expand(wdext, localdata)
             cmd = workdir+wdext
-        print >>f, "%s\n" % cmd
+        print >>f, cmd
     f.close()
 
     # Expand the tarball that was created if required



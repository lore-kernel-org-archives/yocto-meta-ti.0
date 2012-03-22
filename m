Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A686E013CB
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 15:19:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E71C952A5F; Thu, 22 Mar 2012 22:19:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120322221925.E71C952A5F@arago-project.org>
Date: Thu, 22 Mar 2012 22:19:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-eula-unpack: fix the check for 32bit glibc, make it a warning
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
X-List-Received-Date: Thu, 22 Mar 2012 22:19:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 997bf8f58a718afaab57657d8e347bffa70d8b9f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=997bf8f58a718afaab57657d8e347bffa70d8b9f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Mar 22 18:09:43 2012 -0400

ti-eula-unpack: fix the check for 32bit glibc, make it a warning

This makes better checking for 32bit glibc on Ubuntu 11.10
In general, change to a WARNING instead of breaking the build with an ERROR,
to accomodate other different implementations of 32/64bit system libraries,
as well as multiarch setups.
Will need to come up with more robust solution later.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/includes/ti-eula-unpack.inc |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-eula-unpack.inc
index dcabe9d..60f5558 100644
--- a/recipes-ti/includes/ti-eula-unpack.inc
+++ b/recipes-ti/includes/ti-eula-unpack.inc
@@ -21,11 +21,10 @@ python ti_bin_do_unpack() {
 
     # InstallJammer requires 32bit version of glibc
     lib32path = '/lib'
-    if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path.islink('/lib') ):
-       lib32path = '/lib32'
+    if os.path.exists('/lib64') and (os.path.islink('/lib64') or os.path.islink('/lib') or os.path.exists('/lib32')):
+        lib32path = '/lib32'
     if not os.path.exists('%s/libc.so.6' % lib32path):
-	raise bb.build.FuncFailed, \
-        "\nTI installer requires 32bit glibc libraries for proper operation\n\trun 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on Ubuntu/Debian"
+        bb.warn("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on Ubuntu/Debian")
 
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)



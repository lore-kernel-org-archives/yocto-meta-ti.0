Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 076F7E01363
	for <meta-ti@yoctoproject.org>; Mon, 12 Mar 2012 13:10:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7E57C529E0; Mon, 12 Mar 2012 20:10:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120312201027.7E57C529E0@arago-project.org>
Date: Mon, 12 Mar 2012 20:10:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIHRpLWV1bGEtdW5wYWNrOiB0aHJvdyBlcnJvciBtZXNzYWdlIGluIGNhc2UgMzJiaXQgZ2xpYmMgaXMgbWlzc2luZw==?=
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
X-List-Received-Date: Mon, 12 Mar 2012 20:10:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cf056a6ae089c8078609ee6b644f39b19965fbcb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cf056a6ae089c8078609ee6b644f39b19965fbcb

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Mon Mar 12 10:28:05 2012 +0100

ti-eula-unpack: throw error message in case 32bit glibc is missing

TI installation tool requires 32bit glibc [1]

[1] https://lists.yoctoproject.org/pipermail/meta-ti/2012-January/000357.html

Signed-off-by: Andreas M??ller <schnitzeltony@googlemail.com>
Acked-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/includes/ti-eula-unpack.inc |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-eula-unpack.inc
index 7c6e7b7..dcabe9d 100644
--- a/recipes-ti/includes/ti-eula-unpack.inc
+++ b/recipes-ti/includes/ti-eula-unpack.inc
@@ -19,6 +19,14 @@ python ti_bin_do_unpack() {
 
     import os
 
+    # InstallJammer requires 32bit version of glibc
+    lib32path = '/lib'
+    if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path.islink('/lib') ):
+       lib32path = '/lib32'
+    if not os.path.exists('%s/libc.so.6' % lib32path):
+	raise bb.build.FuncFailed, \
+        "\nTI installer requires 32bit glibc libraries for proper operation\n\trun 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on Ubuntu/Debian"
+
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)
 



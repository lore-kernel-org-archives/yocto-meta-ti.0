Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62407E00D69; Tue,  3 May 2016 13:36:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87B55E00D57
	for <meta-ti@yoctoproject.org>; Tue,  3 May 2016 13:36:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3659252ABB; Tue,  3 May 2016 20:35:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160503203559.3659252ABB@arago-project.org>
Date: Tue,  3 May 2016 20:35:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-unpack: update for new Ubuntu 32bit lib packaging
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
X-List-Received-Date: Tue, 03 May 2016 20:36:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 103171802bf4add2209ea33632eaf2bf4feb73be
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=103171802bf4add2209ea33632eaf2bf4feb73be

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue May  3 08:25:59 2016 +0000

ti-unpack: update for new Ubuntu 32bit lib packaging

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/includes/ti-unpack.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
index c19c78c..9101044 100644
--- a/recipes-ti/includes/ti-unpack.inc
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -24,8 +24,8 @@ python ti_bin_do_unpack() {
     lib32path = '/lib'
     if os.path.exists('/lib64') and (os.path.islink('/lib64') or os.path.islink('/lib') or os.path.exists('/lib32')):
         lib32path = '/lib32'
-    if not os.path.exists('%s/libc.so.6' % lib32path):
-        bb.warn("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on Ubuntu/Debian")
+    if not os.path.exists('%s/libc.so.6' % lib32path) and not os.path.exists('%s/i386-linux-gnu/libc.so.6' % lib32path):
+        bb.warn("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
 
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)



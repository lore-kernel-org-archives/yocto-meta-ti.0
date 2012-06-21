Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 025CCE01426
	for <meta-ti@yoctoproject.org>; Thu, 21 Jun 2012 16:19:24 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 21BDD529DE; Thu, 21 Jun 2012 23:19:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120621231924.21BDD529DE@arago-project.org>
Date: Thu, 21 Jun 2012 23:19:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIGxpbnV4LmluYzogcmVtb3ZlIHJlcXVpcmUgbGludXgtdG9vbHMgLmluYw==?=
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
X-List-Received-Date: Thu, 21 Jun 2012 23:19:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b36393d42d1dfba2c95af5f4034ab3c0a4d5c1f4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b36393d42d1dfba2c95af5f4034ab3c0a4d5c1f4

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Fri Jun 22 01:19:37 2012 +0200

linux.inc: remove require linux-tools.inc

linux-tools.inc was removed in oe-core (perf has own package) [1].

[1] http://cgit.openembedded.org/openembedded-core/commit/?id=b485f3e0e55ad62079ed0913970ff0620f4808ea

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux.inc |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index 6996283..02f7cef 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -6,9 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 inherit kernel siteinfo
 
-# Try to build & install perf
-require recipes-kernel/linux/linux-tools.inc
-
 RPSRC = "http://www.rpsys.net/openzaurus/patches/archive"
 
 # Enable OABI compat for people stuck with obsolete userspace



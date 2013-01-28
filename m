Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49FF5E006C3
	for <meta-ti@yoctoproject.org>; Mon, 28 Jan 2013 15:46:05 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4C15752A99; Mon, 28 Jan 2013 23:46:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130128234604.4C15752A99@arago-project.org>
Date: Mon, 28 Jan 2013 23:46:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multi-kernel.inc: repeat do_configure after do_compileconfigs
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
X-List-Received-Date: Mon, 28 Jan 2013 23:46:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 3f07870e29c9cc80eb284e51f39299aaf94bd07e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3f07870e29c9cc80eb284e51f39299aaf94bd07e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Jan 21 21:19:32 2013 -0500

multi-kernel.inc: repeat do_configure after do_compileconfigs

Populate default defconfig into .config and process with oldconfig target

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/multi-kernel.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 04bc987..e5ebe56 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -95,6 +95,8 @@ do_compileconfigs () {
 
       # Restore the regular 'defconfig'
       cp ${WORKDIR}/defconfig.save ${WORKDIR}/defconfig
+      cd ${S}
+      do_configure
     fi
 }
 



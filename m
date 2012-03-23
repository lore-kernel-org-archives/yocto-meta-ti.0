Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2090CE013DF
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 23:22:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3D59552A98; Fri, 23 Mar 2012 06:22:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120323062218.3D59552A98@arago-project.org>
Date: Fri, 23 Mar 2012 06:22:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti81xx: delete broken symlink to dm816x-evm configs
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
X-List-Received-Date: Fri, 23 Mar 2012 06:22:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f3f64d03401e9a4acc6b23415b7e3cedecdc7904
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f3f64d03401e9a4acc6b23415b7e3cedecdc7904

Author: Denys Dmytriyenko <denis@denix.org>
Date:   Thu Mar 22 23:10:54 2012 -0400

linux-ti81xx: delete broken symlink to dm816x-evm configs

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux-ti81xx-psp-2.6.37/dm816x-evm/dm816x-evm  |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti81xx-psp-2.6.37/dm816x-evm/dm816x-evm b/recipes-kernel/linux/linux-ti81xx-psp-2.6.37/dm816x-evm/dm816x-evm
deleted file mode 120000
index 297a000..0000000
--- a/recipes-kernel/linux/linux-ti81xx-psp-2.6.37/dm816x-evm/dm816x-evm
+++ /dev/null
@@ -1 +0,0 @@
-dm816x-evm
\ No newline at end of file



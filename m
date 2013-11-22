Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 454CCE006E7
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 11:06:20 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3A04B52A0B; Fri, 22 Nov 2013 19:06:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131122190620.3A04B52A0B@arago-project.org>
Date: Fri, 22 Nov 2013 19:06:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: 3.12.1, SGX DT, fixes in audio/ display, connectivity, pm, etc.
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
X-List-Received-Date: Fri, 22 Nov 2013 19:06:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: c7320f2271b7f19d3e97647a3727ff3f1856fe1d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c7320f2271b7f19d3e97647a3727ff3f1856fe1d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Nov 22 13:55:22 2013 -0500

linux-ti-staging: 3.12.1, SGX DT, fixes in audio/display, connectivity, pm, etc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 3abc2f4..dd93168 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -31,8 +31,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "6a59302de4852678ccde5008ce531075c9b683d9"
-PV = "3.12"
+SRCREV = "95cb8e7d94bdbc6cd26b6d2ab074343a8dd81b7a"
+PV = "3.12.1"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"



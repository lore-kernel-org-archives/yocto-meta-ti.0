Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3E10E00804
	for <meta-ti@yoctoproject.org>; Thu, 27 Feb 2014 11:23:00 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 71F6352A69; Thu, 27 Feb 2014 19:23:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140227192300.71F6352A69@arago-project.org>
Date: Thu, 27 Feb 2014 19:23:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: latest performance, connectivity, audio and PM fixes
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
X-List-Received-Date: Thu, 27 Feb 2014 19:23:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 8d59a8f6f2203a7d65a81c29ec48b4635abbfa88
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8d59a8f6f2203a7d65a81c29ec48b4635abbfa88

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb 27 13:18:07 2014 -0500

linux-ti-staging: latest performance, connectivity, audio and PM fixes

Most patches were merged in the kernel, remove locally

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...musb-musb_cppi41-Revert-the-Advisory-1.0..patch |  158 --------------------
 ...ll-warning-in-CPUIDLE-code-with-CONFIG_SM.patch |   49 ------
 ...onfig-omap-Change-PREEMPTion-to-voluntary.patch |   33 ----
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |   11 +-
 4 files changed, 3 insertions(+), 248 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=8d59a8f6f2203a7d65a81c29ec48b4635abbfa88


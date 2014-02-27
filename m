Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5B20E007E3
	for <meta-ti@yoctoproject.org>; Thu, 27 Feb 2014 11:22:50 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7FF9152A69; Thu, 27 Feb 2014 19:22:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140227192250.7FF9152A69@arago-project.org>
Date: Thu, 27 Feb 2014 19:22:50 +0000 (UTC)
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
X-List-Received-Date: Thu, 27 Feb 2014 19:22:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 4acd58e753f0310146a2fefc051a7913ba437e58
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4acd58e753f0310146a2fefc051a7913ba437e58

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

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=4acd58e753f0310146a2fefc051a7913ba437e58


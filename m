Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E627E0086B
	for <meta-ti@yoctoproject.org>; Tue, 18 Feb 2014 09:00:58 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id CFC7C52A72; Tue, 18 Feb 2014 17:00:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140218170057.CFC7C52A72@arago-project.org>
Date: Tue, 18 Feb 2014 17:00:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: remove local patches that got merged to kernel tree
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
X-List-Received-Date: Tue, 18 Feb 2014 17:00:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bb73d1506091dee8225c3a661413a858a3e71d29
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bb73d1506091dee8225c3a661413a858a3e71d29

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb 18 10:52:58 2014 -0500

linux-ti-staging: remove local patches that got merged to kernel tree

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...RM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch |   42 -----
 ...omap-Sync-up-omap2plus-defconfig-with-sav.patch |  195 --------------------
 ...p_hwmod-Add-context-ops-to-am43xx-soc_ops.patch |   81 --------
 ...omap-Make-advanced-networking-features-as.patch |   54 ------
 ...2-am43xx-Add-context-offset-for-dss-hwmod.patch |   44 -----
 ...M-config-omap-Disable-extra-debug-options.patch |   47 -----
 ..._hwmod-Maintain-legacy-context-loss-count.patch |   65 -------
 ...ge-ARM-config-omap-Disable-SMP-for-AM335x.patch |   44 -----
 ...ll-warning-in-CPUIDLE-code-with-CONFIG_SM.patch |   49 -----
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |   16 +--
 10 files changed, 2 insertions(+), 635 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=bb73d1506091dee8225c3a661413a858a3e71d29


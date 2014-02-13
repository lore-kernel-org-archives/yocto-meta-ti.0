Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5C0DE00571
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2014 15:12:45 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8F97F52A1B; Thu, 13 Feb 2014 23:12:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140213231244.8F97F52A1B@arago-project.org>
Date: Thu, 13 Feb 2014 23:12:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: apply network performance and LCD fixes locally for now
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
X-List-Received-Date: Thu, 13 Feb 2014 23:12:49 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 368eaedaf72049db4718b311374b10bde5205df0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=368eaedaf72049db4718b311374b10bde5205df0

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb 13 14:43:45 2014 -0500

linux-ti-staging: apply network performance and LCD fixes locally for now

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...2-am43xx-Add-context-offset-for-dss-hwmod.patch |   44 +++++
 ...omap-Sync-up-omap2plus-defconfig-with-sav.patch |  195 ++++++++++++++++++++
 ...map_hwmod-Add-context-ops-to-am43xx-soc_o.patch |   36 ++++
 ...omap-Make-advanced-networking-features-as.patch |   54 ++++++
 ...M-config-omap-Disable-extra-debug-options.patch |   47 +++++
 ...ge-ARM-config-omap-Disable-SMP-for-AM335x.patch |   44 +++++
 ...ll-warning-in-CPUIDLE-code-with-CONFIG_SM.patch |   49 +++++
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |   12 +-
 8 files changed, 480 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=368eaedaf72049db4718b311374b10bde5205df0


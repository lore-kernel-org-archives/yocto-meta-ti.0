Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BF51E0081A
	for <meta-ti@yoctoproject.org>; Fri, 21 Feb 2014 09:19:14 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id A0550529B5; Fri, 21 Feb 2014 17:19:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140221171914.A0550529B5@arago-project.org>
Date: Fri, 21 Feb 2014 17:19:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: add latest critical fixes locally for now
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
X-List-Received-Date: Fri, 21 Feb 2014 17:19:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 29de82b1b5d414ff914629b651414cdbd894b40a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=29de82b1b5d414ff914629b651414cdbd894b40a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Feb 21 11:06:35 2014 -0500

linux-ti-staging: add latest critical fixes locally for now

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...musb-musb_cppi41-Revert-the-Advisory-1.0..patch |  158 ++++++++++++++++++++
 ...02-ARM-config-Add-HAVE_ARM_SCU-for-AM43XX.patch |   37 +++++
 ...ll-warning-in-CPUIDLE-code-with-CONFIG_SM.patch |   49 ++++++
 ...ge-ARM-config-omap-Disable-SMP-for-AM335x.patch |   43 ++++++
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |   11 ++-
 5 files changed, 297 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=29de82b1b5d414ff914629b651414cdbd894b40a


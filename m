Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5A20E007DD
	for <meta-ti@yoctoproject.org>; Fri, 14 Feb 2014 13:59:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1C1E852A14; Fri, 14 Feb 2014 21:59:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140214215919.1C1E852A14@arago-project.org>
Date: Fri, 14 Feb 2014 21:59:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with v2 of LCD resume fixes
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
X-List-Received-Date: Fri, 14 Feb 2014 21:59:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: ce2c6835ca8724615a3185b85e9ba7a7a59bb7b9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ce2c6835ca8724615a3185b85e9ba7a7a59bb7b9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Feb 14 16:36:45 2014 -0500

linux-ti-staging: update with v2 of LCD resume fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...RM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch |   42 ++++++++++
 ...map_hwmod-Add-context-ops-to-am43xx-soc_o.patch |   36 ---------
 ...p_hwmod-Add-context-ops-to-am43xx-soc_ops.patch |   81 ++++++++++++++++++++
 ...-am43xx-Add-context-offset-for-dss-hwmod.patch} |   26 +++---
 ..._hwmod-Maintain-legacy-context-loss-count.patch |   65 ++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |   14 +++-
 6 files changed, 211 insertions(+), 53 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=ce2c6835ca8724615a3185b85e9ba7a7a59bb7b9


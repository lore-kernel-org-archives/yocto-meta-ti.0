Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CB6CE014DC
	for <meta-ti@yoctoproject.org>; Thu, 24 Jan 2013 11:00:41 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id ABA4F52A74; Thu, 24 Jan 2013 19:00:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130124190040.ABA4F52A74@arago-project.org>
Date: Thu, 24 Jan 2013 19:00:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-keystone: update to the latest dev release for keystone
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
X-List-Received-Date: Thu, 24 Jan 2013 19:00:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5a4eff42f27c95dcd53a72a2fdb4317ea4765e3e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5a4eff42f27c95dcd53a72a2fdb4317ea4765e3e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Jan 21 21:38:27 2013 -0500

linux-keystone: update to the latest dev release for keystone

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc                  |    2 +-
 .../linux/linux-keystone-3.6.6/defconfig           |  967 +++++++++++++++++---
 recipes-kernel/linux/linux-keystone_3.6.6.bb       |    2 +-
 3 files changed, 832 insertions(+), 139 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=5a4eff42f27c95dcd53a72a2fdb4317ea4765e3e


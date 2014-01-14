Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BFF6E00840
	for <meta-ti@yoctoproject.org>; Tue, 14 Jan 2014 12:42:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2F14952A85; Tue, 14 Jan 2014 20:42:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140114204253.2F14952A85@arago-project.org>
Date: Tue, 14 Jan 2014 20:42:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : Graphics SDK: Add 5.01.00.01 version
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
X-List-Received-Date: Tue, 14 Jan 2014 20:42:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 327187973eb8bf69e8a7620d2aea2008e7839047
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=327187973eb8bf69e8a7620d2aea2008e7839047

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Jan 13 17:33:07 2014 -0600

Graphics SDK: Add 5.01.00.01 version

* Add the 5.01.00.01 version of the graphics SDK which supports
  suspend/resume operations for the v3.12 and later kernels.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap3-sgx-modules_5.01.00.01.bb                |   67 +++++++++
 .../libgles/libgles-omap3-5.01.00.01/rc.pvr        |  134 ++++++++++++++++++
 .../libgles/libgles-omap3-5.01.00.01/rc_dri.pvr    |  145 ++++++++++++++++++++
 .../libgles/libgles-omap3_5.01.00.01.bb            |   50 +++++++
 4 files changed, 396 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=327187973eb8bf69e8a7620d2aea2008e7839047


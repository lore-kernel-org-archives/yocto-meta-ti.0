Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7239AE007FD
	for <meta-ti@yoctoproject.org>; Fri, 21 Feb 2014 08:08:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 95C5E529CF; Fri, 21 Feb 2014 16:08:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140221160856.95C5E529CF@arago-project.org>
Date: Fri, 21 Feb 2014 16:08:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : Graphics SDK: Add version 05.01.01.01
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
X-List-Received-Date: Fri, 21 Feb 2014 16:08:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 881c9b5b49455423805df10ae044068a41d53140
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=881c9b5b49455423805df10ae044068a41d53140

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Tue Feb 18 22:42:30 2014 +0000

Graphics SDK: Add version 05.01.01.01

* Add latest version of the Graphics SDK that includes bug fixes.
* Fixed Suspend and Resume issue on AM43x.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap3-sgx-modules_5.01.01.01.bb                |   67 +++++++++
 .../libgles/libgles-omap3-5.01.01.01/rc.pvr        |  134 ++++++++++++++++++
 .../libgles/libgles-omap3-5.01.01.01/rc_dri.pvr    |  145 ++++++++++++++++++++
 .../libgles/libgles-omap3_5.01.01.01.bb            |   50 +++++++
 4 files changed, 396 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=881c9b5b49455423805df10ae044068a41d53140


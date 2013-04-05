Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC81FE01523
	for <meta-ti@yoctoproject.org>; Fri,  5 Apr 2013 16:34:24 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 869FF52AAA; Fri,  5 Apr 2013 23:34:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130405233424.869FF52AAA@arago-project.org>
Date: Fri,  5 Apr 2013 23:34:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : ti-graphics: Add latest 4.09.00.01 version
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
X-List-Received-Date: Fri, 05 Apr 2013 23:34:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c14c386946e1ea341faeea292580e37d538d645d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c14c386946e1ea341faeea292580e37d538d645d

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Fri Apr  5 13:28:40 2013 -0500

ti-graphics: Add latest 4.09.00.01 version

* Add the latest 4.09.00.01 version of the graphis SDK.  This
  version will compile against the latest v3.8 kernel.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap3-sgx-modules_4.09.00.01.bb                |   56 ++++++++
 .../libgles/libgles-omap3-4.09.00.01/rc.pvr        |  124 ++++++++++++++++++
 .../libgles/libgles-omap3-4.09.00.01/rc_dri.pvr    |  136 ++++++++++++++++++++
 .../libgles/libgles-omap3_4.09.00.01.bb            |   75 +++++++++++
 4 files changed, 391 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=c14c386946e1ea341faeea292580e37d538d645d


Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9370E014E4
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 11:54:29 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B468752AAE; Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130621185428.B468752AAE@arago-project.org>
Date: Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Prabindh Sundareson : omap3-sgx-modules-x11: Separate X11 SGX driver package into new recipe
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
X-List-Received-Date: Fri, 21 Jun 2013 18:54:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: df2d999252b17598671112f152a9ddbc079ea704
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=df2d999252b17598671112f152a9ddbc079ea704

Author: Prabindh Sundareson <prabu@ti.com>
Date:   Wed Jun 12 23:10:42 2013 +0530

omap3-sgx-modules-x11: Separate X11 SGX driver package into new recipe

omap3-sgx-modules now contains only non-X11 drivers. The X11 driver is
available in the omap3-sgx-modules-x11 package.

Signed-off-by: Prabindh Sundareson <prabu at ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../Compile-fixes-for-38-kernel.patch              |  346 ++++++++++++++++++++
 .../omap3-sgx-modules-x11/kernel-30.patch          |   38 +++
 .../omap3-sgx-modules-x11_4.09.00.01.bb            |   74 +++++
 3 files changed, 458 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=df2d999252b17598671112f152a9ddbc079ea704


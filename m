Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E91F2E014DF
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 11:54:29 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id AB53E52A95; Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130621185428.AB53E52A95@arago-project.org>
Date: Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Prabindh Sundareson : libgles-omap3-x11: Separate X11 SGX driver package into new recipe
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
Commit: 086be90ce8099c5b06a443e386479cada4d4709a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=086be90ce8099c5b06a443e386479cada4d4709a

Author: Prabindh Sundareson <prabu@ti.com>
Date:   Wed Jun 12 23:10:41 2013 +0530

libgles-omap3-x11: Separate X11 SGX driver package into new recipe

libgles-omap3 now contains only non-X11 drivers. The X11 driver is
available in the libgles-omap3-x11 package. This package has
dependency on specific kernel versions for DRM builds.

Signed-off-by: Prabindh Sundareson <prabu at ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/libgles-omap3-x11-4.09.00.01/rc.pvr    |  125 ++++++++
 .../libgles-omap3-x11-4.09.00.01/rc_dri.pvr        |  137 +++++++++
 recipes-graphics/libgles/libgles-omap3-x11.inc     |  319 ++++++++++++++++++++
 3 files changed, 581 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=086be90ce8099c5b06a443e386479cada4d4709a


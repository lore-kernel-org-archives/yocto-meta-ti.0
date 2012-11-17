Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78F5CE003D6
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 19:52:11 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C4A0E52A9A; Sat, 17 Nov 2012 03:52:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121117035209.C4A0E52A9A@arago-project.org>
Date: Sat, 17 Nov 2012 03:52:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : libgles-omap3: Adjust for non X11 distros
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
X-List-Received-Date: Sat, 17 Nov 2012 03:52:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3c3a59dcc79cbcc2cd8730bc37b108e217e85860
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3c3a59dcc79cbcc2cd8730bc37b108e217e85860

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Fri Nov 16 13:19:41 2012 -0600

libgles-omap3: Adjust for non X11 distros

* Non X11 base distros are unable to build this Graphics SDK.
* This patch tweaks the libgles-omap3 include file to always build the
  Graphics SDK in Raw mode and also build in X11 mode only if X11 is
  a part of the DISTRO_FEATURE. Components are built, installed and packaged
  based on which mode the Graphics SDK is built in.
* Create a new variable PVR_INIT that is by default set to pvrsrvinit. This is
  needed for newer version of the Graphics SDK that replaced this file.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc |  139 ++++++++++++++++++----------
 1 files changed, 89 insertions(+), 50 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=3c3a59dcc79cbcc2cd8730bc37b108e217e85860


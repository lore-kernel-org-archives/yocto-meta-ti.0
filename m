Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B319E006B9
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 19:03:48 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D818F52A65; Fri, 22 Nov 2013 03:03:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131122030347.D818F52A65@arago-project.org>
Date: Fri, 22 Nov 2013 03:03:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : libgles-omap3: Add support for AM43x in common libgles-omap3 include files
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
X-List-Received-Date: Fri, 22 Nov 2013 03:03:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 767fd6ec4075eddb4c3d8c4c653f1ac77b4464e1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=767fd6ec4075eddb4c3d8c4c653f1ac77b4464e1

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Tue Nov 19 10:59:08 2013 -0600

libgles-omap3: Add support for AM43x in common libgles-omap3 include files

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc |   34 ++++++++++++++++-------
 recipes-graphics/libgles/libgles-omap3-x11.inc  |   26 ++++++++++++-----
 2 files changed, 42 insertions(+), 18 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=767fd6ec4075eddb4c3d8c4c653f1ac77b4464e1


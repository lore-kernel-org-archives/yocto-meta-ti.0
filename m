Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E00DDE006D3
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 19:03:52 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 89CE252A65; Fri, 22 Nov 2013 03:03:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131122030352.89CE252A65@arago-project.org>
Date: Fri, 22 Nov 2013 03:03:52 +0000 (UTC)
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
X-List-Received-Date: Fri, 22 Nov 2013 03:03:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: e0cd3a7e6f7a3d786bc7d5afdfc888fb00d508a0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e0cd3a7e6f7a3d786bc7d5afdfc888fb00d508a0

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Tue Nov 19 10:59:08 2013 -0600

libgles-omap3: Add support for AM43x in common libgles-omap3 include files

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc |   34 ++++++++++++++++-------
 recipes-graphics/libgles/libgles-omap3-x11.inc  |   26 ++++++++++++-----
 2 files changed, 42 insertions(+), 18 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=e0cd3a7e6f7a3d786bc7d5afdfc888fb00d508a0


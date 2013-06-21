Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A542E0140D
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 11:54:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 13AFC52A4D; Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130621185428.13AFC52A4D@arago-project.org>
Date: Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Prabindh Sundareson : libgles-omap3: Remove X11 related build and packaging
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
X-List-Received-Date: Fri, 21 Jun 2013 18:54:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: adb1681db776d843bbb0d644557509a73b0b89d5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=adb1681db776d843bbb0d644557509a73b0b89d5

Author: Prabindh Sundareson <prabu@ti.com>
Date:   Wed Jun 12 23:10:34 2013 +0530

libgles-omap3: Remove X11 related build and packaging

SGX530 driver for X11 is only buildable and testable standalone
with the pre-built X11 package provided with the Graphics SDK.
This patch removes X11 build from the default recipe, to enable
moving X11 build to a separate recipe.

This is part of a clean up of the Graphics recipe starting from
4.09.00.01 version of the Graphics SDK.

Signed-off-by: Prabindh Sundareson <prabu at ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc    |  330 ++++++++++++++++++++
 .../libgles/libgles-omap3_4.09.00.01.bb            |   46 +---
 2 files changed, 332 insertions(+), 44 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=adb1681db776d843bbb0d644557509a73b0b89d5


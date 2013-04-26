Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B5F2E0151A
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2013 14:25:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 32AB352A57; Fri, 26 Apr 2013 21:25:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130426212506.32AB352A57@arago-project.org>
Date: Fri, 26 Apr 2013 21:25:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-am335x-psp: fix typo in the filename to use underscore
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
X-List-Received-Date: Fri, 26 Apr 2013 21:25:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: f2afcfee588adb594bc46a36d4e4443adb1be64f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f2afcfee588adb594bc46a36d4e4443adb1be64f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Apr 26 17:23:05 2013 -0400

linux-am335x-psp: fix typo in the filename to use underscore

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...x-am335x-psp-3.2.bb => linux-am335x-psp_3.2.bb} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-psp-3.2.bb
rename to recipes-kernel/linux/linux-am335x-psp_3.2.bb



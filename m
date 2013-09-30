Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4BECE0168F
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2013 13:37:34 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A768752A98; Mon, 30 Sep 2013 20:37:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130930203734.A768752A98@arago-project.org>
Date: Mon, 30 Sep 2013 20:37:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-omap4-3.1.0: remove old pandaboard-specific kernel
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
X-List-Received-Date: Mon, 30 Sep 2013 20:37:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: fd9313f1e19b6cb383bf8e111ca486ef900fad73
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fd9313f1e19b6cb383bf8e111ca486ef900fad73

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Sep 28 16:29:28 2013 -0400

linux-omap4-3.1.0: remove old pandaboard-specific kernel

Pandaboard is supported by newer 3.4+ kernel recipes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...inst-fix-install-breakage-for-FW-images-r.patch |   30 -
 .../linux-omap4-3.1.0/add_exec_tracepoint.patch    |  109 -
 .../linux/linux-omap4-3.1.0/pandaboard/defconfig   | 4402 --------------------
 recipes-kernel/linux/linux-omap4_3.1.0.bb          |   19 -
 4 files changed, 0 insertions(+), 4560 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=fd9313f1e19b6cb383bf8e111ca486ef900fad73


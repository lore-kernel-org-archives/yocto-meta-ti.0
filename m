Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B174E014F5
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 11:54:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0CDE652A98; Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130621185429.0CDE652A98@arago-project.org>
Date: Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap3-sgx-modules: remove unnecessary patches for x11, cleanup old patch
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
Commit: b122c644697a98a090c25d6cd6a0e541a2cc036f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b122c644697a98a090c25d6cd6a0e541a2cc036f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 21 14:50:15 2013 -0400

omap3-sgx-modules: remove unnecessary patches for x11, cleanup old patch

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../Compile-fixes-for-38-kernel.patch              |  346 --------------------
 .../omap3-sgx-modules-x11/kernel-30.patch          |   38 ---
 .../omap3-sgx-modules/kernel-30.patch              |   76 +++---
 3 files changed, 38 insertions(+), 422 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=b122c644697a98a090c25d6cd6a0e541a2cc036f


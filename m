Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36541E01503
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 11:54:34 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D497C52AAF; Fri, 21 Jun 2013 18:54:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130621185433.D497C52AAF@arago-project.org>
Date: Fri, 21 Jun 2013 18:54:33 +0000 (UTC)
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
X-List-Received-Date: Fri, 21 Jun 2013 18:54:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 21f9705c8be3382a92d98dbb0929475bae766845
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=21f9705c8be3382a92d98dbb0929475bae766845

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 21 14:50:15 2013 -0400

omap3-sgx-modules: remove unnecessary patches for x11, cleanup old patch

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../Compile-fixes-for-38-kernel.patch              |  346 --------------------
 .../omap3-sgx-modules-x11/kernel-30.patch          |   38 ---
 .../omap3-sgx-modules/kernel-30.patch              |   76 +++---
 3 files changed, 38 insertions(+), 422 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=21f9705c8be3382a92d98dbb0929475bae766845


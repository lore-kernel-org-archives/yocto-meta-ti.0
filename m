Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 923AAE011C5
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2013 09:33:54 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EE76052A5E; Mon, 14 Oct 2013 16:33:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131014163353.EE76052A5E@arago-project.org>
Date: Mon, 14 Oct 2013 16:33:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : init-ifupdown: move interfaces file from netbase to new init-ifupdown
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
X-List-Received-Date: Mon, 14 Oct 2013 16:33:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 084544208aadf82825403d0c9016fe5d358a6e73
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=084544208aadf82825403d0c9016fe5d358a6e73

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sun Oct 13 19:14:22 2013 -0400

init-ifupdown: move interfaces file from netbase to new init-ifupdown

This change has been backported from master to dylan

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../init-ifupdown-1.0}/beagleboard/interfaces      |    0
 .../init-ifupdown_1.0.bbappend}                    |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/recipes-core/netbase/netbase-5.0/beagleboard/interfaces b/recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
similarity index 100%
rename from recipes-core/netbase/netbase-5.0/beagleboard/interfaces
rename to recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
diff --git a/recipes-core/netbase/netbase_5.0.bbappend b/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
similarity index 100%
rename from recipes-core/netbase/netbase_5.0.bbappend
rename to recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend



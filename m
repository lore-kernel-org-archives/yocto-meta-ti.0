Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 269AAE01409
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 13:07:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id AC52E52A1C; Fri, 21 Jun 2013 20:07:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130621200748.AC52E52A1C@arago-project.org>
Date: Fri, 21 Jun 2013 20:07:48 +0000 (UTC)
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
X-List-Received-Date: Fri, 21 Jun 2013 20:07:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bc80eb2756b8fda434a1a7714c4e95e19a8fbe60
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bc80eb2756b8fda434a1a7714c4e95e19a8fbe60

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 21 16:06:15 2013 -0400

init-ifupdown: move interfaces file from netbase to new init-ifupdown

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../init-ifupdown-1.0}/beagleboard/interfaces      |    0
 .../init-ifupdown_1.0.bbappend}                    |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/recipes-core/netbase/netbase-5.1/beagleboard/interfaces b/recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
similarity index 100%
rename from recipes-core/netbase/netbase-5.1/beagleboard/interfaces
rename to recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
diff --git a/recipes-core/netbase/netbase_5.1.bbappend b/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
similarity index 100%
rename from recipes-core/netbase/netbase_5.1.bbappend
rename to recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend



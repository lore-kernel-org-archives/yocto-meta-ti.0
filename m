Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33EE2E016F4
	for <meta-ti@yoctoproject.org>; Sun, 13 Oct 2013 16:15:49 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUM00BAZRACK600@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 13 Oct 2013 18:15:49 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A5B542001F; Sun,
	13 Oct 2013 19:15:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sun, 13 Oct 2013 19:15:48 -0400
Message-id: <1381706148-28325-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] init-ifupdown: move interfaces file from netbase to new init-ifupdown
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
X-List-Received-Date: Sun, 13 Oct 2013 23:15:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

This change has been backported from master to dylan

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../init-ifupdown-1.0}/beagleboard/interfaces                             | 0
 .../netbase_5.0.bbappend => init-ifupdown/init-ifupdown_1.0.bbappend}     | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/beagleboard/interfaces (100%)
 rename recipes-core/{netbase/netbase_5.0.bbappend => init-ifupdown/init-ifupdown_1.0.bbappend} (100%)

diff --git a/recipes-core/netbase/netbase-5.0/beagleboard/interfaces b/recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
similarity index 100%
rename from recipes-core/netbase/netbase-5.0/beagleboard/interfaces
rename to recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
diff --git a/recipes-core/netbase/netbase_5.0.bbappend b/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
similarity index 100%
rename from recipes-core/netbase/netbase_5.0.bbappend
rename to recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
-- 
1.8.3.2



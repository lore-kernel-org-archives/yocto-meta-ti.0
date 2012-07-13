Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45223E0027D
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2012 16:04:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 50B7D52982; Fri, 13 Jul 2012 23:04:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120713230402.50B7D52982@arago-project.org>
Date: Fri, 13 Jul 2012 23:04:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIG5ldGJhc2U6IGZvbGxvdyBvZS1jb3JlIHRvIHY1LjA=?=
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 23:04:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d3ff5630a74640f46ca2ceaef1aa1baa86b9b795
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d3ff5630a74640f46ca2ceaef1aa1baa86b9b795

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Mon Jul  9 14:35:36 2012 +0200

netbase: follow oe-core to v5.0

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../beagleboard/interfaces                         |    0
 ...{netbase_4.47.bbappend => netbase_5.0.bbappend} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/recipes-core/netbase/netbase-4.47/beagleboard/interfaces b/recipes-core/netbase/netbase-5.0/beagleboard/interfaces
similarity index 100%
rename from recipes-core/netbase/netbase-4.47/beagleboard/interfaces
rename to recipes-core/netbase/netbase-5.0/beagleboard/interfaces
diff --git a/recipes-core/netbase/netbase_4.47.bbappend b/recipes-core/netbase/netbase_5.0.bbappend
similarity index 100%
rename from recipes-core/netbase/netbase_4.47.bbappend
rename to recipes-core/netbase/netbase_5.0.bbappend



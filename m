Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05B3BE0027C
	for <meta-ti@yoctoproject.org>; Mon,  6 May 2013 12:17:51 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2B3A952995; Mon,  6 May 2013 19:17:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130506191750.2B3A952995@arago-project.org>
Date: Mon,  6 May 2013 19:17:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : netbase: bump the version to follow oe-core
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
X-List-Received-Date: Mon, 06 May 2013 19:17:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: de8061b927a80e3081327748141da939f09fe633
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=de8061b927a80e3081327748141da939f09fe633

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon May  6 15:16:43 2013 -0400

netbase: bump the version to follow oe-core

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../beagleboard/interfaces                         |    0
 .../{netbase_5.0.bbappend => netbase_5.1.bbappend} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/recipes-core/netbase/netbase-5.0/beagleboard/interfaces b/recipes-core/netbase/netbase-5.1/beagleboard/interfaces
similarity index 100%
rename from recipes-core/netbase/netbase-5.0/beagleboard/interfaces
rename to recipes-core/netbase/netbase-5.1/beagleboard/interfaces
diff --git a/recipes-core/netbase/netbase_5.0.bbappend b/recipes-core/netbase/netbase_5.1.bbappend
similarity index 100%
rename from recipes-core/netbase/netbase_5.0.bbappend
rename to recipes-core/netbase/netbase_5.1.bbappend



Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B777E013DB
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 19:59:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2A1FA52A65; Wed,  8 Aug 2012 02:59:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120808025930.2A1FA52A65@arago-project.org>
Date: Wed,  8 Aug 2012 02:59:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Roger Monk : gstreamer-ti: convert proto to protocol in SRC_URI
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
X-List-Received-Date: Wed, 08 Aug 2012 02:59:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 864173a96a2095bb5c2822dd58d1f0501fe71bb5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=864173a96a2095bb5c2822dd58d1f0501fe71bb5

Author: Roger Monk <r-monk@ti.com>
Date:   Thu Jul 19 13:49:01 2012 +0100

gstreamer-ti: convert proto to protocol in SRC_URI

Signed-off-by: Roger Monk <r-monk@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb b/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
index 3d260ed..f314a35 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
@@ -11,7 +11,7 @@ SRCREV = "962"
 # apply patches from tracker 1208 to get zero copy support.
 # https://gstreamer.ti.com/gf/project/gstreamer_ti/tracker/?action=TrackerItemEdit&tracker_item_id=1208&start=175
 
-SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;proto=https;user=anonymous;pswd='' \
+SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;protocol=https;user=anonymous;pswd='' \
            file://gstreamer-ti-rc.sh \
            file://r962-remove-include-videodev.diff \
            file://gstti-init.service \



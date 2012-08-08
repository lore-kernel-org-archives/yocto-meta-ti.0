Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CB7DE013E5
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 19:59:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7C53152A73; Wed,  8 Aug 2012 02:59:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120808025930.7C53152A73@arago-project.org>
Date: Wed,  8 Aug 2012 02:59:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Roger Monk : am-sysinfo: switch 'proto' to 'protocol' in SRC_URI
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
Commit: 297f5217bffa174bfa4226af01dfcfb692f580b0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=297f5217bffa174bfa4226af01dfcfb692f580b0

Author: Roger Monk <r-monk@ti.com>
Date:   Thu Jul 19 13:52:19 2012 +0100

am-sysinfo: switch 'proto' to 'protocol' in SRC_URI

Signed-off-by: Roger Monk <r-monk@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am-sysinfo_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/ti/am-sysinfo_svn.bb b/recipes-bsp/ti/am-sysinfo_svn.bb
index d4f8740..b73a884 100644
--- a/recipes-bsp/ti/am-sysinfo_svn.bb
+++ b/recipes-bsp/ti/am-sysinfo_svn.bb
@@ -9,7 +9,7 @@ SRCREV = "5"
 PV = "1.0"
 PR = "r1+svnr${SRCPV}"
 
-SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;proto=https;user=anonymous;pswd=''"
+SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;protocol=https;user=anonymous;pswd=''"
 
 S = "${WORKDIR}/trunk"
 



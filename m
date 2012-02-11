Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69D8EE003E3
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 18:33:31 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 6FAAC52984; Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120211023330.6FAAC52984@arago-project.org>
Date: Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Enrico Butera : ti-dmai: build fix
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
X-List-Received-Date: Sat, 11 Feb 2012 02:33:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f88a0a9d7cd64101e5f5564ca0cf47c5209e21ef
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f88a0a9d7cd64101e5f5564ca0cf47c5209e21ef

Author: Enrico Butera <ebutera@users.berlios.de>
Date:   Thu Feb  9 15:12:44 2012 +0100

ti-dmai: build fix

Properly set ${S} dir.

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/dmai/ti-dmai.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index 8c20384..b22495a 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -15,7 +15,7 @@ PE = "1"
 SRCREV               ?= "UNDEFINED_SRCREV"
 DMAIBRANCH           ?= "UNDEFINED_DMAIBRANCH"
 
-S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}"
+S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
 
 SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};proto=https;user=anonymous;pswd='' \
 		file://loadmodules-ti-dmai-dm6446_al.sh \



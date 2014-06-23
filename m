Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CB37E00507; Mon, 23 Jun 2014 15:04:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 739D0E00507
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 15:04:54 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1993352ABA; Mon, 23 Jun 2014 22:04:51 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623220451.1993352ABA@arago-project.org>
Date: Mon, 23 Jun 2014 22:04:51 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Ash Charles : ti-dmai: Allow do_prepsources to run release.sh
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
X-List-Received-Date: Mon, 23 Jun 2014 22:04:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a09450e12db8c456a4339f27c1827030c652e8b2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a09450e12db8c456a4339f27c1827030c652e8b2

Author: Ash Charles <ashcharles@gmail.com>
Date:   Sat Jun 14 04:34:08 2014 +0000

ti-dmai: Allow do_prepsources to run release.sh

The do_prepsources task runs after do_unpack at which point the
${S}/patches directory has been created.  In the last step of
do_prepsources, code should be copied over to ${S} by the release.sh
script.  However, this script silently fails if the target directory
(${S}) is not empty---it contains the 'patches' directory.  The
failure manifests in the do_patch step when trying to applying patches
against the source which wasn't populated by release.sh.

Here, we pre-emptively clean out the directory release.sh intends to
use.  The patch directory is re-created by the do_patch step.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/dmai/ti-dmai.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index 58955b5..f81b4cf 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -74,6 +74,7 @@ do_prepsources() {
     chmod a+x ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/release.sh
     chmod a+x ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/tdox
     sed -i 's|tdox|./tdox|g' ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/release.sh
+    rm -rf ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/*
     (cd ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface; ./release.sh ${PV})
 }
 



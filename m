Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDA79E01373
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 09:04:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B055F529B7; Mon,  5 Mar 2012 17:04:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120305170456.B055F529B7@arago-project.org>
Date: Mon,  5 Mar 2012 17:04:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : bonescript: update to latest git
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
X-List-Received-Date: Mon, 05 Mar 2012 17:04:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: dfbcf63963c95a4818865a9a397dae58c0045121
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=dfbcf63963c95a4818865a9a397dae58c0045121

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Sun Mar  4 11:08:42 2012 +0100

bonescript: update to latest git

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/payload/bonescript.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-misc/payload/bonescript.bb b/recipes-misc/payload/bonescript.bb
index 3361cb4..b1e92df 100644
--- a/recipes-misc/payload/bonescript.bb
+++ b/recipes-misc/payload/bonescript.bb
@@ -1,18 +1,18 @@
 DESCRIPTION = "Scripting tools for the BeagleBoard and BeagleBone"
 
-PR = "r13"
+PR = "r14"
 
 inherit systemd
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=659ee0c98db2664403c769d6b9ab50eb"
 
-SRC_URI = "http://dominion.thruhere.net/koen/angstrom/beaglebone/bonescript-8898f4ee4ae2548642679626a03e332a4cd43331.tar.bz2 \
+SRC_URI = "http://dominion.thruhere.net/koen/angstrom/beaglebone/bonescript-ca0f663083cea4e434864aa276d46ff79d471dff.tar.bz2 \
            file://bonescript-git \
            file://bone101.service \
           "
-SRC_URI[md5sum] = "306278a2afc10b75f4fc886918fb02b7"
-SRC_URI[sha256sum] = "01c87e59adcc663365c664b0731f0e5a23feeae1965a5cd5edd3e89255f8a30b"
+SRC_URI[md5sum] = "2b7edd83a752eaf0be0c7488d32c7e72"
+SRC_URI[sha256sum] = "839ee1147b83924f259dc5e373d73eb0eaa6ece76322dc156a6b04113fa89a91"
 
 S = "${WORKDIR}/bonescript"
 



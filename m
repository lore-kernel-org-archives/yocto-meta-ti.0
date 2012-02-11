Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B1A6E003E4
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 18:33:31 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id A471252A8D; Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120211023330.A471252A8D@arago-project.org>
Date: Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : bonescript: major rework
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
Commit: a924b24328daa3104d5d8538d417763a9e8b459c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a924b24328daa3104d5d8538d417763a9e8b459c

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Feb  9 20:21:20 2012 +0100

bonescript: major rework

* switch to tarball to get a working .git
* post-process out x86 binaries
* remove allarch

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/payload/bonescript.bb |   23 +++++++++++------------
 1 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/recipes-misc/payload/bonescript.bb b/recipes-misc/payload/bonescript.bb
index 4557eae..3361cb4 100644
--- a/recipes-misc/payload/bonescript.bb
+++ b/recipes-misc/payload/bonescript.bb
@@ -1,32 +1,31 @@
 DESCRIPTION = "Scripting tools for the BeagleBoard and BeagleBone"
 
-PR = "r12"
+PR = "r13"
 
-inherit allarch systemd
+inherit systemd
 
-# Ask Jason
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=659ee0c98db2664403c769d6b9ab50eb"
 
-SRCREV = "8118a541e8927f48de2cf9ec203aa1caf88ec1f3"
-SRC_URI = "git://github.com/jadonk/bonescript.git \
+SRC_URI = "http://dominion.thruhere.net/koen/angstrom/beaglebone/bonescript-8898f4ee4ae2548642679626a03e332a4cd43331.tar.bz2 \
            file://bonescript-git \
            file://bone101.service \
           "
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "306278a2afc10b75f4fc886918fb02b7"
+SRC_URI[sha256sum] = "01c87e59adcc663365c664b0731f0e5a23feeae1965a5cd5edd3e89255f8a30b"
+
+S = "${WORKDIR}/bonescript"
 
 do_install() {
-	install -m 0644 ${WORKDIR}/bonescript-git ${S}/.git/config
-	cp $(cat .git/objects/info/alternates)/pack/* .git/objects/pack
-	rm -f ${S}/.git/objects/info/alternates
-	echo ${SRCREV} > .git/refs/heads/master
-	git checkout master || true
 	install -d ${D}${localstatedir}/lib/cloud9/
 	cp -a ${S}/* ${D}${localstatedir}/lib/cloud9/
 	cp -a ${S}/.git ${D}${localstatedir}/lib/cloud9/
 
 	install -d ${D}${base_libdir}/systemd/system
 	install -m 0644 ${WORKDIR}/bone101.service ${D}${base_libdir}/systemd/system
+
+	rm -f ${D}${localstatedir}/lib/cloud9/node_modules/binary/node_modules/put/test/c/itof
+	rm -f ${D}${localstatedir}/lib/cloud9/node_modules/binary/node_modules/put/test/c/ftoi
 }
 
 SYSTEMD_PACKAGES = "${PN}"



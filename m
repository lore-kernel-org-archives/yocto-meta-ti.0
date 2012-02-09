Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AD7FE00593
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  9 Feb 2012 11:21:40 -0800 (PST)
Received: by werp13 with SMTP id p13so1626116wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 09 Feb 2012 11:21:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.138.13 with SMTP id z13mr1227019wei.41.1328815299165;
	Thu, 09 Feb 2012 11:21:39 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id dw7sm8695741wib.4.2012.02.09.11.21.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 11:21:38 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu,  9 Feb 2012 20:21:20 +0100
Message-Id: <1328815284-26086-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1328815284-26086-1-git-send-email-koen@dominion.thruhere.net>
References: <1328815284-26086-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkr2TdRYqcKb93dRxepeG9rsdBw5XrmkxiFiCDYPB7lB150UGIqaGjyXNU4rtRxOdC6Eb/E
Subject: [PATCH 2/6] bonescript: major rework
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
X-List-Received-Date: Thu, 09 Feb 2012 19:21:40 -0000

* switch to tarball to get a working .git
* post-process out x86 binaries
* remove allarch

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
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
-- 
1.7.2.5



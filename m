Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F03EEE009C3; Fri,  4 Dec 2015 19:12:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9639E00956
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 19:12:10 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7EB9852ABB; Sat,  5 Dec 2015 03:12:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151205031209.7EB9852ABB@arago-project.org>
Date: Sat,  5 Dec 2015 03:12:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mpm-transport: Change file permissions
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
X-List-Received-Date: Sat, 05 Dec 2015 03:12:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: d3a9812e4c1fb16954d2452b93cb3cac926a28ff
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d3a9812e4c1fb16954d2452b93cb3cac926a28ff

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Dec  4 22:55:09 2015 +0000

mpm-transport: Change file permissions

- Remove executable permission for json and include files.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 7d86196..812ae04 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -40,11 +40,11 @@ do_install() {
 	oe_runmake installbin BASE_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
 
 	install -d ${D}${includedir}/
-	install -c -m 755 ${S}/include/* ${D}${includedir}/
+	install -c -m 644 ${S}/include/* ${D}${includedir}/
 
 	install -d ${D}${libdir}/
 	cp  -a ${S}/lib/* ${D}${libdir}/
 
 	install -d ${D}${sysconfdir}/mpm/
-	install -c -m 755 ${S}/scripts/mpm_config.json ${D}${sysconfdir}/mpm/mpm_config.json
+	install -c -m 644 ${S}/scripts/mpm_config.json ${D}${sysconfdir}/mpm/mpm_config.json
 }



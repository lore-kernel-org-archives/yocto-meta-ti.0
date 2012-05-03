Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC9C1E00596
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 15:23:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 102BC52A6F; Thu,  3 May 2012 22:23:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120503222332.102BC52A6F@arago-project.org>
Date: Thu,  3 May 2012 22:23:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : bonescript: silence systemd bbclass WARNING, ${PN}-systemd is unwanted
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
X-List-Received-Date: Thu, 03 May 2012 22:23:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: aff1018e66b477544af17501757405283c21bef1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=aff1018e66b477544af17501757405283c21bef1

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May  3 18:21:13 2012 -0400

bonescript: silence systemd bbclass WARNING, ${PN}-systemd is unwanted

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/payload/bonescript.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/payload/bonescript.bb b/recipes-misc/payload/bonescript.bb
index 72bcab0..b9dfbe6 100644
--- a/recipes-misc/payload/bonescript.bb
+++ b/recipes-misc/payload/bonescript.bb
@@ -28,6 +28,7 @@ do_install() {
 	rm -f ${D}${localstatedir}/lib/cloud9/node_modules/binary/node_modules/put/test/c/ftoi
 }
 
+NATIVE_SYSTEMD_SUPPORT = "1"
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "bone101.service"
 



Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AFF6E007BD
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 14:45:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B9846529C3; Wed, 29 Jan 2014 22:45:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140129224518.B9846529C3@arago-project.org>
Date: Wed, 29 Jan 2014 22:45:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIGJlYWdsZWJvbmUtY2FwZXM6IHVwZGF0ZSBvZS1jb3JlJyBzIExJQ0VOU0UgY2hlY2tzdW0=?=
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
X-List-Received-Date: Wed, 29 Jan 2014 22:45:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ff6a6b61f5d82cd0d3aded65f484605291241a3e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ff6a6b61f5d82cd0d3aded65f484605291241a3e

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Wed Jan  8 15:53:28 2014 +0100

beaglebone-capes: update oe-core's LICENSE checksum

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/beagleboard/beaglebone-capes.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
index ae9132e..e74033a 100644
--- a/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Userspace setup for beaglebone capes"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 PR = "r4"
 



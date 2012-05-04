Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03BBEE0070C
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 17:07:36 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8C7CF52AA2; Fri,  4 May 2012 00:07:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120504000735.8C7CF52AA2@arago-project.org>
Date: Fri,  4 May 2012 00:07:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : u-boot 2011.12: switch beagleboard to ext4 to match beaglebone
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
X-List-Received-Date: Fri, 04 May 2012 00:07:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 07913cca6cfd7f35a9bb5d6b2cca41c6b5f07ec3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=07913cca6cfd7f35a9bb5d6b2cca41c6b5f07ec3

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May  1 21:06:52 2012 +0200

u-boot 2011.12: switch beagleboard to ext4 to match beaglebone

Also add patch to increase ext2 read speed.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Acked-by: Tom Rini <trini@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../0011-ext2load-increase-read-speed.patch        |   74 +
 .../2011.12/0012-ext4fs-ls-load-support.patch      | 2362 ++++++++++++++++++++
 .../0013-beagleboard-switch-mmcroots-to-ext4.patch |   43 +
 recipes-bsp/u-boot/u-boot_2011.12.bb               |    5 +-
 4 files changed, 2483 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=07913cca6cfd7f35a9bb5d6b2cca41c6b5f07ec3


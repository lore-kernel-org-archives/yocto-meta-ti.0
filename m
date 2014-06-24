Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76BB8E00566; Tue, 24 Jun 2014 16:35:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_DYNIP autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FEEFE003C1
	for <meta-ti@yoctoproject.org>; Tue, 24 Jun 2014 16:35:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A7FC452A04; Tue, 24 Jun 2014 23:35:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140624233508.A7FC452A04@arago-project.org>
Date: Tue, 24 Jun 2014 23:35:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-am37x: remove old machine-specific version in favor of mainline
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
X-List-Received-Date: Tue, 24 Jun 2014 23:35:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 6b504496d7a3ca6e1d187ee43480905617e03cb8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6b504496d7a3ca6e1d187ee43480905617e03cb8

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jun 24 09:16:19 2014 +0000

u-boot-am37x: remove old machine-specific version in favor of mainline

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch |  172 --------------------
 .../0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch     |   31 ----
 ...e-add-usbethaddr-setting-to-enable-networ.patch |   40 -----
 ...dded-function-calls-to-set-volts-speed-on.patch |  146 -----------------
 ...17evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch |   73 ---------
 ...2-omap3evm-Make-the-board-start-at-800MHz.patch |   36 ----
 ...gleboard-Load-uImage-from-VFAT-by-default.patch |   34 ----
 ...03-beagleboard-Make-xM-rev-C-go-to-800MHz.patch |   34 ----
 ...-Load-uImage-to-the-default-kernel-linux-.patch |   57 -------
 recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb      |   41 -----
 10 files changed, 0 insertions(+), 664 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=6b504496d7a3ca6e1d187ee43480905617e03cb8


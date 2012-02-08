Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A647E01372
	for <meta-ti@yoctoproject.org>; Tue,  7 Feb 2012 22:29:26 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 21542529A0; Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120208062925.21542529A0@arago-project.org>
Date: Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp: add 3.2 based on 3.2-staging branch
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
X-List-Received-Date: Wed, 08 Feb 2012 06:29:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 034e54254f1e5de481714bbfed85d80a677d7ea3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=034e54254f1e5de481714bbfed85d80a677d7ea3

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Jan 31 16:29:11 2012 +0100

linux-ti335x-psp: add 3.2 based on 3.2-staging branch

runtime tested on beaglebone

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

---

 ...1-f_rndis-HACK-around-undefined-variables.patch |   31 +
 ...2-da8xx-fb-add-DVI-support-for-beaglebone.patch |   38 +
 .../0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch   |   30 +
 ...-hwmod-33xx-Add-support-for-third-i2c-bus.patch |   92 +
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |  548 ++
 .../0006-more-beaglebone-merges.patch              |  125 +
 .../0007-beaglebone-disable-tsadc.patch            |   31 +
 ...general-purpose-mode-untested-with-touchs.patch |  411 ++
 ...dc-Add-board-file-mfd-support-fix-warning.patch |   44 +
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |   26 +
 ...cadc-make-stepconfig-channel-configurable.patch |   46 +
 .../0012-tscadc-Trigger-through-sysfs.patch        |  147 +
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |   34 +
 ...c-switch-to-polling-instead-of-interrupts.patch |   54 +
 .../0015-beaglebone-fix-ADC-init.patch             |   47 +
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig | 3566 ++++++++++
 .../beaglebone/logo_linux_clut224.ppm              | 7053 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   46 +
 18 files changed, 12369 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=034e54254f1e5de481714bbfed85d80a677d7ea3


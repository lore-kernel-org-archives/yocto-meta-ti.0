Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37476E0136A
	for <meta-ti@yoctoproject.org>; Tue,  7 Feb 2012 22:29:26 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7B42F52A75; Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120208062925.7B42F52A75@arago-project.org>
Date: Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: enable w1 for beaglebone, fix bootlogo
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
Commit: 4a759de7bb1529bffbeea2c2a28eff076c29b6e5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4a759de7bb1529bffbeea2c2a28eff076c29b6e5

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Feb  7 11:11:09 2012 +0100

linux-ti33x-psp 3.2: enable w1 for beaglebone, fix bootlogo

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

---

 ...1-f_rndis-HACK-around-undefined-variables.patch |    4 +-
 ...2-da8xx-fb-add-DVI-support-for-beaglebone.patch |    4 +-
 .../0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch   |    4 +-
 ...-hwmod-33xx-Add-support-for-third-i2c-bus.patch |    4 +-
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |    7 +-
 .../0006-more-beaglebone-merges.patch              |    4 +-
 .../0007-beaglebone-disable-tsadc.patch            |    4 +-
 ...general-purpose-mode-untested-with-touchs.patch |    7 +-
 ...dc-Add-board-file-mfd-support-fix-warning.patch |    4 +-
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |    4 +-
 ...cadc-make-stepconfig-channel-configurable.patch |    4 +-
 .../0012-tscadc-Trigger-through-sysfs.patch        |    4 +-
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |    4 +-
 ...c-switch-to-polling-instead-of-interrupts.patch |    4 +-
 .../0015-beaglebone-fix-ADC-init.patch             |    4 +-
 ...1A.patch => 0016-AM335x-MUX-add-ehrpwm1A.patch} |    6 +-
 ...nable-PWM-for-lcd-backlight-backlight-is.patch} |    7 +-
 ...et-dto-to-max-value-of-14-to-avoid-SD-Ca.patch} |    7 +-
 ...et-default-brightness-to-50-for-pwm-back.patch} |    7 +-
 ...-framebuffer-driver-supporting-Adafruit-.patch} |    7 +-
 ...021-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch |   83 ++++++++++++++++++++
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |   28 ++++---
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   14 ++--
 23 files changed, 153 insertions(+), 72 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=4a759de7bb1529bffbeea2c2a28eff076c29b6e5


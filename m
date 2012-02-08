Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38D63E01370
	for <meta-ti@yoctoproject.org>; Tue,  7 Feb 2012 22:29:26 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 48501529C1; Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120208062925.48501529C1@arago-project.org>
Date: Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp 3.2: fix sd timeout, use pwm for backlight, add SPI fb support
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
Commit: 584043688cb402a11ea26911ecd2cdb5d3eaf5a9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=584043688cb402a11ea26911ecd2cdb5d3eaf5a9

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Feb  2 09:24:35 2012 +0100

linux-ti335x-psp 3.2: fix sd timeout, use pwm for backlight, add SPI fb support

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

---

 ...1-f_rndis-HACK-around-undefined-variables.patch |    4 +-
 ...2-da8xx-fb-add-DVI-support-for-beaglebone.patch |    4 +-
 .../0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch   |    4 +-
 ...-hwmod-33xx-Add-support-for-third-i2c-bus.patch |    4 +-
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |    4 +-
 .../0006-more-beaglebone-merges.patch              |    4 +-
 .../0007-beaglebone-disable-tsadc.patch            |    4 +-
 ...general-purpose-mode-untested-with-touchs.patch |    4 +-
 ...dc-Add-board-file-mfd-support-fix-warning.patch |    4 +-
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |    4 +-
 ...cadc-make-stepconfig-channel-configurable.patch |    4 +-
 .../0012-tscadc-Trigger-through-sysfs.patch        |    4 +-
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |    4 +-
 ...c-switch-to-polling-instead-of-interrupts.patch |    4 +-
 .../0015-beaglebone-fix-ADC-init.patch             |    4 +-
 .../0017-AM335x-MUX-add-ehrpwm1A.patch             |   26 +
 ...enable-PWM-for-lcd-backlight-backlight-is.patch |  177 ++++++
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |   34 +
 ...set-default-brightness-to-50-for-pwm-back.patch |   27 +
 ...P-framebuffer-driver-supporting-Adafruit-.patch |  668 ++++++++++++++++++++
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    9 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    9 +-
 22 files changed, 974 insertions(+), 36 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=584043688cb402a11ea26911ecd2cdb5d3eaf5a9


Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCA1CE0123C
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 18:33:31 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2060D52AA3; Sat, 11 Feb 2012 02:33:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120211023331.2060D52AA3@arago-project.org>
Date: Sat, 11 Feb 2012 02:33:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: rebase patches onto latest v3. 2-staging branch
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
X-List-Received-Date: Sat, 11 Feb 2012 02:33:32 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 263dac0f942f43b1afe55817f5f12e069f86f957
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=263dac0f942f43b1afe55817f5f12e069f86f957

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Feb  9 20:21:24 2012 +0100

linux-ti33x-psp 3.2: rebase patches onto latest v3.2-staging branch

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...-f_rndis-HACK-around-undefined-variables.patch} |    6 +-
 .../0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch   |   30 -------
 ...-da8xx-fb-add-DVI-support-for-beaglebone.patch} |    6 +-
 ...ebase-everything-onto-3.2-WARNING-MEGAPA.patch} |   77 +++++++++--------
 ...-hwmod-33xx-Add-support-for-third-i2c-bus.patch |   92 --------------------
 ...ges.patch => 0005-more-beaglebone-merges.patch} |    6 +-
 ...c.patch => 0006-beaglebone-disable-tsadc.patch} |    6 +-
 ...eneral-purpose-mode-untested-with-touchs.patch} |    9 +-
 ...c-Add-board-file-mfd-support-fix-warning.patch} |    6 +-
 ...M335X-init-tsc-bone-style-for-new-boards.patch} |    6 +-
 ...adc-make-stepconfig-channel-configurable.patch} |    6 +-
 ...tch => 0011-tscadc-Trigger-through-sysfs.patch} |    6 +-
 ...eta-ti-Remove-debug-messages-for-meta-ti.patch} |    6 +-
 ...-switch-to-polling-instead-of-interrupts.patch} |    6 +-
 ...it.patch => 0014-beaglebone-fix-ADC-init.patch} |    6 +-
 ...1A.patch => 0015-AM335x-MUX-add-ehrpwm1A.patch} |    8 +-
 ...nable-PWM-for-lcd-backlight-backlight-is.patch} |   11 ++-
 ...et-dto-to-max-value-of-14-to-avoid-SD-Ca.patch} |    7 +-
 ...et-default-brightness-to-50-for-pwm-back.patch} |    7 +-
 ...-framebuffer-driver-supporting-Adafruit-.patch} |    7 +-
 ...20-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch} |    6 +-
 ...dd-support-for-Towertech-TT3201-CAN-cape.patch} |   32 ++++---
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   46 +++++-----
 23 files changed, 146 insertions(+), 252 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=263dac0f942f43b1afe55817f5f12e069f86f957


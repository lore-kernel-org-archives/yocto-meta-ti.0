Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF760E01408
	for <meta-ti@yoctoproject.org>; Wed, 18 Apr 2012 10:20:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3C45F52AA1; Wed, 18 Apr 2012 17:20:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120418172030.3C45F52AA1@arago-project.org>
Date: Wed, 18 Apr 2012 17:20:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: rebase onto latest PSP
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
X-List-Received-Date: Wed, 18 Apr 2012 17:20:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 415f8b2c33cc3a7d2856fa0c6063f30fcbdad442
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=415f8b2c33cc3a7d2856fa0c6063f30fcbdad442

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Apr 17 14:47:44 2012 +0200

linux-ti33x-psp 3.2: rebase onto latest PSP

This fixes most PM operations: cpufreq, cpuidle and suspend. Resume does not
work on beaglebone, but 3 out of 4 ain't bad :)

The M3 firmware needed for suspend/resume is used as a binary, building it
from source and including it from sysroots is planned for future commits.

Beaglebone patches have been forward ported and runtime tested.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc                     |    2 +-
 ...AP-correct-SYSC-register-offset-for-OMAP4.patch |   34 --------
 ...new-UV2-hardware-by-using-native-UV2-bro.patch} |    6 +-
 ...x-BAU-destination-timeout-initialization.patch} |    6 +-
 ...atch => 0115-x86-UV2-Work-around-BAU-bug.patch} |    6 +-
 ...ix-interpretation-of-the-rx-KeyMiss-flag.patch} |    6 +-
 ...00pci-fix-spurious-interrupts-generation.patch} |    6 +-
 ...-endian-conversion-issue-in-discard-code.patch} |    6 +-
 ...0t-modified-the-setting-of-transfer-rate.patch} |    6 +-
 ...-fix-off-by-one-index-into-syscall-table.patch} |    6 +-
 ...efault-wsize-when-unix-extensions-are-no.patch} |    6 +-
 ...-kprobes-initialize-before-using-a-hlist.patch} |    6 +-
 ...c-clear_refs-do-not-clear-reserved-pages.patch} |    6 +-
 ...ptr-dereference-in-__count_immobile_page.patch} |    6 +-
 ...patch => 0125-iwlagn-check-for-SMPS-mode.patch} |    6 +-
 ...45-fix-hw-passive-scan-on-radar-channels.patch} |    6 +-
 ...HM_UNLOCK-fix-long-unpreemptible-section.patch} |    8 +-
 ...ix-Unevictable-pages-stranded-after-swap.patch} |    6 +-
 ...30-Linux-3.2.2.patch => 0129-Linux-3.2.2.patch} |    6 +-
 .../linux-ti33x-psp-3.2/am335x-pm-firmware.bin     |  Bin 0 -> 10732 bytes
 ...1-f_rndis-HACK-around-undefined-variables.patch |    6 +-
 ...2-da8xx-fb-add-DVI-support-for-beaglebone.patch |   10 +-
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |   63 +++++++++-------
 .../beaglebone/0004-more-beaglebone-merges.patch   |   48 ++++--------
 .../beaglebone/0005-beaglebone-disable-tsadc.patch |   12 ++--
 ...general-purpose-mode-untested-with-touchs.patch |   67 ++++++++---------
 ...dc-Add-board-file-mfd-support-fix-warning.patch |   14 ++--
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |   10 +-
 ...cadc-make-stepconfig-channel-configurable.patch |   14 ++--
 .../0010-tscadc-Trigger-through-sysfs.patch        |   28 ++++---
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |   10 +-
 ...c-switch-to-polling-instead-of-interrupts.patch |   14 ++--
 .../beaglebone/0013-beaglebone-fix-ADC-init.patch  |   16 ++--
 .../beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch  |    8 +-
 ...enable-PWM-for-lcd-backlight-backlight-is.patch |   80 +++----------------
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |   14 ++--
 ...set-default-brightness-to-50-for-pwm-back.patch |   12 ++--
 ...P-framebuffer-driver-supporting-Adafruit-.patch |    6 +-
 ...019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch |   20 +++---
 ...add-support-for-Towertech-TT3201-CAN-cape.patch |   20 +++---
 ...am33xx-fix-serial-mux-warnings-for-am33xx.patch |   40 ----------
 ...dd-more-beagleboardtoys-cape-partnumbers.patch} |   12 ++--
 ...MAP2-am335x-correct-McASP0-pin-mux-detail.patch |   29 -------
 ...dd-gpio-keys-for-lcd7-add-notes-for-miss.patch} |   19 +++--
 ...3-beaglebone-add-enter-key-for-lcd7-cape.patch} |   14 ++--
 ...=> 0024-beaglebone-add-gpio-keys-for-lcd.patch} |   14 ++--
 ...25-beaglebone-fix-direction-of-gpio-keys.patch} |   30 ++++----
 ...0026-beaglebone-fix-3.5-lcd-cape-support.patch} |   20 +++---
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |   30 +++++---
 recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh  |    7 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   56 +++++++-------
 51 files changed, 364 insertions(+), 519 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=415f8b2c33cc3a7d2856fa0c6063f30fcbdad442


Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECF30E01424
	for <meta-ti@yoctoproject.org>; Tue, 29 May 2012 13:51:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2B68A52A77; Tue, 29 May 2012 20:51:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120529205125.2B68A52A77@arago-project.org>
Date: Tue, 29 May 2012 20:51:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp 3.2: cape enhancements and patch cleanups
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
X-List-Received-Date: Tue, 29 May 2012 20:51:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ca33f0eb2def9d0a8c51ef8ed8adedbcb507691d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ca33f0eb2def9d0a8c51ef8ed8adedbcb507691d

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May 22 08:06:25 2012 +0200

linux-ti335x-psp 3.2: cape enhancements and patch cleanups

* add support for revision A2 of the 7" Beagleboardtoys cape
* allow capes to disable w1-gpio
* add stub for the Beagleboardtoys camera cape
* Fill in more entries in the am335x mux table
* switch to 4x oversampling in the tsadc driver to reduce jitter (or cursor hula
  dancing as Gerald describes it)
* Add a function to set the pinmux from the eeprom data instead of the boardfile
* Add support for the Bebopr cape

All beaglebone patches have been rediffed and renumbered to avoid confusion

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...1-f_rndis-HACK-around-undefined-variables.patch |    8 +-
 ...2-da8xx-fb-add-DVI-support-for-beaglebone.patch |    8 +-
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |    8 +-
 .../beaglebone/0004-more-beaglebone-merges.patch   |   10 +-
 .../beaglebone/0005-beaglebone-disable-tsadc.patch |    8 +-
 ...general-purpose-mode-untested-with-touchs.patch |    6 +-
 ...dc-Add-board-file-mfd-support-fix-warning.patch |    6 +-
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |    8 +-
 ...cadc-make-stepconfig-channel-configurable.patch |    8 +-
 .../0010-tscadc-Trigger-through-sysfs.patch        |    6 +-
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |    8 +-
 ...c-switch-to-polling-instead-of-interrupts.patch |    8 +-
 .../beaglebone/0013-beaglebone-fix-ADC-init.patch  |    8 +-
 .../beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch  |    8 +-
 ...enable-PWM-for-lcd-backlight-backlight-is.patch |    8 +-
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |    8 +-
 ...set-default-brightness-to-50-for-pwm-back.patch |    8 +-
 ...P-framebuffer-driver-supporting-Adafruit-.patch |    8 +-
 ...019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch |    8 +-
 ...add-support-for-Towertech-TT3201-CAN-cape.patch |   10 +-
 ...add-more-beagleboardtoys-cape-partnumbers.patch |    8 +-
 ...add-gpio-keys-for-lcd7-add-notes-for-miss.patch |    8 +-
 ...23-beaglebone-add-enter-key-for-lcd7-cape.patch |    8 +-
 .../0024-beaglebone-add-gpio-keys-for-lcd.patch    |    8 +-
 ...025-beaglebone-fix-direction-of-gpio-keys.patch |    8 +-
 .../0026-beaglebone-fix-3.5-lcd-cape-support.patch |    8 +-
 ...decrease-PWM-frequency-to-old-value-LCD7-.patch |    8 +-
 .../0028-beaglebone-fix-ehrpwm-backlight.patch     |    8 +-
 ...0029-beaglebone-also-report-cape-revision.patch |    8 +-
 ...don-t-compare-undefined-characters-it-mak.patch |    8 +-
 .../0031-beaglebone-fix-3.5-cape-support.patch     |    8 +-
 ...-connect-batterycape-GPIO-to-gpio-charger.patch |    8 +-
 ...lebone-add-support-for-CAN-and-RS232-cape.patch |   10 +-
 ...glebone-add-support-for-DVI-rev.-A2-capes.patch |    4 +-
 ...e-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch |    4 +-
 ...036-Beaglebone-Fixed-compiletime-warnings.patch |    4 +-
 ...Added-missing-termination-record-to-bone_.patch |    4 +-
 ...xevm.c-Beaglebone-expose-all-pwms-through.patch |    4 +-
 ...x-Fixed-debugfs-mux-output-always-reporti.patch |    4 +-
 ...export-SPI2-as-spidev-when-no-capes-are-u.patch |    4 +-
 ...king-WIP-changes-to-make-DMA-safe-and-ad.patch} |    4 +-
 ...> 0042-omap-hwmod-silence-st_shift-error.patch} |    4 +-
 ...sw-phy_device-demote-PHY-message-to-INFO.patch} |    4 +-
 ...ne-add-support-for-7-LCD-cape-revision-A2.patch |   66 ++++
 ...beaglebone-allow-capes-to-disable-w1-gpio.patch |   52 +++
 ...add-stub-for-the-camera-cape-to-disable-w.patch |   30 ++
 ...y-of-the-missing-signals-to-the-mux-table.patch |  310 +++++++++++++++++
 ...sed-part-of-LCD-bus.-Added-even-more-miss.patch |  113 ++++++
 ...c-add-defines-for-4x-and-16x-oversampling.patch |   26 ++
 .../0050-ts_tscadc-switch-to-4x-oversampling.patch |   58 +++
 ...of-pinmux-data-array-in-EEPROM-data-struc.patch |   27 ++
 ...-Bone-Cape-configuration-from-EEPROM.-Onl.patch |  363 ++++++++++++++++++++
 ...nditional-debug-code-by-pr_debug-statemen.patch |  188 ++++++++++
 ...for-boards-with-mistaken-ASCII-interpreta.patch |   31 ++
 ...for-EEPROM-contents-blocking-further-I2C-.patch |   30 ++
 ...-on-EEPROM-revision-to-prevent-interpreti.patch |   60 ++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   25 +-
 57 files changed, 1526 insertions(+), 157 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=ca33f0eb2def9d0a8c51ef8ed8adedbcb507691d


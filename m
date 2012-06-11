Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C88A2E00746
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 14:03:15 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 79950529A7; Mon, 11 Jun 2012 21:03:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120611210314.79950529A7@arago-project.org>
Date: Mon, 11 Jun 2012 21:03:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: switch ADC to 16x averaging, disable 275MHz, add 4.3" LCD support
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
X-List-Received-Date: Mon, 11 Jun 2012 21:03:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3dde332e522f2c38e25e11d3bd484410a002c55e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3dde332e522f2c38e25e11d3bd484410a002c55e

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Jun  7 17:40:39 2012 +0200

linux-ti33x-psp 3.2: switch ADC to 16x averaging, disable 275MHz, add 4.3" LCD support

* The switch to 16x averaging is done to combat the excessive noise in the
  signal. It's still *very* bad, but the TS cursor jitter has decreased a bit
* The OPP for 275MHz was disabled due to all the errata. Both the EMIF and MUSB
  don't seem to like that OPP.
* The resistive touch version of the 4.3" LCD cape is supported in 24 bit mode.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../0065-ti_tscadc-switch-to-16x-averaging.patch   |   53 +++++++++++
 ...disable-OPP-for-275MHz-due-to-silicon-err.patch |   28 ++++++
 ...o-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch |   45 +++++++++
 ...add-support-for-the-4.3-lcd-cape-with-res.patch |   94 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    6 +-
 5 files changed, 225 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=3dde332e522f2c38e25e11d3bd484410a002c55e


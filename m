Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2424DE013D3
	for <meta-ti@yoctoproject.org>; Wed, 30 May 2012 11:15:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C0EA252A46; Wed, 30 May 2012 18:15:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120530181514.C0EA252A46@arago-project.org>
Date: Wed, 30 May 2012 18:15:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: i2c and cape fixes
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
X-List-Received-Date: Wed, 30 May 2012 18:15:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d9d51a11b8ff53c5ee7ef12e221479a24e071f13
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d9d51a11b8ff53c5ee7ef12e221479a24e071f13

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May 22 14:42:55 2012 +0200

linux-ti33x-psp 3.2: i2c and cape fixes

* Fix I2C prescaler to run at full speed instead of 1/4 speed
* fix led/spidev/w1 check
* move RS232 cape to ttyO2

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...lar-fix-i2c-fixed-prescalar-setting-issue.patch |   58 +++++++++++++++
 ...lebone-annotate-default-beaglebone-pinmux.patch |   32 ++++++++
 ...fix-pin-free-thinko-this-method-doesn-t-g.patch |   78 ++++++++++++++++++++
 ...060-beaglebone-switch-RS232-cape-to-ttyO2.patch |   29 +++++++
 ...-make-uart2-pinmux-match-the-uart0-pinmux.patch |   31 ++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    7 ++-
 6 files changed, 234 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=d9d51a11b8ff53c5ee7ef12e221479a24e071f13


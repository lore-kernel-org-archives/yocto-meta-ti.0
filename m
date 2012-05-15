Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA473E013A6
	for <meta-ti@yoctoproject.org>; Mon, 14 May 2012 21:41:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C139A5299E; Tue, 15 May 2012 04:41:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120515044125.C139A5299E@arago-project.org>
Date: Tue, 15 May 2012 04:41:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: updates
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
X-List-Received-Date: Tue, 15 May 2012 04:41:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f189b368a7012056624173e9a8d598e39f96dfd1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f189b368a7012056624173e9a8d598e39f96dfd1

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon May 14 16:34:35 2012 +0200

linux-ti33x-psp 3.2: updates

* Fix LEDs on 3.5", 7" and DVI capes
* Add support for rev A2 DVI capes
* Minor warning fixes to the boardfile
* All PWMs are initialized, but not pinmuxed
* Debugfs output for mux direction has been fixed
* When no capes claim the SPI bus /dev/spidev2.0 will appear

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...glebone-add-support-for-DVI-rev.-A2-capes.patch |  242 ++++++++++++++++++++
 ...e-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch |  240 +++++++++++++++++++
 ...036-Beaglebone-Fixed-compiletime-warnings.patch |   48 ++++
 ...Added-missing-termination-record-to-bone_.patch |   26 ++
 ...xevm.c-Beaglebone-expose-all-pwms-through.patch |   58 +++++
 ...x-Fixed-debugfs-mux-output-always-reporti.patch |   99 ++++++++
 ...export-SPI2-as-spidev-when-no-capes-are-u.patch |   83 +++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    9 +-
 8 files changed, 804 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=f189b368a7012056624173e9a8d598e39f96dfd1


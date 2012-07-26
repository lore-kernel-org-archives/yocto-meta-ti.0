Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F7FCE0141D
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 18:32:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 41D9352AA8; Thu, 26 Jul 2012 01:32:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120726013212.41D9352AA8@arago-project.org>
Date: Thu, 26 Jul 2012 01:32:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: add fixed for cssp, fbset and OPP50
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
X-List-Received-Date: Thu, 26 Jul 2012 01:32:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cb872e3786ec7c08375257c534a38a5eff0bfff9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cb872e3786ec7c08375257c534a38a5eff0bfff9

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Jul 13 12:19:44 2012 +0200

linux-ti33x-psp 3.2: add fixed for cssp, fbset and OPP50

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...disable-OPP-for-275MHz-due-to-silicon-err.patch |   28 -
 ...add-support-for-QuickLogic-Camera-interfa.patch | 1612 ++++++++++++++++++++
 ...-fb-calculate-pixel-clock-period-for-the-.patch |   73 +
 ...-improve-GPMC-bus-timings-for-camera-cape.patch |  105 ++
 ...disable-UYVY-VYUY-and-YVYU-modes-in-camer.patch |   39 +
 ...error-handling-for-DMA-completion-in-cssp.patch |   49 +
 ...rata-OPP50-on-MPU-domain-is-not-supported.patch |   52 +
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    8 +-
 8 files changed, 1936 insertions(+), 30 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=cb872e3786ec7c08375257c534a38a5eff0bfff9


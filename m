Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BAFFAE01409
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 18:55:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B429452A69; Fri, 11 May 2012 01:54:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511015459.B429452A69@arago-project.org>
Date: Fri, 11 May 2012 01:54:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-mainline 3.2: add ASoC fixes for beagleboard
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
X-List-Received-Date: Fri, 11 May 2012 01:55:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0b2c5e6de9be82d6f8362d61c52a76d504fea9d3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0b2c5e6de9be82d6f8362d61c52a76d504fea9d3

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri May  4 08:45:54 2012 +0200

linux-mainline 3.2: add ASoC fixes for beagleboard

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...add-MODULE_ALIAS-to-mcbsp-and-pcm-drivers.patch |   37 +
 ...onvert-per-board-modules-to-platform-driv.patch | 1119 ++++++++++++++++++++
 recipes-kernel/linux/linux-mainline_3.2.bb         |    4 +-
 3 files changed, 1159 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=0b2c5e6de9be82d6f8362d61c52a76d504fea9d3


Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FB1DE01374
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 13:00:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D453552A79; Tue, 10 Apr 2012 20:00:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120410200049.D453552A79@arago-project.org>
Date: Tue, 10 Apr 2012 20:00:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp 3.2: fix 3.5" cape support, turn on CONFIG_AUDIT
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
X-List-Received-Date: Tue, 10 Apr 2012 20:00:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d0b69390399f6fa9602d158718d8d19cf7af4a1a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d0b69390399f6fa9602d158718d8d19cf7af4a1a

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Apr  9 18:06:43 2012 +0200

linux-ti335x-psp 3.2: fix 3.5" cape support, turn on CONFIG_AUDIT

* bump MACHINE_KERNEL_PR for the CONFIG_AUDIT change

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc                     |    2 +-
 ...027-beaglebone-fix-direction-of-gpio-keys.patch |  107 +++++++++++++++++++
 .../0028-beaglebone-fix-3.5-lcd-cape-support.patch |  109 ++++++++++++++++++++
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    7 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +
 5 files changed, 223 insertions(+), 4 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=d0b69390399f6fa9602d158718d8d19cf7af4a1a


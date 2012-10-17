Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 901C5E0045D
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2012 13:14:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BFEBB52A0A; Wed, 17 Oct 2012 20:13:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121017201359.BFEBB52A0A@arago-project.org>
Date: Wed, 17 Oct 2012 20:13:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: LCD7 A3 support, eMMC cape support, camera cape improvements
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 20:14:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: eff601caffe58c3e8049140bdb02723b5cb62da4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=eff601caffe58c3e8049140bdb02723b5cb62da4

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Jul 30 20:41:14 2012 +0200

linux-ti33x-psp 3.2: LCD7 A3 support, eMMC cape support, camera cape improvements

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>

---

 .../0081-beaglebone-add-support-for-LCD7-A3.patch  |  144 +++++++++
 ...one-add-rudimentary-support-for-eMMC-cape.patch |  111 +++++++
 ...bone-add-extra-partnumber-for-camera-cape.patch |   26 ++
 ...084-beaglebone-cssp_camera-driver-cleanup.patch |  324 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    6 +-
 5 files changed, 610 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=eff601caffe58c3e8049140bdb02723b5cb62da4


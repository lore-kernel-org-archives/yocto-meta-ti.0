Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FF07E01448
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 22:53:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5EC7F52A73; Fri, 14 Sep 2012 05:53:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120914055356.5EC7F52A73@arago-project.org>
Date: Fri, 14 Sep 2012 05:53:56 +0000 (UTC)
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
X-List-Received-Date: Fri, 14 Sep 2012 05:53:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e4ea426bb5e7b9dc18cd9fc1e820744c05b63561
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e4ea426bb5e7b9dc18cd9fc1e820744c05b63561

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Jul 30 20:41:14 2012 +0200

linux-ti33x-psp 3.2: LCD7 A3 support, eMMC cape support, camera cape improvements

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../0081-beaglebone-add-support-for-LCD7-A3.patch  |  144 +++++++++
 ...one-add-rudimentary-support-for-eMMC-cape.patch |  111 +++++++
 ...bone-add-extra-partnumber-for-camera-cape.patch |   26 ++
 ...084-beaglebone-cssp_camera-driver-cleanup.patch |  324 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    6 +-
 5 files changed, 610 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=e4ea426bb5e7b9dc18cd9fc1e820744c05b63561


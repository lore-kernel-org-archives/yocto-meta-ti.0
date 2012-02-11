Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCDD4E0136A
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 18:33:31 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id EAFC752AA1; Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120211023330.EAFC752AA1@arago-project.org>
Date: Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: add support for Towertech TT3201 CAN cape
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
X-List-Received-Date: Sat, 11 Feb 2012 02:33:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2405c4176760e9659d1748362a83ce07d650e495
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2405c4176760e9659d1748362a83ce07d650e495

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Feb  9 20:21:23 2012 +0100

linux-ti33x-psp 3.2: add support for Towertech TT3201 CAN cape

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...add-support-for-Towertech-TT3201-CAN-cape.patch |  312 ++++++++++++++++++++
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |   14 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 3 files changed, 321 insertions(+), 8 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=2405c4176760e9659d1748362a83ce07d650e495


Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E310DE0030B
	for <meta-ti@yoctoproject.org>; Thu,  1 Mar 2012 13:28:38 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C08F852A8A; Thu,  1 Mar 2012 21:28:37 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120301212837.C08F852A8A@arago-project.org>
Date: Thu,  1 Mar 2012 21:28:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti33x-psp: add am335x-evm support
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
X-List-Received-Date: Thu, 01 Mar 2012 21:28:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8172b803e73126c2e336050d43251538bdc4d09b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8172b803e73126c2e336050d43251538bdc4d09b

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Tue Feb 28 17:28:14 2012 -0600

linux-ti33x-psp: add am335x-evm support

* Added a defconfig file for the am335x-evm and moved the common
  configs directory from the beaglebone directory to the top
  of the kernel files tree.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti33x-psp-3.2/am335x-evm/defconfig | 2640 ++++++++++++++++++++
 .../{beaglebone => }/configs/empty                 |    0
 2 files changed, 2640 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=8172b803e73126c2e336050d43251538bdc4d09b


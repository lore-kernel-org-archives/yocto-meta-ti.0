Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E880E006B3
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 19:55:09 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 410D052AB5; Sat, 17 Nov 2012 03:55:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121117035509.410D052AB5@arago-project.org>
Date: Sat, 17 Nov 2012 03:55:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-keystone: add kernel for keystone SOC
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
X-List-Received-Date: Sat, 17 Nov 2012 03:55:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 41691840eab371dc3fe7e18dca4c399e8a703bca
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=41691840eab371dc3fe7e18dca4c399e8a703bca

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Nov  1 20:44:13 2012 -0400

linux-keystone: add kernel for keystone SOC

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-keystone-3.5+3.6-rc6/defconfig     | 1012 ++++++++++++++++++++
 recipes-kernel/linux/linux-keystone_3.6.bb         |   17 +
 2 files changed, 1029 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=41691840eab371dc3fe7e18dca4c399e8a703bca


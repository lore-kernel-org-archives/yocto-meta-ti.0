Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D616CE00724
	for <meta-ti@yoctoproject.org>; Mon, 21 Jan 2013 19:32:14 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id A451452A04; Tue, 22 Jan 2013 03:32:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130122033213.A451452A04@arago-project.org>
Date: Tue, 22 Jan 2013 03:32:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-keystone: update to the latest dev release for keystone
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
X-List-Received-Date: Tue, 22 Jan 2013 03:32:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: f4cc35d3ac44a29d3001a295a99f39ecf19fc9ca
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f4cc35d3ac44a29d3001a295a99f39ecf19fc9ca

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Jan 21 21:38:27 2013 -0500

linux-keystone: update to the latest dev release for keystone

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc                  |    2 +-
 .../linux/linux-keystone-3.6.6/defconfig           |  967 +++++++++++++++++---
 recipes-kernel/linux/linux-keystone_3.6.6.bb       |    2 +-
 3 files changed, 832 insertions(+), 139 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=f4cc35d3ac44a29d3001a295a99f39ecf19fc9ca


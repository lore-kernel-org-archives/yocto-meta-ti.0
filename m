Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42002E00280
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 15:49:11 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1832E529D2; Wed,  5 Feb 2014 23:49:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140205234911.1832E529D2@arago-project.org>
Date: Wed,  5 Feb 2014 23:49:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Baptiste DURAND : linux-omap4 3.4: Fix random segfaults and boot issues seen with gcc 4.8
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
X-List-Received-Date: Wed, 05 Feb 2014 23:49:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 07809e70f4f277d894323b7d2ed39400e0cca8e3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=07809e70f4f277d894323b7d2ed39400e0cca8e3

Author: Baptiste DURAND <baptiste.durand@gmail.com>
Date:   Tue Feb  4 21:40:01 2014 +0100

linux-omap4 3.4: Fix random segfaults and boot issues seen with gcc 4.8

Based on work
https://github.com/koenkooi/meta-beagleboard/commit/87efc663c4f76d3051cecf1e2c3e2bbd461d200b

Signed-off-by: Baptiste DURAND <baptiste.durand@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...fix-memset-related-crashes-caused-by-rece.patch |  256 ++++++++++++++++++++
 .../0004-ARM-7670-1-fix-the-memset-fix.patch       |   83 +++++++
 recipes-kernel/linux/linux-omap4_3.4.bb            |    2 +
 3 files changed, 341 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=07809e70f4f277d894323b7d2ed39400e0cca8e3


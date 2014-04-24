Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5DA8E00B7C
	for <meta-ti@yoctoproject.org>; Thu, 24 Apr 2014 10:49:04 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 891AC52A92; Thu, 24 Apr 2014 17:49:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140424174904.891AC52A92@arago-project.org>
Date: Thu, 24 Apr 2014 17:49:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : licenses: add standard TI licenses
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
X-List-Received-Date: Thu, 24 Apr 2014 17:49:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 7860fdf1e05f02ffa1426b9b09755f4354d1edee
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7860fdf1e05f02ffa1426b9b09755f4354d1edee

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Apr 24 03:54:50 2014 +0000

licenses: add standard TI licenses

The new Texas Instruments Text File License (TI-TFL) is now replacing the
old Technology and Software Publicly Available (TSPA) license. But there are
older versions of the components previously released under TI-TSPA license.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 conf/layer.conf  |    2 +
 licenses/TI-TFL  |   62 ++++++++++++++++
 licenses/TI-TSPA |  206 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 270 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=7860fdf1e05f02ffa1426b9b09755f4354d1edee


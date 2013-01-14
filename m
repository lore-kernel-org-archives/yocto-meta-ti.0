Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDDCBE002AB
	for <meta-ti@yoctoproject.org>; Mon, 14 Jan 2013 15:42:08 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id ABC1D52A70; Mon, 14 Jan 2013 23:42:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130114234207.ABC1D52A70@arago-project.org>
Date: Mon, 14 Jan 2013 23:42:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIG1lc2EtZHJpOiB1cGRhdGUgdG8gOS4wLiAxIHRvIG1hdGNoIG9lLWNvcmU=?=
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
X-List-Received-Date: Mon, 14 Jan 2013 23:42:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f9952c5fa420f284b53460ce9c306a144c082764
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f9952c5fa420f284b53460ce9c306a144c082764

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Fri Jan 11 08:52:53 2013 +0100

mesa-dri: update to 9.0.1 to match oe-core

this makes Cliff Brake's unapplied patch obsolete

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...-dri_8.0.4.bbappend => mesa-dri_9.0.1.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend b/recipes-graphics/mesa/mesa-dri_9.0.1.bbappend
similarity index 100%
rename from recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
rename to recipes-graphics/mesa/mesa-dri_9.0.1.bbappend



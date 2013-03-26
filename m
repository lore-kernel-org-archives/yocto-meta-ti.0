Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE144E01423
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 93C2152AAF; Tue, 26 Mar 2013 00:42:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004224.93C2152AAF@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIG1lc2EtZHJpOiBmb2xsb3cgb2UtY29yZScgcyByZW5hbWluZyB0byBtZXNh?=
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 352bb2f0a8a6c0d92ac7498e8117f4fa6d1c12fd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=352bb2f0a8a6c0d92ac7498e8117f4fa6d1c12fd

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Mon Mar 25 09:09:30 2013 +0100

mesa-dri: follow oe-core's renaming to mesa

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...mesa-dri_9.0.2.bbappend => mesa_9.0.2.bbappend} |    0
 .../{mesa-dri_git.bbappend => mesa_git.bbappend}   |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/mesa/mesa-dri_9.0.2.bbappend b/recipes-graphics/mesa/mesa_9.0.2.bbappend
similarity index 100%
rename from recipes-graphics/mesa/mesa-dri_9.0.2.bbappend
rename to recipes-graphics/mesa/mesa_9.0.2.bbappend
diff --git a/recipes-graphics/mesa/mesa-dri_git.bbappend b/recipes-graphics/mesa/mesa_git.bbappend
similarity index 100%
rename from recipes-graphics/mesa/mesa-dri_git.bbappend
rename to recipes-graphics/mesa/mesa_git.bbappend



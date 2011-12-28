Return-Path: <pabigot@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D82DE0127E
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:14 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by yhpp56 with SMTP id p56so8589750yhp.35
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=i6Q/5GSoZELz35TdcnPNwK48lKmGVOqs/WR4twCzn4I=;
	b=Q9j6mPSv/Ud6nz/JGCXzDoa1OiDJY2E1/2r5d3CK3tcynEGePuW14DC19HhEsfi7yd
	nLZL2C3uyobtCQkbx3GhJpsP4EiDO27U7QOnSMRaQPd/EmX+7zRn95cY+/B7bhf8wST9
	LJKPTOxK1cV/7dobRn5UcxJ7Epq96p0TA8IgI=
Received: by 10.236.165.33 with SMTP id d21mr12112721yhl.37.1325033533550;
	Tue, 27 Dec 2011 16:52:13 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id k10sm18006608anb.22.2011.12.27.16.52.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Dec 2011 16:52:12 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Tue, 27 Dec 2011 18:51:56 -0600
Message-Id: <1325033520-6907-2-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1325033520-6907-1-git-send-email-bigotp@acm.org>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
Subject: [PATCH 1/5] ti-eula-unpack: remove extraneous newline in cmd output
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
X-List-Received-Date: Wed, 28 Dec 2011 00:52:14 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

print adds one already; to add another causes the input to be off and the
default installation directory to be used, at least on Fedora 15.

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 recipes-ti/includes/ti-eula-unpack.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-eula-unpack.inc
index 3b79c24..7c6e7b7 100644
--- a/recipes-ti/includes/ti-eula-unpack.inc
+++ b/recipes-ti/includes/ti-eula-unpack.inc
@@ -53,7 +53,7 @@ python ti_bin_do_unpack() {
             wdext = bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
             wdext = bb.data.expand(wdext, localdata)
             cmd = workdir+wdext
-        print >>f, "%s\n" % cmd
+        print >>f, cmd
     f.close()
 
     # Expand the tarball that was created if required
-- 
1.7.6.4



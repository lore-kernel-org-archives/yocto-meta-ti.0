Return-Path: <pabigot@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA9AFE0138D
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:41:15 -0800 (PST)
Received: by yenl9 with SMTP id l9so2623031yen.35
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=i6Q/5GSoZELz35TdcnPNwK48lKmGVOqs/WR4twCzn4I=;
	b=DWBWB4oso7+fPlE9QJW4oqXZYOsCSy7Sa+VfuIp7RWWBJrPNl7gImJIoyZfg9JTW0A
	Ny01dRIzoOHgVeBADcpPmvvRPXZ9PznoLX3Y6kI32MAcNS1RcO/XuTtWXtWyRkSd18xU
	clmRHOrpLf5yPIkpGXfmuGP4pw69z5eb6j12w=
Received: by 10.236.80.71 with SMTP id j47mr33519794yhe.28.1328013675304;
	Tue, 31 Jan 2012 04:41:15 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id t13sm55432563anh.2.2012.01.31.04.41.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 04:41:13 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Tue, 31 Jan 2012 06:40:54 -0600
Message-Id: <1328013657-2069-2-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328013657-2069-1-git-send-email-bigotp@acm.org>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
Subject: [PATCH 1/4] ti-eula-unpack: remove extraneous newline in cmd output
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
X-List-Received-Date: Tue, 31 Jan 2012 12:41:16 -0000

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



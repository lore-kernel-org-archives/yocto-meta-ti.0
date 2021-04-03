Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24548.1617408632844343478
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 17:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5603040C5E;
	Sat,  3 Apr 2021 00:10:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMp-nu3j3edG; Sat,  3 Apr 2021 00:10:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4335740C98;
	Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3C381174582;
	Fri,  2 Apr 2021 20:10:28 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 10/11] multiprocmgr-test: suppress ldflags and staticdev QA errors
Date: Fri,  2 Apr 2021 20:10:02 -0400
Message-Id: <1617408603-2482-11-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408603-2482-1-git-send-email-denis@denix.org>
References: <1617408603-2482-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Resolves:
QA Issue: File /usr/share/ti/examples/mpm/test/filetestdemo/host/bin/demo_filetest in package multiprocmgr-test doesn't have GNU_HASH (didn't pass LDFLAGS?)
QA Issue: non -staticdev package contains static .a library: multiprocmgr-test path '/usr/share/ti/examples/mpm/test/filetestdemo/bufmgr/lib/bufmgr.a' [staticdev]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
index 7c3f9e1..8bcb110 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
@@ -27,3 +27,5 @@ do_install() {
 	cp -r ${S}/src/sync ${D}${datadir}/ti/examples/mpm/src
 	cp -r ${S}/test ${D}${datadir}/ti/examples/mpm
 }
+
+INSANE_SKIP_${PN} = "ldflags staticdev"
-- 
2.7.4


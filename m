Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24547.1617408632154459069
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 17:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9F52D40C7F;
	Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZM67Lymy2U8; Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 870B340C82;
	Sat,  3 Apr 2021 00:10:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E821017457C;
	Fri,  2 Apr 2021 20:10:27 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Suman Anna <s-anna@ti.com>
Subject: [master][PATCH 04/11] ti-ipc: suppress gcc10 multiple definitions of _GateHWSpinlock_cfgParams
Date: Fri,  2 Apr 2021 20:09:56 -0400
Message-Id: <1617408603-2482-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408603-2482-1-git-send-email-denis@denix.org>
References: <1617408603-2482-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Workaround for this gcc10 error:
.../linux/src/api/gates/GateHWSpinlock.c:96: multiple definition of `_GateHWSpinlock_cfgParams';
.libs/Ipc.o:.../linux/src/api/Ipc.c:97: first defined here

Needs to be resolved properly in the code:
https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Cc: Suman Anna <s-anna@ti.com>
---
 recipes-ti/ipc/ti-ipc.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 3b0115e..34278d4 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -15,4 +15,6 @@ BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
 SRCREV = "${TI_IPC_SRCREV}"
 
+CFLAGS += "-fcommon"
+
 S = "${WORKDIR}/git"
-- 
2.7.4


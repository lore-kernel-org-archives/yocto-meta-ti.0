Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.139.1590533875274568774
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 May 2020 15:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9764D40BCC;
	Tue, 26 May 2020 22:57:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKF1jScc0XiS; Tue, 26 May 2020 22:57:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7FE83407DA;
	Tue, 26 May 2020 22:57:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0B26C16FAC7;
	Tue, 26 May 2020 18:57:52 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH v2 09/11] ti-pdk-fetch: update to REL.CORESDK.07.00.00.16 tag
Date: Tue, 26 May 2020 18:57:49 -0400
Message-Id: <1590533869-42492-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - bump to 07.00.00.16 for latest tools fixes

 classes/ti-pdk-fetch.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 7a27e37..3bee5fd 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,11 +1,12 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "a1ace885998e9adbcbbd0abf8b9ded6ba9ec54ff"
+TI_PDK_SRCREV ?= "3fcdaf16f0248eb03966b3c9d8f52aea5bb99a49"
 
-TI_PDK_VERSION ?= "2020.5.6"
+TI_PDK_VERSION ?= "07.00.00.16"
 
 PV = "${TI_PDK_VERSION}"
+PE = "1"
 
 TI_PDK_COMP ?= ""
 TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
-- 
2.7.4


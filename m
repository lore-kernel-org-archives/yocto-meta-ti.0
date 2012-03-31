Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2163CE004D2
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 17:16:28 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so946264wib.11
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 17:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=xaWE+I4Vf6hqzfkqfdJGFlkM/U3Wmo1JDdIkTzmQ71s=;
	b=YX3MsRGJDbXh7Ps/bGchqrMSVl7Fqdihw+BBshV9fga1fIjP0ppKdjp7TAA1sqp2bw
	oG8Ihfan4nFBlE7L51iXXXDAxKLVEG5xRndrKMTTRnF6LRxTHLbz/MyAlSWACy0tW1NY
	P79pONOh3XZDOmnhD3lXgUyGkz012aYDaWO8vuaREE8kPnRSetdYenibLKJuzkwrzLvQ
	LKGETNQD8fh8fPEEESjNY1mB5SmAxvkfX7StPA2S3uYECnl5ySCn6/OQvJhikCH8EVv2
	EfDU0H0M9uSJQBLkO3WVTSPP0unV1RGJZlsFugCYbk2m9Rlmo0hoegyRU77g7WDCCEYA
	wNoA==
Received: by 10.180.82.132 with SMTP id i4mr1894914wiy.12.1333152987835;
	Fri, 30 Mar 2012 17:16:27 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id w10sm17206976wiy.3.2012.03.30.17.16.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 17:16:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sat, 31 Mar 2012 02:16:19 +0200
Message-Id: <1333152979-6679-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQl0m2T/rjVcmaIuCdo6yCJByQFCZi4G1ab8XXyIgJcNYwW1+MyaWFFtBf600x31Xqj6awV4
Subject: README: add sample git send-email commandline
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
X-List-Received-Date: Sat, 31 Mar 2012 00:16:29 -0000

This enables me to copy/paste the right commandline instead of picking the wrong one from bash history.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 README |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/README b/README
index 352cb2e..97439d7 100644
--- a/README
+++ b/README
@@ -28,5 +28,7 @@ BINUVERSION = "2.20.1"
 
 Send pull requests, patches, comments or questions to meta-ti@yoctoproject.org
 
+When sending single patches, please use something like 'git send-email -1 --to meta-ti@yoctoproject.org --subject-prefix=meta-ti'
+
 Maintainers: Denys Dmytriyenko <denys@ti.com>
              Koen Kooi <koen@dominion.thruhere.net>
-- 
1.7.2.5



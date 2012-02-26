Return-Path: <ebutera@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B28FE013BA
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:39 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id e49so869394eek.35
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:39 -0800 (PST)
Received-SPF: pass (google.com: domain of ebutera@gmail.com designates
	10.213.26.20 as permitted sender) client-ip=10.213.26.20; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ebutera@gmail.com
	designates 10.213.26.20 as permitted sender)
	smtp.mail=ebutera@gmail.com;
	dkim=pass header.i=ebutera@gmail.com
Received: from mr.google.com ([10.213.26.20])
	by 10.213.26.20 with SMTP id b20mr3248657ebc.19.1330285179364 (num_hops
	= 1); Sun, 26 Feb 2012 11:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=VK3Al41GKJF6dUV8mUMuyX9WMF0k06miryfBXt93KRM=;
	b=fMY6RcLJBEzp4cvu6kGrDmVygLHcu5ogCKyNRtjg5MJTWEBAU+ALhF9vD3Q+F9SzmQ
	iRflI2MCw9l5XIZNseoLmArGyeRLZLqcARTEM/Mffp1sF6HGV0IjPdNJDBYu61fgi1Pf
	p5Wk7r4LllDo0Jvl5FWY9+0vbUimFOGV/enVo=
Received: by 10.213.26.20 with SMTP id b20mr2442820ebc.19.1330285179299;
	Sun, 26 Feb 2012 11:39:39 -0800 (PST)
Received: from localhost.localdomain ([188.11.55.70])
	by mx.google.com with ESMTPS id v51sm48713599eef.2.2012.02.26.11.39.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 11:39:38 -0800 (PST)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Sun, 26 Feb 2012 20:39:13 +0100
Message-Id: <1330285154-14853-9-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
References: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
Subject: [RFC PATCH 8/9] xdais: add version 7.20.00.07
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
X-List-Received-Date: Sun, 26 Feb 2012 19:39:40 -0000

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-ti/xdais/ti-xdais_7.20.00.07.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/xdais/ti-xdais_7.20.00.07.bb

diff --git a/recipes-ti/xdais/ti-xdais_7.20.00.07.bb b/recipes-ti/xdais/ti-xdais_7.20.00.07.bb
new file mode 100644
index 0000000..e24fbee
--- /dev/null
+++ b/recipes-ti/xdais/ti-xdais_7.20.00.07.bb
@@ -0,0 +1,12 @@
+require ti-xdais.inc
+
+#COMPATIBLE_MACHINE = "(omap4430-panda|pandaboard)"
+
+PV = "7_20_00_07"
+
+LIC_FILES_CHKSUM = "file://xdais_${PV}_manifest.html;md5=5e3840059835ba12f277892eacdb69f0"
+
+SRC_URI[xdaistarball.md5sum] = "3f3080e7b63dfb5d8d21654a6690cba3"
+SRC_URI[xdaistarball.sha256sum] = "bd64cf052d186b228c9ea26fec60d59527877a3e216fc82d76639bc3043ca275"
+
+
-- 
1.7.5.4



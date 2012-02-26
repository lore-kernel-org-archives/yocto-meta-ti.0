Return-Path: <ebutera@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 585BBE0139E
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:27 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id e49so869394eek.35
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:27 -0800 (PST)
Received-SPF: pass (google.com: domain of ebutera@gmail.com designates
	10.14.45.75 as permitted sender) client-ip=10.14.45.75; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ebutera@gmail.com
	designates 10.14.45.75 as permitted sender)
	smtp.mail=ebutera@gmail.com;
	dkim=pass header.i=ebutera@gmail.com
Received: from mr.google.com ([10.14.45.75])
	by 10.14.45.75 with SMTP id o51mr6336695eeb.20.1330285167094 (num_hops
	= 1); Sun, 26 Feb 2012 11:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=21Fh41IOr3CHy/pbzxELmRkIS/Z5KiteoKA2Kq92LLQ=;
	b=brs3eW65jtx9Owzp23ywjyr2mBHCraQcm+3lZz5qX8+kbVVEvOuLJymXjqjeizr3Ha
	shfVttWvg2lohdm4y2XuUSUH1Qhltvbx27tDKql4+rvASkYmm6O5Qz8wqduFMoistmhI
	RgLxLrTzgJTyCKgJz8UbYHq3hdabO75E2DZmw=
Received: by 10.14.45.75 with SMTP id o51mr4777859eeb.20.1330285165809;
	Sun, 26 Feb 2012 11:39:25 -0800 (PST)
Received: from localhost.localdomain ([188.11.55.70])
	by mx.google.com with ESMTPS id v51sm48713599eef.2.2012.02.26.11.39.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 11:39:24 -0800 (PST)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Sun, 26 Feb 2012 20:39:06 +0100
Message-Id: <1330285154-14853-2-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
References: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
Subject: [RFC PATCH 1/9] devtools cgt470: add version 4.9.1
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
X-List-Received-Date: Sun, 26 Feb 2012 19:39:27 -0000

This version is still not public on ti.com site BUT it can be downloaded
freely with CCS.

Read the recipe to know how to download the needed file (without having
to install CCS).

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-ti/devtools/ti-cgt470_4.9.1.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/devtools/ti-cgt470_4.9.1.bb

diff --git a/recipes-ti/devtools/ti-cgt470_4.9.1.bb b/recipes-ti/devtools/ti-cgt470_4.9.1.bb
new file mode 100644
index 0000000..ed1a7db
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt470_4.9.1.bb
@@ -0,0 +1,13 @@
+require ti-cgt470.inc
+
+# Version 4.9.1 is not publically available from ti.com site but as an update
+# to CCSv5, download the file from:
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_ccstudio/CCSv5/CCS5.1.0.09000_linux/featurerepo/binary/com.ti.cgt.tms470.4.9.linux_root.gtk.linux.x86_4.9.1
+# then unzip that file and you will get the bin file to put in download dir
+
+PV = "4_9_1"
+PVwithdots = "4.9.1"
+
+SRC_URI[cgt470bin.md5sum] = "94ee0096b5dddc65c9849fa260ccf6b9"
+SRC_URI[cgt470bin.sha256sum] = "39ed73aaceade7a0208edeac10f0e9cab280898f1f421c3917863dc89178f88c"
+
-- 
1.7.5.4



Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED594E013C2
	for <meta-ti@yoctoproject.org>; Thu, 29 Mar 2012 10:18:27 -0700 (PDT)
Received: by yhfq46 with SMTP id q46so2112521yhf.35
	for <meta-ti@yoctoproject.org>; Thu, 29 Mar 2012 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=D2ztg57kbBdVx6eUAvGkfqJzZuJMIrGyKb1Wl4M/oKQ=;
	b=uwL1HrdDHewj6T6eA1oRP2LaSGZcx4C3FHRY8vklggqLe71Zm6xDqjo2X6wRXZy9jo
	dc69NdwhDJPmc0PFl9gwEFVUlcJdoKIOv3QU1gDnb5asQS0fgZDy8BXzsnhcyZ/Fk9r9
	7pB7HIRqAz+5vK/zO53zCJ7VWmDp07/iv58AlnAq1B+JxlDANq60wzaPn4TxZVGW6M+K
	VAV85vkMbNwW+bpA4sYVFXALA4HEj6MOX5ql569PoRaao6IezxWLZXrW7xOCJRAppIQX
	rLY4Ji2Ua7dVIFPbrXcqoSl3rsTZHTEPTd0djofXLNDV1hQhJi20eOVvTl1H75/o/vUN
	Ddwg==
Received: by 10.60.24.164 with SMTP id v4mr40697771oef.51.1333041507095;
	Thu, 29 Mar 2012 10:18:27 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id r8sm2854153oer.6.2012.03.29.10.18.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 10:18:22 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 29 Mar 2012 10:18:15 -0700
Message-Id: <1333041498-18971-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332958485-967-1-git-send-email-trini@ti.com>
References: <1332958485-967-1-git-send-email-trini@ti.com>
Subject: [PATCH v4 1/4] am37x-evm.conf: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Thu, 29 Mar 2012 17:18:28 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '+=' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/am37x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index e4170f4..ddb54e8 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -16,7 +16,7 @@ require conf/machine/include/omap3.inc
 
 # Ship all kernel modules
 
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES += "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-- 
1.7.0.4



Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DE67E00817
	for <meta-ti@yoctoproject.org>; Wed,  8 Jan 2014 06:53:39 -0800 (PST)
Received: by mail-ea0-f178.google.com with SMTP id d10so893601eaj.9
	for <meta-ti@yoctoproject.org>; Wed, 08 Jan 2014 06:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=A7+9jmijUnXeY7Y0qRiDOM/CXolSLIzWy8FzlhI1FXw=;
	b=HQGanIBTxrq/sXx4ckqrXIbQgJKEYZCJXLGC/yyH74++4mpd7W1woMbzqjM7MsRcW3
	S10fU9YHv01YfNX0+91KdJVjUZp2v1eFMClAn2cD0Yi9bUaKiZqOaFwI/Xdt9nsJMd3s
	JSxzRlPPniG/0E0firKVl4FD9TecFujdTpagu6zlcj8rK+HnID5lhAUkfbzPJGP//SdX
	UOZ4aAMbVBDVXe3n3ze6zyDMFHqBXaKBVPLeHbxPXPxFtfblM0F66f2kQkTxS0FtenD+
	Ifo+xK5Ffb8fsv8AxtkvsNZiJWXlrsKUm2J3JarAWza0b9EiDtxjFZnz9a+eMhNva4w3
	xvLQ==
X-Received: by 10.15.41.140 with SMTP id s12mr46370205eev.50.1389192816488;
	Wed, 08 Jan 2014 06:53:36 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id 4sm190160501eed.14.2014.01.08.06.53.35
	for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 06:53:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Wed,  8 Jan 2014 15:53:27 +0100
Message-Id: <1389192808-16423-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 1/2] gadget-init: update oe-core's LICENSE checksum
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
X-List-Received-Date: Wed, 08 Jan 2014 14:53:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-ti/beagleboard/gadget-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard/gadget-init.bb
index 1a6a336..8b899c5 100644
--- a/recipes-ti/beagleboard/gadget-init.bb
+++ b/recipes-ti/beagleboard/gadget-init.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Units to initialize usb gadgets"
 PR = "r19"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.8.3.1



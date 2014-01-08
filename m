Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 842B6E00817
	for <meta-ti@yoctoproject.org>; Wed,  8 Jan 2014 06:53:40 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id h14so865709eaj.35
	for <meta-ti@yoctoproject.org>; Wed, 08 Jan 2014 06:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=zR+degHlmvyWvgXFsSVs59YzrOfIBO+x2sehyex7Sdw=;
	b=LDEVPgdW3w6Uzp3bjjTnzEUkmdFPRSG/zQyBxNxAVdzAyJ3/Un8VuKUxGt7EcRUJca
	WoiFgPKbzXqpMXvJZ9YH44UEEZ/lEa5BG/rn25BnL5AN3iuz7FkpadwIK1f57TocdnNN
	Bkp/oo6mz2dqvO6JGfp0LM7oWDb0c0iR4WmCPcZlLmrkrtAnHHdHYnbfSs3bT9+cKRcE
	MQpPBs3FZZ9uxUB48uXgpL7RypVyFfPR6hKzXLybduktYbyZo/IxumdTD+1JUEo9sm5C
	fnN7p4Fidl98F5WFNqBIVf8rVneZPneVzwNKyZtCd1WDhI4NKaDGJWtKSTyiVqK5A+B5
	ALqw==
X-Received: by 10.14.5.194 with SMTP id 42mr13924964eel.100.1389192817685;
	Wed, 08 Jan 2014 06:53:37 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id 4sm190160501eed.14.2014.01.08.06.53.36
	for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 06:53:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Wed,  8 Jan 2014 15:53:28 +0100
Message-Id: <1389192808-16423-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1389192808-16423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1389192808-16423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] beaglebone-capes: update oe-core's LICENSE checksum
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
X-List-Received-Date: Wed, 08 Jan 2014 14:53:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-ti/beagleboard/beaglebone-capes.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
index ae9132e..e74033a 100644
--- a/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Userspace setup for beaglebone capes"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 PR = "r4"
 
-- 
1.8.3.1



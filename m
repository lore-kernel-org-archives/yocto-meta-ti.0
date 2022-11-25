Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30580C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 23:00:31 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.59228.1669417222475172144
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Nov 2022 15:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=h2CHeOWv;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2APN0L0K047989;
	Fri, 25 Nov 2022 17:00:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669417221;
	bh=wUnm9/HfQkrbt1dDgnhU6OmYwnqWzKcnQesJUdpTInc=;
	h=From:To:Subject:Date;
	b=h2CHeOWv3oZ9utMkItMPZgtIC3lmUVxRMkvr4AlVU6NjlRNdlYPQMG5TBhH3zEaRw
	 4WUcZbrVsde7oGnZx20J1o9yQMnVj766ytveF89oLSLRJE6exiYcBnjXI8abBWkxk9
	 2Mc/VyPy3F503TR3PSZKEU0UwUlSlQhATSQY7xFY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2APN0Lu7001644
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Nov 2022 17:00:21 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 25
 Nov 2022 17:00:21 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 25 Nov 2022 17:00:20 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2APN0KAY092771;
	Fri, 25 Nov 2022 17:00:20 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oyhgC-0001OR-O5; Fri, 25 Nov 2022 17:00:20 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-unpack: Remove update_data call
Date: Fri, 25 Nov 2022 17:00:20 -0600
Message-ID: <20221125230020.5316-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Nov 2022 23:00:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15362

update_data() was removed from upstream bitbake, so we should remove
the call from our code as well.

https://github.com/openembedded/bitbake/commit/584989ed2b5af4e8799571dece0cf94f995ef14e

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-ti/includes/ti-unpack.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
index 46bfb957..13068843 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
@@ -24,7 +24,6 @@ python ti_bin_do_unpack() {
         bb.fatal("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
 
     localdata = bb.data.createCopy(d)
-    bb.data.update_data(localdata)
 
     binfile  = localdata.getVar('BINFILE')
     binfile  = bb.data.expand(binfile, localdata)
-- 
2.17.1



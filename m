Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA3AD68B27
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 14:08:29 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.37607.1731593304781015542
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Nov 2024 06:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=BaDenQVv;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=sTwCfSF0;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731593305; x=1763129305;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DuAwc8g4EXLMDDjxToCHLJRiNLeUGV7Y29irITptSsc=;
  b=BaDenQVvuZifLHwf5P0Cj8cIA+tKHpu8xtJcFtQWQEKcLBkpS8pN/EYm
   1+BUFlcNjofKwPgvW9EDF02O54eXivoXqnv0Kk/oEYjrznFcFDcgM01Ke
   b8rtdyBtFJ2FbMkFwswNFZRxib986dt0+mD9ge0pL7qD/0EaNTW/YcsSr
   1B7Rh2PX24ZfyAw/ptpnI5+7VnKs4SJb1J9fZLCDn2pX/xNshaMYr96rP
   gBztM4b6T8J7FP3cW1GdzeXipEAfp9pf3Woq9BgArnfyBTBb+hGrNgPYC
   UnXutChSw+fxOSJYxMlPbP/qEnmXMMGS3XDqRJ9BaUJLFBMMjdB6e/4Nr
   g==;
X-CSE-ConnectionGUID: dDW9EFNZQu2AX0yGBRJ70g==
X-CSE-MsgGUID: nUovVM5YQLK32v/DReJMgQ==
X-IronPort-AV: E=Sophos;i="6.12,154,1728943200"; 
   d="scan'208";a="40042630"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 Nov 2024 15:08:22 +0100
X-CheckPoint: {67360456-19-86C05612-CA75E1CA}
X-MAIL-CPID: B4198670927E8DBF3C6DD7F9F1E2B88A_1
X-Control-Analysis: str=0001.0A682F21.67360456.00E9,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29CAB169557;
	Thu, 14 Nov 2024 15:08:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731593298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DuAwc8g4EXLMDDjxToCHLJRiNLeUGV7Y29irITptSsc=;
	b=sTwCfSF0Sen8aqMZMpIAotMDxJnoPrjrSgQ26PpoXlhoZ56oUl9HJwtTGZ6AA9UdVrLa4u
	Yp1mOAM4ErMHJcSULFqq6sJK3njfa/8mzXeb5698dzieah3Wrf4LaOkKFV7yyq6xgede5g
	BZq9QdT08yWv56ZCUVfnsfCJWSvpLxgQmHG3Uw+/U6bXHzs4eNaKoHlPMBApKTajeRQ5al
	NMO3Mpgrz7aooTNnkrCy497dVcbat7wk2MuHkBvDYVhN7kADD4BCpzaZhAZZtW/7ouH9J6
	y+k6CxwU5QVfCHvKtbMaAHszBlEebL/YiJTliX1nfrOnqa14BFkEmx/puAzihA==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: oss@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [master][PATCH] conf: machine: k3: use ARMv8-A as base arch
Date: Thu, 14 Nov 2024 15:08:01 +0100
Message-ID: <20241114140801.1964528-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Nov 2024 14:08:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18066

All K3 SoCs are Cortex-A53/A72, so arch-armv8a.inc is a more appropriate
common base than the very generic arch-arm64.inc. arch-armv8a.inc defaults
to enable the CRC extension (DEFAULTTUNE = "armv8a-crc") and allows for
easy addition of the ARMv8 crypto extensions by setting the tune to
"armv8a-crc-crypto".

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index a296f64f..140564f7 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -3,7 +3,7 @@
 require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append = ":k3"
 
-require conf/machine/include/arm/arch-arm64.inc
+require conf/machine/include/arm/arch-armv8a.inc
 
 require conf/machine/include/ti-bsp.inc
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/



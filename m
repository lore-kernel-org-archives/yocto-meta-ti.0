Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E549C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 22:02:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.44556.1656712951812257715
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Jul 2022 15:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VetzWTzY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 261M2TC2006439;
	Fri, 1 Jul 2022 17:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656712949;
	bh=Io9QhaAEme1ouLnxPSb0jv+6xnTZQq7I2lP1hkwqbBo=;
	h=From:To:CC:Subject:Date;
	b=VetzWTzYYHeGYeWVDpHgTkUICHlAUMuD2BHrKpwGrlwXHMldDj90ftdKmnm+sqkco
	 Hwhg8a8cGy9CgQZ0nY7Ms5ryiZ6NfIlzja8VRdNylMAca9iiVJJZt4Z8ImxsyaqG6h
	 OjMqLwDdUvqdwX+auMc/MV2aLc0+mZz71ys6sdMI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 261M2TYc017542
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Jul 2022 17:02:29 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Jul 2022 17:02:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Jul 2022 17:02:29 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 261M2SS3029974;
	Fri, 1 Jul 2022 17:02:28 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][RFC 0/6] HS SDK on GP EVM support
Date: Fri, 1 Jul 2022 17:02:22 -0500
Message-ID: <20220701220228.5449-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Jul 2022 22:02:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14859

Hello all,

Still some changes pending in the k3-image-gen and u-boot projects
but wanted to get some comments on this early. Plan is to remove
the GP SDK. Have the HS SDK work on GP SoCs with minimal effort
and have HS become the default single SDK type (starting only
with AM64x and working out from there so don't panic (yet)).

Thanks,
Andrew

Andrew Davis (6):
  conf: machine: Make multi-certificate image the default
  ti-sci-fw: Use new SOC_TYPE and SYSFW_DIR to simplify recipe
  ti-sci-fw: Deploy all SYSFW firmware types
  ti-sci-fw: Use SYSFW_TIBOOT3 to point to the SYSFW image
  machine: am64xx-k3r5: The output of u-boot is not used
  ti-sci-fw: Deploy GP version of tiboot3.bin with HS SDK

 conf/machine/am64xx-evm-k3r5.conf      |   7 +
 conf/machine/am64xx-hs-evm-k3r5.conf   |   7 +
 conf/machine/am64xx-hs-evm.conf        |   2 +
 conf/machine/include/am62xx.inc        |   3 -
 conf/machine/include/am64xx.inc        |   3 -
 conf/machine/include/am65xx.inc        |   5 +-
 conf/machine/include/j7.inc            |   2 -
 conf/machine/include/k3.inc            |   5 +-
 conf/machine/j7-evm.conf               |   3 +
 conf/machine/j7-hs-evm.conf            |   1 -
 conf/machine/j7200-evm.conf            |   3 -
 conf/machine/j721s2-evm.conf           |   3 -
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 334 +++++++++----------------
 recipes-bsp/u-boot/u-boot-ti.inc       |  10 -
 14 files changed, 149 insertions(+), 239 deletions(-)
 rewrite recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb (72%)

-- 
2.36.1



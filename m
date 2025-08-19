Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1E2CA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 10:25:12 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10528.1755599110293662441
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 03:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EEWNO14O;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JAP9vk2932829;
	Tue, 19 Aug 2025 05:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755599109; i=@ti.com;
	bh=yRA/ezygmczcZn+JxLZ+l2XMN1mFlK4uGzpWZf6HEls=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EEWNO14OE2kvcVenvm3NBc606O88z6SvXh0rarAi/4TvQAOnTqQ0E46mC/nbu2Du6
	 WP0VUxfXFjtNHPXier/aC0OlFLOEY/4TJJdrr92u2CAp+y5xSzMavuCFSVg20WMBbG
	 qgt84zJyorC8AAmJy7pXKy1w/NZIE8b2UwRBML1k=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JAP9FJ975943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 05:25:09 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 05:25:08 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 05:25:08 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JAP8uE449631;
	Tue, 19 Aug 2025 05:25:08 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id CF060142D3E; Tue, 19 Aug 2025 05:25:08 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <a-limaye@ti.com>, <afd@ti.com>,
        <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [master/scarthgap][PATCH v3 0/3] Add recipe to package MessageQ Application and Firmware
Date: Tue, 19 Aug 2025 05:25:08 -0500
Message-ID: <20250819102508.3789549-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250819102350.2915102-1-b-padhi@ti.com>
References: <20250819102350.2915102-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Aug 2025 10:25:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18940

meta-ti / na / 20250819102350.2915102-1-b-padhi

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================


=========================================================
  check-yocto-repo: PASS
=========================================================




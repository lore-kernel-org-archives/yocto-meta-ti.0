Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C737C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 15:49:46 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.91261.1754063322577736594
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 08:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=B+4K4IuX;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: automated_prc_response@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571FmfxC3277274;
	Fri, 1 Aug 2025 10:48:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754063321;
	bh=pEeDTLKF+nvGBYlnXX6QINnc1+dM0aakgYjppDB+Jz8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=B+4K4IuXu+hIXkbt0rhLrH+8JTRKzyCcueb0mneSsc5khAEsG8RgJaLOTtimZWKZl
	 wcNGyDo4fdpEUqPJb33q8HC0UW6GNIhP9Q6+tXydbBefdup+sISVVWTCWp34fzYS6G
	 udcOiz/qh9hZhy6YZuL87/MwD2DfuBjMXzexKgfw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571FmfKH647296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 10:48:41 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 10:48:40 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 10:48:40 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571Fmf0E389040;
	Fri, 1 Aug 2025 10:48:41 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id E8117142E2B; Fri,  1 Aug 2025 10:48:40 -0500 (CDT)
From: PRC Automation <automated_prc_response@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] linux-ti-*: Move KERNEL_BASE_CLASS default
Date: Fri, 1 Aug 2025 10:48:40 -0500
Message-ID: <20250801154840.877207-1-automated_prc_response@ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250801133958.22623-1-reatmon@ti.com>
References: <20250801133958.22623-1-reatmon@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 15:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18885

meta-ti / na / 20250801133958.22623-1-reatmon

PRC Results: PASS


master
=====================
PASS





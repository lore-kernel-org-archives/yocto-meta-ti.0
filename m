Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF398C87FCF
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 19:26:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.32254.1754853994238752062
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 10 Aug 2025 12:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=E+Vdnk9Z;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57AJQWDO1384257;
	Sun, 10 Aug 2025 14:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754853992; i=@ti.com;
	bh=qMPAhikz+WwM7QA6gyg8y4v5xXDwuwsX2dkmxgFlTRo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=E+Vdnk9ZHAjNju7gZNN/m/AQYHx2vk5c84FFCn3JoZDeay0mD/mWK+VEincxcC4kP
	 lsrZRQDonurYVi8LubNbza1NmApU8L+/mmQzBRKGFRonZuKIQrjc1zpDdblWxvWWCn
	 VaGhSdR/Jp/ierMDsx9ZuuDGtvrSyLajGOo5rDCc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57AJQWbE3172115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 10 Aug 2025 14:26:32 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 10
 Aug 2025 14:26:02 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 10 Aug 2025 14:26:02 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57AJQ2Mx588490;
	Sun, 10 Aug 2025 14:26:02 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2A3A113F534; Sun, 10 Aug 2025 14:26:02 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [master][PATCH 1/4] linux-bb.org_6.6: update to the latest
Date: Sun, 10 Aug 2025 14:26:02 -0500
Message-ID: <20250810192602.2583748-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250809234616.3626274-1-denis@denix.org>
References: <20250809234616.3626274-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 10 Aug 2025 19:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18923

meta-ti / na / 20250809234616.3626274-1-denis

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




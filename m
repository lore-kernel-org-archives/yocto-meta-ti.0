Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3494FC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 14:40:28 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.15490.1751035218651450272
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 07:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Z3w7eJob;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: anshuld@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55REeI4t2759834
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 09:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751035218;
	bh=yfoVkRDBpACeiucogaxHzVOSWOoULhp5xrb46szm1CA=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=Z3w7eJob7q//HCKm4yvt+bMzEKuWtmwHd/u+CPPZqLmqjOrF530P2o2a0MEEuTeyF
	 KGi3iT05NOc3CILBk4ZHcMg2eeXpvCu+qwgqU/JE5vwTxZLg2DEnLg4iMdpKmMVgLl
	 9U2ElOQMmSoVWcBjWfGvDmlsvNXlZwa2pDznWnKw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55REeHNo3322037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 09:40:18 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 09:40:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 09:40:17 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55REeG5Z2963530;
	Fri, 27 Jun 2025 09:40:17 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 27 Jun 2025 20:09:35 +0530
Message-ID: <DAXE5YO8ORYB.3HV2T9D8I1RU7@ti.com>
Subject: Re: [PATCH v1 2/2] conf: machine: move UBOOR_*ADDRESS to top level
 ti-soc
From: Anshul Dalal <anshuld@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250627060416.639661-1-anshuld@ti.com>
 <20250627060416.639661-2-anshuld@ti.com>
 <5b7c7d3c-22d6-4810-9951-84844b6d0e87@ti.com>
In-Reply-To: <5b7c7d3c-22d6-4810-9951-84844b6d0e87@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 14:40:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18704

On Fri Jun 27, 2025 at 8:02 PM IST, Ryan Eatmon wrote:
>
> UBOOR ?  Typo in the subject.
>

My bad, didn't catch that earlier. Sorry for the inconvenience but could
you reword it locally please :)

- Anshul


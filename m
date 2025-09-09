Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72ADCCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 20:52:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1484.1757451168228965231
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 13:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kJF256yT;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589KqjZj368494;
	Tue, 9 Sep 2025 15:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757451166;
	bh=HlNj7jVhhyNziO3D/KcCrhrvrBFB1+aUSTl+cLaxzik=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=kJF256yTM44CfBvfY7J95mCsGLHVPH2nBKSE5SXEvDtVkSpe9NwaEM4mf6g5fVPwi
	 SFDKelQQ8XHBGW9ndIFwdM/soQcZMFwCM2/OxxZbmoSXirrdsndG7KVzNvEbzsr0ez
	 CeFME6iT2CEK5TyHkt7nHKv85Vc+BJlR89zYDK0s=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589KqjLD3415010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 15:52:45 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 15:52:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Sep 2025 15:52:45 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589Kqjr03600275;
	Tue, 9 Sep 2025 15:52:45 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 9 Sep 2025 15:52:45 -0500
Message-ID: <DCOKFZNU5ZM9.1PL3UQTDARDKL@ti.com>
Subject: Re: [meta-ti][scarthgap][RFC 6/6] mesa-pvr: Use mesa-pvr for all TI
 SoCs
From: Randolph Sapp <rs@ti.com>
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan
 Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250909151028.272925-1-afd@ti.com>
 <20250909151028.272925-6-afd@ti.com>
In-Reply-To: <20250909151028.272925-6-afd@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Sep 2025 20:52:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18991

On Tue Sep 9, 2025 at 10:10 AM CDT, Andrew Davis wrote:
> TI SoCs without GPUs can still use mesa-pvr as it will simply fallback to
> SW rendering just like the normal mesa package. The benefit is using the
> same version across all supported devices is more consistent and only
> one version of Mesa is needed for all TI SoCs.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

[snip]

Originally this was done to mitigate damage in the event where there is an
issue with mesa. I'm not entirely sure we want to move everything over to
pvr-mesa as they still hijack some of the common dri code for their own goo=
fy
stuff.

My opinion is we should use vanilla software where we can. Especially
considering we'll need to be able to access vanilla mesa for AM62 later if =
I get
my way.

- Randolph


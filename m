Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29B0C38142
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 17:13:20 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.48091.1674493996982258627
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 09:13:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=De5BSjRE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30NHDBqd128454;
	Mon, 23 Jan 2023 11:13:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674493991;
	bh=saovVYODFZX/OrF41mPSiYZ6DLCt+BuYnPiXhB/OBZY=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=De5BSjREe6Sy76wzFo4Oea0xWxV2KP3/4EPq+nXkblR6tzTbauKjpjbk/XG+97XQE
	 SYh9WjFgZNOxYeSZAEKjNqyCgAjGLscO9/fIkeqcHUrSjf9zOX0+lTSGOazo3sCndc
	 toPS99tquzLt4wP1RLfzXjVfJrIkwXGcurKAKP9E=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30NHDB6a014949
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Jan 2023 11:13:11 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 11:13:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 11:13:11 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30NHDACZ098412;
	Mon, 23 Jan 2023 11:13:10 -0600
Date: Mon, 23 Jan 2023 11:13:05 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [master/kirkstone][PATCH] all: Graphics
 recipe overhaul
To: <rs@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, <denys@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <k-bhargav@ti.com>
Message-ID: <TT7YOR.VRO6BMBX0OR22@ti.com>
In-Reply-To: <173C27F35DB2D18B.15760@lists.yoctoproject.org>
References: <20230119204026.1297616-1-rs@ti.com>
	<20230120182636.GP22689@denix.org> <SBSSOR.I33PHI6LU4AA@ti.com>
	<20230120221120.GR22689@denix.org>
	<173C27F35DB2D18B.15760@lists.yoctoproject.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 17:13:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15624

On Fri, Jan 20 2023 at 05:24:37 PM -0600, Randolph Sapp via 
lists.yoctoproject.org <rs=ti.com@lists.yoctoproject.org> wrote:
> Well what do you recommend? Version pinning (through the copy in 
> meta-ti) in addition to a bbappend, or just a version globed bbappend?

Sorry, suppose it's not what you would recommend, but rather what would 
you hate the least...




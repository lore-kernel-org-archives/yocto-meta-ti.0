Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A944C021B3
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 00:43:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.38127.1740185011875154847
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 16:43:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 04DD140D60;
	Sat, 22 Feb 2025 00:43:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pludCpB9faiC; Sat, 22 Feb 2025 00:43:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CE99340CFC;
	Sat, 22 Feb 2025 00:43:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3733D16428D; Fri, 21 Feb 2025 19:43:28 -0500 (EST)
Date: Fri, 21 Feb 2025 19:43:28 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: jweyer@aecontrols.com, Paresh Bhagat <p-bhagat@ti.com>
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] Jailhouse invalid SRC_REV
Message-ID: <20250222004328.GC1879@denix.org>
References: <04a9fd4d741d4ca99d52a75677ab8114@AEC-Exchange.AEC.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04a9fd4d741d4ca99d52a75677ab8114@AEC-Exchange.AEC.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 22 Feb 2025 00:43:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18334

+Paresh Bhagat

jailhouse recipe now points to SRCREV="dc77c05460bc3df8f2ddc9cc3a9990ca31cb9f9d"

https://git.yoctoproject.org/meta-ti/commit/?id=31b423275aa2bc685a1348218bda16894a35ad8b

which does not exist:

https://git.ti.com/cgit/jailhouse/ti-jailhouse/commit/?id=dc77c05460bc3df8f2ddc9cc3a9990ca31cb9f9d


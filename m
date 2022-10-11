Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60335C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 02:39:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3044.1665455970463345619
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 19:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5AB3740D23
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 02:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9LnV1rue1j7 for <meta-ti@lists.yoctoproject.org>;
	Tue, 11 Oct 2022 02:39:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4A96440CCC
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 02:39:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2D99B174A1C; Mon, 10 Oct 2022 22:39:27 -0400 (EDT)
Date: Mon, 10 Oct 2022 22:39:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: meta-ti langdale plans
Message-ID: <20221011023927.GA22689@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 02:39:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15137

All,

Due to limited resources, meta-ti has no plans to branch off and separately 
support "langdale" release. There are currently 2 actively supported LTS 
releases in meta-ti - "dunfell" and "kirkstone". That means CI builds and 
testing (to some extent, as kirkstone limitations are being addressed now). 
The plan for "master" branch is to stay as close to kirkstone and for as long, 
as possible. As such, master will be marked as compatible with langdale in 
addition to kirkstone for now.

Historically, this is no different to handling past intermediate releases - 
there were no branches for "gatesgarth", "hardknott" or "honister". Only 
tracking compatibility changes in master:

https://git.yoctoproject.org/meta-ti/commit/conf/layer.conf?id=37d8e1829447df919945181ef05b43f08696dbe2
https://git.yoctoproject.org/meta-ti/commit/conf/layer.conf?id=5d0855593915c6bbd2261e2047d389f894afd5cd
https://git.yoctoproject.org/meta-ti/commit/conf/layer.conf?id=cfe3f785739428552ffd9afe24b9f2000d1d2cc6
https://git.yoctoproject.org/meta-ti/commit/conf/layer.conf?id=e21c11b4a44417f67c78503bc3f954c175ac20e2

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964


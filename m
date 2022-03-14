Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BA2C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:29:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3726.1647300593178329561
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Mar 2022 16:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB8CF40C3A;
	Mon, 14 Mar 2022 23:29:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ON3RlWvlEKC; Mon, 14 Mar 2022 23:29:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A129D407E5;
	Mon, 14 Mar 2022 23:29:50 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C41A8165570;
	Mon, 14 Mar 2022 19:29:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell][PATCH] README: update maintainers list
Date: Mon, 14 Mar 2022 19:29:49 -0400
Message-Id: <1647300589-29693-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 14 Mar 2022 23:29:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14510

From: Denys Dmytriyenko <denys@konsulko.com>

Update the maintainers list.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>
---
This is a modified backport of a similar change from master.

 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 44544c6..40524a4 100644
--- a/README
+++ b/README
@@ -29,5 +29,5 @@ Please note - meta-ti mailing list requires subscription for posting:
 https://lists.yoctoproject.org/g/meta-ti
 
 Maintainers:
-Praneeth Bajjuri <praneeth@ti.com>
+Ryan Eatmon <reatmon@ti.com>
 Denys Dmytriyenko <denys@konsulko.com>
-- 
2.7.4



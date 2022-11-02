Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0017C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 22:16:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.12714.1667427395777913928
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Nov 2022 15:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B2C8040CA5;
	Wed,  2 Nov 2022 22:16:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlNMCROIbqj3; Wed,  2 Nov 2022 22:16:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9033840C67;
	Wed,  2 Nov 2022 22:16:32 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E5151162043;
	Wed,  2 Nov 2022 18:16:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Andrew Davis <afd@ti.com>
Subject: [dunfell][PATCH 0/2] Fix K3 HS builds when external SECDEV is not provided
Date: Wed,  2 Nov 2022 18:16:21 -0400
Message-Id: <1667427383-18305-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 02 Nov 2022 22:16:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15217

From: Denys Dmytriyenko <denys@konsulko.com>

Normally, SECDEV tools are provided externally to the build and pointed to by
TI_SECURE_DEV_PKG_K3 variable. Recently changes were made to pull SECDEV tools
during the build automatically and stage them for use, if TI_SECURE_DEV_PKG_K3
is not defined. Unfortunately, there were couple problems with the flow, fixed
by this patchset.

Denys Dmytriyenko (2):
  ti-k3-secdev: include ti-paths.inc
  ti-sci-fw: use getVar() to check if TI_SECURE_DEV_PKG_K3 is defined

 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 +-
 recipes-ti/secdev/ti-k3-secdev_git.bb  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.7.4



Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9705BC54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 09:47:59 +0000 (UTC)
Subject: Re: [master][PATCH] Revert "python3-yamllint: Temporarily carry this new recipe"
To: meta-ti@lists.yoctoproject.org
From: "Samuli Piippo" <samuli.piippo@gmail.com>
X-Originating-Location: Helsinki, Uusimaa, FI (62.183.187.94)
X-Originating-Platform: Linux Firefox 122
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 22 Mar 2024 02:47:54 -0700
References: <20240126192526.15795-1-reatmon@ti.com>
In-Reply-To: <20240126192526.15795-1-reatmon@ti.com>
Message-ID: <16770.1711100874284340056@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Mar 2024 09:47:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17547

Now that the recipe is gone, the layer is compatible only with scarthgap.
Would it be possible to keep the recipe or otherwise get a nanbield compati=
ble branch?

-samuli


Return-Path: <sebastian.krahl@lacon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A11C36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 09:36:51 +0000 (UTC)
Subject: Re: Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed.
To: meta-ti@lists.yoctoproject.org
From: "Sebastian" <sebastian.krahl@lacon.de>
X-Originating-Location: =?UTF-8?B?S2FybHNydWhlLCBCYWRlbi1Xw7xydHRlbWJlcmcsIERF?= (145.253.245.242)
X-Originating-Platform: Windows Chrome 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 01 Apr 2025 02:36:47 -0700
References: <8404.1743410272291654232@lists.yoctoproject.org>
In-Reply-To: <8404.1743410272291654232@lists.yoctoproject.org>
Message-ID: <16009.1743500207260580759@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Apr 2025 09:36:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18442

I've applied the patch and it builds without any additional error.

Thanks for that.

But how to proceed? I'm not happy with the modification of an included laye=
r...

Regards,

Sebastian


Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D366C4167B
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 08:34:21 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.10981.1670661256103119907
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 10 Dec 2022 00:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nq9yk28Z;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: kamlesh@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BA8YFSo007112;
	Sat, 10 Dec 2022 02:34:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670661255;
	bh=a7zy478dNyLJRoRBqRhHIuBXTsf3OMx5/pPM+s2BKwM=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=nq9yk28ZuGWg6fcyfTbG0wKu7BaRKLR3QIN0QPdHYaeH2S3rQdECY/7qFk3TzwDXt
	 W6HY/IKNcAEcynvac7yBz3tlSusfQSrjoPwlwUQxUxcLAl0Wm7Z9josr/jXBHaZKfe
	 f+K5BQQxNia7XL9qw+JbrA1MPG1haG4VwYPyruLs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BA8YFu4025376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 10 Dec 2022 02:34:15 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 10
 Dec 2022 02:34:15 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 10 Dec 2022 02:34:15 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BA8YEsV030832;
	Sat, 10 Dec 2022 02:34:14 -0600
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: "Gurudasani, Kamlesh via lists.yoctoproject.org"
	<kamlesh=ti.com@lists.yoctoproject.org>,
        <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <afd@ti.com>,
        <c-shilwant@ti.com>
Subject: Re: [EXTERNAL] [meta-ti][dunfell][PATCH] optee-os: Revert to lower
 log level for AM62x
In-Reply-To: <172F5F8D317AC303.24570@lists.yoctoproject.org>
References: <172F5F8D317AC303.24570@lists.yoctoproject.org>
Date: Sat, 10 Dec 2022 14:04:14 +0530
Message-ID: <87ilij8xo9.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 10 Dec 2022 08:34:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15441

"Gurudasani, Kamlesh via lists.yoctoproject.org"
<kamlesh=ti.com@lists.yoctoproject.org> writes:

> While removing SOFTWARE_PRNG support
> commit:98506a4a07363a1b57012ccfaee263f47e5b46c4,
> accidently removed the changes applied
> by commit:27641e1f2d7f6696fd7bbd8f24fcac20766b6234
> (optee-os: Lower log level for AM62x).
>
> Reverting those changes back
>
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---

Earlier mail didn't go on the list cause of difference in "from and
envelope-sender".

@praneeth, I'm not sure if I should add you reviewed by here directly.

Could see optee log being suppressed, but couldn't test lpm-demo
sucessfully, could be because of older kernel/dtb version.

http://serenity.dal.design.ti.com:7777/odokiluwep.yaml

Requesting @chirag to test and give tested-by.
...


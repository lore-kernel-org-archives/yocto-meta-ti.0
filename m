Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87111C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 06:07:14 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.7085.1751004433988512167
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 23:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tPrY7yom;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: anshuld@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55R67DMK2645728
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 01:07:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751004433;
	bh=+QawEe9LR5GMX1pZHdYpiT5esaoQixbljGHp0BhUFyA=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=tPrY7yom4bh/yEhMrQ7+Cgix6NQhm9f4l5TLI703T1aRgD23+c+bTuXmYyawcI5sD
	 JIMF/lcLTK9QvmuB8+zEKIwDjdC3IfV3qnWOTIEhXrtZhJQKd64M12xjTG85DNPwKM
	 1yyxFaIRKMm5S31F16MJvoTT3fBcrod4p6Qzsa9M=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55R67D9O2962811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 01:07:13 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 01:07:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 01:07:12 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55R67CFu2309799;
	Fri, 27 Jun 2025 01:07:12 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 27 Jun 2025 11:36:31 +0530
Message-ID: <DAX394J0MLYR.3DH4O5A7846IF@ti.com>
CC: <c-shilwant@ti.com>, <reatmon@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>
Subject: Re: [PATCH v1 1/2] conf: machine: k3: update fitImage load address
From: Anshul Dalal <anshuld@ti.com>
To: Anshul Dalal <anshuld@ti.com>, <meta-ti@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250627060416.639661-1-anshuld@ti.com>
In-Reply-To: <20250627060416.639661-1-anshuld@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:07:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18700

On Fri Jun 27, 2025 at 11:34 AM IST, Anshul Dalal wrote:
> In yocto, the UBOOT_ENTRYPOINT and UBOOT_*LOADADDRESS variables specify
> the entry point and load addresses for the kernel image and the DTB when
> creating the fitImage[1].
>
> Currently the load address for the kernel is set to 0x81000000 and
> 0x83000000 for the DTB for all k3 platforms.
>
> However the region 0x80080000 to 0x81880000 is reserved for OPTEE on
> am62xxsip-evm, leading to boot failure[2] when using the fitImage.
>
> This patch fixes the issue by changing the addresses to 0x82000000 for
> kernel and 0x88000000 for the DTB. This also allows us to load kernel
> images > 32MiB in size when not using initrd while also making the
> falcon and standard boot addresses consistent.
>
> [1]:
> https://docs.yoctoproject.org/ref-manual/variables.html#term-UBOOT_ENTRYP=
OINT
> [2]:
> https://raw.githubusercontent.com/ArchUsr64/ti_boot_logs/HEAD/am62xxsip-e=
vm/failures/fitImage_load_addr_issue.log
>
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---

Sorry I forgot to add prefix in the subject, this patch set is meant for
scarthgap-next.

Regards,
Anshul


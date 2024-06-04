Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7AEC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 19:12:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4829.1717528355725146285
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 12:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A4F5840C8C;
	Tue,  4 Jun 2024 19:12:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wR5hQM0fh7eu; Tue,  4 Jun 2024 19:12:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 11F3740C1C;
	Tue,  4 Jun 2024 19:12:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 57D6C163F86; Tue,  4 Jun 2024 15:12:31 -0400 (EDT)
Date: Tue, 4 Jun 2024 15:12:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH] gitignore: lift some sane
 defaults from others
Message-ID: <20240604191231.GP21287@denix.org>
References: <20240603195515.1089534-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603195515.1089534-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Jun 2024 19:12:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17694

On Mon, Jun 03, 2024 at 02:55:15PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Lift the common parts of the top level gitignore from oe-core and
> meta-openembedded. This masks out temporary python files, intermediate
> artifacts, and patches at the root of the project.

FWIW, this is a matter of a personal preference, e.g. I don't like when 
git ignores, essentially hiding patches in the top directory. I do prefer 
them to be visible with "git status". But I'll leave it to Ryan.


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .gitignore | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 .gitignore
> 
> diff --git a/.gitignore b/.gitignore
> new file mode 100644
> index 00000000..c01df45e
> --- /dev/null
> +++ b/.gitignore
> @@ -0,0 +1,7 @@
> +*.pyc
> +*.pyo
> +/*.patch
> +*.swp
> +*.orig
> +*.rej
> +*~
> -- 
> 2.45.1


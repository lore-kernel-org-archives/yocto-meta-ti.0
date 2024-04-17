Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220F8C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 18:54:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22366.1713380084866751920
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 11:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E026940C7B;
	Wed, 17 Apr 2024 18:54:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEECuPnZVQbj; Wed, 17 Apr 2024 18:54:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6F31A40A0B;
	Wed, 17 Apr 2024 18:54:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6E903163F21; Wed, 17 Apr 2024 14:54:40 -0400 (EDT)
Date: Wed, 17 Apr 2024 14:54:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH v2 1/3] python3-yamllint: Temporarily
 carry this new recipe
Message-ID: <20240417185440.GP28791@denix.org>
References: <20240417184031.17308-1-reatmon@ti.com>
 <20240417184031.17308-2-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417184031.17308-2-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17587

On Wed, Apr 17, 2024 at 01:40:29PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Add recipe for yamllint.  There is an upcoming change in u-boot where
> the binman tool is now configured to call yamllint to verify the configs
> during compile time.
> 
> There was a previous patch a year ago from Trevor Woerner that never
> made it into oe-core.  This patch is a reworking of his patch but
> pointing to a newer version.
> 
> We are waiting on this patch to be accepted in oe-core.  Once it is
> available on master we will remove this recipe to avoid conflict.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../python-yamllint/python3-yamllint_1.33.0.bb    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb
> 
> diff --git a/meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb b/meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb
> new file mode 100644
> index 00000000..4b7bd065
> --- /dev/null
> +++ b/meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "A linter for YAML files."
> +HOMEPAGE = "https://github.com/adrienverge/yamllint"
> +LICENSE = "GPL-3.0-only"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "yamllint"
> +
> +SRC_URI[sha256sum] = "2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3ca315118e4a1a81f7d"
> +
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +RDEPENDS:${PN} += "${PYTHON_PN}-pyyaml"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.17.1


Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004CFCEE34B
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 19:01:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4758.1763492484453265263
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 11:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 84B1640C7B;
	Tue, 18 Nov 2025 19:01:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84xm__TKy08r; Tue, 18 Nov 2025 19:01:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 28DB640BD6;
	Tue, 18 Nov 2025 19:01:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4271717544B; Tue, 18 Nov 2025 14:01:18 -0500 (EST)
Date: Tue, 18 Nov 2025 14:01:18 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: s-joshi@ti.com
Cc: meta-ti@lists.yoctoproject.org, kamlesh@ti.com, k-malarvizhi@ti.com,
	s-tripathi1@ti.com
Subject: Re: [meta-ti][scarthgap][PATCH v4] meta-ti-bsp: optee: Ensure
 libckteec.so symlink is installed
Message-ID: <20251118190118.GC3125@denix.org>
References: <20251117083407.3719468-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117083407.3719468-1-s-joshi@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Nov 2025 19:01:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19289

On Mon, Nov 17, 2025 at 02:04:08PM +0530, Suhaas Joshi via lists.yoctoproject.org wrote:
> Presently, /usr/lib/libckteec.so is not installed. Instead, the only
> symlink present is /usr/lib/libckteec.so.0 which points to
> libckteec.so.0.1.0. This makes OpenSSL commands fail since it looks for
> /usr/bin/libckteec.so.
> 
> So ensure that this symlink is installed by explicitly adding a
> FILES:${PN} assignment.
> 
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
> v3 -> v4:
> * I realized that libckteec.so.0* and the PKCS#11 TA file were both already installed in the SDK.
>   Therefore, in v4, I have removed the logic for that since its redundant now. CFG_PKCS11_TA and
>   CFG_REE_FS are enabled by-default.
> * v4 only fixes one issue: the absence of libckteec.so. /usr/bin/libckteec.so should link to
>   /usr/bin/libckteec.so.0 which then links to /usr/bin/libckteec.so.0.1.0.

NAK

This patch seems to be unnecessary.

After 4 revisions it was determined that the necessary library is getting 
built and packaged.

I just checked and all the symlinks are also getting created. In accordance 
with Distro packaging guidelines, which OE follows, the *.so file is assumed 
to be a development symlink, hence it gets packaged into a corresponding *-dev 
package.

Simply pulling *.so symlink into the main package is not the right way to 
handle it. Doing so will trigger a QA error that will require a "dev-so" flag 
in INSANE_SKIP list - while not immediately violating YP Compat requirements, 
it's still not recommended.


> * Link to v3:
> https://lore.kernel.org/yocto-meta-ti/20251113104522.2443817-1-prc@list.ti.com/T/#t
> ---
>  .../recipes-security/optee/optee-client-ti-overrides.inc     | 1 +
>  meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend   | 5 +++++
>  2 files changed, 6 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
> new file mode 100644
> index 00000000..dd6a9d01
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
> @@ -0,0 +1 @@
> +FILES:${PN} += "${libdir}/libckteec.so*"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> index f193e78b..0cee127f 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> @@ -2,3 +2,8 @@ OPTEE_TI_VERSION = ""
>  OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
>  
>  require ${OPTEE_TI_VERSION}
> +
> +OPTEE_TI_OVERRIDES = ""
> +OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
> +
> +require ${OPTEE_TI_OVERRIDES}
> -- 
> 2.34.1


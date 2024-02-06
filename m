Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57051C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:17:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.17220.1707207471453182715
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 00:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 14D6240C61;
	Tue,  6 Feb 2024 08:17:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ID-vgy_w7AIL; Tue,  6 Feb 2024 08:17:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 806D040023;
	Tue,  6 Feb 2024 08:17:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 65CBE163E0B; Tue,  6 Feb 2024 03:17:44 -0500 (EST)
Date: Tue, 6 Feb 2024 03:17:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: alexandre.belloni@bootlin.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] check-layer failures for meta-ti
Message-ID: <20240206081744.GF15614@denix.org>
References: <202402060743225a1d9587@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402060743225a1d9587@mail.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Feb 2024 08:17:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17447

On Tue, Feb 06, 2024 at 08:43:22AM +0100, Alexandre Belloni via lists.yoctoproject.org wrote:
> Hello,
> 
> meta-ti is currently failing check-layer-nightly:
> 
> AssertionError: Adding layer meta-ti-extras changed signatures.
> 19 signatures changed, initial differences (first hash before, second after):
>    python3-yamllint:do_recipe_qa: fc237fe111fe2f670fa77ee058d87ca7d6504dbd79e67473d6a4b7446b663ee8 -> 1cd40e42be630dbb89ee6b685d818c0010544cf11bc9207f3ba26ab922389f4e
>       bitbake-diffsigs --task python3-yamllint do_recipe_qa --signature fc237fe111fe2f670fa77ee058d87ca7d6504dbd79e67473d6a4b7446b663ee8 1cd40e42be630dbb89ee6b685d818c0010544cf11bc9207f3ba26ab922389f4e
>       NOTE: Starting bitbake server...
>       basehash changed from 1bc327910b55333ec708cf071f99c3bc4beb62595f125f6206833bf24f4a7052 to 5f4d001ca8ce422815b6bc9c4c584b8712a5cc6b766ca1cbd28af4269be5ab6a
>       Variable ERROR_QA value changed:
>       @@ -1,2 +1,2 @@
>       -dev-so debug-deps dev-deps debug-files arch pkgconfig la             perms dep-cmp pkgvarcheck perm-config perm-line perm-link             split-strip packages-list pkgv-undefined var-undefined             version-going-backwards expanded-d invalid-chars             license-checksum dev-elf file-rdeps configure-unsafe             configure-gettext perllocalpod shebang-size             already-stripped installed-vs-shipped ldflags compile-host-path             install-host-path pn-overrides unknown-configure-option             useless-rpaths rpaths staticdev empty-dirs             patch-fuzz             ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)} patch-status
>       +dev-so debug-deps dev-deps debug-files arch pkgconfig la             perms dep-cmp pkgvarcheck perm-config perm-line perm-link             split-strip packages-list pkgv-undefined var-undefined             version-going-backwards expanded-d invalid-chars             license-checksum dev-elf file-rdeps configure-unsafe             configure-gettext perllocalpod shebang-size             already-stripped installed-vs-shipped ldflags compile-host-path             install-host-path pn-overrides unknown-configure-option             useless-rpaths rpaths staticdev empty-dirs             patch-fuzz             ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}
>        DISTRO_FEATURES{usrmerge} = Unset
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1882/steps/20/logs/stdio

The fix is already in master-next:
https://git.yoctoproject.org/meta-ti/commit/?h=master-next&id=af4bfac806c22166cf77f93b2a33dd984f03293d

Not sure if there are any issues merging this to master... Ryan?

-- 
Denys


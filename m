Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BCEC04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 22:17:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.167.1715206634288330209
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 May 2024 15:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 522AE40C81;
	Wed,  8 May 2024 22:17:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YgU-OFA_Lq3M; Wed,  8 May 2024 22:17:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1917940A2F;
	Wed,  8 May 2024 22:17:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 02BD5163F66; Wed,  8 May 2024 18:17:08 -0400 (EDT)
Date: Wed, 8 May 2024 18:17:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: alexandre.belloni@bootlin.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] check-layer failures for meta-ti
Message-ID: <20240508221707.GD21287@denix.org>
References: <20240508215222b967f0db@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508215222b967f0db@mail.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 May 2024 22:17:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17649

On Wed, May 08, 2024 at 11:52:22PM +0200, Alexandre Belloni via lists.yoctoproject.org wrote:
> Hello,
> 
> meta-ti is currently failing check-layer-nightly:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/2063/steps/20/logs/stdio

Thanks, Alexandre,

This issue is master-specific and is due to python3-yamllint - the new package 
was added to OE-Core before Scarthgap, but wasn't backported to Nanbield. Due 
to resource constraints, meta-ti only branches off for LTS releases, while 
master tries to provide limited compatibility with the last intermediate 
stable release, which is Nanbield. Since Nanbield is expected to EOL this 
month, the idea was to keep the local copy of python3-yamllint in meta-ti 
master a bit longer until the corresponding compatibility with that release 
can be safely dropped. But I can take a look if we can easily adjust something 
to avoid the issue for now...

-- 
Denys


> INFO: ======================================================================
> INFO: FAIL: test_signatures (common.CommonCheckLayer.test_signatures)
> INFO: ----------------------------------------------------------------------
> INFO: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/scripts/lib/checklayer/cases/common.py", line 99, in test_signatures
>     self.fail('Adding layer %s changed signatures.\n%s' % (self.tc.layer['name'], msg))
> AssertionError: Adding layer meta-ti-extras changed signatures.
> 19 signatures changed, initial differences (first hash before, second after):
>    python3-yamllint:do_recipe_qa: 8ee2e91624905aa91d611870e9d8cf0d1fb6bc248f181cb9f9f9c35198cd2ec6 -> 7d43e16b2e61b0e319270b32ff19a39960e99a77af1fdabbd2f3610066344a3f
>       bitbake-diffsigs --task python3-yamllint do_recipe_qa --signature 8ee2e91624905aa91d611870e9d8cf0d1fb6bc248f181cb9f9f9c35198cd2ec6 7d43e16b2e61b0e319270b32ff19a39960e99a77af1fdabbd2f3610066344a3f
>       NOTE: Starting bitbake server...
>       basehash changed from 8a578aebd04ba58b12e29b5eef3f92aaafba21aed33f40ab80f6d93689da0241 to 842db39ba0f9c7db1959bf577c83fb1455216b8c38f8e9822b3be7275048d240
>       Variable ERROR_QA value changed:
>       @@ -1,2 +1,2 @@
>       -dev-so debug-deps dev-deps debug-files arch pkgconfig la             perms dep-cmp pkgvarcheck perm-config perm-line perm-link             split-strip packages-list pkgv-undefined var-undefined             version-going-backwards expanded-d invalid-chars             license-checksum dev-elf file-rdeps configure-unsafe             configure-gettext perllocalpod shebang-size             already-stripped installed-vs-shipped ldflags compile-host-path             install-host-path pn-overrides unknown-configure-option             useless-rpaths rpaths staticdev empty-dirs             patch-fuzz             ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)} patch-status
>       +dev-so debug-deps dev-deps debug-files arch pkgconfig la             perms dep-cmp pkgvarcheck perm-config perm-line perm-link             split-strip packages-list pkgv-undefined var-undefined             version-going-backwards expanded-d invalid-chars             license-checksum dev-elf file-rdeps configure-unsafe             configure-gettext perllocalpod shebang-size             already-stripped installed-vs-shipped ldflags compile-host-path             install-host-path pn-overrides unknown-configure-option             useless-rpaths rpaths staticdev empty-dirs             patch-fuzz             ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}
>        DISTRO_FEATURES{usrmerge} = Unset
>       Variable PV value changed from '1.35.1' to '1.33.0'
>       Variable SRC_URI[sha256sum] value changed from '7a003809f88324fd2c877734f2d575ee7881dd9043360657cc8049c809eba6cd' to '2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3ca315118e4a1a81f7d'


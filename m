Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652D7C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 15:13:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.14295.1718378011532611795
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 08:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o1bMqMuT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 551424000A;
	Fri, 14 Jun 2024 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718378009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TOWzea25zeFaFuXXUvm6eyziLDN8egQsAPygVbM84G8=;
	b=o1bMqMuTD153vJurqLgdNjRlhftDE1ID2y3Fwo5IhCLM295e6R9bSGUZFhz2jo/aKy5ux4
	aWx9m8xjFineEo9+AMumYrwi6h4tnmZ1XR6CE6VkZueQbCwo6IsBBUuWi4J/79Cwl5GVK1
	BKauIy8mEMiNBkjXs4j99+bnNCkbdfkjfK5CftaVlVuQZnKl0JiHYbO6eSOL3Pn2RvObok
	l8YngjOixDhA0havuHkjyDUN74R9IuD4rBzuSlCPoLky1ehM+3qLqvh/vs//rJUrfJQQga
	gG1bdonoALSd1Uvfg+86ZjyCbd919sgI4sL2qDgxEFDkZspcyzhFt1bTKGue+g==
Date: Fri, 14 Jun 2024 17:13:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: check-layer failures for meta-ti
Message-ID: <20240614151329915a52aa@mail.local>
References: <20240508215222b967f0db@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508215222b967f0db@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 15:13:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17733

Hello,

This was reported more than a month ago and this is still failing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/2123/steps/19/logs/stdio

I guess the solution is to stop testing meta-ti master. I'll send a
patch to do that. Of course, once this is fixed, you can send a patch to
enable testing again.

On 08/05/2024 23:52:23+0200, Alexandre Belloni wrote:
> Hello,
> 
> meta-ti is currently failing check-layer-nightly:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/2063/steps/20/logs/stdio
> 
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
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


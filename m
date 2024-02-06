Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404D7C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:43:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.16902.1707205404555211097
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 23:43:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Af69ox9Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D8ED40007;
	Tue,  6 Feb 2024 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707205402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=cDolQEPV1hQokMCGBxUGa8+Nwzki20XnZk+5P7Ayl5s=;
	b=Af69ox9Qf0P4WdgjUaI+uh6jei1rcVzYR15N1wYmdgXR76DFH7hZYBF/3pFThqKdcYYxFK
	fxepGYBD3K/k7s8ijctwRlxNfkSgZaXFwTSjjgKvaPNd6cGHsN4ap0ACF9FrqK479xtCHw
	MWufsWfXrf/9mnUHhHdXs+6KuGg4Vw8dSYSiYfCbp/X72Crt9bMdrw6zCKJ6IQnVHrQ0aY
	1Dls+xmNQfZ5n0G9XLGwaMb81JWhhpUCJ934vgiMT9DTMfw5Ftho2tTpWYOiTUUElSWMli
	YjDUDw0colLm2K64LFv3umloQ6IG/oUQD2KP59uDS8xOMwm0ftppvWs7c73VWA==
Date: Tue, 6 Feb 2024 08:43:22 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: check-layer failures for meta-ti
Message-ID: <202402060743225a1d9587@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Feb 2024 07:43:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17446

Hello,

meta-ti is currently failing check-layer-nightly:

AssertionError: Adding layer meta-ti-extras changed signatures.
19 signatures changed, initial differences (first hash before, second after):
   python3-yamllint:do_recipe_qa: fc237fe111fe2f670fa77ee058d87ca7d6504dbd79e67473d6a4b7446b663ee8 -> 1cd40e42be630dbb89ee6b685d818c0010544cf11bc9207f3ba26ab922389f4e
      bitbake-diffsigs --task python3-yamllint do_recipe_qa --signature fc237fe111fe2f670fa77ee058d87ca7d6504dbd79e67473d6a4b7446b663ee8 1cd40e42be630dbb89ee6b685d818c0010544cf11bc9207f3ba26ab922389f4e
      NOTE: Starting bitbake server...
      basehash changed from 1bc327910b55333ec708cf071f99c3bc4beb62595f125f6206833bf24f4a7052 to 5f4d001ca8ce422815b6bc9c4c584b8712a5cc6b766ca1cbd28af4269be5ab6a
      Variable ERROR_QA value changed:
      @@ -1,2 +1,2 @@
      -dev-so debug-deps dev-deps debug-files arch pkgconfig la             perms dep-cmp pkgvarcheck perm-config perm-line perm-link             split-strip packages-list pkgv-undefined var-undefined             version-going-backwards expanded-d invalid-chars             license-checksum dev-elf file-rdeps configure-unsafe             configure-gettext perllocalpod shebang-size             already-stripped installed-vs-shipped ldflags compile-host-path             install-host-path pn-overrides unknown-configure-option             useless-rpaths rpaths staticdev empty-dirs             patch-fuzz             ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)} patch-status
      +dev-so debug-deps dev-deps debug-files arch pkgconfig la             perms dep-cmp pkgvarcheck perm-config perm-line perm-link             split-strip packages-list pkgv-undefined var-undefined             version-going-backwards expanded-d invalid-chars             license-checksum dev-elf file-rdeps configure-unsafe             configure-gettext perllocalpod shebang-size             already-stripped installed-vs-shipped ldflags compile-host-path             install-host-path pn-overrides unknown-configure-option             useless-rpaths rpaths staticdev empty-dirs             patch-fuzz             ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}
       DISTRO_FEATURES{usrmerge} = Unset

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1882/steps/20/logs/stdio

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

